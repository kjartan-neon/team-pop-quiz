/*
  # Rename tables with quiz_ prefix

  1. Table Renames
    - `sessions` → `quiz_sessions`
    - `questions` → `quiz_questions` 
    - `game_history` → `quiz_game_history`

  2. Update Foreign Key References
    - Update all foreign key constraints to reference new table names
    - Maintain all existing relationships and constraints

  3. Security
    - Transfer all RLS policies to new tables
    - Maintain same access patterns
*/

-- Rename tables
ALTER TABLE IF EXISTS sessions RENAME TO quiz_sessions;
ALTER TABLE IF EXISTS questions RENAME TO quiz_questions;
ALTER TABLE IF EXISTS game_history RENAME TO quiz_game_history;

-- Update foreign key constraints for quiz_game_history
DO $$
BEGIN
  -- Drop existing foreign key constraints
  IF EXISTS (
    SELECT 1 FROM information_schema.table_constraints 
    WHERE constraint_name = 'game_history_session_id_fkey' 
    AND table_name = 'quiz_game_history'
  ) THEN
    ALTER TABLE quiz_game_history DROP CONSTRAINT game_history_session_id_fkey;
  END IF;

  IF EXISTS (
    SELECT 1 FROM information_schema.table_constraints 
    WHERE constraint_name = 'game_history_question_id_fkey' 
    AND table_name = 'quiz_game_history'
  ) THEN
    ALTER TABLE quiz_game_history DROP CONSTRAINT game_history_question_id_fkey;
  END IF;

  -- Add new foreign key constraints with updated references
  ALTER TABLE quiz_game_history 
    ADD CONSTRAINT quiz_game_history_session_id_fkey 
    FOREIGN KEY (session_id) REFERENCES quiz_sessions(id) ON DELETE CASCADE;

  ALTER TABLE quiz_game_history 
    ADD CONSTRAINT quiz_game_history_question_id_fkey 
    FOREIGN KEY (question_id) REFERENCES quiz_questions(id);
END $$;

-- Update RLS policies for quiz_game_history to reference new table names
DROP POLICY IF EXISTS "Anyone can read blocks of published pages" ON quiz_game_history;
DROP POLICY IF EXISTS "Game history is publicly accessible" ON quiz_game_history;

CREATE POLICY "Quiz game history is publicly accessible"
  ON quiz_game_history
  FOR ALL
  TO anon, authenticated
  USING (true)
  WITH CHECK (true);

-- Update any triggers that might reference the old table names
DO $$
BEGIN
  -- Update trigger for quiz_sessions if it exists
  IF EXISTS (
    SELECT 1 FROM information_schema.triggers 
    WHERE trigger_name = 'update_sessions_updated_at'
  ) THEN
    DROP TRIGGER update_sessions_updated_at ON quiz_sessions;
    CREATE TRIGGER update_quiz_sessions_updated_at
      BEFORE UPDATE ON quiz_sessions
      FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
  END IF;
END $$;