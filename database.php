<?php
function db_connection_open()
{
    $db = new PDO("mysql:host=localhost;dbname=quizduell", "testuser", "testuser");
    $db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $db;
}