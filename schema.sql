create database yeticave default character set utf8 default collate utf8_general_ci;
use yeticave;

create table users(
  id int auto_increment,
  name char,
  email char,
  password char,
  avatar char,
  date_registration datetime,
  contact char,
  primary key (id)
)engine=InnoDB auto_increment=0 default charset=utf8;

create table categories(
  id int auto_increment,
  name char,
  primary key (id)
)engine=InnoDB auto_increment=0 default charset=utf8;

create table bet(
  id int auto_increment,
  date_bet datetime,
  summ int,
  users_id int,
  lot_id int,
  primary key (id),

  foreign key (users_id) references users(id),
  foreign key (lot_id) references lot(id)
)engine=InnoDB auto_increment=0 default charset=utf8;

create table lot(
  id int auto_increment,
  name char,
  description char,
  img char,
  create_date datetime,
  end_date date,
  start_price int,
  finish_price int,
  step int,
  category_id int,
  user_win int,
  user_author int,
  primary key (id),

  foreign key (category_id) references categories(id),
  foreign key (user_win) references users(id),
  foreign key (user_author) references users(id)
)engine=InnoDB auto_increment=0 default charset=utf8;


create unique index uniq_user_name on users(name);
create unique index uniq_user_email on users(email);
create unique index uniq_cat_name on categories(name);
create index lot_category_id on lot(category_id);
create index user_email on users(email);
create index lot_user_win on lot(user_win, end_date);
