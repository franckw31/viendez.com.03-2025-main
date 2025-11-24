<?php
session_start();
error_reporting(1);
ini_set('display_errors', 1);
include ('include/config.php');

header('Content-Type: application/json');

// Log pour debugging
error_log('REQUEST_METHOD: ' . $_SERVER['REQUEST_METHOD']);
error_log('POST data: ' . print_r($_POST, true));

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['updates'])) {
    $updates = json_decode($_POST['updates'], true);
    $classements = isset($_POST['classements']) ? json_decode($_POST['classements'], true) : [];
    
    error_log('Decoded updates: ' . print_r($updates, true));
    error_log('Decoded classements: ' . print_r($classements, true));

    if (is_array($updates) && count($updates) > 0) {
        $success = true;
        
        // Mettre à jour les recaves
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
                    echo json_encode(['status' => 'error', 'message' => 'Erreur SQL recave: ' . mysqli_error($con)]);
                    exit;
                }
            } else {
                echo json_encode(['status' => 'error', 'message' => 'ID participant non trouvé: ' . $id]);
                exit;
            }
        }
        
        // Mettre à jour les classements si disponibles
        if (is_array($classements) && count($classements) > 0) {
            foreach ($classements as $classement) {
                $id = intval($classement['id-participation']);
                $rank = intval($classement['classement']);
                
                // Vérifiez que l'ID existe
                $check = mysqli_query($con, "SELECT `id-participation` FROM `participation` WHERE `id-participation` = '$id'");
                
                if (mysqli_num_rows($check) > 0) {
                    $query = "UPDATE `participation` SET `classement` = '$rank' WHERE `id-participation` = '$id'";
                    $result = mysqli_query($con, $query);
                    
                    if (!$result) {
                        $success = false;
                        echo json_encode(['status' => 'error', 'message' => 'Erreur SQL classement: ' . mysqli_error($con)]);
                        exit;
                    }
                }
            }
        }
        
        if ($success) {
            echo json_encode(['status' => 'success', 'message' => 'Recaves et classements mis à jour avec succès']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Pas de données à mettre à jour']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Requête invalide ou données manquantes']);
}
?>
