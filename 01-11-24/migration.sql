ALTER TABLE `users` ADD `user_type_id` INT(10) NULL DEFAULT NULL AFTER `id`;
UPDATE `users` SET `user_type_id` = '1' WHERE `users`.`id` = 1


CREATE TABLE `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_name` int(11) DEFAULT 0,
  `status` varchar(10) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

ALTER TABLE `users` CHANGE `password` `password` VARCHAR(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL;
UPDATE `users` SET `password` = '$2y$10$gMKkB0s2IF/iUDcIhThk9esA0QKrU/g3/yQqv4lOtqN/trTrhjOwq' WHERE `users`.`id` = 1
ALTER TABLE `user_type` CHANGE `user_type_name` `user_type_name` VARCHAR(20) NULL DEFAULT NULL;
INSERT INTO `user_type` (`id`, `user_type_name`, `status`, `created_at`, `updated_at`) VALUES (NULL, 'Admin', '1', NULL, NULL), (NULL, 'Staff', '1', NULL, NULL)

DROP TABLE `assign_project`, `attendance`, `chat`, `equipment`, `login_details`, `more_images`, `payment`, `salary`, `sda_image`, `staff`, `supervisor`;


CREATE TABLE `project_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_status_name` varchar(50) DEFAULT 0,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

ALTER TABLE `project_status` CHANGE `project_status_name` `project_status_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL;

INSERT INTO `project_status` (`id`, `project_status_name`, `status`, `created_at`, `updated_at`) VALUES (NULL, 'Upcoming Projects', '1', NULL, NULL), (NULL, 'Progress Projects', '1', NULL, NULL)

INSERT INTO `project_status` (`id`, `project_status_name`, `status`, `created_at`, `updated_at`) VALUES (NULL, 'Completed Projects', '1', NULL, NULL)


CREATE TABLE `project_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `photo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `s_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT, 
  `parent_id` int DEFAULT '0',
  `category_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category_url` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `photo` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE `category`;


