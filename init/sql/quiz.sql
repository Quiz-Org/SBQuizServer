CREATE TABLE `quiz` (
                        `_id` int(11) NOT NULL AUTO_INCREMENT,
                        `name` text NOT NULL,
                        `description` text NOT NULL,
                        `num_quests` int(11) NOT NULL,
                        PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `quiz` (`name`, `description`, `num_quests`) VALUES
                                                                    ('History', 'A short quiz on general history.', 2),
                                                                    ('Bits and Bytes', 'A short quiz about basic data quantities', 5),
                                                                    ('General Knowledge Quiz', 'See how much you know about various topics.', 5),
                                                                    ('World History Quiz', 'Test your knowledge of significant historical events worldwide.', 5),
                                                                    ('Science and Nature Quiz', 'Explore the wonders of the natural world and scientific concepts.', 5),
                                                                    ('Literature Quiz', 'Dive into the world of classic and contemporary literature.', 5),
                                                                    ('Technology Quiz', 'Test your knowledge of modern technological advancements.', 5),
                                                                    ('Geography Quiz', 'Test your knowledge of world geography.', 15),
                                                                    ('Sports Quiz', 'Test your knowledge of sports and athletic events.', 15),
                                                                    ('Music Quiz', 'Test your knowledge of music and musicians.', 15),
                                                                    ('Movies Quiz', 'Test your knowledge of classic and modern films.', 15),
                                                                    ('Science Fiction Quiz', 'Test your knowledge of science fiction movies, books, and TV shows.', 15);