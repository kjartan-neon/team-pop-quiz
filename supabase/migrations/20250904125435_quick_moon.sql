/*
  # Add Norwegian Children's TV Questions

  1. New Questions
    - 30 questions about Norwegian children's television shows
    - Mix of classic and modern shows from NRK and TV2
    - Questions about characters, shows, and Norwegian children's TV history
    - Includes both multiple choice and number questions

  2. Categories
    - All questions categorized as "Norsk barne-TV"
    - Mix of easy (25p), medium (50p), and hard (100p) difficulties
    - Covers shows from 1970s to present day

  3. Content
    - Classic shows: Flåklypa, Kaptein Sabeltann, Pompel og Pilt
    - Modern shows: Skam, Side om Side, Jenter
    - NRK Super and other children's programming
*/

-- Insert Norwegian Children's TV questions
INSERT INTO quiz_questions (question_text, question_type, options, correct_answer, category, difficulty) VALUES

-- Easy questions (25 points)
('Hva heter hovedpersonen i "Flåklypa Grand Prix"?', 'multiple_choice', '["Reodor Felgen", "Ludvig", "Lambert", "Solan Gundersen"]', 'Reodor Felgen', 'Norsk barne-TV', 'easy'),

('Hvilken kanal sender "NRK Super"?', 'multiple_choice', '["NRK1", "NRK2", "NRK3", "NRK"]', 'NRK', 'Norsk barne-TV', 'easy'),

('Hva heter kapteinens skip i "Kaptein Sabeltann"?', 'multiple_choice', '["Den Sorte Dame", "Havets Hevner", "Sjørøverskipet", "Skatteøya"]', 'Den Sorte Dame', 'Norsk barne-TV', 'easy'),

('Hvilke to figurer er hovedpersonene i "Pompel og Pilt"?', 'multiple_choice', '["To klovner", "To dukker", "To barn", "To dyr"]', 'To dukker', 'Norsk barne-TV', 'easy'),

('Hva heter hunden i "Sesam Stasjon"?', 'multiple_choice', '["Bjarne", "Alfa", "Rex", "Buster"]', 'Alfa', 'Norsk barne-TV', 'easy'),

('Hvilken farge har Teletubbies Po?', 'multiple_choice', '["Rød", "Gul", "Grønn", "Lilla"]', 'Rød', 'Norsk barne-TV', 'easy'),

('Hva heter programlederen i "Barne-TV"?', 'multiple_choice', '["Øystein Bache", "Marve Fleksnes", "Herr Skrubb", "Onkel Blå"]', 'Herr Skrubb', 'Norsk barne-TV', 'easy'),

('Hvilken by foregår "Skam" i?', 'multiple_choice', '["Bergen", "Trondheim", "Oslo", "Stavanger"]', 'Oslo', 'Norsk barne-TV', 'easy'),

('Hva heter elefanten i "Kamerat Kalle"?', 'multiple_choice', '["Jumbo", "Stampe", "Trompet", "Kalle"]', 'Stampe', 'Norsk barne-TV', 'easy'),

('Hvilken kanal sendte "Titten Tei"?', 'multiple_choice', '["NRK", "TV2", "TVNorge", "TV3"]', 'NRK', 'Norsk barne-TV', 'easy'),

-- Medium questions (50 points)
('Hvem spilte Kaptein Sabeltann i de første forestillingene?', 'multiple_choice', '["Terje Formoe", "Kyrre Haugen Sydness", "Jan Martin Johnsen", "Trond Kirkvaag"]', 'Terje Formoe', 'Norsk barne-TV', 'medium'),

('Hvilket år startet "Lørdagsgodt" på NRK?', 'multiple_choice', '["1965", "1970", "1975", "1980"]', '1970', 'Norsk barne-TV', 'medium'),

('Hva heter roboten i "Flåklypa Grand Prix"?', 'multiple_choice', '["Il Tempo Gigante", "Lambert", "Ludvig", "Reodor"]', 'Il Tempo Gigante', 'Norsk barne-TV', 'medium'),

('Hvilken skuespiller spilte "Onkel Blå"?', 'multiple_choice', '["Rolv Wesenlund", "Arve Opsahl", "Trond Kirkvaag", "Jon Skolmen"]', 'Rolv Wesenlund', 'Norsk barne-TV', 'medium'),

('Hva heter serien om tenåringsjenter på Hartvig Nissen VGS?', 'multiple_choice', '["Jenter", "Skam", "Side om Side", "Unge lovende"]', 'Skam', 'Norsk barne-TV', 'medium'),

