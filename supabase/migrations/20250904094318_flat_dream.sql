/*
  # Add questions about people named Christian and Heidi

  1. New Questions
    - 30 questions featuring people named Christian
    - 30 questions featuring people named Heidi
    - Mix of multiple choice and number questions
    - Various difficulty levels and categories

  2. Categories
    - NRK (Norwegian broadcasting)
    - Popmusikk (Pop music)
    - Verden (World knowledge)
    - Vitenskap (Science)
    - Allmennkunnskap (General knowledge)
*/

INSERT INTO quiz_questions (question_text, question_type, options, correct_answer, category, difficulty) VALUES

-- Christian questions
('Hvilken norsk komiker heter Christian Skolmen?', 'multiple_choice', '["Christian Skolmen", "Christian Løchstøer", "Christian Ingebrigtsen", "Christian Strand"]', 'Christian Skolmen', 'Allmennkunnskap', 'easy'),

('Christian Ingebrigtsen var medlem av hvilken boyband?', 'multiple_choice', '["A1", "Westlife", "Backstreet Boys", "NSYNC"]', 'A1', 'Popmusikk', 'medium'),

('Hvilken norsk skuespiller heter Christian Rubeck?', 'multiple_choice', '["Christian Rubeck", "Christian Skolmen", "Christian Strand", "Christian Løchstøer"]', 'Christian Rubeck', 'Allmennkunnskap', 'medium'),

('Christian Bale spilte Batman i hvilken filmtrilogi?', 'multiple_choice', '["The Dark Knight-trilogien", "Batman Forever-serien", "Batman Returns-serien", "Justice League-filmene"]', 'The Dark Knight-trilogien', 'Allmennkunnskap', 'easy'),

('Hvilket år ble Christian Radich bygget?', 'number', null, '1937', 'Allmennkunnskap', 'hard'),

('Christian Løchstøer er kjent som programleder på hvilken NRK-sending?', 'multiple_choice', '["Nytt på nytt", "Side om side", "Kvitt eller dobbelt", "Lotto-trekningen"]', 'Nytt på nytt', 'NRK', 'easy'),

('Christian Dior grunnla sitt motehus i hvilket år?', 'number', null, '1946', 'Allmennkunnskap', 'hard'),

('Hvilken norsk artist heter Christian Strand?', 'multiple_choice', '["Christian Strand", "Christian Ingebrigtsen", "Christian Skolmen", "Christian Løchstøer"]', 'Christian Strand', 'Popmusikk', 'medium'),

('Christian Eriksen spiller fotball for hvilket landslag?', 'multiple_choice', '["Danmark", "Norge", "Sverige", "Finland"]', 'Danmark', 'Allmennkunnskap', 'easy'),

('Hvilket år ble Christian IV kronet som konge av Danmark-Norge?', 'number', null, '1588', 'Allmennkunnskap', 'hard'),

('Christian Tybring-Gjedde er politiker for hvilket parti?', 'multiple_choice', '["Fremskrittspartiet", "Høyre", "Arbeiderpartiet", "Senterpartiet"]', 'Fremskrittspartiet', 'Allmennkunnskap', 'medium'),

('Christian Slater spilte hovedrollen i hvilken kultfilm fra 1988?', 'multiple_choice', '["Heathers", "The Breakfast Club", "Ferris Bueller''s Day Off", "Pretty in Pink"]', 'Heathers', 'Allmennkunnskap', 'medium'),

('Hvor mange ganger var Christian IV gift?', 'number', null, '2', 'Allmennkunnskap', 'hard'),

('Christian Michelsen var Norges første hva?', 'multiple_choice', '["Statsminister", "Konge", "President", "Stortingspresident"]', 'Statsminister', 'Allmennkunnskap', 'medium'),

('Christian Doppler oppdaget Doppler-effekten innen hvilket fagområde?', 'multiple_choice', '["Fysikk", "Kjemi", "Biologi", "Matematikk"]', 'Fysikk', 'Vitenskap', 'medium'),

('Hvilket år døde Christian Krohg?', 'number', null, '1925', 'Allmennkunnskap', 'hard'),

('Christian Lacroix er kjent som hva?', 'multiple_choice', '["Motedesigner", "Maler", "Musiker", "Skuespiller"]', 'Motedesigner', 'Allmennkunnskap', 'medium'),

