USE myquizappdb;

-- Quiz 2: General Knowledge
INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
    (2, 'General Knowledge Quiz', 'See how much you know about various topics.', 5);

-- Quiz 3: World History
INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
    (3, 'World History Quiz', 'Test your knowledge of significant historical events worldwide.', 5);

-- Quiz 4: Science and Nature
INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
    (4, 'Science and Nature Quiz', 'Explore the wonders of the natural world and scientific concepts.', 5);

-- Quiz 5: Literature
INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
    (5, 'Literature Quiz', 'Dive into the world of classic and contemporary literature.', 5);

-- Quiz 6: Technology
INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
    (6, 'Technology Quiz', 'Test your knowledge of modern technological advancements.', 5);


-- Quiz 2: General Knowledge
INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (7, 2, 'What is the capital city of France?'),
                                                               (8, 2, 'Who painted the famous artwork "Mona Lisa"?'),
                                                               (9, 2, 'Which planet is known as the "Red Planet"?'),
                                                               (10, 2, 'What is the chemical symbol for water?'),
                                                               (11, 2, 'Who wrote the play "Romeo and Juliet"?');

-- Quiz 3: World History
INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (12, 3, 'Which ancient civilization built the Great Pyramid of Giza?'),
                                                               (13, 3, 'The Renaissance period originated in which European city?'),
                                                               (14, 3, 'Who was the first President of the United States?'),
                                                               (15, 3, 'In which year did World War II end?'),
                                                               (16, 3, 'The Industrial Revolution began in which country?');

-- Quiz 4: Science and Nature
INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (17, 4, 'What is the chemical symbol for gold?'),
                                                               (18, 4, 'Which gas do plants absorb from the atmosphere during photosynthesis?'),
                                                               (19, 4, 'What is the largest organ in the human body?'),
                                                               (20, 4, 'Which planet is closest to the Sun?'),
                                                               (21, 4, 'What causes tides on Earth?');

-- Quiz 5: Literature
INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (22, 5, 'Which novel begins with the line, "It was the best of times, it was the worst of times"?'),
                                                               (23, 5, 'Who wrote the famous play "Hamlet"?'),
                                                               (24, 5, '"To Kill a Mockingbird" is a novel written by whom?'),
                                                               (25, 5, 'Which classic novel tells the story of a young girl named Anne Shirley?'),
                                                               (26, 5, 'In J.R.R. Tolkien\'s "The Lord of the Rings," who is the main antagonist?');

-- Quiz 6: Technology
INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (27, 6, 'What does "HTML" stand for in web development?'),
                                                               (28, 6, 'Which company developed the iPhone?'),
                                                               (29, 6, 'What is the main function of an SSD in a computer?'),
                                                               (30, 6, 'Which programming language is commonly used for artificial intelligence and machine learning?'),
                                                               (31, 6, 'What does "URL" stand for in the context of the internet?');


