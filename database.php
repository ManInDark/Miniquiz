<?php
function db_connection_open() {
    return new PDO('mysql:host=localhost; dbname=quizduell', 'testuser', 'testuser'); //"localhost", "testuser", "testuser", "quizduell");
}
function db_connection_close($connection) {
    $connection->close();
}
