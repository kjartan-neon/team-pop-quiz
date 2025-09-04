/*
  # Remove questions with full names in both question and answer

  1. Purpose
     - Remove questions where the answer is "First Last" format
     - And both the first name and last name appear in the question text
     - This prevents questions that give away the answer

  2. Logic
     - Split answers on space to get first and last names
     - Check if both names appear in the question text (case insensitive)
     - Only remove if answer has exactly 2 words (first name + last name)

  3. Safety
     - Uses safe deletion with EXISTS clause
     - Only targets answers with exactly 2 words
     - Case insensitive matching for reliability
*/

DELETE FROM quiz_questions 
WHERE EXISTS (
  SELECT 1 
  FROM quiz_questions q2 
  WHERE q2.id = quiz_questions.id
    AND array_length(string_to_array(trim(q2.correct_answer), ' '), 1) = 2
    AND lower(q2.question_text) LIKE '%' || lower(split_part(trim(q2.correct_answer), ' ', 1)) || '%'
    AND lower(q2.question_text) LIKE '%' || lower(split_part(trim(q2.correct_answer), ' ', 2)) || '%'
);