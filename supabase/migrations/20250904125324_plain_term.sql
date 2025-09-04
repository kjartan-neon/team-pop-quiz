/*
  # Add Pokémon Questions

  1. New Data
    - 30 Pokémon-related quiz questions
    - Mix of multiple choice and number questions
    - Various difficulty levels (easy, medium, hard)
    - Questions about Pokémon names, types, generations, and trivia

  2. Question Types
    - Multiple choice questions about Pokémon facts
    - Number questions about Pokédex numbers, stats, and counts
*/

INSERT INTO quiz_questions (question_text, question_type, options, correct_answer, category, difficulty) VALUES
-- Easy Questions
('Hvilken type er Pikachu?', 'multiple_choice', '["Electric", "Fire", "Water", "Grass"]', 'Electric', 'Pokémon', 'easy'),
('Hva heter hovedpersonen i Pokémon anime?', 'multiple_choice', '["Ash", "Gary", "Brock", "Misty"]', 'Ash', 'Pokémon', 'easy'),
('Hvilken farge har Charizard?', 'multiple_choice', '["Rød/Oransje", "Blå", "Grønn", "Lilla"]', 'Rød/Oransje', 'Pokémon', 'easy'),
('Hva er den første Pokémon i Pokédex?', 'multiple_choice', '["Pikachu", "Charmander", "Bulbasaur", "Squirtle"]', 'Bulbasaur', 'Pokémon', 'easy'),
('Hvilken type er Squirtle?', 'multiple_choice', '["Water", "Fire", "Electric", "Grass"]', 'Water', 'Pokémon', 'easy'),
('Hva heter Pikachu sin evolusjon?', 'multiple_choice', '["Raichu", "Pichu", "Electrode", "Voltorb"]', 'Raichu', 'Pokémon', 'easy'),
('Hvilken type er Charmander?', 'multiple_choice', '["Fire", "Water", "Electric", "Grass"]', 'Charmander', 'Pokémon', 'easy'),
('Hva er Pokémon kort for?', 'multiple_choice', '["Pocket Monsters", "Pokemon Masters", "Power Monsters", "Pocket Magic"]', 'Pocket Monsters', 'Pokémon', 'easy'),
('Hvilken by starter Ash sin reise i?', 'multiple_choice', '["Pallet Town", "Viridian City", "Pewter City", "Cerulean City"]', 'Pallet Town', 'Pokémon', 'easy'),
('Hva heter Team Rocket sine to hovedmedlemmer?', 'multiple_choice', '["Jessie og James", "Butch og Cassidy", "Annie og Oakley", "Domino og Pierce"]', 'Jessie og James', 'Pokémon', 'easy'),

-- Medium Questions
('Hvilken generasjon introduserte Dark og Steel typer?', 'multiple_choice', '["Generasjon 1", "Generasjon 2", "Generasjon 3", "Generasjon 4"]', 'Generasjon 2', 'Pokémon', 'medium'),
('Hva heter den legendariske Pokémon som kan kontrollere tid?', 'multiple_choice', '["Dialga", "Palkia", "Giratina", "Arceus"]', 'Dialga', 'Pokémon', 'medium'),
('Hvilken region er Pokémon Gold og Silver satt i?', 'multiple_choice', '["Kanto", "Johto", "Hoenn", "Sinnoh"]', 'Johto', 'Pokémon', 'medium'),
('Hva er den sterkeste ikke-legendariske Pokémon i generasjon 1?', 'multiple_choice', '["Dragonite", "Mewtwo", "Mew", "Alakazam"]', 'Dragonite', 'Pokémon', 'medium'),
('Hvilken Pokémon er kjent som "Genetic Pokémon"?', 'multiple_choice', '["Mew", "Mewtwo", "Ditto", "Porygon"]', 'Mewtwo', 'Pokémon', 'medium'),
('Hva heter Professor Oak sitt fornavn?', 'multiple_choice', '["Samuel", "Elm", "Birch", "Rowan"]', 'Samuel', 'Pokémon', 'medium'),
('Hvilken Pokémon evolusjon krever en Moon Stone?', 'multiple_choice', '["Clefairy til Clefable", "Pikachu til Raichu", "Eevee til Vaporeon", "Magikarp til Gyarados"]', 'Clefairy til Clefable', 'Pokémon', 'medium'),
('Hva er Ditto sin spesialitet?', 'multiple_choice', '["Transform", "Teleport", "Psychic", "Recover"]', 'Transform', 'Pokémon', 'medium'),
('Hvilken type er mest effektiv mot Ghost-type?', 'multiple_choice', '["Dark", "Ghost", "Psychic", "Normal"]', 'Ghost', 'Pokémon', 'medium'),
('Hva heter den første Gym Leader i Kanto?', 'multiple_choice', '["Brock", "Misty", "Lt. Surge", "Erika"]', 'Brock', 'Pokémon', 'medium'),

-- Hard Questions
('Hvilken Pokémon har høyest base stat total i generasjon 1?', 'multiple_choice', '["Mewtwo", "Mew", "Dragonite", "Alakazam"]', 'Mewtwo', 'Pokémon', 'hard'),
('Hva er Arceus sin signatur-move?', 'multiple_choice', '["Judgment", "Roar of Time", "Spacial Rend", "Shadow Force"]', 'Judgment', 'Pokémon', 'hard'),
('Hvilken Pokémon har ability "Wonder Guard"?', 'multiple_choice', '["Shedinja", "Spiritomb", "Sableye", "Duskull"]', 'Shedinja', 'Pokémon', 'hard'),
('Hva er den sjeldneste Pokémon-typen kombinasjonen?', 'multiple_choice', '["Ice/Bug", "Fire/Grass", "Electric/Dark", "Normal/Ghost"]', 'Ice/Bug', 'Pokémon', 'hard'),
('Hvilken move har høyest base power i Pokémon?', 'multiple_choice', '["Explosion", "Self-Destruct", "Hyper Beam", "Giga Impact"]', 'Explosion', 'Pokémon', 'hard'),

-- Number Questions
('Hvor mange originale Pokémon var det i generasjon 1?', 'number', NULL, '151', 'Pokémon', 'easy'),
('Hva er Pikachu sitt Pokédex nummer?', 'number', NULL, '25', 'Pokémon', 'easy'),
('Hvor mange typer Pokémon finnes det totalt?', 'number', NULL, '18', 'Pokémon', 'medium'),
('Hva er Mewtwo sitt Pokédex nummer?', 'number', NULL, '150', 'Pokémon', 'medium'),
('Hvor mange Eevee evolusjoner (Eeveelutions) finnes det?', 'number', NULL, '8', 'Pokémon', 'hard');