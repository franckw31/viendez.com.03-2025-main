<?php
session_start();
error_reporting(0);
include('include/config.php');

if(strlen($_SESSION['id']) == 0) {
    header('location:logout.php');
    exit;
}

$response = array('status' => 'error', 'message' => 'Erreur inconnue');

if(isset($_POST['snapshot_id']) && isset($_POST['id_activite'])) {
    $snapshot_id = intval($_POST['snapshot_id']);
    $id_activite = intval($_POST['id_activite']);
    $id_membre = intval($_SESSION['id']); // ID de l'utilisateur connecté
    
    // Vérifier que le snapshot appartient à l'utilisateur actif
    $snapshot_query = mysqli_query($con, "SELECT * FROM `blindes_snapshots` 
                                          WHERE `id` = '$snapshot_id' 
                                          AND `id_membre` = '$id_membre'");
    
    if($snapshot_query && mysqli_num_rows($snapshot_query) > 0) {
        $snapshot = mysqli_fetch_array($snapshot_query);
        $snapshot_data = json_decode($snapshot['snapshot_data'], true);
        
        if($snapshot_data) {
            // Supprimer toutes les blindes actuelles
            mysqli_query($con, "DELETE FROM `blindes-live` WHERE `id-activite` = '$id_activite'");
            
            // Restaurer les blindes depuis le snapshot
            foreach($snapshot_data as $blinde) {
                $ordre = intval($blinde['ordre']);
                $sb = intval($blinde['sb']);
                $bb = intval($blinde['bb']);
                $ante = intval($blinde['ante']);
                $minutes = intval($blinde['minutes']);
                $fin = mysqli_real_escape_string($con, $blinde['fin']);
                
                mysqli_query($con, "INSERT INTO `blindes-live` 
                    (`id-activite`, `ordre`, `sb`, `bb`, `ante`, `minutes`, `fin`) 
                    VALUES ('$id_activite', '$ordre', '$sb', '$bb', '$ante', '$minutes', '$fin')");
            }
            
            $response['status'] = 'success';
            $response['message'] = 'Snapshot restauré avec succès';
        } else {
            $response['message'] = 'Données du snapshot invalides';
        }
    } else {
        $response['message'] = 'Vous n\'avez pas les droits pour restaurer ce snapshot';
    }
} else {
    $response['message'] = 'Paramètres manquants';
}

header('Content-Type: application/json');
echo json_encode($response);
?>
