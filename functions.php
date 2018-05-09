<?php

function priceFormat($price){
    $ceilPrice = ceil($price);
    if ($ceilPrice < 1000){
        $editPrice = $ceilPrice;
    }else{
        $editPrice = number_format($price, 0, '', ' ');
    }
    return $editPrice . " ₽";
}
function renderTemplate($path, $data){
    if (!file_exists($path)) {
        return '';
    }else {
        extract($data);
        ob_start();
        include "$path";
        return ob_get_clean();
    }
}

date_default_timezone_set("Europe/Moscow");

function finishtime(){
    $time = strtotime("tomorrow");
    $day = $time - time();
    $hours = floor($day/3600);
    $minutes = floor(($day%3600)/60);
    $timer = $hours . ":" . $minutes;

    return date("H:i", strtotime($timer));
}

?>