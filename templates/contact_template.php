<div id="rcolumn">
<h1>Form</h1>

    <b class="<?=$flash['status']?>"><?=$flash['message']?></b>
    <br>
    <form method="post">
        <input type="text" name="username" value="<?=requestPost('username') ?>"><br>
        <input type="text" name="email" value="<?=requestPost('email') ?>"><br>
        <textarea name="message"><?=requestPost('message') ?></textarea><br>
        <img src="captcha.php"> <br>
        <input type="text" name="security_number"/><br>
        <button>GO</button>
    </form>
    
    <hr>
    
    <?php foreach ($messages as $key => $message) : ?>
        
        <i><?=$message['username']?></i><br>
        <?=$message['message']?>
        
        <a href="index.php?page=contact&amp;action=del&amp;mes_id=<?=$message['id']?>">Delete</a>
        <!--a href="contact.php?action=edit">Edit</a-->
    <hr>
    <?php endforeach ?>