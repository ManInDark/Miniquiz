<?php
include "./database.php";
$connection = db_connection_open();
$sqlquery = $connection->prepare("SELECT antwort FROM antworten WHERE fragenid = :fid;");
$sqlquery->bindParam("fid", $_GET["id"]);
$sqlquery->execute();
$sqlquery->bindColumn(1, $antwort);
# loop here
$arr = array();
while ($sqlquery->fetch(PDO::FETCH_BOUND)) {
    $arr[] = $antwort;
}
echo json_encode($arr);
