CREATE TABLE `quiz` (
                        `_id` int(11) NOT NULL AUTO_INCREMENT,
                        `name` text NOT NULL,
                        `description` text NOT NULL,
                        `category` ENUM('History', 'Technology','General_Knowledge','Pop_Culture'),
                        `num_quests` int(11) NOT NULL,
                        PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `quiz` (`name`, `description`,`category`, `num_quests`) VALUES
                                                                    ('History', 'A short quiz on general history.','History', 2),
                                                                    ('Bits and Bytes', 'A short quiz about basic data quantities','Technology', 5),
                                                                    ('General Knowledge Quiz', 'See how much you know about various topics.','General_Knowledge', 5),
                                                                    ('World History Quiz', 'Test your knowledge of significant historical events worldwide.','History', 5),
                                                                    ('Science and Nature Quiz', 'Explore the wonders of the natural world and scientific concepts.','General_Knowledge', 5),
                                                                    ('Literature Quiz', 'Dive into the world of classic and contemporary literature.','Pop_Culture', 5),
                                                                    ('Technology Quiz', 'Test your knowledge of modern technological advancements.','Technology', 5),
                                                                    ('Geography Quiz', 'Test your knowledge of world geography.','General_Knowledge', 15),
                                                                    ('Sports Quiz', 'Test your knowledge of sports and athletic events.','Pop_Culture', 15),
                                                                    ('Music Quiz', 'Test your knowledge of music and musicians.','Pop_Culture', 15),
                                                                    ('Movies Quiz', 'Test your knowledge of classic and modern films.','Pop_Culture', 15),
                                                                    ('Science Fiction Quiz', 'Test your knowledge of science fiction movies, books, and TV shows.','Pop_Culture', 15);