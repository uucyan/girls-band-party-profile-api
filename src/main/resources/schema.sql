DROP TABLE IF EXISTS bd_profile;
DROP TABLE IF EXISTS bd_members;
DROP TABLE IF EXISTS bd_event_score;
DROP TABLE IF EXISTS bd_music_score;
DROP TABLE IF EXISTS bd_config;
DROP TABLE IF EXISTS inquiry;
DROP TABLE IF EXISTS bang_dreamer;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS music;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS bands;

CREATE TABLE IF NOT EXISTS bang_dreamer (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  last_login_at DATE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = 'バンドリーマーテーブル';

CREATE TABLE IF NOT EXISTS bands (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) COMMENT 'バンド名',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = '各バンドのマスターデータ用テーブル';

CREATE TABLE IF NOT EXISTS members (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  band_id BIGINT NOT NULL,
  name VARCHAR(255) COMMENT 'キャラクター名',
  name_kana VARCHAR(255) COMMENT 'キャラクター名かな',
  part VARCHAR(255) COMMENT 'パート',
  school VARCHAR(255) COMMENT '学校',
  grade VARCHAR(255) COMMENT '学年',
  birthday VARCHAR(255) COMMENT '誕生日',
  constellation VARCHAR(255) COMMENT '星座',
  favorite_food VARCHAR(255) COMMENT '好きな食べ物',
  hate_food VARCHAR(255) COMMENT '嫌いな食べ物',
  hobby VARCHAR(255) COMMENT '趣味',
  cv VARCHAR(255) COMMENT '担当声優',
  self_introduction TEXT COMMENT '自己紹介',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (band_id) REFERENCES bands(id)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = '各バンドに所属するメンバーのマスターデータ用テーブル';

CREATE TABLE IF NOT EXISTS music (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  band_id BIGINT NOT NULL,
  name VARCHAR(255) COMMENT '楽曲名',
  category VARCHAR(255) COMMENT 'カテゴリ',
  easy_level INT(11) COMMENT '楽曲レベル（EASY）',
  normal_level INT(11) COMMENT '楽曲レベル（NORMAL）',
  hard_level INT(11) COMMENT '楽曲レベル（HARD）',
  expert_level INT(11) COMMENT '楽曲レベル（EXPERT）',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (band_id) REFERENCES bands(id)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = 'ガルパ内で公開されている楽曲のマスターデータ用テーブル';

CREATE TABLE IF NOT EXISTS events (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  band_id BIGINT NOT NULL,
  name VARCHAR(255) COMMENT 'イベント名',
  open_at DATETIME COMMENT 'イベント開始日時',
  close_at DATETIME COMMENT 'イベント終了日時',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (band_id) REFERENCES bands(id)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = 'ガルパ内で開催されたイベントのマスターデータ用テーブル';

CREATE TABLE IF NOT EXISTS bd_profile (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  bang_dreamer_id BIGINT NOT NULL,
  twitter_id VARCHAR(255) COMMENT 'TwitterID',
  gbp_player_id BIGINT COMMENT 'ガルパ内ID',
  gbp_player_name VARCHAR(255) COMMENT 'ガルパ内プレイヤーネーム',
  gbp_rank INT(11) COMMENT 'ガルパランク',
  gbp_start_at DATETIME COMMENT 'ガルパ開始日時',
  gbp_comprehensive_power INT(11) COMMENT 'PT総合力',
  gbp_notes_speed INT(11) COMMENT 'ノーツ速度',
  gbp_clear_music INT(11) COMMENT 'クリア楽曲数',
  gbp_full_combo_music INT(11) COMMENT 'フルコンボ楽曲数',
  gbp_high_score_rating INT(11) COMMENT 'ハイスコアレーティング',
  gender TINYINT(1) COMMENT '性別',
  play_style TINYINT(1) COMMENT 'ゲームのプレイスタイル',
  play_finger TINYINT(1) COMMENT 'ゲームプレイ時の指',
  play_terminal VARCHAR(255) COMMENT 'ゲームプレイする端末',
  favorite_band BIGINT COMMENT '推しバンド',
  favorite_member BIGINT COMMENT '推しキャラ',
  favorite_music BIGINT COMMENT '好きな曲',
  self_introduction TEXT COMMENT '自己紹介',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (bang_dreamer_id) REFERENCES bang_dreamer(id),
  FOREIGN KEY (favorite_band) REFERENCES bands(id),
  FOREIGN KEY (favorite_member) REFERENCES members(id),
  FOREIGN KEY (favorite_music) REFERENCES music(id)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = 'バンドリーマーのプロフィール情報テーブル';

CREATE TABLE IF NOT EXISTS bd_members (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  bang_dreamer_id BIGINT NOT NULL,
  member_id BIGINT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (bang_dreamer_id) REFERENCES bang_dreamer(id),
  FOREIGN KEY (member_id) REFERENCES members(id)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = 'バンドリーマーが保持してるメンバーテーブル';

CREATE TABLE IF NOT EXISTS bd_music_score (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  bang_dreamer_id BIGINT NOT NULL,
  music_id BIGINT NOT NULL,
  is_easy_full_combo BOOLEAN DEFAULT FALSE COMMENT 'EASYでフルコンしたか',
  is_normal_full_combo BOOLEAN DEFAULT FALSE COMMENT 'NORMALでフルコンしたか',
  is_hard_full_combo BOOLEAN DEFAULT FALSE COMMENT 'HARDでフルコンしたか',
  is_expert_full_combo BOOLEAN DEFAULT FALSE COMMENT 'EXPERTでフルコンしたか',
  is_easy_all_perfect BOOLEAN DEFAULT FALSE COMMENT 'EASYでAPしたか',
  is_normal_all_perfect BOOLEAN DEFAULT FALSE COMMENT 'NORMALでAPしたか',
  is_hard_all_perfect BOOLEAN DEFAULT FALSE COMMENT 'HARDでAPしたか',
  is_expert_all_perfect BOOLEAN DEFAULT FALSE COMMENT 'EXPERTでAPしたか',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (bang_dreamer_id) REFERENCES bang_dreamer(id),
  FOREIGN KEY (music_id) REFERENCES music(id)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = 'バンドリーマーの楽曲スコアテーブル';

CREATE TABLE IF NOT EXISTS bd_event_score (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  bang_dreamer_id BIGINT NOT NULL,
  event_id BIGINT NOT NULL,
  score INT(11) COMMENT 'スコア',
  ranking INT(11) COMMENT 'ランキング',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (bang_dreamer_id) REFERENCES bang_dreamer(id),
  FOREIGN KEY (event_id) REFERENCES events(id)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = 'バンドリーマーのイベントスコアテーブル';

CREATE TABLE IF NOT EXISTS bd_config (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  bang_dreamer_id BIGINT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (bang_dreamer_id) REFERENCES bang_dreamer(id)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = 'バンドリーマーの個人設定テーブル';

CREATE TABLE IF NOT EXISTS inquiry (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  bang_dreamer_id BIGINT COMMENT 'ログインしてるユーザーの場合のみ保存',
  email VARCHAR(255) COMMENT '返信先メールアドレス',
  detail TEXT COMMENT '問い合わせ内容',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (bang_dreamer_id) REFERENCES bang_dreamer(id)
)
ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = 'お問い合わせや要望の保持テーブル';
