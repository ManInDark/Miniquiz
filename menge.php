<?php
include "./database.php";

$connection = db_connection_open();
$sqlquery = $connection->prepare("SELECT COUNT( DISTINCT(id) ) as Amount FROM fragen");
$sqlquery->execute();
$sqlquery->bind_result($amount);
$sqlquery->fetch();
echo $amount;
db_connection_close($connection);
