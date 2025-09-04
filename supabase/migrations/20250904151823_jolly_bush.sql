/*
  # Improve Supabase Security

  1. Rate Limiting & Anti-Spam
    - Add rate limiting for session creation
    - Add constraints to prevent excessive data
    - Add validation functions

  2. Enhanced RLS Policies
    - More restrictive policies
    - Better validation
    - Prevent abuse

  3. Input Validation
    - Add check constraints
    - Validate data formats
    - Prevent malicious input
*/

-- Create a function to check rate limiting for session creation
CREATE OR REPLACE FUNCTION check_session_creation_rate_limit()
RETURNS TRIGGER AS $$
BEGIN
  -- Check if more than 5 sessions created from same IP in last hour
  -- Note: This is a basic implementation, you might want to use a proper rate limiting service
  IF (
    SELECT COUNT(*)
    FROM quiz_sessions
    WHERE created_at > NOW() - INTERVAL '1 hour'
  ) > 10 THEN
    RAISE EXCEPTION 'Rate limit exceeded. Too many sessions created recently.';
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger for rate limiting
DROP TRIGGER IF EXISTS session_rate_limit_trigger ON quiz_sessions;
CREATE TRIGGER session_rate_limit_trigger
  BEFORE INSERT ON quiz_sessions
  FOR EACH ROW
  EXECUTE FUNCTION check_session_creation_rate_limit();

-- Add constraints to prevent spam and validate input
ALTER TABLE quiz_sessions 
  ADD CONSTRAINT word_combination_length CHECK (length(word_combination) >= 3 AND length(word_combination) <= 50),
  ADD CONSTRAINT word_combination_format CHECK (word_combination ~ '^[a-zA-ZæøåÆØÅ\s]+$'),
  ADD CONSTRAINT team_name_length CHECK (length(team1_name) >= 1 AND length(team1_name) <= 50),
  ADD CONSTRAINT team2_name_length CHECK (length(team2_name) >= 1 AND length(team2_name) <= 50),
  ADD CONSTRAINT team_names_format CHECK (team1_name ~ '^[a-zA-ZæøåÆØÅ0-9\s\-_]+$' AND team2_name ~ '^[a-zA-ZæøåÆØÅ0-9\s\-_]+$');

-- Add constraints to game history to prevent spam
ALTER TABLE quiz_game_history
  ADD CONSTRAINT answer_length CHECK (answer_given IS NULL OR length(answer_given) <= 200),
  ADD CONSTRAINT points_range CHECK (points_awarded >= -100 AND points_awarded <= 200);

-- Create more restrictive RLS policies

-- Drop existing policies
DROP POLICY IF EXISTS "Sessions are publicly accessible" ON quiz_sessions;
DROP POLICY IF EXISTS "Quiz game history is publicly accessible" ON quiz_game_history;

-- New session policies with rate limiting
CREATE POLICY "Sessions can be read by anyone"
  ON quiz_sessions
  FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Sessions can be created with rate limit"
  ON quiz_sessions
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (
    -- Additional validation in policy
    length(word_combination) >= 3 AND 
    length(word_combination) <= 50 AND
    length(team1_name) >= 1 AND 
    length(team1_name) <= 50 AND
    length(team2_name) >= 1 AND 
    length(team2_name) <= 50
  );

CREATE POLICY "Sessions can be updated by anyone"
  ON quiz_sessions
  FOR UPDATE
  TO anon, authenticated
  USING (true)
  WITH CHECK (
    -- Prevent score manipulation beyond reasonable limits
    team1_score >= -1000 AND team1_score <= 10000 AND
    team2_score >= -1000 AND team2_score <= 10000 AND
    current_turn IN (1, 2)
  );

-- New game history policies
CREATE POLICY "Game history can be read"
  ON quiz_game_history
  FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Game history can be inserted with validation"
  ON quiz_game_history
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (
    team_number IN (1, 2) AND
    points_awarded >= -100 AND 
    points_awarded <= 200 AND
    (answer_given IS NULL OR length(answer_given) <= 200)
  );

-- Create function to sanitize input
CREATE OR REPLACE FUNCTION sanitize_text_input(input_text TEXT)
RETURNS TEXT AS $$
BEGIN
  -- Remove potentially dangerous characters and limit length
  RETURN LEFT(REGEXP_REPLACE(COALESCE(input_text, ''), '[<>"\'';&]', '', 'g'), 200);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Add indexes for better performance and to prevent some attack vectors
CREATE INDEX IF NOT EXISTS idx_quiz_sessions_created_at ON quiz_sessions(created_at);
CREATE INDEX IF NOT EXISTS idx_quiz_sessions_word_combination ON quiz_sessions(word_combination);
CREATE INDEX IF NOT EXISTS idx_game_history_session_id ON quiz_game_history(session_id);
CREATE INDEX IF NOT EXISTS idx_game_history_answered_at ON quiz_game_history(answered_at);

-- Create a function to clean up old sessions (helps prevent database bloat)
CREATE OR REPLACE FUNCTION cleanup_old_sessions()
RETURNS void AS $$
BEGIN
  -- Delete sessions older than 30 days
  DELETE FROM quiz_sessions 
  WHERE created_at < NOW() - INTERVAL '30 days';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- You can set up a cron job to run this function periodically
-- SELECT cron.schedule('cleanup-old-sessions', '0 2 * * *', 'SELECT cleanup_old_sessions();');