<?php
session_start();
error_reporting(1);
ini_set('display_errors', 1);
include ('include/config.php');

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['updates'])) {
    $updates = json_decode($_POST['updates'], true);

    if (is_array($updates) && count($updates) > 0) {
        $success = true;
        foreach ($updates as $update) {
            $id = intval($update['id-participation']);
            $recave = intval($update['recave']);
            
            // Vérifiez que l'ID existe
            $check = mysqli_query($con, "SELECT `id-participation` FROM `participation` WHERE `id-participation` = '$id'");
            
            if (mysqli_num_rows($check) > 0) {
                $query = "UPDATE `participation` SET `recave` = '$recave' WHERE `id-participation` = '$id'";
                $result = mysqli_query($con, $query);
                
                if (!$result) {
                    $success = false;
                    echo json_encode(['status' => 'error', 'message' => 'Erreur SQL: ' . mysqli_error($con)]);
                    exit;
                }
            } else {
                echo json_encode(['status' => 'error', 'message' => 'ID participant non trouvé: ' . $id]);
                exit;
            }
        }
        
        if ($success) {
            echo json_encode(['status' => 'success', 'message' => 'Recaves mises à jour avec succès']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Pas de données à mettre à jour']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Requête invalide ou données manquantes']);
}
?>