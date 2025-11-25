<?php
session_start();
error_reporting(0);
include('include/config.php');

if(strlen($_SESSION['id']) == 0) {
    header('location:logout.php');
    exit;
}

$response = array('status' => 'error', 'message' => 'Erreur inconnue');

if(isset($_POST['snapshot_id'])) {
    $snapshot_id = intval($_POST['snapshot_id']);
    $id_membre = intval($_SESSION['id']); // ID de l'utilisateur connecté
    
    // Vérifier que le snapshot appartient à l'utilisateur actif
    $check_query = mysqli_query($con, "SELECT * FROM `blindes_snapshots` 
                                       WHERE `id` = '$snapshot_id' 
                                       AND `id_membre` = '$id_membre'");
    
    if($check_query && mysqli_num_rows($check_query) > 0) {
        // L'utilisateur est propriétaire, on peut supprimer
        $delete_query = mysqli_query($con, "DELETE FROM `blindes_snapshots` 
                                            WHERE `id` = '$snapshot_id' 
                                            AND `id_membre` = '$id_membre'");
        
        if($delete_query) {
            $response['status'] = 'success';
            $response['message'] = 'Snapshot supprimé avec succès';
        } else {
            $response['message'] = 'Erreur lors de la suppression: ' . mysqli_error($con);
        }
    } else {
        $response['message'] = 'Vous n\'avez pas les droits pour supprimer ce snapshot';
    }
} else {
    $response['message'] = 'ID de snapshot manquant';
}

header('Content-Type: application/json');
echo json_encode($response);
?>
