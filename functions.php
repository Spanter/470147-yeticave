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

?>