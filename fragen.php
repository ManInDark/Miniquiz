<?php
include "./database.php";
$connection = db_connection_open();
$sqlquery = $connection->prepare("SELECT id, objekt FROM fragen ORDER BY RAND() LIMIT 1;");
$sqlquery->execute();
$sqlquery->bindColumn(1, $id);
$sqlquery->bindColumn(2, $frage);
$sqlquery->fetch();
echo "[" . $id . ',"' . $frage . '"]';
