USE yeticave;

/*** Создание запроса категорий ***/

INSERT INTO categories (cat_name) VALUES ('Доски и лыжи'), ('Крепления'), ('Ботинки'), ('Одежда'), ('Инструменты'), ('Разное');

/*** Создание запроса пользователя ***/

INSERT INTO users
(name, email, password, date_registration, contact, avatar)
VALUES
('Иван', 'zloy-ivan@gmail.com', 'Trust0ne-Ivan', '2017-01-10 00:00:00', '7(999)999 99 99', null),
('Константин', 'kostyan@gmail.com', 'Trust0ne-Kostya', '2018-02-11 00:00:00', '7(999)999 99 98', 'img/user.jpg'),
('Евгений', 'zheka@gmail.com', 'Trust0ne-Zhenya', '2017-03-12 00:00:00', '7(999)999 99 97', null),
('Семён', 'senya@gmail.com', 'Trust0ne-Semen', '2018-04-15 00:00:00', '7(999)999 99 96', null);

/*** Создание лота ***/

INSERT INTO lot
(name, description, img, create_date, end_date, start_price, finish_price, category_id, win_id, author_id)
VALUES
('2015 Rossignol District Snowboard', 'Описание товара', 'img/lot-1.jpg', '2018-05-3 00:00:00', '2018-06-4 00:00:00', 1000, 10999, 1, 3, 1),
('DC Ply Mens 2016/2017 Snowboard', 'Описание товара', 'img/lot-2.jpg', '2018-05-4 00:00:00', '2018-06-5 00:00:00', 2800, 15999, 1, 2, 3),
('Крепления Union Contact Pro 2015 года размер L/XL', 'Описание товара', 'img/lot-3.jpg', '2018-05-7 00:00:00', '2018-06-9 00:00:00', 750, 8000, 2, 2, 4),
('Ботинки для сноуборда DC Mutiny Charoca', 'Описание товара', 'img/lot-4.jpg', '2018-05-9 00:00:00', '2018-06-7 00:00:00', 990, 10999, 3, 1, 2),
('Куртка для сноуборда DC Mutiny Charocal', 'Описание товара', 'img/lot-5.jpg', '2018-05-7 00:00:00', '2018-06-8 00:00:00', 700, 7500, 4, 1, 3),
('Маска Oakley Canopy', 'Описание товара', 'img/lot-5.jpg', '2018-05-8 00:00:00', '2018-06-10 00:00:00', 500, 5400, 6, 4, 2);

/*** Добавление данных ставок ***/

INSERT INTO  bet
(date_bet, summ, users_id, lot_id)
VALUES
('2018-05-3 14:04:00', 8500, 1, 1),
('2018-05-3 12:12:00', 10500, 3, 1),
('2018-05-4 15:00:00', 11900, 2, 2),
('2018-05-5 07:00:00', 5400, 2, 3),
('2018-05-6 00:59:00', 7999, 1, 4),
('2018-05-7 12:12:00', 3200, 4, 5),
('2018-05-7 22:22:00', 5100, 1, 5),
('2018-05-8 22:22:22', 2100, 4, 6);


/*** Получение всех категорий ***/

SELECT  * FROM categories;


/**** Обновление лота по id ****/

UPDATE lot SET name = '2014 Rossignol District Snowboard' WHERE id = 1;


/**** Показ лота  по id. Получение нназвание категорий по лоту***/

SELECT name, lot.create_date, img, start_price, end_date, finish_price, author_id, cat_name
FROM lot JOIN categories ON lot.category_id = categories.id WHERE lot.id=1;

/*** получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, количество ставок, название категории ***/

SELECT name, start_price, img, finish_price,COUNT(bet.lot_id) AS bets, cat_name
FROM lot JOIN  bet ON bet.lot_id = lot.id JOIN categories ON lot.category_id = categories.id
WHERE NOW() < lot.end_date
GROUP BY lot.id ORDER BY lot.create_date DESC;