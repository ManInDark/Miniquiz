<?php
function db_connection_open()
{
    return new mysqli("localhost", "testuser", "testuser", "quizduell");
}
function db_connection_close($connection)
{
    $connection->close();
}
