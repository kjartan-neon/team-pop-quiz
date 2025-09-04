/*
  # Add Hollywood Movie Quote Questions

  1. New Questions
    - 50 movie quote questions across different difficulties
    - Mix of multiple choice and number questions
    - Covers classic and modern blockbuster films
    - Questions ask which movie a famous quote is from

  2. Categories
    - All questions categorized as "Hollywood filmsitater"
    - Difficulty spread: 15 easy, 25 medium, 10 hard
    - 5 number questions about release years

  3. Content
    - Famous quotes from well-known blockbuster movies
    - Multiple choice options include similar genre films
    - Covers action, sci-fi, drama, and comedy blockbusters
*/

-- Easy movie quote questions (25 points)
INSERT INTO quiz_questions (question_text, question_type, options, correct_answer, category, difficulty) VALUES
('Hvilket film er sitatet "May the Force be with you" fra?', 'multiple_choice', '["Star Wars", "Star Trek", "Blade Runner", "Alien"]', 'Star Wars', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "I''ll be back" fra?', 'multiple_choice', '["Terminator", "Predator", "Total Recall", "Conan"]', 'Terminator', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "Here''s looking at you, kid" fra?', 'multiple_choice', '["Casablanca", "Gone with the Wind", "Roman Holiday", "Sunset Boulevard"]', 'Casablanca', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "You talking to me?" fra?', 'multiple_choice', '["Taxi Driver", "Goodfellas", "Scarface", "The Godfather"]', 'Taxi Driver', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "Life is like a box of chocolates" fra?', 'multiple_choice', '["Forrest Gump", "Big", "Cast Away", "Philadelphia"]', 'Forrest Gump', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "I see dead people" fra?', 'multiple_choice', '["The Sixth Sense", "The Others", "Ghost", "Poltergeist"]', 'The Sixth Sense', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "Show me the money!" fra?', 'multiple_choice', '["Jerry Maguire", "Wall Street", "Top Gun", "A Few Good Men"]', 'Jerry Maguire', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "Houston, we have a problem" fra?', 'multiple_choice', '["Apollo 13", "Gravity", "Interstellar", "The Right Stuff"]', 'Apollo 13', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "Nobody puts Baby in a corner" fra?', 'multiple_choice', '["Dirty Dancing", "Flashdance", "Footloose", "Saturday Night Fever"]', 'Dirty Dancing', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "You can''t handle the truth!" fra?', 'multiple_choice', '["A Few Good Men", "The Firm", "JFK", "Born on the Fourth of July"]', 'A Few Good Men', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "E.T. phone home" fra?', 'multiple_choice', '["E.T.", "Close Encounters", "Alien", "The Thing"]', 'E.T.', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "Frankly, my dear, I don''t give a damn" fra?', 'multiple_choice', '["Gone with the Wind", "Casablanca", "Citizen Kane", "The Maltese Falcon"]', 'Gone with the Wind', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "I''m gonna make him an offer he can''t refuse" fra?', 'multiple_choice', '["The Godfather", "Goodfellas", "Scarface", "Casino"]', 'The Godfather', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "There''s no place like home" fra?', 'multiple_choice', '["The Wizard of Oz", "Alice in Wonderland", "Peter Pan", "Mary Poppins"]', 'The Wizard of Oz', 'Hollywood filmsitater', 'easy'),
('Hvilket film er sitatet "Keep your friends close, but your enemies closer" fra?', 'multiple_choice', '["The Godfather Part II", "Scarface", "Casino", "Goodfellas"]', 'The Godfather Part II', 'Hollywood filmsitater', 'easy'),

-- Medium movie quote questions (50 points)
('Hvilket film er sitatet "Roads? Where we''re going, we don''t need roads" fra?', 'multiple_choice', '["Back to the Future", "Star Wars", "Blade Runner", "The Terminator"]', 'Back to the Future', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "I feel the need... the need for speed!" fra?', 'multiple_choice', '["Top Gun", "Days of Thunder", "Rush", "Ford v Ferrari"]', 'Top Gun', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Say hello to my little friend!" fra?', 'multiple_choice', '["Scarface", "The Godfather", "Goodfellas", "Casino"]', 'Scarface', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "I''m not a smart man, but I know what love is" fra?', 'multiple_choice', '["Forrest Gump", "Big", "Philadelphia", "Cast Away"]', 'Forrest Gump', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Wax on, wax off" fra?', 'multiple_choice', '["The Karate Kid", "Rocky", "Bloodsport", "Enter the Dragon"]', 'The Karate Kid', 'Hollywood filmsitater', 'medium'),
('Vilket film er sitatet "Nobody expects the Spanish Inquisition!" fra?', 'multiple_choice', '["Monty Python''s Flying Circus", "Life of Brian", "Holy Grail", "The Meaning of Life"]', 'Monty Python''s Flying Circus', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "I am your father" fra?', 'multiple_choice', '["The Empire Strikes Back", "A New Hope", "Return of the Jedi", "Revenge of the Sith"]', 'The Empire Strikes Back', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Here''s Johnny!" fra?', 'multiple_choice', '["The Shining", "Psycho", "Halloween", "Friday the 13th"]', 'The Shining', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Yippee-ki-yay, motherf***er!" fra?', 'multiple_choice', '["Die Hard", "Lethal Weapon", "48 Hrs.", "Beverly Hills Cop"]', 'Die Hard', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Go ahead, make my day" fra?', 'multiple_choice', '["Sudden Impact", "Dirty Harry", "Magnum Force", "The Enforcer"]', 'Sudden Impact', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "I''ll have what she''s having" fra?', 'multiple_choice', '["When Harry Met Sally", "Sleepless in Seattle", "You''ve Got Mail", "The Princess Bride"]', 'When Harry Met Sally', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Carpe diem. Seize the day, boys" fra?', 'multiple_choice', '["Dead Poets Society", "Good Will Hunting", "School Ties", "The Paper Chase"]', 'Dead Poets Society', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "I''m king of the world!" fra?', 'multiple_choice', '["Titanic", "The Aviator", "Catch Me If You Can", "Romeo + Juliet"]', 'Titanic', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "You had me at hello" fra?', 'multiple_choice', '["Jerry Maguire", "Top Gun", "A Few Good Men", "Mission: Impossible"]', 'Jerry Maguire', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "My precious" fra?', 'multiple_choice', '["The Lord of the Rings", "The Hobbit", "Harry Potter", "Chronicles of Narnia"]', 'The Lord of the Rings', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Why so serious?" fra?', 'multiple_choice', '["The Dark Knight", "Batman Begins", "Batman Returns", "Batman Forever"]', 'The Dark Knight', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "I am Iron Man" fra?', 'multiple_choice', '["Iron Man", "The Avengers", "Iron Man 2", "Captain America"]', 'Iron Man', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "With great power comes great responsibility" fra?', 'multiple_choice', '["Spider-Man", "X-Men", "Superman", "Batman"]', 'Spider-Man', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "I have a very particular set of skills" fra?', 'multiple_choice', '["Taken", "The Bourne Identity", "John Wick", "Mission: Impossible"]', 'Taken', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Welcome to the party, pal!" fra?', 'multiple_choice', '["Die Hard", "Lethal Weapon", "48 Hrs.", "Beverly Hills Cop"]', 'Die Hard', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "I''m not bad. I''m just drawn that way" fra?', 'multiple_choice', '["Who Framed Roger Rabbit", "Cool World", "The Mask", "Space Jam"]', 'Who Framed Roger Rabbit', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Hasta la vista, baby" fra?', 'multiple_choice', '["Terminator 2", "Predator", "Total Recall", "True Lies"]', 'Terminator 2', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Nobody makes me bleed my own blood" fra?', 'multiple_choice', '["Dodgeball", "Zoolander", "Anchorman", "Old School"]', 'Dodgeball', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "I am serious... and don''t call me Shirley" fra?', 'multiple_choice', '["Airplane!", "The Naked Gun", "Blazing Saddles", "Young Frankenstein"]', 'Airplane!', 'Hollywood filmsitater', 'medium'),
('Hvilket film er sitatet "Bueller? Bueller?" fra?', 'multiple_choice', '["Ferris Bueller''s Day Off", "Sixteen Candles", "The Breakfast Club", "Pretty in Pink"]', 'Ferris Bueller''s Day Off', 'Hollywood filmsitater', 'medium'),

-- Hard movie quote questions (100 points)
('Hvilket film er sitatet "The first rule of Fight Club is: You do not talk about Fight Club" fra?', 'multiple_choice', '["Fight Club", "Se7en", "The Game", "Zodiac"]', 'Fight Club', 'Hollywood filmsitater', 'hard'),
('Hvilket film er sitatet "I drink your milkshake!" fra?', 'multiple_choice', '["There Will Be Blood", "No Country for Old Men", "The Departed", "Gangs of New York"]', 'There Will Be Blood', 'Hollywood filmsitater', 'hard'),
('Hvilket film er sitatet "Rosebud" fra?', 'multiple_choice', '["Citizen Kane", "The Maltese Falcon", "Casablanca", "Sunset Boulevard"]', 'Citizen Kane', 'Hollywood filmsitater', 'hard'),
('Hvilket film er sitatet "I''m walking here! I''m walking here!" fra?', 'multiple_choice', '["Midnight Cowboy", "Taxi Driver", "Mean Streets", "Serpico"]', 'Midnight Cowboy', 'Hollywood filmsitater', 'hard'),
('Hvilket film er sitatet "Greed, for lack of a better word, is good" fra?', 'multiple_choice', '["Wall Street", "The Wolf of Wall Street", "Boiler Room", "Glengarry Glen Ross"]', 'Wall Street', 'Hollywood filmsitater', 'hard'),
('Hvilket film er sitatet "I coulda been a contender" fra?', 'multiple_choice', '["On the Waterfront", "Rocky", "Raging Bull", "The Hustler"]', 'On the Waterfront', 'Hollywood filmsitater', 'hard'),
('Hvilket film er sitatet "All work and no play makes Jack a dull boy" fra?', 'multiple_choice', '["The Shining", "Psycho", "The Exorcist", "Rosemary''s Baby"]', 'The Shining', 'Hollywood filmsitater', 'hard'),
('Hvilket film er sitatet "I''m gonna get medieval on your ass" fra?', 'multiple_choice', '["Pulp Fiction", "Reservoir Dogs", "Kill Bill", "Jackie Brown"]', 'Pulp Fiction', 'Hollywood filmsitater', 'hard'),
('Hvilket film er sitatet "Forget it, Jake, it''s Chinatown" fra?', 'multiple_choice', '["Chinatown", "The Long Goodbye", "The Big Sleep", "L.A. Confidential"]', 'Chinatown', 'Hollywood filmsitater', 'hard'),
('Hvilket film er sitatet "I love the smell of napalm in the morning" fra?', 'multiple_choice', '["Apocalypse Now", "Platoon", "Full Metal Jacket", "Born on the Fourth of July"]', 'Apocalypse Now', 'Hollywood filmsitater', 'hard'),

-- Number questions about movie release years
('Hvilket år kom filmen "The Godfather" ut?', 'number', NULL, '1972', 'Hollywood filmsitater', 'medium'),
('Hvilket år kom filmen "Star Wars: A New Hope" ut?', 'number', NULL, '1977', 'Hollywood filmsitater', 'medium'),
('Hvilket år kom filmen "Casablanca" ut?', 'number', NULL, '1942', 'Hollywood filmsitater', 'hard'),
('Hvilket år kom filmen "Pulp Fiction" ut?', 'number', NULL, '1994', 'Hollywood filmsitater', 'medium'),
('Hvilket år kom filmen "Titanic" ut?', 'number', NULL, '1997', 'Hollywood filmsitater', 'easy');