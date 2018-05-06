<?php
require_once ("functions.php");

$is_auth = (bool) rand(0, 1);

$user_name = 'Константин';
$user_avatar = 'img/user.jpg';

$list_cat = ["Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"];

$list_lot = [
        ["name" => "2014 Rossignol District Snowboard",
            "category" => "Доски и лыжи",
            "price" => 10999,
            "url_img" => "img/lot-1.jpg"],
        ["name" => "DC Ply Mens 2016/2017 Snowboard",
            "category" => "Доски и лыжи",
            "price" => 159999,
            "url_img" => "img/lot-2.jpg"],
        ["name" => "Крепления Union Contact Pro 2015 года размер L/XL",
            "category" => "Крепления",
            "price" => 8000,
            "url_img" => "img/lot-3.jpg"],
        ["name" => "Ботинки для сноуборда DC Mutiny Charocal",
            "category" => "Ботинки",
            "price" => 10999,
            "url_img" => "img/lot-4.jpg"],
        ["name" => "Куртка для сноуборда DC Mutiny Charocal",
            "category" => "Одежда",
            "price" => 7500,
            "url_img" => "img/lot-5.jpg"],
        ["name" => "Маска Oakley Canopy",
            "category" => "Разное",
            "price" => 5400,
            "url_img" => "img/lot-6.jpg"]
];

//Защита от XSS
foreach ($list_lot as $lot){
    $lot["name"] = htmlspecialchars($lot["name"]);
    $lot["category"] = htmlspecialchars($lot["category"]);
    $lot["price"] = htmlspecialchars($lot["price"]);
    $lot["url_img"] = htmlspecialchars($lot["url_img"]);
}


$content = renderTemplate('templates/index.php', ['list_lot' => $list_lot]);
$template_Layout = renderTemplate('templates/layout.php', [
    'site_name' => "Yeticave",
    'is_auth' => $is_auth,
    'user_name' => $user_name,
    'user_avatar' => $user_avatar,
    'content' => $content,
    'list_cat' => $list_cat
]);


print ($template_Layout);


?>
