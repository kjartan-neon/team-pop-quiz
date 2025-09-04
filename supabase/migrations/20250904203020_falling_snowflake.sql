/*
  # Update session creation rate limit to 20 per hour

  1. Changes
    - Modify the rate limit function to allow 20 sessions per hour instead of 5
    - This provides more flexibility for testing and development
*/

CREATE OR REPLACE FUNCTION check_session_creation_rate_limit()
RETURNS TRIGGER AS $$
DECLARE
  session_count INTEGER;
BEGIN
  -- Count sessions created in the last hour from the same IP (if available)
  -- Since we don't have IP tracking, we'll use a simple time-based limit
  SELECT COUNT(*)
  INTO session_count
  FROM quiz_sessions
  WHERE created_at > NOW() - INTERVAL '1 hour';
  
  -- Allow up to 20 sessions per hour
  IF session_count >= 20 THEN
    RAISE EXCEPTION 'Rate limit exceeded. Maximum 20 sessions per hour allowed.';
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;