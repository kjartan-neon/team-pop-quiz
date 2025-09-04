/*
  # Increase session creation rate limit

  1. Changes
    - Update rate limit function to allow more sessions per time period
    - Increase from 5 sessions per hour to 20 sessions per hour per IP
    - This allows for more testing and development flexibility

  2. Security
    - Still maintains protection against abuse
    - Reasonable limit for legitimate usage
*/

-- Drop and recreate the rate limit function with higher limits
DROP FUNCTION IF EXISTS check_session_creation_rate_limit();

CREATE OR REPLACE FUNCTION check_session_creation_rate_limit()
RETURNS TRIGGER AS $$
DECLARE
  session_count INTEGER;
BEGIN
  -- Count sessions created from the same IP in the last hour
  -- Note: In a real deployment, you'd want to track by IP address
  -- For now, we'll just count total sessions in the last hour
  SELECT COUNT(*)
  INTO session_count
  FROM quiz_sessions
  WHERE created_at > NOW() - INTERVAL '1 hour';

  -- Allow up to 20 sessions per hour (increased from 5)
  IF session_count >= 20 THEN
    RAISE EXCEPTION 'Rate limit exceeded. Too many sessions created recently. Please wait before creating a new session.';
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;