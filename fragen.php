<?php
$connection = new mysqli("localhost", "testuser", "testuser", "quizduell");
$sqlquery = $connection->prepare("SELECT * FROM fragen ORDER BY RAND() LIMIT 1;");
$sqlquery->execute();
$sqlquery->bind_result($id, $frage);
$sqlquery->fetch();
echo "[" . $id . "," . $frage . "]";
$sqlquery->close();
