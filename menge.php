<?php
$connection = new mysqli("localhost", "testuser", "testuser", "quizduell");
$sqlquery = $connection->prepare("SELECT COUNT( DISTINCT(id) ) as Amount FROM fragen;");
$sqlquery->execute();
$sqlquery->bind_result($amount);
$sqlquery->fetch();
echo $amount;
$sqlquery->close();
