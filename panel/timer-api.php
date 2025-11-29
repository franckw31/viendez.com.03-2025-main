<?php
session_start();
include('include/config.php');
date_default_timezone_set('Arctic/Longyearbyen'); // Garder votre timezone actuelle

header('Content-Type: application/json');

$id_activite = isset($_GET['uid']) ? intval($_GET['uid']) : 0;

if ($id_activite === 0 && isset($_SESSION['act'])) {
    $id_activite = $_SESSION['act'];
}

$response = [
    'status' => 'error',
    'seconds_remaining' => 0,
    'is_paused' => false,
    'blinds_text' => 'Terminé',
    'ante_text' => '',
    'level_id' => 0
];

if ($id_activite > 0) {
    // 1. Vérifier si le tournoi est en pause globalement (basé sur le niveau 1 ou une config générale)
    // On regarde le niveau 1 pour l'état de pause global comme dans votre ancien script
    $reqPause = mysqli_query($con, "SELECT en_pause FROM `blindes-live` WHERE `id-activite` = '$id_activite' LIMIT 1");
    $rowPause = mysqli_fetch_assoc($reqPause);
    $is_paused = ($rowPause && $rowPause['en_pause'] == 1);

    if ($is_paused) {
        $response['status'] = 'success';
        $response['is_paused'] = true;
        $response['blinds_text'] = 'PAUSE';
    } else {
        // 2. Trouver le niveau en cours (celui dont la date de fin est dans le futur)
        $now = date("Y-m-d H:i:s");
        $query = "SELECT * FROM `blindes-live` WHERE `id-activite` = '$id_activite' AND `fin` > '$now' ORDER BY `ordre` ASC LIMIT 1";
        $result = mysqli_query($con, $query);

        if ($row = mysqli_fetch_assoc($result)) {
            $fin = strtotime($row['fin']);
            $maintenant = time();
            $diff = $fin - $maintenant;

            $nom = $row['nom']; // ex: Level 1
            $nom = $row['sb']."/".$row['bb']; 
            $ante = ($row['ante'] != '0' && $row['ante'] != '') ? " + " . $row['ante'] : "";
            
            // Formater le texte des blindes (ex: 100/200)
            $blinds_display = $nom; 

            $response['status'] = 'success';
            $response['is_paused'] = false;
            $response['seconds_remaining'] = $diff;
            $response['blinds_text'] = $blinds_display;
            
            // AJOUT : Nom brut pour le fichier audio (ex: "100/200")
            $response['blinds_raw'] = $row['nom']; 
            
            $response['ante_text'] = $ante;
            $response['level_id'] = $row['id']; // Utile pour détecter le changement de niveau
        } else {
            // Aucun niveau futur trouvé, c'est fini
            $response['status'] = 'finished';
            $response['blinds_text'] = 'Tournoi Terminé';
        }
    }
}

echo json_encode($response);
?>