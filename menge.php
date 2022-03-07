<?php
include "./database.php";
$connection = db_connection_open();
$sqlquery = $connection->prepare("SELECT COUNT( DISTINCT(id) ) as Amount FROM fragen;");
$sqlquery->execute();
$sqlquery->bindColumn(1, $amount);
$sqlquery->fetch();
echo $amount;