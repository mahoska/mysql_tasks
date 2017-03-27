<?php

//https://mockaroo.com
$titles = [];
for($i = 1; $i<=7; $i++){
    $titles[] = 'Dummy title '.rand(10,99);
}
$authors = [
    'Mattew Frazier',
    'Jose Washington',
    'Russell Wilson',
    'Lisa Mccoy',
    'Sean Atrmstrong',
    'Roy Hudson',
    'Wayne Torres'
];

for($i = 1; $i <= 20; $i++){
    $book = [
        'title' => $titles[rand(0,6)],
        'author' => $authors[rand(0,6)],
        'price' => rand(100,1000)
    ];
    echo "<pre>";
    var_dump($book);
    file_put_contents('books.txt', serialize($book).PHP_EOL, FILE_APPEND);
}