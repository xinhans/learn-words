CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
  `name` VARCHAR(100) NOT NULL COMMENT '用户昵称',
  `avatar` VARCHAR(255) COMMENT '用户头像URL',
  `signature` VARCHAR(255) COMMENT '个性签名',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

CREATE TABLE `word_banks` (
  `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '词库ID',
  `name` VARCHAR(100) NOT NULL COMMENT '词库名称',
  `description` TEXT COMMENT '词库描述',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='词库表';

CREATE TABLE `words` (
  `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '单词ID',
  `word_bank_id` INT NOT NULL COMMENT '所属词库ID',
  `word` VARCHAR(100) NOT NULL COMMENT '日语单词',
  `kana` VARCHAR(100) NOT NULL COMMENT '假名',
  `part_of_speech` VARCHAR(50) COMMENT '词性',
  `meaning` TEXT NOT NULL COMMENT '中文释义',
  `example_sentence` TEXT COMMENT '例句',
  `audio_url` VARCHAR(255) COMMENT '读音URL',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  FOREIGN KEY (`word_bank_id`) REFERENCES `word_banks`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='单词表';

CREATE TABLE `user_word_progress` (
  `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '学习进度ID',
  `user_id` INT NOT NULL COMMENT '用户ID',
  `word_id` INT NOT NULL COMMENT '单词ID',
  `status` ENUM('new', 'learning', 'reviewing', 'mastered') NOT NULL DEFAULT 'new' COMMENT '学习状态 (新词, 学习中, 复习, 已掌握)',
  `is_favorite` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '是否收藏',
  `progress` INT NOT NULL DEFAULT 0 COMMENT '掌握进度 (0-100)',
  `review_stage` INT NOT NULL DEFAULT 0 COMMENT '艾宾浩斯复习阶段',
  `next_review_at` TIMESTAMP NULL COMMENT '下次复习时间',
  `last_reviewed_at` TIMESTAMP NULL COMMENT '上次复习时间',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  UNIQUE KEY `user_word_unique` (`user_id`, `word_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`word_id`) REFERENCES `words`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户单词学习进度表';

CREATE TABLE `user_settings` (
  `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '设置ID',
  `user_id` INT NOT NULL COMMENT '用户ID',
  `active_word_bank_id` INT COMMENT '当前选择的词库ID',
  `daily_goal` INT NOT NULL DEFAULT 20 COMMENT '每日学习目标',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  UNIQUE KEY `user_id_unique` (`user_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`active_word_bank_id`) REFERENCES `word_banks`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户设置表';

CREATE TABLE `learning_reminders` (
  `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '提醒ID',
  `user_id` INT NOT NULL COMMENT '用户ID',
  `day_of_week` ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL COMMENT '星期几',
  `reminder_time` TIME NOT NULL COMMENT '提醒时间',
  `is_active` BOOLEAN NOT NULL DEFAULT TRUE COMMENT '是否激活',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习提醒表';

CREATE TABLE `feedback` (
  `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '反馈ID',
  `user_id` INT NOT NULL COMMENT '用户ID',
  `content` TEXT NOT NULL COMMENT '反馈内容',
  `status` ENUM('open', 'in_progress', 'resolved') NOT NULL DEFAULT 'open' COMMENT '处理状态',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户反馈表';
