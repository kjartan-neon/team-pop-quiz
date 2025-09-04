/*
  # Add question flagging functionality

  1. Schema Changes
    - Add `is_flagged` column to `quiz_questions` table
    - Add `flagged_at` timestamp column
    - Add `flag_reason` text column for optional feedback

  2. Security
    - Allow authenticated and anonymous users to flag questions
    - Flagged questions will be excluded from random selection
*/

-- Add flagging columns to quiz_questions table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'quiz_questions' AND column_name = 'is_flagged'
  ) THEN
    ALTER TABLE quiz_questions ADD COLUMN is_flagged boolean DEFAULT false;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'quiz_questions' AND column_name = 'flagged_at'
  ) THEN
    ALTER TABLE quiz_questions ADD COLUMN flagged_at timestamptz DEFAULT null;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'quiz_questions' AND column_name = 'flag_reason'
  ) THEN
    ALTER TABLE quiz_questions ADD COLUMN flag_reason text DEFAULT null;
  END IF;
END $$;

-- Add policy to allow flagging questions
CREATE POLICY "Users can flag questions" ON quiz_questions
  FOR UPDATE
  TO anon, authenticated
  USING (true)
  WITH CHECK (true);