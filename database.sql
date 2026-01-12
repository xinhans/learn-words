CREATE TABLE `users` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
  `name` VARCHAR(100) NOT NULL COMMENT '用户昵称',
  `avatar` VARCHAR(255) COMMENT '用户头像URL',
  `signature` VARCHAR(255) COMMENT '个性签名',
  `check_in_days` INT DEFAULT 0 COMMENT '连续打卡天数',
  `total_learning_minutes` INT DEFAULT 0 COMMENT '累计学习时长（分钟），对应42小时15分',
  `open_id` VARCHAR(64) COMMENT '用户OpenID，用于关联微信登录',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

CREATE TABLE `word_banks` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '词库ID',
  `name` VARCHAR(100) NOT NULL COMMENT '词库名称',
  `description` TEXT COMMENT '词库描述',
  `total_words_count` INT DEFAULT 2000 COMMENT '总单词量',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  INDEX `idx_word_banks_name` (`name`) -- 优化词库名称查询
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='词库表';

CREATE TABLE `words` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '单词ID',
  `word_bank_id` BIGINT NOT NULL COMMENT '所属词库ID',
  `word` VARCHAR(100) NOT NULL COMMENT '日语单词, 如：木漏れ日',
  `kana` VARCHAR(100) NOT NULL COMMENT '假名，如：こもれび',
  `part_of_speech` VARCHAR(50) COMMENT '词性，如：名词 (n.)',
  `meaning` TEXT NOT NULL COMMENT '中文释义',
  `example_sentence` TEXT COMMENT '日文例句',
  `example_translation` TEXT COMMENT '日文例句翻译',
  `audio_url` VARCHAR(255) COMMENT '读音URL',
  `sort_order` INT NOT NULL DEFAULT 0 COMMENT '排序权重，值越大越靠前',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  FOREIGN KEY (`word_bank_id`) REFERENCES `word_banks`(`id`),
  INDEX `idx_words_word_bank_id` (`word_bank_id`), -- 优化词库查询
  INDEX `idx_words_word` (`word`), -- 优化单词搜索
  INDEX `idx_words_kana` (`kana`), -- 优化假名搜索
  UNIQUE KEY `uk_word_bank_order` (`word_bank_id`, `sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='单词表';

CREATE TABLE `user_word_progress` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '学习进度ID',
  `user_id` BIGINT NOT NULL COMMENT '用户ID',
  `word_id` BIGINT NOT NULL COMMENT '单词ID',
  `status` ENUM('new', 'learning', 'reviewing', 'mastered') NOT NULL DEFAULT 'new' COMMENT '学习状态 (新词, 学习中, 复习, 已掌握)',
  `is_favorite` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '是否收藏',
  `progress` INT NOT NULL DEFAULT 0 COMMENT '掌握进度 (0-100)',
  `review_stage` INT NOT NULL DEFAULT 0 COMMENT '艾宾浩斯复习阶段，1, 2, 3, 4阶段',
  `next_review_at` DATETIME NULL COMMENT '下次复习时间',
  `last_reviewed_at` DATETIME NULL COMMENT '上次复习时间',
  `wrong_count` INT DEFAULT 0 COMMENT '累计答错/点击“不认识”的次数',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  UNIQUE KEY `user_word_unique` (`user_id`, `word_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
  FOREIGN KEY (`word_id`) REFERENCES `words`(`id`),
  INDEX `idx_user_word_progress_user_favorite` (`user_id`,`is_favorite`), -- 优化收藏查询
  INDEX `idx_user_word_progress_user_next_review` (`user_id`,`next_review_at`), -- 优化复习时间查询
  INDEX `idx_user_word_progress_user_status` (`user_id`, `status`) -- 复合索引优化
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户单词学习进度表';

CREATE TABLE `user_settings` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '设置ID',
  `user_id` BIGINT NOT NULL COMMENT '用户ID',
  `active_word_bank_id` BIGINT COMMENT '当前选择的词库ID',
  `daily_goal` INT NOT NULL DEFAULT 20 COMMENT '每日学习目标',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  UNIQUE KEY `user_id_unique` (`user_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
  FOREIGN KEY (`active_word_bank_id`) REFERENCES `word_banks`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户设置表';

CREATE TABLE `learning_reminders` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '提醒ID',
  `user_id` BIGINT NOT NULL COMMENT '用户ID',
  `day_of_week` ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL COMMENT '星期几',
  `reminder_time` TIME NOT NULL COMMENT '提醒时间',
  `reminder_time_final` TIME NOT NULL COMMENT '最终提醒时间',
  `is_active` BOOLEAN NOT NULL DEFAULT TRUE COMMENT '是否激活',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
  INDEX `idx_learning_reminders_user_active` (`user_id`, `is_active`) -- 复合索引优化
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习提醒表';

CREATE TABLE `feedback` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '反馈ID',
  `user_id` BIGINT NOT NULL COMMENT '用户ID',
  `content` TEXT NOT NULL COMMENT '反馈内容',
  `status` ENUM('open', 'in_progress', 'resolved') NOT NULL DEFAULT 'open' COMMENT '处理状态',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
  INDEX `idx_feedback_status` (`status`), -- 优化状态查询
  INDEX `idx_feedback_created_at` (`created_at`) -- 优化时间查询
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户反馈表';

CREATE TABLE `word_review` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '题目ID',
  `word_id` BIGINT NOT NULL COMMENT '关联的单词ID',
  `options` JSON NOT NULL COMMENT '四个中文释义选项，数组形式',
  `correct_option_index` TINYINT NOT NULL COMMENT '正确选项的索引 (0-3)',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  UNIQUE KEY `word_id_unique` (`word_id`),
  FOREIGN KEY (`word_id`) REFERENCES `words`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='复习题目表';

CREATE TABLE `word_daily` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '每日单词ID',
  `word_id` BIGINT NOT NULL COMMENT '单词ID',
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='每日单词表'; -- 修正了表注释
