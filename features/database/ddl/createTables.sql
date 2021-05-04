DROP TABLE IF EXISTS `recipedb`.`t_users`;
CREATE TABLE `recipedb`.`t_users`
(
  `user_id` VARCHAR(256) NOT NULL,
  `name` VARCHAR(256),
  `user_authority_id` INT UNSIGNED NOT NULL,
  `insert_user_id` VARCHAR(256),
  `inserted_at` DATETIME,
  `update_user_id` VARCHAR(256),
  `updated_at` DATETIME,
  PRIMARY KEY(user_id)
);

DROP TABLE IF EXISTS `recipedb`.`t_user_authorities`;
CREATE TABLE `recipedb`.`t_user_authorities`
(
  `user_authority_id` INT UNSIGNED NOT NULL,
  `user_authority_name` VARCHAR(256),
  `description` VARCHAR(512),
  PRIMARY KEY(user_authority_id)
);

DROP TABLE IF EXISTS `recipedb`.`t_passwords`;
CREATE TABLE `recipedb`.`t_passwords`
(
  `user_id` VARCHAR(256) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `authentication_type` VARCHAR(64),
  `insert_user_id` VARCHAR(256),
  `inserted_at` DATETIME,
  `update_user_id` VARCHAR(256),
  `updated_at` DATETIME,
  PRIMARY KEY(user_id)
);

DROP TABLE IF EXISTS `recipedb`.`t_recipes`;
CREATE TABLE `recipedb`.`t_recipes`
(
  `recipe_id` INT UNSIGNED NOT NULL,
  `recipe_name` VARCHAR(256),
  `recipe_category_id` INT UNSIGNED NOT NULL,
  `remark` VARCHAR(512),
  `insert_user_id` VARCHAR(256),
  `inserted_at` DATETIME,
  `update_user_id` VARCHAR(256),
  `updated_at` DATETIME,
  PRIMARY KEY(recipe_id)
);

DROP TABLE IF EXISTS `recipedb`.`t_recipe_categories`;
CREATE TABLE `recipedb`.`t_recipe_categories`
(
  `recipe_category_id` INT UNSIGNED NOT NULL,
  `recipe_category_name` VARCHAR(256),
  `insert_user_id` VARCHAR(256),
  `inserted_at` DATETIME,
  `update_user_id` VARCHAR(256),
  `updated_at` DATETIME,
  PRIMARY KEY(recipe_category_id)
);

DROP TABLE IF EXISTS `recipedb`.`t_ingredients`;
CREATE TABLE `recipedb`.`t_ingredients`
(
  `recipe_id` INT UNSIGNED NOT NULL,
  `ingredient_seq` INT UNSIGNED NOT NULL,
  `ingredient_name` VARCHAR(256),
  `quantity` VARCHAR(64),
  `insert_user_id` VARCHAR(256),
  `inserted_at` DATETIME,
  `update_user_id` VARCHAR(256),
  `updated_at` DATETIME,
  PRIMARY KEY(recipe_id,ingredient_seq)
);

DROP TABLE IF EXISTS `recipedb`.`t_instructions`;
CREATE TABLE `recipedb`.`t_instructions`
(
  `recipe_id` INT UNSIGNED NOT NULL,
  `instructions_seq` INT UNSIGNED NOT NULL,
  `description` TEXT,
  `insert_user_id` VARCHAR(256),
  `inserted_at` DATETIME,
  `update_user_id` VARCHAR(256),
  `updated_at` DATETIME,
  PRIMARY KEY(recipe_id,instructions_seq)
);

DROP TABLE IF EXISTS `recipedb`.`t_reference_urls`;
CREATE TABLE `recipedb`.`t_reference_urls`
(
  `recipe_id` INT UNSIGNED NOT NULL,
  `url_seq` INT UNSIGNED NOT NULL,
  `url` VARCHAR(512),
  `insert_user_id` VARCHAR(256),
  `inserted_at` DATETIME,
  `update_user_id` VARCHAR(256),
  `updated_at` DATETIME,
  PRIMARY KEY(recipe_id,url_seq)
);

DROP TABLE IF EXISTS `recipedb`.`t_food_pictures`;
CREATE TABLE `recipedb`.`t_food_pictures`
(
  `recipe_id` INT UNSIGNED NOT NULL,
  `picture_seq` INT UNSIGNED NOT NULL,
  `file_path` VARCHAR(512),
  `insert_user_id` VARCHAR(256),
  `inserted_at` DATETIME,
  `update_user_id` VARCHAR(256),
  `updated_at` DATETIME,
  PRIMARY KEY(recipe_id,picture_seq)
);

ALTER TABLE `recipedb`.`t_users` ADD FOREIGN KEY(user_authority_id)
  REFERENCES `recipedb`.`t_user_authorities`(user_authority_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_passwords` ADD FOREIGN KEY(user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_recipes` ADD FOREIGN KEY(recipe_category_id)
  REFERENCES `recipedb`.`t_recipe_categories`(recipe_category_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_recipes` ADD FOREIGN KEY(insert_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_recipes` ADD FOREIGN KEY(update_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_recipe_categories` ADD FOREIGN KEY(insert_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_recipe_categories` ADD FOREIGN KEY(update_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_ingredients` ADD FOREIGN KEY(recipe_id)
  REFERENCES `recipedb`.`t_recipes`(recipe_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_ingredients` ADD FOREIGN KEY(insert_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_ingredients` ADD FOREIGN KEY(update_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_instructions` ADD FOREIGN KEY(recipe_id)
  REFERENCES `recipedb`.`t_recipes`(recipe_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_instructions` ADD FOREIGN KEY(insert_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_instructions` ADD FOREIGN KEY(update_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_reference_urls` ADD FOREIGN KEY(recipe_id)
  REFERENCES `recipedb`.`t_recipes`(recipe_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_reference_urls` ADD FOREIGN KEY(insert_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_reference_urls` ADD FOREIGN KEY(update_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_food_pictures` ADD FOREIGN KEY(recipe_id)
  REFERENCES `recipedb`.`t_recipes`(recipe_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_food_pictures` ADD FOREIGN KEY(insert_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `recipedb`.`t_food_pictures` ADD FOREIGN KEY(update_user_id)
  REFERENCES `recipedb`.`t_users`(user_id)
  ON DELETE CASCADE ON UPDATE CASCADE;
