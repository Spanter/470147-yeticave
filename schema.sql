CREATE DATABASE yeticave DEFAULT CHARACTER SET  utf8 DEFAULT COLLATE utf8_general_ci;

USE yeticave;

CREATE TABLE users(
  id INT AUTO_INCREMENT,
  name CHAR(64),
  email CHAR(128),
  password CHAR(128),
  date_registration DATETIME,
  contact CHAR(24),
  avatar CHAR(128),
  PRIMARY KEY (id)
);

CREATE TABLE categories(
  id INT AUTO_INCREMENT,
  cat_name CHAR(64),
  PRIMARY KEY (id)
);

CREATE TABLE lot(
  id INT AUTO_INCREMENT,
  name CHAR (64),
  description CHAR (128),
  img CHAR (128),
  create_date DATETIME,
  end_date DATETIME,
  start_price INT,
  finish_price INT,
  category_id INT,
  win_id INT,
  author_id INT,
  PRIMARY KEY (id),

  FOREIGN KEY (category_id) REFERENCES categories(id),
  FOREIGN KEY (win_id) REFERENCES users(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE bet(
  id INT AUTO_INCREMENT,
  date_bet DATETIME,
  summ INT,
  users_id INT,
  lot_id INT,
  PRIMARY KEY (id),

  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (lot_id) REFERENCES lot(id)
);

CREATE UNIQUE INDEX user_on_email ON users(email);
CREATE INDEX name_on_lot ON lot(name);
CREATE INDEX description_on_lot ON lot(description);
CREATE INDEX bet_on_lot ON lot(start_price);