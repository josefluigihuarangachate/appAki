<?php

// Using Medoo namespace.
use Medoo\Medoo;

// Connect the database.
$pdo = new Medoo(
        [
    'type' => DB_TYPE,
    'host' => DB_HOST,
    'database' => DB_NAME,
    'username' => DB_USER,
    'password' => DB_PASS,
    'error' => PDO::ERRMODE_SILENT,
        ]
);
