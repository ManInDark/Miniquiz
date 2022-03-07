<?php
include "./database.php";
$connection = db_connection_open();
$sqlquery = $connection->prepare("SELECT antwort from `antworten` WHERE richtig = 1 AND fragenid = :fid");
$sqlquery->bindParam("fid", $_GET["id"]);
$sqlquery->execute();
$sqlquery->bindColumn(1, $richtig);
$sqlquery->fetch();
echo $richtig;
