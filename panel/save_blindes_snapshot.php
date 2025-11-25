<?php
session_start();
error_reporting(0);
include('include/config.php');

if(strlen($_SESSION['id']==0)) {
    header('location:logout.php');
    exit;
}

$response = array('status' => 'error', 'message' => 'Erreur inconnue');

if(isset($_POST['id_activite']) && isset($_POST['snapshot_name'])) {
    $id_activite = intval($_POST['id_activite']);
    $snapshot_name = mysqli_real_escape_string($con, $_POST['snapshot_name']);
    $id_membre = intval($_SESSION['id']); // Récupérer l'ID de l'utilisateur connecté
    
    // Récupérer toutes les blindes actuelles
    $req_blindes = mysqli_query($con, "SELECT * FROM `blindes-live` WHERE `id-activite` = '$id_activite' ORDER BY `ordre` ASC");
    
    if($req_blindes && mysqli_num_rows($req_blindes) > 0) {
        // Créer la sauvegarde
        date_default_timezone_set('Europe/Paris');
        $created_at = date('Y-m-d H:i:s');
        
        // Sérialiser les données des blindes
        $blindes_data = array();
        while($blinde = mysqli_fetch_array($req_blindes)) {
            $blindes_data[] = array(
                'id' => intval($blinde['id']),
                'ordre' => intval($blinde['ordre']),
                'sb' => intval($blinde['sb']),
                'bb' => intval($blinde['bb']),
                'ante' => intval($blinde['ante']),
                'minutes' => intval($blinde['minutes']),
                'fin' => $blinde['fin']
            );
        }
        
        $snapshot_data = json_encode($blindes_data);
        
        // Insérer la sauvegarde dans la base de données avec l'ID du membre
        $insert_query = mysqli_query($con, "INSERT INTO `blindes_snapshots` (`id_activite`, `id_membre`, `snapshot_name`, `snapshot_data`, `created_at`) VALUES ('$id_activite', '$id_membre', '$snapshot_name', '$snapshot_data', '$created_at')");
        
        if($insert_query) {
            $response['status'] = 'success';
            $response['message'] = 'Sauvegarde créée avec succès';
            $response['snapshot_id'] = mysqli_insert_id($con);
            $response['created_by'] = $id_membre;
        } else {
            $response['message'] = 'Erreur lors de la création de la sauvegarde: ' . mysqli_error($con);
        }
    } else {
        $response['message'] = 'Aucune blinde trouvée';
    }
} else {
    $response['message'] = 'Paramètres manquants';
}

header('Content-Type: application/json');
echo json_encode($response);
?>
