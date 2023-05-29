CREATE TABLE `athlets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `team` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `athlete_events` (
  `athlete_id` int NOT NULL,
  `games` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `season` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `sport` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `medal` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci