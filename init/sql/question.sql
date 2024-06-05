CREATE TABLE `question` (
                            `_id` int(11) NOT NULL AUTO_INCREMENT,
                            `quiz_id` int(11) NOT NULL,
                            `question_text` text NOT NULL,
                            PRIMARY KEY (`_id`),
                            FOREIGN KEY (`quiz_id`) REFERENCES quiz(`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `question` (`quiz_id`, `question_text`) VALUES
                                                        (1, 'What year was The Battle of Hastings?'),
                                                        (1, 'How many different wives did Henry VIII have?'),
                                                        (2, 'What values can a bit hold?'),
                                                        (2, 'How many bits make a nibble?'),
                                                        (2, 'How many bits are there in a byte?'),
                                                        (2,'1024 bytes equals what?'),
                                                        (2, 'What is the biggest value a byte can hold?'),
                                                        (3, 'What is the capital city of France?'),
                                                        (3, 'Who painted the famous artwork "Mona Lisa"?'),
                                                        (3, 'Which planet is known as the "Red Planet"?'),
                                                        (3, 'What is the chemical symbol for water?'),
                                                        (3, 'Who wrote the play "Romeo and Juliet"?'),
                                                        (4, 'Which ancient civilization built the Great Pyramid of Giza?'),
                                                        (4, 'The Renaissance period originated in which European city?'),
                                                        (4, 'Who was the first President of the United States?'),
                                                        (4, 'In which year did World War II end?'),
                                                        (4, 'The Industrial Revolution began in which country?'),
                                                        (5, 'What is the chemical symbol for gold?'),
                                                        (5, 'Which gas do plants absorb from the atmosphere during photosynthesis?'),
                                                        (5, 'What is the largest organ in the human body?'),
                                                        (5, 'Which planet is closest to the Sun?'),
                                                        (5, 'What causes tides on Earth?'),
                                                        (6, 'Which novel begins with the line, "It was the best of times, it was the worst of times"?'),
                                                        (6, 'Who wrote the famous play "Hamlet"?'),
                                                        (6, '"To Kill a Mockingbird" is a novel written by whom?'),
                                                        (6, 'Which classic novel tells the story of a young girl named Anne Shirley?'),
                                                        (6, 'In J.R.R. Tolkien''s "The Lord of the Rings," who is the main antagonist?'),
                                                        (7, 'What does "HTML" stand for in web development?'),
                                                        (7, 'Which company developed the iPhone?'),
                                                        (7, 'What is the main function of an SSD in a computer?'),
                                                        (7, 'Which programming language is commonly used for artificial intelligence and machine learning?'),
                                                        (7, 'What does "URL" stand for in the context of the internet?'),
                                                        (8, 'What is the capital of Australia?'),
                                                        (8, 'Which river is the longest in the world?'),
                                                        (8, 'Which country is known as the Land of the Rising Sun?'),
                                                        (8, 'In which continent is the Sahara Desert located?'),
                                                        (8, 'What is the largest ocean on Earth?'),
                                                        (8, 'Which mountain range runs along the northern border of India?'),
                                                        (8, 'Which country is home to the famous ancient site of Machu Picchu?'),
                                                        (8, 'Which African country is known as the "Pearl of Africa"?'),
                                                        (8, 'Which European city is divided into two parts by the Bosphorus Strait?'),
                                                        (8, 'What is the tallest waterfall in the world?'),
                                                        (8, 'Which two countries share the longest border in the world?'),
                                                        (8, 'Which city is often called the "Eternal City"?'),
                                                        (8, 'Which country is known as the "Land of Smiles"?'),
                                                        (8, 'Which sea is bordered by Spain, France, and Italy?'),
                                                        (8, 'Which country is the smallest in the world by land area?'),
                                                        (9, 'In which sport would you perform a slam dunk?'),
                                                        (9, 'Which country won the first FIFA World Cup in 1930?'),
                                                        (9, 'What is the highest score achievable in a single turn in bowling?'),
                                                        (9, 'Which sport uses a shuttlecock?'),
                                                        (9, 'Who holds the record for the most Olympic gold medals?'),
                                                        (9, 'Which tennis player has the most Grand Slam titles?'),
                                                        (9, 'Which country is known for inventing the sport of cricket?'),
                                                        (9, 'In which sport would you perform a "slalom"?'),
                                                        (9, 'Which boxer is nicknamed "Iron Mike"?'),
                                                        (9, 'What is the name of the horse race known as "The Run for the Roses"?'),
                                                        (9, 'Which track and field event involves throwing a heavy metal ball?'),
                                                        (9, 'Which sport is measured in knots and involves wind and water?'),
                                                        (9, 'Which golf major is played at Augusta National Golf Club?'),
                                                        (9, 'Which athlete is often referred to as "The Greatest"?'),
                                                        (9, 'What is the official ball used in basketball competitions?'),
                                                        (10, 'Who is known as the "Queen of Pop"?'),
                                                        (10, 'Which band is often referred to as "The Fab Four"?'),
                                                        (10, 'Which instrument has 88 keys?'),
                                                        (10, 'Which composer wrote the "Moonlight Sonata"?'),
                                                        (10, 'In which country did the opera originate?'),
                                                        (10, 'Who released the album "Thriller"?'),
                                                        (10, 'Which music genre is characterized by its use of turntables and sampling?'),
                                                        (10, 'Which rock band is known for its iconic tongue logo?'),
                                                        (10, 'What is the name of the traditional Japanese three-stringed instrument?'),
                                                        (10, 'Which famous composer was deaf during the latter part of his life?'),
                                                        (10, 'Which singer is known for hits like "Like a Virgin" and "Vogue"?'),
                                                        (10, 'What is the highest singing voice for males?'),
                                                        (10, 'Which song by John Lennon is a plea for world peace?'),
                                                        (10, 'Which country music legend is known for hits like "Ring of Fire" and "Folsom Prison Blues"?'),
                                                        (10, 'In which decade did the punk rock movement emerge?'),
                                                        (11, 'Who directed the movie "The Godfather"?'),
                                                        (11, 'Which movie features a character named Jack Dawson and Rose DeWitt Bukater?'),
                                                        (11, 'What is the highest-grossing film of all time (as of my knowledge cutoff in 2021)?'),
                                                        (11, 'Which actor portrayed James Bond in the film "GoldenEye"?'),
                                                        (11, 'In the film "The Shawshank Redemption," who plays the character Andy Dufresne?'),
                                                        (11, 'Which Disney animated film features the song "Let It Go"?'),
                                                        (11, 'Which movie is set in the fictional African kingdom of Wakanda?'),
                                                        (11, 'Which actress won an Academy Award for her role in "La La Land"?'),
                                                        (11, 'Which sci-fi film is set in a post-apocalyptic world and features characters named Neo and Morpheus?'),
                                                        (11, 'In which film does the character Clarice Starling try to catch a serial killer named Buffalo Bill?'),
                                                        (11, 'Which movie is known for its line "You can''t handle the truth!"?'),
                                                        (11, 'What is the name of the fictional wizarding school in the "Harry Potter" film series?'),
                                                        (11, 'Which film won the Academy Award for Best Picture in 2020?'),
                                                        (11, 'In the film "Forrest Gump," what does Forrest keep in his pocket?'),
                                                        (11, 'Which movie features a group of friends who embark on a road trip to find a dead body?'),
                                                        (12, 'In "Star Wars," who is Luke Skywalker''s twin sister?'),
                                                        (12, 'Which alien species is known for their ritual of "mind melding"?'),
                                                        (12, 'Who wrote the classic science fiction novel "Fahrenheit 451"?'),
                                                        (12, 'What is the name of the spacecraft in the movie "2001: A Space Odyssey"?'),
                                                        (12, 'In "The Hitchhiker''s Guide to the Galaxy," what is the answer to the ultimate question of life, the universe, and everything?'),
                                                        (12, 'Which time-traveling TV show features a police call box as the time machine?'),
                                                        (12, 'Which sci-fi film is set in a futuristic Los Angeles and involves "replicants"?'),
                                                        (12, 'What is the name of the robotic character in "The Day the Earth Stood Still"?'),
                                                        (12, 'Which sci-fi TV series follows the adventures of the Doctor and the TARDIS?'),
                                                        (12, 'In "Blade Runner," what is the main occupation of the character Deckard?'),
                                                        (12, 'Which author wrote the "Foundation" series?'),
                                                        (12, 'In the movie "The Matrix," what color pill does Morpheus offer Neo?'),
                                                        (12, 'Which sci-fi movie features a character named Ellen Ripley?'),
                                                        (12, 'What is the name of the fictional substance that powers the DeLorean time machine in "Back to the Future"?'),
                                                        (12, 'Which famous sci-fi TV series follows the voyages of the starship USS Enterprise?');