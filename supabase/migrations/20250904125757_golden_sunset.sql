/*
  # Add music lyrics questions

  1. New Questions
    - 50 questions about famous song lyrics from the last 40 years
    - Mix of difficulties: 15 easy, 25 medium, 10 hard
    - 5 number questions about release years
    - Category: "Musikk og sangtekster"

  2. Content
    - Short, recognizable lyric excerpts (fair use)
    - Mix of genres: pop, rock, hip-hop, alternative
    - Artists from 1980s to 2020s
    - Focus on widely known, iconic lines
*/

-- Easy questions (25 points) - Very famous, instantly recognizable lyrics
INSERT INTO quiz_questions (question_text, question_type, options, correct_answer, category, difficulty) VALUES
('Hvilken artist sang "Hello, is it me you''re looking for?"', 'multiple_choice', '["Lionel Richie", "Phil Collins", "George Michael", "Stevie Wonder"]', 'Lionel Richie', 'Musikk og sangtekster', 'easy'),
('Hvem sang "I Will Always Love You" i 1992-versjonen?', 'multiple_choice', '["Celine Dion", "Whitney Houston", "Mariah Carey", "Tina Turner"]', 'Whitney Houston', 'Musikk og sangtekster', 'easy'),
('Hvilket band sang "We Will Rock You"?', 'multiple_choice', '["Led Zeppelin", "Queen", "The Beatles", "Rolling Stones"]', 'Queen', 'Musikk og sangtekster', 'easy'),
('Hvem sang "Like a Virgin"?', 'multiple_choice', '["Madonna", "Cyndi Lauper", "Pat Benatar", "Blondie"]', 'Madonna', 'Musikk og sangtekster', 'easy'),
('Hvilket band sang "Sweet Child O'' Mine"?', 'multiple_choice', '["Metallica", "Guns N'' Roses", "Def Leppard", "Bon Jovi"]', 'Guns N'' Roses', 'Musikk og sangtekster', 'easy'),
('Hvem sang "Billie Jean"?', 'multiple_choice', '["Prince", "Michael Jackson", "Stevie Wonder", "Lionel Richie"]', 'Michael Jackson', 'Musikk og sangtekster', 'easy'),
('Hvilket band sang "Don''t Stop Believin''"?', 'multiple_choice', '["Journey", "Foreigner", "Boston", "Styx"]', 'Journey', 'Musikk og sangtekster', 'easy'),
('Hvem sang "Girls Just Want to Have Fun"?', 'multiple_choice', '["Madonna", "Cyndi Lauper", "Pat Benatar", "Joan Jett"]', 'Cyndi Lauper', 'Musikk og sangtekster', 'easy'),
('Hvilket band sang "Livin'' on a Prayer"?', 'multiple_choice', '["Def Leppard", "Bon Jovi", "Whitesnake", "Europe"]', 'Bon Jovi', 'Musikk og sangtekster', 'easy'),
('Hvem sang "I Want It That Way"?', 'multiple_choice', '["NSYNC", "Backstreet Boys", "98 Degrees", "Boyz II Men"]', 'Backstreet Boys', 'Musikk og sangtekster', 'easy'),
('Hvilket band sang "Smells Like Teen Spirit"?', 'multiple_choice', '["Pearl Jam", "Soundgarden", "Nirvana", "Alice in Chains"]', 'Nirvana', 'Musikk og sangtekster', 'easy'),
('Hvem sang "My Heart Will Go On"?', 'multiple_choice', '["Whitney Houston", "Celine Dion", "Mariah Carey", "Barbra Streisand"]', 'Celine Dion', 'Musikk og sangtekster', 'easy'),
('Hvilket band sang "Eye of the Tiger"?', 'multiple_choice', '["Survivor", "Journey", "Foreigner", "REO Speedwagon"]', 'Survivor', 'Musikk og sangtekster', 'easy'),
('Hvem sang "Like a Prayer"?', 'multiple_choice', '["Whitney Houston", "Madonna", "Janet Jackson", "Mariah Carey"]', 'Madonna', 'Musikk og sangtekster', 'easy'),
('Hvilket band sang "Pour Some Sugar on Me"?', 'multiple_choice', '["Def Leppard", "Whitesnake", "Poison", "Motley Crue"]', 'Def Leppard', 'Musikk og sangtekster', 'easy');

