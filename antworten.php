<?php
include "./database.php";

$connection = db_connection_open();
$sqlquery = $connection->prepare("SELECT antwort FROM antworten WHERE fragenid = :id;");
$sqlquery->execute([
    ":id" => $_GET["id"]
]);
$arr = $sqlquery->fetchAll(PDO::FETCH_ASSOC)
echo json_encode($arr);
db_connection_close($connection);
