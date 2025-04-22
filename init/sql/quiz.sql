CREATE TABLE `quiz` (
                        `_id` int(11) NOT NULL AUTO_INCREMENT,
                        `name` text NOT NULL,
                        `description` text NOT NULL,
                        `category` ENUM('HISTORY', 'TECHNOLOGY','GENERAL_KNOWLEDGE','POP_CULTURE'),
                        `num_quests` int(11) NOT NULL,
                        PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `quiz` (`name`, `description`,`category`, `num_quests`) VALUES
                                                                    ('History', 'A short quiz on general history.','HISTORY', 2),
                                                                    ('Bits and Bytes', 'A short quiz about basic data quantities','TECHNOLOGY', 5),
                                                                    ('General Knowledge Quiz', 'See how much you know about various topics.','GENERAL_KNOWLEDGE', 5),
                                                                    ('World History Quiz', 'Test your knowledge of significant historical events worldwide.','HISTORY', 5),
                                                                    ('Science and Nature Quiz', 'Explore the wonders of the natural world and scientific concepts.','GENERAL_KNOWLEDGE', 5),
                                                                    ('Literature Quiz', 'Dive into the world of classic and contemporary literature.','POP_CULTURE', 5),
                                                                    ('Technology Quiz', 'Test your knowledge of modern technological advancements.','TECHNOLOGY', 5),
                                                                    ('Geography Quiz', 'Test your knowledge of world geography.','GENERAL_KNOWLEDGE', 15),
                                                                    ('Sports Quiz', 'Test your knowledge of sports and athletic events.','POP_CULTURE', 15),
                                                                    ('Music Quiz', 'Test your knowledge of music and musicians.','POP_CULTURE', 15),
                                                                    ('Movies Quiz', 'Test your knowledge of classic and modern films.','POP_CULTURE', 15),
                                                                    ('Science Fiction Quiz', 'Test your knowledge of science fiction movies, books, and TV shows.','POP_CULTURE', 15);