('Christian Bautista er en artist fra hvilket land?', 'multiple_choice', '["Filippinene", "Mexico", "Spania", "Brasil"]', 'Filippinene', 'Popmusikk', 'hard'),

('Hvor mange barn hadde Christian IV?', 'number', null, '23', 'Allmennkunnskap', 'hard'),

('Christian Andersen skrev "Den lille havfrue" i hvilket år?', 'number', null, '1837', 'Allmennkunnskap', 'hard'),

('Christian Cage er et artistnavn innen hvilken bransje?', 'multiple_choice', '["Wrestling", "Musikk", "Film", "TV"]', 'Wrestling', 'Allmennkunnskap', 'medium'),

('Christian Horner er teamsjef for hvilket Formel 1-team?', 'multiple_choice', '["Red Bull Racing", "Mercedes", "Ferrari", "McLaren"]', 'Red Bull Racing', 'Allmennkunnskap', 'medium'),

('Hvilket år ble Christian Ringnes født?', 'number', null, '1954', 'Allmennkunnskap', 'hard'),

('Christian Berge er landslagstrener i hvilken idrett?', 'multiple_choice', '["Håndball", "Fotball", "Ishockey", "Basketball"]', 'Håndball', 'Allmennkunnskap', 'medium'),

('Christian Aguilera sang "Genie in a Bottle" i hvilket år?', 'number', null, '1999', 'Popmusikk', 'medium'),

('Christian Sinding komponerte "Rustle of Spring" i hvilket år?', 'number', null, '1896', 'Allmennkunnskap', 'hard'),

('Christian Morgenstern var en forfatter fra hvilket land?', 'multiple_choice', '["Tyskland", "Østerrike", "Sveits", "Nederland"]', 'Tyskland', 'Allmennkunnskap', 'medium'),

('Christian Barnard utførte verdens første hva?', 'multiple_choice', '["Hjertetransplantasjon", "Nyretransplantasjon", "Levertransplantasjon", "Lungetransplantasjon"]', 'Hjertetransplantasjon', 'Vitenskap', 'medium'),

('Hvilket år døde Christian Doppler?', 'number', null, '1853', 'Vitenskap', 'hard'),

('Christian Louboutin er kjent for å lage hva?', 'multiple_choice', '["Sko", "Vesker", "Klær", "Smykker"]', 'Sko', 'Allmennkunnskap', 'easy'),

-- Heidi questions
('Heidi Løke er en norsk utøver innen hvilken idrett?', 'multiple_choice', '["Håndball", "Fotball", "Volleyball", "Basketball"]', 'Håndball', 'Allmennkunnskap', 'easy'),

('Heidi Klum var gift med hvilken musiker?', 'multiple_choice', '["Seal", "Lenny Kravitz", "John Mayer", "Adam Levine"]', 'Seal', 'Allmennkunnskap', 'medium'),

('Heidi Montag var med i hvilket reality-TV-program?', 'multiple_choice', '["The Hills", "The Bachelor", "Keeping Up with the Kardashians", "Jersey Shore"]', 'The Hills', 'Allmennkunnskap', 'medium'),

('Hvilket år kom boken "Heidi" av Johanna Spyri ut?', 'number', null, '1881', 'Allmennkunnskap', 'hard'),

('Heidi Range var medlem av hvilken britisk jentegruppe?', 'multiple_choice', '["Sugababes", "Girls Aloud", "Atomic Kitten", "All Saints"]', 'Sugababes', 'Popmusikk', 'medium'),

('Heidi Weng er en norsk utøver innen hvilken idrett?', 'multiple_choice', '["Langrenn", "Skiskyting", "Alpint", "Skøyter"]', 'Langrenn', 'Allmennkunnskap', 'easy'),

('I hvilken sveitsisk region foregår historien om Heidi?', 'multiple_choice', '["Alpene", "Jura", "Mittelland", "Ticino"]', 'Alpene', 'Allmennkunnskap', 'medium'),

('Heidi Fleiss var kjent som hva i USA?', 'multiple_choice', '["Hollywood Madam", "Skuespiller", "Sanger", "Politiker"]', 'Hollywood Madam', 'Allmennkunnskap', 'hard'),

('Hvilket år ble Heidi Klum født?', 'number', null, '1973', 'Allmennkunnskap', 'medium'),

