 <?php
 //------Получить выборку по всей таблице со странами country. 
 //------Вывести соответствующий массив на экран 
    $dsn = 'mysql:host=localhost; dbname=practice_db';
    $user = 'root';
    $password = '';
    try {
        $dbh = new PDO($dsn, $user, $password);
        //var_dump($dbh); // object(PDO)#1 (0) { }
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sth = $dbh->query(""
                . "SELECT country.name,"
                . " short_name,"
                . "square, "
                . "population,"
                . " president,"
                . " continent.name as 'continent',"
                . " prime_minister "
                . "FROM country JOIN continent ON country.continent_id = continent.id ");
        $countries = $sth->fetchAll(PDO::FETCH_ASSOC);
        //echo"<pre>";
        //print_r($countries);
    } catch (PDOException $e) {
      echo $e->getMessage();
    }
    
    //------информацию о стране по конкретному названию
    $country_info = null;
    if($_POST){
        $country_name = requestPost('country'); 
        $sth = $dbh->prepare("SELECT country.name, short_name,square, population, president, continent.name as 'continent', prime_minister FROM country JOIN continent ON country.continent_id = continent.id WHERE country.name = :name");
        $sth->execute(array('name'=>$country_name));
        $country_info = $sth->fetch(PDO::FETCH_ASSOC); 
        //var_dump($country_info);
    }
    
    //------еще задания на закрепление explode/prepare
    $tasks = [
      1 => "страны, порядковые номера которых больше 3 и не меньше 7",  
      2 => "страны, в которых население больше 20 миллионов и порядковые номера которых меньше 7.",
      3 => "Получить страны Азии.",
      4 => "страны, порядковые номера которых либо 5, либо 7, либо 2."       
    ];
    
    foreach($tasks as $number => $task){
        $var = 'info_task'.$number;
        $$var = null;
    }
    
    if($_GET){
        $number_task = (int)requestGet('task');
        switch($number_task){
            case 1:
                $query = "SELECT name FROM `country` WHERE id > :from AND id <= :to;";
                $info_task1 = exacute_query($dbh, $query,array('from'=>3, 'to'=>7));
                break;
            case 2:
                $query = "SELECT name FROM `country` WHERE population > :population AND id < :id;";
                $info_task2 = exacute_query($dbh, $query,array('population'=>20000000, 'id'=>7));
                break;
            case 3:
                $query = "SELECT country.name FROM country JOIN continent ON country.continent_id = continent.id  WHERE continent.name = :continent ;";
                $info_task3 = exacute_query($dbh,$query,array('continent'=>'Asia'));
                break;
            case 4:
                $query = "SELECT name FROM `country` WHERE id IN(?,?,?);";
                $info_task4 = exacute_query($dbh, $query,array(5,7,2));
                break;
        }
    }
    
    function requestPost($key, $default=null){
        return (isset($_POST[$key])) ? $_POST[$key] : $default;
    }
    
    function requestGet($key, $default=null){
        return (isset($_GET[$key])) ? $_GET[$key] : $default;
    }
    
    function exacute_query($dbh, $query, array $params){
        $sth = $dbh->prepare($query);
        $sth->execute($params);
        return $sth->fetchAll(PDO::FETCH_ASSOC);
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Connection testing</title>
        <link rel="stylesheet" type="text/css" href="style/my_style.css"/>
    </head>
    <body>
        <table border="1">
            <tr>
		<th>Name</th>
		<th>Short name</th>
		<th>Square</th>
		<th>Population</th>
                <th>President</th>
                <th>Continent</th>
                <th>Prime minister</th>
            </tr>
       <?php foreach($countries as $country):?>
            <tr>
                <td><?=$country['name'];?></td>
                <td><?=$country['short_name'];?></td>
                <td><?=$country['square'];?></td>
                <td><?=$country['population'];?></td>
                <td><?=$country['president'];?></td>
                <td><?=$country['continent'];?></td>
                <td><?=$country['prime_minister'];?></td>
            </tr>
        <?php endforeach; ?>
        </table>
        
        <p>
            <strong>информацию о стране по конкретному названию.</strong>
            <form method="post">
                <select name="country">
                    <?php foreach ($countries as $country):?>
                    <option value="<?=$country['name']?>" <?=($country['name'] == $country_info['name'])?"selected":""?>><?=$country['name']?></option>
                    <?php endforeach;?>
                </select>
                <button>Show info</button>
            </form>
            <pre>
                <?php isset($country_info)?print_r($country_info):null;?>
            </pre>
        </p>
        <ul>
            <?php foreach($tasks as $number => $task):?>
            <li>
                <a href="index.php?task=<?=$number?>"><?=$task;?></a>
                <pre>
                    <?php $var = 'info_task'.$number; isset($var)?print_r($$var):null;?>
                </pre>
            </li>
            <?php  endforeach;?>
        </ul>
        
    </body>
</html>