-- Answers for Quiz 2: General Knowledge
INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (28, 7, 'London', 0),
                                                                          (29, 7, 'Berlin', 0),
                                                                          (30, 7, 'Paris', 1),
                                                                          (31, 7, 'Rome', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (32, 8, 'Leonardo da Vinci', 1),
                                                                          (33, 8, 'Vincent van Gogh', 0),
                                                                          (34, 8, 'Pablo Picasso', 0),
                                                                          (35, 8, 'Michelangelo', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (36, 9, 'Venus', 0),
                                                                          (37, 9, 'Mars', 1),
                                                                          (38, 9, 'Jupiter', 0),
                                                                          (39, 9, 'Saturn', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (40, 10, 'H2O', 1),
                                                                          (41, 10, 'CO2', 0),
                                                                          (42, 10, 'O2', 0),
                                                                          (43, 10, 'N2', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (44, 11, 'William Shakespeare', 1),
                                                                          (45, 11, 'Jane Austen', 0),
                                                                          (46, 11, 'Charles Dickens', 0),
                                                                          (47, 11, 'Mark Twain', 0);

-- Answers for Quiz 3: World History
INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (48, 12, 'Roman Empire', 0),
                                                                          (49, 12, 'Ancient Greece', 0),
                                                                          (50, 12, 'Ancient Egypt', 1),
                                                                          (51, 12, 'Mayan Civilization', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (52, 13, 'Athens', 0),
                                                                          (53, 13, 'Rome', 0),
                                                                          (54, 13, 'Florence', 1),
                                                                          (55, 13, 'Paris', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (56, 14, 'Thomas Jefferson', 0),
                                                                          (57, 14, 'George Washington', 1),
                                                                          (58, 14, 'Benjamin Franklin', 0),
                                                                          (59, 14, 'John Adams', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (60, 15, '1945', 1),
                                                                          (61, 15, '1918', 0),
                                                                          (62, 15, '1939', 0),
                                                                          (63, 15, '1950', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (64, 16, 'United States', 0),
                                                                          (65, 16, 'Germany', 0),
                                                                          (66, 16, 'United Kingdom', 1),
                                                                          (67, 16, 'France', 0);

-- Answers for Quiz 4: Science and Nature
INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (68, 17, 'Au', 1),
                                                                          (69, 17, 'Ag', 0),
                                                                          (70, 17, 'Go', 0),
                                                                          (71, 17, 'Gd', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (72, 18, 'Oxygen', 0),
                                                                          (73, 18, 'Carbon dioxide', 1),
                                                                          (74, 18, 'Nitrogen', 0),
                                                                          (75, 18, 'Hydrogen', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (76, 19, 'Heart', 0),
                                                                          (77, 19, 'Liver', 1),
                                                                          (78, 19, 'Brain', 0),
                                                                          (79, 19, 'Skin', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (80, 20, 'Venus', 0),
                                                                          (81, 20, 'Mercury', 1),
                                                                          (82, 20, 'Mars', 0),
                                                                          (83, 20, 'Jupiter', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (84, 21, 'Gravitational pull of the Moon and the Sun', 1),
                                                                          (85, 21, 'Earth''s rotation', 0),
                                                                          (86, 21, 'Earth''s magnetic field', 0),
                                                                          (87, 21, 'Solar flares', 0);

-- Answers for Quiz 5: Literature
INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (88, 22, 'Pride and Prejudice', 0),
                                                                          (89, 22, 'Wuthering Heights', 0),
                                                                          (90, 22, 'A Tale of Two Cities', 1),
                                                                          (91, 22, 'Jane Eyre', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (92, 23, 'William Shakespeare', 1),
                                                                          (93, 23, 'Oscar Wilde', 0),
                                                                          (94, 23, 'George Bernard Shaw', 0),
                                                                          (95, 23, 'Tennessee Williams', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (96, 24, 'Mark Twain', 0),
                                                                          (97, 24, 'J.K. Rowling', 0),
                                                                          (98, 24, 'Harper Lee', 1),
                                                                          (99, 24, 'Charles Dickens', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (100, 25, 'Little Women', 0),
                                                                          (101, 25, 'Anne of Green Gables', 1),
                                                                          (102, 25, 'Emma', 0),
                                                                          (103, 25, 'Oliver Twist', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (104, 26, 'Frodo Baggins', 0),
                                                                          (105, 26, 'Gandalf', 0),
                                                                          (106, 26, 'Sauron', 1),
                                                                          (107, 26, 'Legolas', 0);

-- Answers for Quiz 6: Technology
INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (108, 27, 'Hyperlinks and Text Markup Language', 0),
                                                                          (109, 27, 'Hyper Text Markup Language', 1),
                                                                          (110, 27, 'Home Tool Markup Language', 0),
                                                                          (111, 27, 'Hyper Text Modern Language', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (112, 28, 'Samsung', 0),
                                                                          (113, 28, 'Apple', 1),
                                                                          (114, 28, 'Sony', 0),
                                                                          (115, 28, 'Microsoft', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (116, 29, 'Sound processing', 0),
                                                                          (117, 29, 'Graphics rendering', 0),
                                                                          (118, 29, 'Data storage', 1),
                                                                          (119, 29, 'Internet connectivity', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (120, 30, 'Java', 0),
                                                                          (121, 30, 'C++', 0),
                                                                          (122, 30, 'Python', 1),
                                                                          (123, 30, 'Ruby', 0);

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (124, 31, 'Universal Resource Locator', 1),
                                                                          (125, 31, 'Universal Routing Link', 0),
                                                                          (126, 31, 'Unified Resource Listing', 0),
                                                                          (127, 31, 'Underlying Routing Language', 0);