<?php
session_start();
error_reporting(0);
include('include/config.php');

if(strlen($_SESSION['id']==0)) {
    header('location:logout.php');
    exit;
}

$response = array('status' => 'error', 'snapshots' => array());

if(isset($_GET['id_activite'])) {
    $id_activite = intval($_GET['id_activite']);
    
    // Récupérer toutes les sauvegardes pour cette activité
    $req_snapshots = mysqli_query($con, "SELECT `id`, `snapshot_name`, `created_at` FROM `blindes_snapshots` WHERE `id_activite` = '$id_activite' ORDER BY `created_at` DESC LIMIT 10");
    
    if($req_snapshots && mysqli_num_rows($req_snapshots) > 0) {
        $snapshots = array();
        while($snapshot = mysqli_fetch_array($req_snapshots)) {
            $snapshots[] = array(
                'id' => intval($snapshot['id']),
                'name' => htmlspecialchars($snapshot['snapshot_name'], ENT_QUOTES),
                'created_at' => $snapshot['created_at']
            );
        }
        $response['status'] = 'success';
        $response['snapshots'] = $snapshots;
    } else {
        $response['status'] = 'success';
        $response['snapshots'] = array();
    }
} else {
    $response['message'] = 'Paramètres manquants';
}

header('Content-Type: application/json');
echo json_encode($response);
?>
