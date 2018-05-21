<?php
//Подключение к БД и проверка на подключение

$connect = mysqli_connect('localhost','root','','yeticave');

if ($connect == false){
    print ("Ошибка в подключения БД: " . mysqli_connect_error());
}

//Получение категорий товаров

$sql = "SELECT id, cat_name FROM categories ";
$result = mysqli_query($connect, $sql);
$categories = [];
if ($result) {
    $row = mysqli_fetch_all($result, MYSQLI_ASSOC);
    foreach ($row as $row){
        $categories[] = $row['cat_name'];
    }
}

//Информация по новым лотам

$sql_l = "SELECT lot.id, lot.name, lot.finish_price AS price, lot.img AS url_img, categories.cat_name AS category FROM lot "
    . " JOIN categories " . " ON lot.category_id = categories.id "
    . " WHERE NOW() < lot.end_date "
    . " ORDER BY lot.create_date DESC limit 6";
if ($result_lot = mysqli_query($connect, $sql_l)){
    $lot = mysqli_fetch_all($result_lot, MYSQLI_ASSOC);
    $page_cont = renderTemplate('templates/index.php', ['lot' => $lot]);
}else{
    $error = mysqli_error($connect);
    $page_cont = "";
    print ("Error: " . $error);
}


// ставки пользователей, которыми надо заполнить таблицу
$bets = [
    ['name' => 'Иван', 'price' => 11500, 'ts' => strtotime('-' . rand(1, 50) .' minute')],
    ['name' => 'Константин', 'price' => 11000, 'ts' => strtotime('-' . rand(1, 18) .' hour')],
    ['name' => 'Евгений', 'price' => 10500, 'ts' => strtotime('-' . rand(25, 50) .' hour')],
    ['name' => 'Семён', 'price' => 10000, 'ts' => strtotime('last week')]
];
