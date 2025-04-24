USE myquizappdb;

-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
                        `_id` int(11) NOT NULL AUTO_INCREMENT,
                        `name` text NOT NULL,
                        `description` text NOT NULL,
                        `category` ENUM('HISTORY', 'TECHNOLOGY','GENERAL_KNOWLEDGE','POP_CULTURE'),
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

INSERT INTO `quiz` (`name`, `description`, `num_quests`) VALUES
                                                                    ('History', 'A short quiz on general history.', 2),
                                                                    ('Bits and Bytes', 'A short quiz about basic data quantities', 5);




--
-- Dumping data for table `question`
--

INSERT INTO `question` (`quiz_id`, `question_text`) VALUES
                                                               (1, 'What year was The Battle of Hastings?'),
                                                               (1, 'How many different wives did Henry VIII have?'),
                                                               (2, 'What values can a bit hold?'),
                                                               (2, 'How many bits make a nibble?'),
                                                               (2, 'How many bits are there in a byte?'),
                                                               (2, 'What is the biggest value a byte can hold?'),
                                                               (2, '1024 bytes equals what?');

-- --------------------------------------------------------


--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`question_id`, `answer_text`, `correct`) VALUES
                                                                          (1, '1066', 1),
                                                                          (1, '1939', 0),
                                                                          (1, '45', 0),
                                                                          (1, '1010', 0),
                                                                          (2, '6', 1),
                                                                          (2, '0', 0),
                                                                          (2, '64', 0),
                                                                          (2, '8', 0),
                                                                          (3, '1 0r 0', 1),
                                                                          (3, 'Only 7', 0),
                                                                          (3, 'Anything from one to 10', 0),
                                                                          (3, 'No value at all', 0),
                                                                          (4, '4', 1),
                                                                          (4, 'A half', 0),
                                                                          (4, '7', 0),
                                                                          (4, '64', 0),
                                                                          (5, '8', 1),
                                                                          (5, '64', 0),
                                                                          (5, '128', 0),
                                                                          (5, '1024', 0),
                                                                          (6, '255', 1),
                                                                          (6, '10000000', 0),
                                                                          (6, '42', 0),
                                                                          (6, '256', 0),
                                                                          (7, '1 KiloByte', 1),
                                                                          (7, '1 GigaByte', 0),
                                                                          (7, '4 KiloBytes', 0),
                                                                          (7, '1 Elephant', 0);