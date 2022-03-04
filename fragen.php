<?php
include "./database.php";
$connection = db_connection_open();
$sqlquery = $connection->prepare("SELECT id, objekt FROM fragen ORDER BY RAND() LIMIT 1;");
$sqlquery->execute();
$sqlquery->bind_result($id, $frage);
$sqlquery->fetch();
echo "[" . $id . ',"' . $frage . '"]';
db_connection_close($connection);
