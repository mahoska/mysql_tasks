<?php
require ROOT . 'models/contact_model.php';

// todo: delete       
 // delete script
 // redirect + flash message
if (requestGet('action') == 'del') {
 $mes_id = requestGet('mes_id');   
 $kol_rows = deleteMessage($link, $mes_id);
 if($kol_rows)
        setFlash('message was delete');
 else
        setFlash('message was delete','fail');
 
 redirect("index.php?page=contact");
}


if (isRequestPost()) {
    // todo: добавить проверку капчи, задавать соответствующее значение для сообщения + менять капчу если успех
    if (isFormValid()) {
        $_SESSION['captcha_number'] = rand(1000, 9999);
        $message = createMessage(requestPost('username'), requestPost('email'), requestPost('message'));
        $kol_rows = saveMessage($link, $message);
        //echo  "!!!!".$kol_rows;
        if($kol_rows)
            setFlash('Your message was sent');
        else
            setFlash('Your message not send');
        
        redirect("index.php?page=contact");
    } 
    
    // todo: убрать
    setFlash('Fill the fields','fail');
}


$messages = loadMessages($link);
$flash = getFlash();

