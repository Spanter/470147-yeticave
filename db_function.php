<?php

//Получение категорий товаров

function get_categories($connect){
    $sql = "SELECT * FROM categories ";
    $categories = [];
    if ($result = mysqli_query($connect, $sql)){
        $categories = mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    return ($categories);
}

//Информация по новым лотам

function get_lots($connect){
    $sql = "SELECT lot.id, lot.name, lot.finish_price AS price, lot.img AS url_img, categories.cat_name AS category FROM lot 
         JOIN categories   ON lot.category_id = categories.id 
         WHERE NOW() < lot.end_date
         ORDER BY lot.create_date DESC limit 6";
    $lot = [];
    if ($result_lot = mysqli_query($connect, $sql)) {
        $lot = mysqli_fetch_all($result_lot, MYSQLI_ASSOC);
    }
    return($lot);
}