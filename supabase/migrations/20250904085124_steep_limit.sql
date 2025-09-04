/*
  # Norwegian Quiz Game Schema

  1. New Tables
    - `sessions`
      - `id` (uuid, primary key)
      - `word_combination` (text, unique session identifier)
      - `team1_name` (text)
      - `team2_name` (text)  
      - `team1_score` (integer)
      - `team2_score` (integer)
      - `current_turn` (integer, 1 or 2)
      - `created_at` (timestamp)
      - `updated_at` (timestamp)
    
    - `questions`
      - `id` (uuid, primary key)
      - `question_text` (text, Norwegian question)
      - `question_type` (text, 'multiple_choice' or 'number')
      - `options` (jsonb, for multiple choice)
      - `correct_answer` (text)
      - `category` (text)
      - `difficulty` (text)
      - `created_at` (timestamp)
    
    - `game_history`
      - `id` (uuid, primary key)
      - `session_id` (uuid, foreign key)
      - `question_id` (uuid, foreign key)
      - `team_number` (integer)
      - `answer_given` (text)
      - `is_correct` (boolean)
      - `points_awarded` (integer)
      - `answered_at` (timestamp)

  2. Security
    - Enable RLS on all tables
    - Add policies for public access (no authentication required)

  3. Sample Data
    - Pre-populate with Norwegian general knowledge questions
*/

-- Create sessions table
CREATE TABLE IF NOT EXISTS sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  word_combination text UNIQUE NOT NULL,
  team1_name text DEFAULT 'Lag 1',
  team2_name text DEFAULT 'Lag 2',
  team1_score integer DEFAULT 0,
  team2_score integer DEFAULT 0,
  current_turn integer DEFAULT 1,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create questions table
CREATE TABLE IF NOT EXISTS questions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  question_text text NOT NULL,
  question_type text NOT NULL CHECK (question_type IN ('multiple_choice', 'number')),
  options jsonb,
  correct_answer text NOT NULL,
  category text DEFAULT 'Allmennkunnskap',
  difficulty text DEFAULT 'medium',
  created_at timestamptz DEFAULT now()
);

-- Create game history table
CREATE TABLE IF NOT EXISTS game_history (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id uuid REFERENCES sessions(id) ON DELETE CASCADE,
  question_id uuid REFERENCES questions(id),
  team_number integer NOT NULL CHECK (team_number IN (1, 2)),
  answer_given text,
  is_correct boolean,
  points_awarded integer,
  answered_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE game_history ENABLE ROW LEVEL SECURITY;

-- Create policies for public access (no auth required)
CREATE POLICY "Sessions are publicly accessible"
  ON sessions
  FOR ALL
  TO anon, authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Questions are publicly readable"
  ON questions
  FOR SELECT
  TO anon, authenticated
  USING (true);

CREATE POLICY "Game history is publicly accessible"
  ON game_history
  FOR ALL
  TO anon, authenticated
  USING (true)
  WITH CHECK (true);

-- Insert sample Norwegian questions
INSERT INTO questions (question_text, question_type, options, correct_answer, category) VALUES
  ('Hva er hovedstaden i Norge?', 'multiple_choice', '["Oslo", "Bergen", "Trondheim", "Stavanger"]', 'Oslo', 'Geografi'),
  ('Hvor mange kommuner er det i Norge per 2024?', 'number', null, '356', 'Samfunnsfag'),
  ('Hvilket år ble Norge selvstendig fra Sverige?', 'multiple_choice', '["1905", "1814", "1900", "1912"]', '1905', 'Historie'),
  ('Hva heter Norges lengste elv?', 'multiple_choice', '["Glomma", "Lågen", "Tana", "Otra"]', 'Glomma', 'Geografi'),
  ('Hvor høy er Galdhøpiggen?', 'number', null, '2469', 'Geografi'),
  ('Hvilket parti ledet Einar Gerhardsen?', 'multiple_choice', '["Arbeiderpartiet", "Høyre", "Venstre", "Senterpartiet"]', 'Arbeiderpartiet', 'Historie'),
  ('Hva heter forfatter av "Kristin Lavransdatter"?', 'multiple_choice', '["Sigrid Undset", "Knut Hamsun", "Henrik Ibsen", "Bjørnstjerne Bjørnson"]', 'Sigrid Undset', 'Litteratur'),
  ('Hvor mange fylker har Norge?', 'number', null, '11', 'Samfunnsfag'),
  ('Hvilket år ble Hurtigruten etablert?', 'multiple_choice', '["1893", "1885", "1900", "1912"]', '1893', 'Historie'),
  ('Hva er Norges nasjonalblomst?', 'multiple_choice', '["Rødt sisteblad", "Blåveis", "Hvit sisteblad", "Liljekonvall"]', 'Rødt sisteblad', 'Natur'),
  ('Hvor mange innbyggere har Norge cirka?', 'number', null, '5500000', 'Samfunnsfag'),
  ('Hva heter Norges største innsjø?', 'multiple_choice', '["Mjøsa", "Femund", "Røssvatnet", "Randsfjorden"]', 'Mjøsa', 'Geografi'),
  ('Hvilket år fikk kvinner stemmerett i Norge?', 'multiple_choice', '["1913", "1905", "1920", "1918"]', '1913', 'Historie'),
  ('Hva heter Norges nasjonaldyr?', 'multiple_choice', '["Elg", "Bjørn", "Rein", "Ulv"]', 'Elg', 'Natur'),
  ('Hvor mange nasjonalparker har Norge?', 'number', null, '47', 'Natur'),
  ('Hva heter Norges høyeste foss?', 'multiple_choice', '["Vinnufossen", "Mardalsfossen", "Skjeggedal", "Låtefoss"]', 'Vinnufossen', 'Geografi'),
  ('Hvilket år ble Holmenkollbakken først bygget?', 'multiple_choice', '["1892", "1885", "1900", "1910"]', '1892', 'Sport'),
  ('Hva er Norges største øy?', 'multiple_choice', '["Spitsbergen", "Hinnøya", "Senja", "Langøya"]', 'Spitsbergen', 'Geografi'),
  ('Hvor mange grader nord ligger Nordkapp?', 'number', null, '71', 'Geografi'),
  ('Hva heter Norges eldste by?', 'multiple_choice', '["Tønsberg", "Oslo", "Bergen", "Trondheim"]', 'Tønsberg', 'Historie');