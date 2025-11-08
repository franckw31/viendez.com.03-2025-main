<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);

if (strlen($_SESSION['id']) == 0) {
    die('Non autorisé');
}

include('include/config.php');

$conn = mysqli_connect(DB_CONFIG['host'], DB_CONFIG['user'], DB_CONFIG['password'], DB_CONFIG['name']);
if (!$conn) die('Erreur connexion DB');

$result = mysqli_query($conn, "DESCRIBE participation recave");
$field = mysqli_fetch_assoc($result);

echo "Type du champ recave: " . $field['Type'] . "\n";
echo "Valeurs acceptées: " . $field['Type'] . "\n";

mysqli_close($conn);
?>
