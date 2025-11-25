<?php
session_start();
error_reporting(0);
include('include/config.php');

if(strlen($_SESSION['id']) == 0) {
    header('location:logout.php');
    exit;
}

$response = array('status' => 'error', 'message' => 'Erreur inconnue', 'snapshots' => array());

// Récupérer l'ID de l'utilisateur connecté
$id_membre = intval($_SESSION['id']);

// Récupérer TOUS les snapshots de l'utilisateur (pas filtré par activité)
$query = mysqli_query($con, "SELECT bs.*, a.`titre-activite` 
                              FROM `blindes_snapshots` bs 
                              LEFT JOIN `activite` a ON bs.`id_activite` = a.`id-activite`
                              WHERE bs.`id_membre` = '$id_membre' 
                              ORDER BY bs.`created_at` DESC");

if($query) {
    $snapshots = array();
    while($row = mysqli_fetch_array($query)) {
        // Formater la date
        $date = new DateTime($row['created_at']);
        $formatted_date = $date->format('d/m/Y H:i');
        
        $snapshots[] = array(
            'id' => intval($row['id']),
            'name' => $row['snapshot_name'],
            'created_at' => $formatted_date,
            'id_membre' => intval($row['id_membre']),
            'id_activite' => intval($row['id_activite']),
            'titre_activite' => $row['titre-activite']
        );
    }
    
    $response['status'] = 'success';
    $response['snapshots'] = $snapshots;
    $response['count'] = count($snapshots);
    $response['user_id'] = $id_membre;
} else {
    $response['message'] = 'Erreur lors de la récupération des snapshots: ' . mysqli_error($con);
}

header('Content-Type: application/json');
echo json_encode($response);
?>
