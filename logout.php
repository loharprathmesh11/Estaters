<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start();

// Unset all session variables
$_SESSION = array();

// Destroy the session
session_destroy();

// Redirect to signup.php after logout
header('Location: signup.php');
exit();
