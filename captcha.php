<?php
error_reporting(E_ALL);
session_start();

if (!isset($_SESSION['captcha_number'])) {
    $_SESSION['captcha_number'] = rand(1000, 9999);
}

function drawNumber($securityNumber, $fontMinSize, $fontMaxSize,  $maxHorizAngle, $imgY, $imgX, &$image, $textColor, $font)
{
    //  В переменной $number будет храниться число, показанное на изображении
    $num_n = strlen($securityNumber);
    for ($n = 0; $n < $num_n; $n++) {
        $num = substr($securityNumber, $n, 1);
        $font_size = rand($fontMinSize, $fontMaxSize);//$imgY/2
        $angle = rand(360 - $maxHorizAngle, 360 + $maxHorizAngle);
        //  вычисление координат для каждой цифры, формулы обеспечивают нормальное расположние
        //  при любых значениях размеров цифры и изображения
        $y = rand(($imgY - $font_size) / 4 + $font_size, ($imgY - $font_size) / 2 + $font_size);
        $x = rand(($imgX / $num_n - $font_size) / 2, $imgX / $num_n - $font_size) + $n * $imgX / $num_n;
        $textColor = imagecolorallocate($image, rand(0, 100), rand(0, 100), rand(0, 100));       //цвет текста
        imagettftext($image, $font_size, $angle, $x, $y, $textColor, $font, $num);
    }
}

$securityNumber = $_SESSION['captcha_number'];
$imgX = 120;  // image width
$imgY = 20;   // image height
$fontMinSize = 12;  // Min font size
$fontMaxSize = 15;   //Max	 font size
$maxHorizAngle = 20;   //Максимальный угол отклонения от горизонтали по часовой стрелке и против, по умолчанию-20


$font = __DIR__ .DIRECTORY_SEPARATOR. 'font'.DIRECTORY_SEPARATOR.'SpicyRice.ttf';
//echo $font;
$image = imagecreate($imgX, $imgY);
// colors allocations - text, noise, bg
$textColor = imagecolorallocate($image, 0, 0, 0);
$imageColor = imagecolorallocate($image, 255, 255, 255);
// fill the bg of image
imagefill($image, 0, 0, $imageColor);

drawNumber($securityNumber, $fontMinSize, $fontMaxSize, $maxHorizAngle, $imgY, $imgX, $image, $textColor, $font);
header("Content-type: image/png");
imagepng($image);