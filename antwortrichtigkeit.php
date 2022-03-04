<?php
include "./database.php";

$connection = db_connection_open();
$sqlquery = $connection->prepare("SELECT antwort from `antworten` WHERE richtig = 1 AND fragenid = :id;");
$sqlquery->execute([
    ":id" => $_GET["id"]
]);
$arr = $sqlquery->fetchAll(PDO::FETCH_ASSOC)
echo $arr;
db_connection_close($connection);
