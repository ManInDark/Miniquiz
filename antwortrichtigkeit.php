<?php
include "./database.php";
$connection = db_connection_open();
$sqlquery = $connection->prepare("SELECT richtig FROM fragen WHERE id=?");
$sqlquery->bind_param("s", $_GET["id"]);
$sqlquery->execute();
$sqlquery->bind_result($richtig);
$sqlquery->fetch();
echo $richtig;
db_connection_close($connection);