('Heidi Andersson er en svensk artist kjent for hvilken sang?', 'multiple_choice', '["I''m In Love", "Dancing Queen", "Waterloo", "Fernando"]', 'I''m In Love', 'Popmusikk', 'hard'),

('Heidi Newfield var vokalist i hvilket countryband?', 'multiple_choice', '["Trick Pony", "Lady Antebellum", "The Dixie Chicks", "Sugarland"]', 'Trick Pony', 'Popmusikk', 'hard'),

('Hvor gammel var Heidi i den opprinnelige historien?', 'number', null, '5', 'Allmennkunnskap', 'medium'),

('Heidi Cortez er kjent som hva?', 'multiple_choice', '["Modell", "Skuespiller", "Sanger", "Danser"]', 'Modell', 'Allmennkunnskap', 'medium'),

('Heidi Klum var dommer i hvilken amerikansk TV-konkurranse?', 'multiple_choice', '["America''s Got Talent", "American Idol", "The Voice", "X Factor"]', 'America''s Got Talent', 'Allmennkunnskap', 'easy'),

('Hvilket år giftet Heidi Klum seg med Tom Kaulitz?', 'number', null, '2019', 'Allmennkunnskap', 'hard'),

('Heidi Hauge er en norsk artist kjent for hvilken sjanger?', 'multiple_choice', '["Country", "Pop", "Rock", "Jazz"]', 'Country', 'Popmusikk', 'medium'),

('Heidi Happy er en sveitsisk artist som synger på hvilket språk?', 'multiple_choice', '["Tysk", "Fransk", "Italiensk", "Engelsk"]', 'Tysk', 'Popmusikk', 'hard'),

('Hvor mange barn har Heidi Klum?', 'number', null, '4', 'Allmennkunnskap', 'medium'),

('Heidi Kabel var en tysk skuespiller kjent for hvilken dialekt?', 'multiple_choice', '["Plattdeutsch", "Bayerisch", "Sächsisch", "Schwäbisch"]', 'Plattdeutsch', 'Allmennkunnskap', 'hard'),

('Heidi Schüller var en tysk artist på hvilket tiår?', 'multiple_choice', '["1960-tallet", "1970-tallet", "1980-tallet", "1990-tallet"]', '1960-tallet', 'Popmusikk', 'hard'),

('Heidi Brühl sang "Wir wollen niemals auseinandergehn" i hvilket år?', 'number', null, '1960', 'Popmusikk', 'hard'),

('Heidi Janků er en artist fra hvilket land?', 'multiple_choice', '["Tsjekkia", "Slovakia", "Polen", "Ungarn"]', 'Tsjekkia', 'Popmusikk', 'hard'),

('Hvor høy er fjellet Heidi bor på i den opprinnelige historien?', 'number', null, '1800', 'Allmennkunnskap', 'hard'),

('Heidi Korth er gift med hvilken nigeriansk musiker?', 'multiple_choice', '["Davido", "Wizkid", "Burna Boy", "Tiwa Savage"]', 'Davido', 'Popmusikk', 'hard'),

('Heidi Talbot er en irsk folkemusiker som spiller hvilket instrument?', 'multiple_choice', '["Gitar", "Fiolin", "Harpe", "Fløyte"]', 'Gitar', 'Popmusikk', 'medium'),

('Heidi Murkoff skrev hvilken populære bok for gravide?', 'multiple_choice', '["What to Expect When You''re Expecting", "The Pregnancy Bible", "Expecting Better", "The First Nine Months"]', 'What to Expect When You''re Expecting', 'Allmennkunnskap', 'medium'),

('Heidi Powell er kjent som hva i USA?', 'multiple_choice', '["Fitnesstrener", "Skuespiller", "Sanger", "Kok"]', 'Fitnesstrener', 'Allmennkunnskap', 'medium'),

('Heidi Zeigler er en amerikansk artist kjent for hvilken sjanger?', 'multiple_choice', '["Country", "Pop", "Rock", "Jazz"]', 'Country', 'Popmusikk', 'hard'),

('Heidi Swedberg spilte hvilken karakter i Seinfeld?', 'multiple_choice', '["Susan Ross", "Elaine Benes", "Kramer", "Newman"]', 'Susan Ross', 'Allmennkunnskap', 'medium'),

('Heidi Montag giftet seg med Spencer Pratt i hvilket år?', 'number', null, '2009', 'Allmennkunnskap', 'hard');