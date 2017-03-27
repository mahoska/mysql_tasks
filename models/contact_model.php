<?php

// `feedback` table

function isFormValid()
{
    $captureValid =  $_SESSION['captcha_number']==requestPost('security_number');
    return $captureValid && trim(requestPost('username')) != '' && trim(requestPost('email')) != '' && trim(requestPost('message')) != '';
}

define('DATA_FILE', 'messages.txt');
define('FLASH_KEY', 'flash_message');
// functions

// todo : определять в какой цвет закрасить сообщение в зависимости от успеха/фейла
function setFlash($message,$default='success')
{
    $_SESSION[FLASH_KEY] = ['status' => $default, 'message' => $message];
}

function getFlash()
{
    if (!isset($_SESSION[FLASH_KEY])) {
        return null;
    }
    
    $flash= $_SESSION[FLASH_KEY];
    unset($_SESSION[FLASH_KEY]);
    
    return $flash;
}


function createMessage($username, $email, $message)
{
    $id = uniqid();
    return compact('username', 'email', 'message');
}

function redirect($to)
{
    header("Location: {$to}");
    die;
}

// todo: argument for filename
function saveMessage($link, array $message)
{
   // var_dump($message);
    //$s = serialize($message);
    //file_put_contents(DATA_FILE, $s . PHP_EOL, FILE_APPEND);
    
    $sql = "INSERT INTO messages(username, email, message) VALUES (?,?,?)";
    $stmt = mysqli_prepare($link, $sql);
    mysqli_stmt_bind_param($stmt, 'sss', $message['username'],$message['email'],$message['message']);
    mysqli_stmt_execute($stmt);
    
    return  mysqli_stmt_affected_rows($stmt);
}

function loadMessages($link)
{
//    $messages = file_get_contents(DATA_FILE);
//    $messages = explode(PHP_EOL, $messages);
//    
//    foreach ($messages as $key => $message) {
//        if ($message) {
//            $messages[$key] = unserialize($message);
//            continue;
//        }
//        
//        unset($messages[$key]);
//    }
    
    $sql = "SELECT * FROM messages";
    $res = mysqli_get_result($link, $sql);
    while($row = mysqli_fetch_assoc($res)){
        $messages[] = $row;
    }
    return $messages;
}


function deleteMessage($link, $mes_id){
     $mes_id = (int) $mes_id;
    $sql = "DELETE from messages where id = ?";
    
    $stmt = mysqli_prepare($link, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $mes_id);
    mysqli_stmt_execute($stmt);
    return  mysqli_stmt_affected_rows($stmt);
}