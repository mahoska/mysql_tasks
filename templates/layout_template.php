<!--основная разметка-->
 <!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mego site</title>
        <link rel="stylesheet" type="text/css" href="styles/style.css" />
    </head>
    <body>
        <div id="container">
            <div id="head">
                <a href = "index.php">Home</a>
                <a href = "index.php?page=about">About us</a>
                <a href = "index.php?page=contact">Contact</a>
                <a href = "index.php?page=books">Books</a>
                <hr>
            </div>
            
            <div id="main">
                
            
                <?=$content?>
            </div>
            <br class="clear">
            <hr>
            All rights reserved &copy; <?=$date?>
        </div>
    </body>
</html>

