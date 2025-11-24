<?php
session_start();
error_reporting(0);
include('include/config.php');

if(strlen($_SESSION['id']==0)) {
    header('location:logout.php');
    exit;
}

$response = array('status' => 'error', 'message' => 'Erreur inconnue');

if(isset($_POST['snapshot_id'])) {
    $snapshot_id = intval($_POST['snapshot_id']);
    
    // Supprimer la sauvegarde
    $delete_query = mysqli_query($con, "DELETE FROM `blindes_snapshots` WHERE `id` = '$snapshot_id'");
    
    if($delete_query) {
        $response['status'] = 'success';
        $response['message'] = 'Sauvegarde supprimée avec succès';
    } else {
        $response['message'] = 'Erreur lors de la suppression de la sauvegarde';
    }
} else {
    $response['message'] = 'Paramètres manquants';
}

header('Content-Type: application/json');
echo json_encode($response);
?>
