<?php
include "./database.php";
$connection = db_connection_open();
$sqlquery = $connection->prepare("SELECT antwort FROM antworten WHERE fragenid = ?;");
$sqlquery->bind_param("s", $_GET["id"]);
$sqlquery->execute();
$sqlquery->bind_result($antwort);
# loop here
$arr = array();
while ($sqlquery->fetch()) {
    $arr[] = $antwort;
}
echo json_encode($arr);
db_connection_close($connection);
