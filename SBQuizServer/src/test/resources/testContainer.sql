USE myquizappdb;

-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
                        `_id` int(11) NOT NULL AUTO_INCREMENT,
                        `name` text NOT NULL,
                        `description` text NOT NULL,
                        `num_quests` int(11) NOT NULL,
                        PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
                            `_id` int(11) NOT NULL AUTO_INCREMENT,
                            `quiz_id` int(11) NOT NULL,
                            `question_text` text NOT NULL,
                            PRIMARY KEY (`_id`),
                            FOREIGN KEY (`quiz_id`) REFERENCES quiz(`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `answer` (
                          `_id` int(11) NOT NULL AUTO_INCREMENT,
                          `question_id` int(11) NOT NULL,
                          `answer_text` text NOT NULL,
                          `correct` tinyint(1) NOT NULL,
                          PRIMARY KEY (`_id`),
                          FOREIGN KEY (`question_id`) REFERENCES question(`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
                                                                    ('History', 'A short quiz on general history.', 2),
                                                                    ('Bits and Bytes', 'A short quiz about basic data quantities', 5);




--
-- Dumping data for table `question`
--

INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (0, 'What year was The Battle of Hastings?'),
                                                               (0, 'How many different wives did Henry VIII have?'),
                                                               (1, 'What values can a bit hold?'),
                                                               (1, 'How many bits make a nibble?'),
                                                               (1, 'How many bits are there in a byte?'),
                                                               (1, 'What is the biggest value a byte can hold?'),
                                                               (1, '1024 bytes equals what?');

-- --------------------------------------------------------


--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (0, '1066', 1),
                                                                          (0, '1939', 0),
                                                                          (0, '45', 0),
                                                                          (0, '1010', 0),
                                                                          (1, '6', 1),
                                                                          (1, '0', 0),
                                                                          (1, '64', 0),
                                                                          (1, '8', 0),
                                                                          (2, '1 0r 0', 1),
                                                                          (2, 'Only 7', 0),
                                                                          (2, 'Anything from one to 10', 0),
                                                                          (2, 'No value at all', 0),
                                                                          (3, '4', 1),
                                                                          (3, 'A half', 0),
                                                                          (3, '7', 0),
                                                                          (3, '64', 0),
                                                                          (4, '8', 1),
                                                                          (4, '64', 0),
                                                                          (4, '128', 0),
                                                                          (4, '1024', 0),
                                                                          (5, '255', 1),
                                                                          (5, '10000000', 0),
                                                                          (5, '42', 0),
                                                                          (5, '256', 0),
                                                                          (6, '1 KiloByte', 1),
                                                                          (6, '1 GigaByte', 0),
                                                                          (6, '4 KiloBytes', 0),
                                                                          (6, '1 Elephant', 0);