-- Medium questions (50 points) - Well-known but requires more specific knowledge
INSERT INTO quiz_questions (question_text, question_type, options, correct_answer, category, difficulty) VALUES
('Hvem sang "Everybody Hurts"?', 'multiple_choice', '["U2", "R.E.M.", "Pearl Jam", "Radiohead"]', 'R.E.M.', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Creep"?', 'multiple_choice', '["Oasis", "Blur", "Radiohead", "Coldplay"]', 'Radiohead', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Waterfalls"?', 'multiple_choice', '["TLC", "Salt-N-Pepa", "En Vogue", "SWV"]', 'TLC', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Black"?', 'multiple_choice', '["Soundgarden", "Pearl Jam", "Alice in Chains", "Stone Temple Pilots"]', 'Pearl Jam', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Torn"?', 'multiple_choice', '["Alanis Morissette", "Natalie Imbruglia", "Fiona Apple", "Jewel"]', 'Natalie Imbruglia', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Wonderwall"?', 'multiple_choice', '["Blur", "Oasis", "Radiohead", "Stone Roses"]', 'Oasis', 'Musikk og sangtekster', 'medium'),
('Hvem sang "No Scrubs"?', 'multiple_choice', '["Destiny''s Child", "TLC", "En Vogue", "Xscape"]', 'TLC', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Losing My Religion"?', 'multiple_choice', '["U2", "R.E.M.", "INXS", "Depeche Mode"]', 'R.E.M.', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Zombie"?', 'multiple_choice', '["Alanis Morissette", "The Cranberries", "Sinead O''Connor", "Dolores O''Riordan solo"]', 'The Cranberries', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Under the Bridge"?', 'multiple_choice', '["Jane''s Addiction", "Red Hot Chili Peppers", "Pearl Jam", "Soundgarden"]', 'Red Hot Chili Peppers', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Ironic"?', 'multiple_choice', '["Fiona Apple", "Alanis Morissette", "Tori Amos", "Sarah McLachlan"]', 'Alanis Morissette', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Basket Case"?', 'multiple_choice', '["The Offspring", "Green Day", "Rancid", "Bad Religion"]', 'Green Day', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Gangsta''s Paradise"?', 'multiple_choice', '["Tupac", "Coolio", "Snoop Dogg", "Dr. Dre"]', 'Coolio', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Champagne Supernova"?', 'multiple_choice', '["Blur", "Oasis", "Stone Roses", "Radiohead"]', 'Oasis', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Believe"?', 'multiple_choice', '["Madonna", "Cher", "Whitney Houston", "Celine Dion"]', 'Cher', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "1979"?', 'multiple_choice', '["Nirvana", "Smashing Pumpkins", "Soundgarden", "Alice in Chains"]', 'Smashing Pumpkins', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Mambo No. 5"?', 'multiple_choice', '["Ricky Martin", "Lou Bega", "Marc Anthony", "Enrique Iglesias"]', 'Lou Bega', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Killing Me Softly" (1996-versjonen)?', 'multiple_choice', '["Lauryn Hill solo", "Fugees", "TLC", "En Vogue"]', 'Fugees', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Genie in a Bottle"?', 'multiple_choice', '["Britney Spears", "Christina Aguilera", "Jessica Simpson", "Mandy Moore"]', 'Christina Aguilera', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Mr. Brightside"?', 'multiple_choice', '["The Strokes", "The Killers", "Franz Ferdinand", "Arctic Monkeys"]', 'The Killers', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Crazy"?', 'multiple_choice', '["Lauryn Hill", "Gnarls Barkley", "OutKast", "Missy Elliott"]', 'Gnarls Barkley', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Seven Nation Army"?', 'multiple_choice', '["The Black Keys", "The White Stripes", "The Raconteurs", "Queens of the Stone Age"]', 'The White Stripes', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Hips Don''t Lie"?', 'multiple_choice', '["Jennifer Lopez", "Shakira", "Christina Aguilera", "Beyonce"]', 'Shakira', 'Musikk og sangtekster', 'medium'),
('Hvilket band sang "Use Somebody"?', 'multiple_choice', '["Coldplay", "Kings of Leon", "The Killers", "Arcade Fire"]', 'Kings of Leon', 'Musikk og sangtekster', 'medium'),
('Hvem sang "Rolling in the Deep"?', 'multiple_choice', '["Amy Winehouse", "Adele", "Duffy", "Joss Stone"]', 'Adele', 'Musikk og sangtekster', 'medium');

-- Hard questions (100 points) - More obscure or challenging
INSERT INTO quiz_questions (question_text, question_type, options, correct_answer, category, difficulty) VALUES
('Hvem sang "Fade Into You"?', 'multiple_choice', '["Mazzy Star", "Cocteau Twins", "Slowdive", "My Bloody Valentine"]', 'Mazzy Star', 'Musikk og sangtekster', 'hard'),
('Hvilket band sang "Temple of the Dog"?', 'multiple_choice', '["Pearl Jam", "Soundgarden", "Temple of the Dog", "Alice in Chains"]', 'Temple of the Dog', 'Musikk og sangtekster', 'hard'),
('Hvem sang "Bittersweet Symphony"?', 'multiple_choice', '["Oasis", "The Verve", "Blur", "Stone Roses"]', 'The Verve', 'Musikk og sangtekster', 'hard'),
('Hvilket band sang "Connection"?', 'multiple_choice', '["Elastica", "Sleeper", "Suede", "Pulp"]', 'Elastica', 'Musikk og sangtekster', 'hard'),
('Hvem sang "6 Underground"?', 'multiple_choice', '["Sneaker Pimps", "Portishead", "Massive Attack", "Tricky"]', 'Sneaker Pimps', 'Musikk og sangtekster', 'hard'),
('Hvilket band sang "Flagpole Sitta"?', 'multiple_choice', '["Harvey Danger", "Local H", "Toadies", "Marcy Playground"]', 'Harvey Danger', 'Musikk og sangtekster', 'hard'),
('Hvem sang "Possum Kingdom"?', 'multiple_choice', '["Stone Temple Pilots", "Toadies", "Local H", "Filter"]', 'Toadies', 'Musikk og sangtekster', 'hard'),
('Hvilket band sang "Pepper"?', 'multiple_choice', '["311", "Sublime", "Red Hot Chili Peppers", "Fishbone"]', 'Butthole Surfers', 'Musikk og sangtekster', 'hard'),
('Hvem sang "Lump"?', 'multiple_choice', '["Presidents of the United States of America", "Weezer", "Pavement", "Sonic Youth"]', 'Presidents of the United States of America', 'Musikk og sangtekster', 'hard'),
('Hvilket band sang "Peaches"?', 'multiple_choice', '["Weezer", "Presidents of the United States of America", "Pavement", "Beck"]', 'Presidents of the United States of America', 'Musikk og sangtekster', 'hard');

-- Number questions - Mix of difficulties
INSERT INTO quiz_questions (question_text, question_type, options, correct_answer, category, difficulty) VALUES
('Hvilket år kom "Thriller" av Michael Jackson ut?', 'number', NULL, '1982', 'Musikk og sangtekster', 'medium'),
('Hvilket år kom "Nevermind" av Nirvana ut?', 'number', NULL, '1991', 'Musikk og sangtekster', 'medium'),
('Hvilket år kom "Like a Prayer" av Madonna ut?', 'number', NULL, '1989', 'Musikk og sangtekster', 'easy'),
('Hvilket år kom "OK Computer" av Radiohead ut?', 'number', NULL, '1997', 'Musikk og sangtekster', 'hard'),
('Hvilket år kom "The Miseducation of Lauryn Hill" ut?', 'number', NULL, '1998', 'Musikk og sangtekster', 'hard');