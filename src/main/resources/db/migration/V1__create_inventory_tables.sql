
CREATE TABLE `items` (
    `item_id` BIGINT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(50) DEFAULT NULL,
    `ar_name` VARCHAR(255) NOT NULL,
    `en_name` VARCHAR(255) NOT NULL,
    `quantity` BIGINT NOT NULL DEFAULT 0,
    `category` TINYINT NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (`item_id`),
    UNIQUE KEY `en_name` (`en_name`),
    UNIQUE KEY `ar_name` (`ar_name`),
    UNIQUE KEY `code` (`code`),

    CONSTRAINT `items_chk_1` CHECK (`quantity` >= 0)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `transactions` (
    `transaction_id` BIGINT NOT NULL AUTO_INCREMENT,
    `quantity_before` BIGINT NOT NULL,
    `quantity_after` BIGINT NOT NULL,
    `transaction_quantity` BIGINT NOT NULL,
    `item_id` BIGINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `transaction_type` TINYINT NOT NULL DEFAULT 0,

    PRIMARY KEY (`transaction_id`),
    KEY `fk_item_id` (`item_id`),

    CONSTRAINT `fk_item_id`
        FOREIGN KEY (`item_id`)
        REFERENCES `items` (`item_id`),

    CONSTRAINT `transactions_chk_1`
        CHECK (`quantity_before` >= 0),
    CONSTRAINT `transactions_chk_2`
        CHECK (`quantity_after` >= 0),
    CONSTRAINT `transactions_chk_3`
        CHECK (`transaction_quantity` > 0)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;