('Hvilken figur i "Jul i Blåfjell" heter Blåmann?', 'multiple_choice', '["En nisse", "En troll", "En alv", "En dverg"]', 'En nisse', 'Norsk barne-TV', 'medium'),

('Hva heter programmet hvor barn kan ringe inn og snakke?', 'multiple_choice', '["Barnas time", "Ring til NRK", "Telefon til barna", "Barnetelefonen"]', 'Barnetelefonen', 'Norsk barne-TV', 'medium'),

('Hvilken norsk serie handler om en familie som driver hotell?', 'multiple_choice', '["Hotel Cæsar", "Side om Side", "Himmel og Hav", "Hotell Norge"]', 'Side om Side', 'Norsk barne-TV', 'medium'),

('Hva heter kua i "Dyrene i Hakkebakkeskogen"?', 'multiple_choice', '["Bestemor Skogmus", "Klatremus", "Bakermester Harepus", "Ingen ku"]', 'Ingen ku', 'Norsk barne-TV', 'medium'),

('Hvilken norsk animasjonsfilm handler om en sykkel?', 'multiple_choice', '["Solan og Ludvig", "Flåklypa Grand Prix", "Karius og Baktus", "Askeladden"]', 'Flåklypa Grand Prix', 'Norsk barne-TV', 'medium'),

('Hva heter serien om en gutt som bor hos bestemoren sin?', 'multiple_choice', '["Pelle Politibil", "Karsten og Petra", "Casper og Emma", "Lillebror"]', 'Lillebror', 'Norsk barne-TV', 'medium'),

('Hvilken kanal sendte "Fantorangen"?', 'multiple_choice', '["NRK", "TV2", "Disney Channel", "Nickelodeon"]', 'NRK', 'Norsk barne-TV', 'medium'),

('Hva heter serien om to barn som er bestevenner?', 'multiple_choice', '["Karsten og Petra", "Casper og Emma", "Pelle og Proffen", "Alle svarene"]', 'Alle svarene', 'Norsk barne-TV', 'medium'),

('Hvilken norsk serie handler om en politibil?', 'multiple_choice', '["Pelle Politibil", "Brannmann Sam", "Postmann Pat", "Thomas Toget"]', 'Pelle Politibil', 'Norsk barne-TV', 'medium'),

('Hva heter programmet hvor barn kan sende inn tegninger?', 'multiple_choice', '["Tegn med oss", "Barnas kunsttime", "Kreativ time", "Alle kan tegne"]', 'Tegn med oss', 'Norsk barne-TV', 'medium'),

-- Hard questions (100 points)
('Hvilket år ble "Flåklypa Grand Prix" første gang vist på kino?', 'multiple_choice', '["1973", "1975", "1977", "1979"]', '1975', 'Norsk barne-TV', 'hard'),

('Hvem var den opprinnelige stemmen til Solan Gundersen?', 'multiple_choice', '["Kari Simonsen", "Wenche Foss", "Knut Risan", "Harald Heide-Steen Jr."]', 'Kari Simonsen', 'Norsk barne-TV', 'hard'),

('Hvilket år startet "Sesam Stasjon" på norsk TV?', 'multiple_choice', '["1989", "1991", "1993", "1995"]', '1991', 'Norsk barne-TV', 'hard'),

('Hvem komponerte musikken til "Flåklypa Grand Prix"?', 'multiple_choice', '["Bent Fabricius-Bjerre", "Egil Monn-Iversen", "Arne Bendiksen", "Georg Kajanus"]', 'Bent Fabricius-Bjerre', 'Norsk barne-TV', 'hard'),

('Hvilket år ble NRK Super lansert som egen kanal?', 'multiple_choice', '["2005", "2007", "2009", "2011"]', '2007', 'Norsk barne-TV', 'hard'),

-- Number questions
('Hvor mange sesonger av "Skam" ble det laget?', 'number', NULL, '4', 'Norsk barne-TV', 'medium'),

('I hvilket år ble "Pompel og Pilt" første gang sendt på NRK?', 'number', NULL, '1969', 'Norsk barne-TV', 'hard'),

('Hvor mange Kaptein Sabeltann-filmer er det laget for kino? (per 2024)', 'number', NULL, '3', 'Norsk barne-TV', 'medium'),

('Hvor mange minutter varer en episode av "Flåklypa Grand Prix"?', 'number', NULL, '88', 'Norsk barne-TV', 'hard'),

('I hvilket år ble "Dyrene i Hakkebakkeskogen" første gang sendt på TV?', 'number', NULL, '1973', 'Norsk barne-TV', 'medium');