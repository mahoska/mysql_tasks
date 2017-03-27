<?php

require ROOT . 'models/books_model.php';
require ROOT . 'page/book_search_controller.php';

$id = requestGet('id');
$book = findBookById($link, $id);


if (!$book) {
    die('Book not found');
}
