<?php
session_start();
error_reporting(0);
include('include/config.php');

if(strlen($_SESSION['id']==0)) {
    header('location:logout.php');
    exit;
}

$response = array('status' => 'error', 'message' => 'Erreur inconnue');

if(isset($_POST['snapshot_id']) && isset($_POST['id_activite'])) {
    $snapshot_id = intval($_POST['snapshot_id']);
    $id_activite = intval($_POST['id_activite']);
    
    // Récupérer la sauvegarde
    $req_snapshot = mysqli_query($con, "SELECT * FROM `blindes_snapshots` WHERE `id` = '$snapshot_id' AND `id_activite` = '$id_activite' LIMIT 1");
    
    if($req_snapshot && mysqli_num_rows($req_snapshot) > 0) {
        $snapshot = mysqli_fetch_array($req_snapshot);
        $blindes_data = json_decode($snapshot['snapshot_data'], true);
        
        if($blindes_data && is_array($blindes_data)) {
            // Supprimer toutes les blindes actuelles
            mysqli_query($con, "DELETE FROM `blindes-live` WHERE `id-activite` = '$id_activite'");
            
            // Restaurer les blindes de la sauvegarde
            $success = true;
            foreach($blindes_data as $blinde) {
                $ordre = intval($blinde['ordre']);
                $sb = intval($blinde['sb']);
                $bb = intval($blinde['bb']);
                $ante = intval($blinde['ante']);
                $minutes = intval($blinde['minutes']);
                $fin = $blinde['fin'];
                
                $insert = mysqli_query($con, "INSERT INTO `blindes-live` (`id-activite`, `ordre`, `sb`, `bb`, `ante`, `minutes`, `fin`) VALUES ('$id_activite', '$ordre', '$sb', '$bb', '$ante', '$minutes', '$fin')");
                
                if(!$insert) {
                    $success = false;
                    break;
                }
            }
            
            if($success) {
                $response['status'] = 'success';
                $response['message'] = 'Sauvegarde restaurée avec succès';
            } else {
                $response['message'] = 'Erreur lors de la restauration des blindes';
            }
        } else {
            $response['message'] = 'Données de sauvegarde corrompues';
        }
    } else {
        $response['message'] = 'Sauvegarde introuvable';
    }
} else {
    $response['message'] = 'Paramètres manquants';
}

header('Content-Type: application/json');
echo json_encode($response);
?>
