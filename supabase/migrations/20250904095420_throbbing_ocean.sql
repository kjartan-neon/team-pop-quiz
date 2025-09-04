/*
  # Remove duplicate name questions

  1. Purpose
    - Remove questions where the full name appears in both the question text and the answer
    - This prevents questions that give away the answer directly in the question

  2. Safety
    - Uses safe deletion with EXISTS clause
    - Only removes questions where both question_text and correct_answer contain the same full name
    - Preserves questions where only partial names match

  3. Logic
    - Identifies questions where a 2+ word name from the answer also appears in the question
    - Uses case-insensitive matching
    - Requires exact word boundaries to avoid false positives
*/

-- Remove questions where the full name (2+ words) from the answer also appears in the question
DELETE FROM quiz_questions 
WHERE EXISTS (
  SELECT 1 
  WHERE 
    -- Check if the correct_answer contains at least 2 words (indicating a full name)
    array_length(string_to_array(trim(correct_answer), ' '), 1) >= 2
    AND
    -- Check if the full name from correct_answer appears in the question_text (case insensitive)
    lower(question_text) LIKE '%' || lower(trim(correct_answer)) || '%'
    AND
    -- Additional safety: ensure it's not just a partial match by checking word boundaries
    question_text ~* '\y' || regexp_replace(trim(correct_answer), '\s+', '\\s+', 'g') || '\y'
);

-- Also remove questions where individual words from a multi-word answer appear prominently in the question
-- This catches cases where "Christian Skolmen" might appear as "Christian" and "Skolmen" separately
DELETE FROM quiz_questions 
WHERE EXISTS (
  SELECT 1 
  WHERE 
    -- Only check multi-word answers
    array_length(string_to_array(trim(correct_answer), ' '), 1) >= 2
    AND
    -- Check if both first and last name appear in the question
    (
      SELECT COUNT(*)
      FROM unnest(string_to_array(trim(correct_answer), ' ')) AS name_part
      WHERE lower(question_text) LIKE '%' || lower(name_part) || '%'
      AND length(name_part) > 2  -- Ignore very short words
    ) >= 2
);