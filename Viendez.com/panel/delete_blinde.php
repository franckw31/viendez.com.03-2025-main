<?php
session_start();
error_reporting(0);
include('include/config.php');

if(strlen($_SESSION['id']==0)) {
    header('location:logout.php');
    exit;
}

$response = array('status' => 'error', 'message' => 'Erreur inconnue');

if(isset($_POST['id']) && isset($_POST['id_activite'])) {
    $blinde_id = intval($_POST['id']);
    $id_activite = intval($_POST['id_activite']);
    
    // Récupérer les informations de la blinde à supprimer
    $req_blinde = mysqli_query($con, "SELECT * FROM `blindes-live` WHERE `id` = '$blinde_id' LIMIT 1");
    
    if($req_blinde && mysqli_num_rows($req_blinde) > 0) {
        $blinde = mysqli_fetch_array($req_blinde);
        $ordre_supprime = intval($blinde['ordre']);
        
        // AVANT la suppression : récupérer les blindes qui doivent être recalculées
        $req_blindes_suivantes = mysqli_query($con, "SELECT * FROM `blindes-live` WHERE `id-activite` = '$id_activite' AND `ordre` > '$ordre_supprime' ORDER BY `ordre` ASC");
        $blindes_a_recalculer = array();
        if($req_blindes_suivantes && mysqli_num_rows($req_blindes_suivantes) > 0) {
            while($row = mysqli_fetch_array($req_blindes_suivantes)) {
                $blindes_a_recalculer[] = array(
                    'id' => intval($row['id']),
                    'minutes' => intval($row['minutes'])
                );
            }
        }
        
        // Récupérer la blinde précédente (si elle existe)
        $req_blinde_precedente = mysqli_query($con, "SELECT * FROM `blindes-live` WHERE `id-activite` = '$id_activite' AND `ordre` = ($ordre_supprime - 1) LIMIT 1");
        $blinde_precedente = mysqli_fetch_array($req_blinde_precedente);
        
        // Calculer le timestamp de départ après suppression
        date_default_timezone_set('Europe/Paris');
        $start_time = time();
        if($blinde_precedente && !empty($blinde_precedente['fin'])) {
            $start_time = strtotime($blinde_precedente['fin']);
        }
        
        // Supprimer la blinde
        $delete_query = mysqli_query($con, "DELETE FROM `blindes-live` WHERE `id` = '$blinde_id'");
        
        if($delete_query) {
            // Décaler les ordres des blindes suivantes
            mysqli_query($con, "UPDATE `blindes-live` SET `ordre` = `ordre` - 1 WHERE `id-activite` = '$id_activite' AND `ordre` > '$ordre_supprime'");
            
            // Recalculer les timestamps `fin` pour les blindes stockées
            $current_fin_time = $start_time;
            
            foreach($blindes_a_recalculer as $blinde_item) {
                $next_fin_time = $current_fin_time + ($blinde_item['minutes'] * 60);
                $next_fin = date('Y-m-d H:i:s', $next_fin_time);
                
                mysqli_query($con, "UPDATE `blindes-live` SET `fin` = '$next_fin' WHERE `id` = '".$blinde_item['id']."'");
                
                $current_fin_time = $next_fin_time;
            }
            
            $response['status'] = 'success';
            $response['message'] = 'Blinde supprimée avec succès et les blindes suivantes ont été recalculées';
        } else {
            $response['message'] = 'Erreur lors de la suppression de la blinde';
        }
    } else {
        $response['message'] = 'Blinde introuvable';
    }
} else {
    $response['message'] = 'Paramètres manquants';
}

header('Content-Type: application/json');
echo json_encode($response);
?>
