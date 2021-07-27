<?php
session_start();
if ($_SESSION['acceso'] <> true) {
    header("Location: ./login");
}
header('Content-Type: text/html; charset=UTF-8');
?>