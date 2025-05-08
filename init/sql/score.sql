CREATE TABLE `score` (
                        `_id` int(11) NOT NULL AUTO_INCREMENT,
                        `user_id` text NOT NULL,
                        `quiz_id` int(11) NOT NULL,
                        `score` int(11) NOT NULL,
                        `total` int(11) NOT NULL,
                        FOREIGN KEY (`quiz_id`) REFERENCES quiz(`_id`),
                        PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;