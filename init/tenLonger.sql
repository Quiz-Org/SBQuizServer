-- Quiz 7: Geography
INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
    (7, 'Geography Quiz', 'Test your knowledge of world geography.', 15);

-- Questions for Quiz 7: Geography
INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (128, 7, 'What is the capital of Australia?'),
                                                               (129, 7, 'Which river is the longest in the world?'),
                                                               (130, 7, 'Which country is known as the Land of the Rising Sun?'),
                                                               (131, 7, 'In which continent is the Sahara Desert located?'),
                                                               (132, 7, 'What is the largest ocean on Earth?'),
                                                               (133, 7, 'Which mountain range runs along the northern border of India?'),
                                                               (134, 7, 'Which country is home to the famous ancient site of Machu Picchu?'),
                                                               (135, 7, 'Which African country is known as the "Pearl of Africa"?'),
                                                               (136, 7, 'Which European city is divided into two parts by the Bosphorus Strait?'),
                                                               (137, 7, 'What is the tallest waterfall in the world?'),
                                                               (138, 7, 'Which two countries share the longest border in the world?'),
                                                               (139, 7, 'Which city is often called the "Eternal City"?'),
                                                               (140, 7, 'Which country is known as the "Land of Smiles"?'),
                                                               (141, 7, 'Which sea is bordered by Spain, France, and Italy?'),
                                                               (142, 7, 'Which country is the smallest in the world by land area?');

