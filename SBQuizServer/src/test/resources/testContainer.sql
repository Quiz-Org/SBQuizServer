USE myquizappdb;

-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
                        `_id` int(11) NOT NULL,
                        `name` text NOT NULL,
                        `description` text NOT NULL,
                        `num_quests` int(11) NOT NULL,
                        PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
                            `_id` int(11) NOT NULL,
                            `quiz_id` int(11) NOT NULL,
                            `question_text` text NOT NULL,
                            PRIMARY KEY (`_id`),
                            FOREIGN KEY (`quiz_id`) REFERENCES quiz(`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `answer` (
                          `_id` int(11) NOT NULL,
                          `question_id` int(11) NOT NULL,
                          `answer_text` text NOT NULL,
                          `correct` tinyint(1) NOT NULL,
                          PRIMARY KEY (`_id`),
                          FOREIGN KEY (`question_id`) REFERENCES question(`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `quiz` (`_id`, `name`, `description`, `num_quests`) VALUES
                                                                    (0, 'History', 'A short quiz on general history.', 2),
                                                                    (1, 'Bits and Bytes', 'A short quiz about basic data quantities', 5);




--
-- Dumping data for table `question`
--

INSERT INTO `question` (`_id`, `quiz_id`, `question_text`) VALUES
                                                               (0, 0, 'What year was The Battle of Hastings?'),
                                                               (1, 0, 'How many different wives did Henry VIII have?'),
                                                               (2, 1, 'What values can a bit hold?'),
                                                               (3, 1, 'How many bits make a nibble?'),
                                                               (4, 1, 'How many bits are there in a byte?'),
                                                               (5, 1, 'What is the biggest value a byte can hold?'),
                                                               (6, 1, '1024 bytes equals what?');

-- --------------------------------------------------------


--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`_id`, `question_id`, `answer_text`, `correct`) VALUES
                                                                          (0, 0, '1066', 1),
                                                                          (1, 0, '1939', 0),
                                                                          (2, 0, '45', 0),
                                                                          (3, 0, '1010', 0),
                                                                          (4, 1, '6', 1),
                                                                          (5, 1, '0', 0),
                                                                          (6, 1, '64', 0),
                                                                          (7, 1, '8', 0),
                                                                          (8, 2, '1 0r 0', 1),
                                                                          (9, 2, 'Only 7', 0),
                                                                          (10, 2, 'Anything from one to 10', 0),
                                                                          (11, 2, 'No value at all', 0),
                                                                          (12, 3, '4', 1),
                                                                          (13, 3, 'A half', 0),
                                                                          (14, 3, '7', 0),
                                                                          (15, 3, '64', 0),
                                                                          (16, 4, '8', 1),
                                                                          (17, 4, '64', 0),
                                                                          (18, 4, '128', 0),
                                                                          (19, 4, '1024', 0),
                                                                          (20, 5, '255', 1),
                                                                          (21, 5, '10000000', 0),
                                                                          (22, 5, '42', 0),
                                                                          (23, 5, '256', 0),
                                                                          (24, 6, '1 KiloByte', 1),
                                                                          (25, 6, '1 GigaByte', 0),
                                                                          (26, 6, '4 KiloBytes', 0),
                                                                          (27, 6, '1 Elephant', 0);