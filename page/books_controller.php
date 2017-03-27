<?php

//$books = file_get_contents("books.txt");
//if(!$books)die("ошибка получения данных");
//$books = explode(PHP_EOL,$books);
//foreach($books as &$book){
//    $book = unserialize($book);
//}
//
//переделали на работу с БД
require ROOT . 'models/books_model.php';
require ROOT . 'page/book_search_controller.php';

 $sortField = requestGet('sort', 'price');
 $sortOrder = requestGet('order', 'asc');
 //$author_id = requestGet('author_id');
 $sortAllField = getSortedFields();
 $sortAllOrder = ['asc','desc'];
 
 $serch_book_name = requestGet('search_book_name');
 //var_dump($all_authors);
 
 if($author_id){
     $books = findBooksByParam($link, $sortField, $sortOrder, "author.id", $author_id);
 }
 else if($style_id){
     $books = findBooksByParam($link, $sortField, $sortOrder, "book.style_id", $style_id);
 }
 else if($serch_book_name){
     $books = findAllBooks($link, $sortField, $sortOrder,$serch_book_name);
 }
 else{
    $books = findAllBooks($link, $sortField, $sortOrder);
 }

    foreach ($books as $key => &$book) {
        $authors_name = explode(", ",$book['authors_name']);
        $authors_id = explode(", ", $book['authors_id']);
        $book['authors'] = array_combine($authors_id,$authors_name);
        //var_dump($authors);
    }
 
//echo count($books);
//echo"<pre>";
//var_dump($books);
//echo"</pre>";