-- Answers for Quiz 7: Geography
INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (130, 128, 'Canberra', 1),
                                                                          (131, 128, 'Sydney', 0),
                                                                          (132, 128, 'Melbourne', 0),
                                                                          (133, 128, 'Auckland', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (134, 129, 'Amazon River', 0),
                                                                          (135, 129, 'Yangtze River', 0),
                                                                          (136, 129, 'Nile River', 1),
                                                                          (137, 129, 'Mississippi River', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (138, 130, 'China', 0),
                                                                          (139, 130, 'Japan', 1),
                                                                          (140, 130, 'South Korea', 0),
                                                                          (141, 130, 'Vietnam', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (142, 131, 'Africa', 1),
                                                                          (143, 131, 'South America', 0),
                                                                          (144, 131, 'Asia', 0),
                                                                          (145, 131, 'Australia', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (146, 132, 'Atlantic Ocean', 0),
                                                                          (147, 132, 'Arctic Ocean', 0),
                                                                          (148, 132, 'Indian Ocean', 0),
                                                                          (149, 132, 'Pacific Ocean', 1);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (150, 133, 'Himalayas', 1),
                                                                          (151, 133, 'Rocky Mountains', 0),
                                                                          (152, 133, 'Andes', 0),
                                                                          (153, 133, 'Alps', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (154, 134, 'Peru', 1),
                                                                          (155, 134, 'Brazil', 0),
                                                                          (156, 134, 'Mexico', 0),
                                                                          (157, 134, 'Egypt', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (158, 135, 'Uganda', 1),
                                                                          (159, 135, 'Kenya', 0),
                                                                          (160, 135, 'Tanzania', 0),
                                                                          (161, 135, 'Nigeria', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (162, 136, 'Istanbul', 1),
                                                                          (163, 136, 'Rome', 0),
                                                                          (164, 136, 'Athens', 0),
                                                                          (165, 136, 'Cairo', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (166, 137, 'Angel Falls', 1),
                                                                          (167, 137, 'Niagara Falls', 0),
                                                                          (168, 137, 'Iguazu Falls', 0),
                                                                          (169, 137, 'Victoria Falls', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (170, 138, 'Canada and Russia', 1),
                                                                          (171, 138, 'United States and Canada', 0),
                                                                          (172, 138, 'India and China', 0),
                                                                          (173, 138, 'Russia and Kazakhstan', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (174, 139, 'Rome', 1),
                                                                          (175, 139, 'Paris', 0),
                                                                          (176, 139, 'Athens', 0),
                                                                          (177, 139, 'Berlin', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (178, 140, 'Thailand', 1),
                                                                          (179, 140, 'Indonesia', 0),
                                                                          (180, 140, 'Vietnam', 0),
                                                                          (181, 140, 'Malaysia', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (182, 141, 'Mediterranean Sea', 1),
                                                                          (183, 141, 'Caribbean Sea', 0),
                                                                          (184, 141, 'Red Sea', 0),
                                                                          (185, 141, 'Arabian Sea', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (186, 142, 'Vatican City', 1),
                                                                          (187, 142, 'Monaco', 0),
                                                                          (188, 142, 'Nauru', 0),
                                                                          (189, 142, 'San Marino', 0);

-- Quiz 8: Sports
INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
    (8, 'Sports Quiz', 'Test your knowledge of sports and athletic events.', 15);

-- Questions for Quiz 8: Sports
INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (190, 8, 'In which sport would you perform a slam dunk?'),
                                                               (191, 8, 'Which country won the first FIFA World Cup in 1930?'),
                                                               (192, 8, 'What is the highest score achievable in a single turn in bowling?'),
                                                               (193, 8, 'Which sport uses a shuttlecock?'),
                                                               (194, 8, 'Who holds the record for the most Olympic gold medals?'),
                                                               (195, 8, 'Which tennis player has the most Grand Slam titles?'),
                                                               (196, 8, 'Which country is known for inventing the sport of cricket?'),
                                                               (197, 8, 'In which sport would you perform a "slalom"?'),
                                                               (198, 8, 'Which boxer is nicknamed "Iron Mike"?'),
                                                               (199, 8, 'What is the name of the horse race known as "The Run for the Roses"?'),
                                                               (200, 8, 'Which track and field event involves throwing a heavy metal ball?'),
                                                               (201, 8, 'Which sport is measured in knots and involves wind and water?'),
                                                               (202, 8, 'Which golf major is played at Augusta National Golf Club?'),
                                                               (203, 8, 'Which athlete is often referred to as "The Greatest"?'),
                                                               (204, 8, 'What is the official ball used in basketball competitions?');

-- Answers for Quiz 8: Sports
INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (190, 190, 'Basketball', 1),
                                                                          (191, 190, 'Soccer', 0),
                                                                          (192, 190, 'Volleyball', 0),
                                                                          (193, 190, 'Tennis', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (426, 191, 'Uruguay', 1),
                                                                          (427, 191, 'Brazil', 0),
                                                                          (428, 191, 'Germany', 0),
                                                                          (429, 191, 'Italy', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (194, 192, '300', 0),
                                                                          (195, 192, '200', 0),
                                                                          (196, 192, '100', 0),
                                                                          (197, 192, '300', 1);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (198, 193, 'Badminton', 1),
                                                                          (199, 193, 'Table Tennis', 0),
                                                                          (200, 193, 'Squash', 0),
                                                                          (201, 193, 'Tennis', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (202, 194, 'Michael Phelps', 1),
                                                                          (203, 194, 'Usain Bolt', 0),
                                                                          (204, 194, 'Carl Lewis', 0),
                                                                          (205, 194, 'Nadia Comăneci', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (206, 195, 'Roger Federer', 0),
                                                                          (207, 195, 'Serena Williams', 1),
                                                                          (208, 195, 'Rafael Nadal', 0),
                                                                          (209, 195, 'Steffi Graf', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (210, 196, 'England', 1),
                                                                          (211, 196, 'India', 0),
                                                                          (212, 196, 'Australia', 0),
                                                                          (213, 196, 'United States', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (214, 197, 'Skiing', 1),
                                                                          (215, 197, 'Snowboarding', 0),
                                                                          (216, 197, 'Cycling', 0),
                                                                          (217, 197, 'Windsurfing', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (218, 198, 'Mike Tyson', 1),
                                                                          (219, 198, 'Muhammad Ali', 0),
                                                                          (220, 198, 'Floyd Mayweather Jr.', 0),
                                                                          (221, 198, 'Evander Holyfield', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (222, 199, 'Kentucky Derby', 1),
                                                                          (223, 199, 'Preakness Stakes', 0),
                                                                          (224, 199, 'Belmont Stakes', 0),
                                                                          (225, 199, 'Melbourne Cup', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (226, 200, 'Shot Put', 1),
                                                                          (227, 200, 'Discus Throw', 0),
                                                                          (228, 200, 'Javelin Throw', 0),
                                                                          (229, 200, 'Hammer Throw', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (230, 201, 'Sailing', 1),
                                                                          (231, 201, 'Surfing', 0),
                                                                          (232, 201, 'Ice Hockey', 0),
                                                                          (233, 201, 'Motocross', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (234, 202, 'The Masters', 1),
                                                                          (235, 202, 'The Open Championship (British Open)', 0),
                                                                          (236, 202, 'U.S. Open', 0),
                                                                          (237, 202, 'PGA Championship', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (238, 203, 'Muhammad Ali', 0),
                                                                          (239, 203, 'Michael Jordan', 1),
                                                                          (240, 203, 'Serena Williams', 0),
                                                                          (241, 203, 'Pele', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (242, 204, 'Basketball', 0),
                                                                          (243, 204, 'Football (Soccer)', 0),
                                                                          (244, 204, 'Tennis', 0),
                                                                          (245, 204, 'Basketball', 1);

-- Quiz 9: Music
INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
    (9, 'Music Quiz', 'Test your knowledge of music and musicians.', 15);

-- Questions for Quiz 9: Music
INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (246, 9, 'Who is known as the "Queen of Pop"?'),
                                                               (247, 9, 'Which band is often referred to as "The Fab Four"?'),
                                                               (248, 9, 'Which instrument has 88 keys?'),
                                                               (249, 9, 'Which composer wrote the "Moonlight Sonata"?'),
                                                               (250, 9, 'In which country did the opera originate?'),
                                                               (251, 9, 'Who released the album "Thriller"?'),
                                                               (252, 9, 'Which music genre is characterized by its use of turntables and sampling?'),
                                                               (253, 9, 'Which rock band is known for its iconic tongue logo?'),
                                                               (254, 9, 'What is the name of the traditional Japanese three-stringed instrument?'),
                                                               (255, 9, 'Which famous composer was deaf during the latter part of his life?'),
                                                               (256, 9, 'Which singer is known for hits like "Like a Virgin" and "Vogue"?'),
                                                               (257, 9, 'What is the highest singing voice for males?'),
                                                               (258, 9, 'Which song by John Lennon is a plea for world peace?'),
                                                               (259, 9, 'Which country music legend is known for hits like "Ring of Fire" and "Folsom Prison Blues"?'),
                                                               (260, 9, 'In which decade did the punk rock movement emerge?');

-- Answers for Quiz 9: Music
INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (246, 246, 'Madonna', 1),
                                                                          (247, 246, 'Beyoncé', 0),
                                                                          (248, 246, 'Lady Gaga', 0),
                                                                          (249, 246, 'Adele', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (250, 247, 'The Beatles', 1),
                                                                          (251, 247, 'The Rolling Stones', 0),
                                                                          (252, 247, 'Led Zeppelin', 0),
                                                                          (253, 247, 'Queen', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (254, 248, 'Piano', 1),
                                                                          (255, 248, 'Guitar', 0),
                                                                          (256, 248, 'Violin', 0),
                                                                          (257, 248, 'Trumpet', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (258, 249, 'Ludwig van Beethoven', 1),
                                                                          (259, 249, 'Wolfgang Amadeus Mozart', 0),
                                                                          (260, 249, 'Johann Sebastian Bach', 0),
                                                                          (261, 249, 'Franz Schubert', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (262, 250, 'Italy', 1),
                                                                          (263, 250, 'Germany', 0),
                                                                          (264, 250, 'France', 0),
                                                                          (265, 250, 'Spain', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (266, 251, 'Michael Jackson', 1),
                                                                          (267, 251, 'Prince', 0),
                                                                          (268, 251, 'Whitney Houston', 0),
                                                                          (269, 251, 'David Bowie', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (270, 252, 'Hip Hop', 0),
                                                                          (271, 252, 'Jazz', 0),
                                                                          (272, 252, 'Electronic', 1),
                                                                          (273, 252, 'Classical', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (274, 253, 'The Rolling Stones', 0),
                                                                          (275, 253, 'The Who', 0),
                                                                          (276, 253, 'Pink Floyd', 0),
                                                                          (277, 253, 'The Rolling Stones', 1);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (278, 254, 'Shamisen', 0),
                                                                          (279, 254, 'Sitar', 0),
                                                                          (280, 254, 'Koto', 1),
                                                                          (281, 254, 'Balalaika', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (282, 255, 'Ludwig van Beethoven', 0),
                                                                          (283, 255, 'Wolfgang Amadeus Mozart', 0),
                                                                          (284, 255, 'Johann Sebastian Bach', 0),
                                                                          (285, 255, 'Ludwig van Beethoven', 1);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (286, 256, 'Madonna', 1),
                                                                          (287, 256, 'Whitney Houston', 0),
                                                                          (288, 256, 'Britney Spears', 0),
                                                                          (289, 256, 'Celine Dion', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (290, 257, 'Tenor', 0),
                                                                          (291, 257, 'Soprano', 0),
                                                                          (292, 257, 'Baritone', 0),
                                                                          (293, 257, 'Countertenor', 1);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (294, 258, 'Imagine', 1),
                                                                          (295, 258, 'Hey Jude', 0),
                                                                          (296, 258, 'Bohemian Rhapsody', 0),
                                                                          (297, 258, 'Like a Rolling Stone', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (298, 259, 'Johnny Cash', 1),
                                                                          (299, 259, 'Willie Nelson', 0),
                                                                          (300, 259, 'Hank Williams', 0),
                                                                          (301, 259, 'Merle Haggard', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (302, 260, '1970s', 1),
                                                                          (303, 260, '1980s', 0),
                                                                          (304, 260, '1960s', 0),
                                                                          (305, 260, '1990s', 0);

-- Quiz 10: Movies
INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
    (10, 'Movies Quiz', 'Test your knowledge of classic and modern films.', 15);

-- Questions for Quiz 10: Movies
INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (306, 10, 'Who directed the movie "The Godfather"?'),
                                                               (307, 10, 'Which movie features a character named Jack Dawson and Rose DeWitt Bukater?'),
                                                               (308, 10, 'What is the highest-grossing film of all time (as of my knowledge cutoff in 2021)?'),
                                                               (309, 10, 'Which actor portrayed James Bond in the film "GoldenEye"?'),
                                                               (310, 10, 'In the film "The Shawshank Redemption," who plays the character Andy Dufresne?'),
                                                               (311, 10, 'Which Disney animated film features the song "Let It Go"?'),
                                                               (312, 10, 'Which movie is set in the fictional African kingdom of Wakanda?'),
                                                               (313, 10, 'Which actress won an Academy Award for her role in "La La Land"?'),
                                                               (314, 10, 'Which sci-fi film is set in a post-apocalyptic world and features characters named Neo and Morpheus?'),
                                                               (315, 10, 'In which film does the character Clarice Starling try to catch a serial killer named Buffalo Bill?'),
                                                               (316, 10, 'Which movie is known for its line "You can''t handle the truth!"?'),
                                                               (317, 10, 'What is the name of the fictional wizarding school in the "Harry Potter" film series?'),
                                                               (318, 10, 'Which film won the Academy Award for Best Picture in 2020?'),
                                                               (319, 10, 'In the film "Forrest Gump," what does Forrest keep in his pocket?'),
                                                               (320, 10, 'Which movie features a group of friends who embark on a road trip to find a dead body?');

-- Answers for Quiz 10: Movies
INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (306, 306, 'Francis Ford Coppola', 1),
                                                                          (307, 306, 'Martin Scorsese', 0),
                                                                          (308, 306, 'Steven Spielberg', 0),
                                                                          (309, 306, 'Quentin Tarantino', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (310, 307, 'Titanic', 1),
                                                                          (311, 307, 'The Notebook', 0),
                                                                          (312, 307, 'Gone with the Wind', 0),
                                                                          (313, 307, 'Casablanca', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (314, 308, 'Avengers: Endgame', 1),
                                                                          (315, 308, 'Avatar', 0),
                                                                          (316, 308, 'Titanic', 0),
                                                                          (317, 308, 'Star Wars: The Force Awakens', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (318, 309, 'Pierce Brosnan', 1),
                                                                          (319, 309, 'Sean Connery', 0),
                                                                          (320, 309, 'Daniel Craig', 0),
                                                                          (321, 309, 'Roger Moore', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (322, 310, 'Tim Robbins', 1),
                                                                          (323, 310, 'Morgan Freeman', 0),
                                                                          (324, 310, 'Tom Hanks', 0),
                                                                          (325, 310, 'Leonardo DiCaprio', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (326, 311, 'Frozen', 1),
                                                                          (327, 311, 'Beauty and the Beast', 0),
                                                                          (328, 311, 'Aladdin', 0),
                                                                          (329, 311, 'The Lion King', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (330, 312, 'Black Panther', 1),
                                                                          (331, 312, 'The Lion King', 0),
                                                                          (332, 312, 'Avatar', 0),
                                                                          (333, 312, 'Inception', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (334, 313, 'Emma Stone', 1),
                                                                          (335, 313, 'Natalie Portman', 0),
                                                                          (336, 313, 'Jennifer Lawrence', 0),
                                                                          (337, 313, 'Meryl Streep', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (338, 314, 'The Matrix', 1),
                                                                          (339, 314, 'Blade Runner', 0),
                                                                          (340, 314, 'Star Wars: A New Hope', 0),
                                                                          (341, 314, 'Inception', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (342, 315, 'The Silence of the Lambs', 1),
                                                                          (343, 315, 'Se7en', 0),
                                                                          (344, 315, 'Psycho', 0),
                                                                          (345, 315, 'The Sixth Sense', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (346, 316, 'A Few Good Men', 1),
                                                                          (347, 316, 'Forrest Gump', 0),
                                                                          (348, 316, 'The Shawshank Redemption', 0),
                                                                          (349, 316, 'The Godfather', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (350, 317, 'Hogwarts School of Witchcraft and Wizardry', 1),
                                                                          (351, 317, 'Beauxbatons Academy of Magic', 0),
                                                                          (352, 317, 'Durmstrang Institute', 0),
                                                                          (353, 317, 'Ilvermorny School of Witchcraft and Wizardry', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (354, 318, 'Nomadland', 1),
                                                                          (355, 318, 'The Trial of the Chicago 7', 0),
                                                                          (356, 318, 'Mank', 0),
                                                                          (357, 318, 'Minari', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (358, 319, 'A box of chocolates', 1),
                                                                          (359, 319, 'A feather', 0),
                                                                          (360, 319, 'A letter from Jenny', 0),
                                                                          (361, 319, 'A ping pong paddle', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (362, 320, 'Stand by Me', 1),
                                                                          (363, 320, 'The Goonies', 0),
                                                                          (364, 320, 'Superbad', 0),
                                                                          (365, 320, 'The Breakfast Club', 0);

-- Quiz 11: Science Fiction
INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
    (11, 'Science Fiction Quiz', 'Test your knowledge of science fiction movies, books, and TV shows.', 15);

-- Questions for Quiz 11: Science Fiction
INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (366, 11, 'In "Star Wars," who is Luke Skywalker''s twin sister?'),
                                                               (367, 11, 'Which alien species is known for their ritual of "mind melding"?'),
                                                               (368, 11, 'Who wrote the classic science fiction novel "Fahrenheit 451"?'),
                                                               (369, 11, 'What is the name of the spacecraft in the movie "2001: A Space Odyssey"?'),
                                                               (370, 11, 'In "The Hitchhiker''s Guide to the Galaxy," what is the answer to the ultimate question of life, the universe, and everything?'),
                                                               (371, 11, 'Which time-traveling TV show features a police call box as the time machine?'),
                                                               (372, 11, 'Which sci-fi film is set in a futuristic Los Angeles and involves "replicants"?'),
                                                               (373, 11, 'What is the name of the robotic character in "The Day the Earth Stood Still"?'),
                                                               (374, 11, 'Which sci-fi TV series follows the adventures of the Doctor and the TARDIS?'),
                                                               (375, 11, 'In "Blade Runner," what is the main occupation of the character Deckard?'),
                                                               (376, 11, 'Which author wrote the "Foundation" series?'),
                                                               (377, 11, 'In the movie "The Matrix," what color pill does Morpheus offer Neo?'),
                                                               (378, 11, 'Which sci-fi movie features a character named Ellen Ripley?'),
                                                               (379, 11, 'What is the name of the fictional substance that powers the DeLorean time machine in "Back to the Future"?'),
                                                               (380, 11, 'Which famous sci-fi TV series follows the voyages of the starship USS Enterprise?');

-- Answers for Quiz 11: Science Fiction
INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (366, 366, 'Princess Leia', 1),
                                                                          (367, 366, 'Padmé Amidala', 0),
                                                                          (368, 366, 'Rey', 0),
                                                                          (369, 366, 'Mara Jade', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (370, 367, 'Vulcans', 1),
                                                                          (371, 367, 'Klingons', 0),
                                                                          (372, 367, 'Wookiees', 0),
                                                                          (373, 367, 'Cybermen', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (374, 368, 'Ray Bradbury', 1),
                                                                          (375, 368, 'George Orwell', 0),
                                                                          (376, 368, 'Aldous Huxley', 0),
                                                                          (377, 368, 'Isaac Asimov', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (378, 369, 'Discovery One', 0),
                                                                          (379, 369, 'Nostromo', 1),
                                                                          (380, 369, 'Serenity', 0),
                                                                          (381, 369, 'Millennium Falcon', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (382, 370, '42', 1),
                                                                          (383, 370, '24', 0),
                                                                          (384, 370, '137', 0),
                                                                          (385, 370, '101', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (386, 371, 'Doctor Who', 1),
                                                                          (387, 371, 'Stargate SG-1', 0),
                                                                          (388, 371, 'The X-Files', 0),
                                                                          (389, 371, 'Quantum Leap', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (390, 372, 'Blade Runner', 1),
                                                                          (391, 372, 'The Terminator', 0),
                                                                          (392, 372, 'Minority Report', 0),
                                                                          (393, 372, 'A.I. Artificial Intelligence', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (394, 373, 'Gort', 1),
                                                                          (395, 373, 'Robby the Robot', 0),
                                                                          (396, 373, 'C-3PO', 0),
                                                                          (397, 373, 'HAL 9000', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (398, 374, 'Doctor Who', 0),
                                                                          (399, 374, 'Star Trek', 1),
                                                                          (400, 374, 'The X-Files', 0),
                                                                          (401, 374, 'Battlestar Galactica', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (402, 375, 'Blade Runner', 1),
                                                                          (403, 375, 'The Matrix', 0),
                                                                          (404, 375, 'Minority Report', 0),
                                                                          (405, 375, 'The Fifth Element', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (406, 376, 'Isaac Asimov', 1),
                                                                          (407, 376, 'Philip K. Dick', 0),
                                                                          (408, 376, 'Arthur C. Clarke', 0),
                                                                          (409, 376, 'Frank Herbert', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (410, 377, 'Blue', 0),
                                                                          (411, 377, 'Red', 1),
                                                                          (412, 377, 'Green', 0),
                                                                          (413, 377, 'Yellow', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (414, 378, 'Alien', 1),
                                                                          (415, 378, 'Star Wars', 0),
                                                                          (416, 378, 'The Terminator', 0),
                                                                          (417, 378, 'E.T. the Extra-Terrestrial', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (418, 379, 'Plutonium', 0),
                                                                          (419, 379, 'Uranium', 0),
                                                                          (420, 379, 'Flux Capacitor', 1),
                                                                          (421, 379, 'Quantum Crystals', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (422, 380, 'Star Trek', 1),
                                                                          (423, 380, 'Star Wars', 0),
                                                                          (424, 380, 'Doctor Who', 0),
                                                                          (425, 380, 'Stargate SG-1', 0);
