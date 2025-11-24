<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
include('include/config.php');

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status' => 'error', 'message' => 'Méthode non autorisée']);
    exit;
}

$victim_id = isset($_POST['victim_id']) ? intval($_POST['victim_id']) : 0;
$eliminator_id = isset($_POST['eliminator_id']) ? intval($_POST['eliminator_id']) : 0;
$eliminator_name = isset($_POST['eliminator_name']) ? mysqli_real_escape_string($con, $_POST['eliminator_name']) : '';
$is_definitive = isset($_POST['is_definitive']) ? intval($_POST['is_definitive']) : 0;

if ($victim_id <= 0 || ($eliminator_id <= 0 && $eliminator_name === '')) {
    echo json_encode(['status' => 'error', 'message' => 'Données manquantes ou invalides']);
    exit;
}

// si id non fourni, rechercher id_membre depuis la table membres par pseudo
if ($eliminator_id <= 0 && $eliminator_name !== '') {
    $membre_query = "SELECT `id-membre` FROM `membres` WHERE `pseudo` = '$eliminator_name' LIMIT 1";
    $membre_result = mysqli_query($con, $membre_query);
    if ($membre_result && mysqli_num_rows($membre_result) > 0) {
        $membre_row = mysqli_fetch_array($membre_result);
        $eliminator_id = intval($membre_row['id-membre']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Membre éliminateur non trouvé']);
        exit;
    }
}

// si nom non fourni, récupérer pseudo depuis membres
if ($eliminator_name === '') {
    $membre_query = "SELECT `pseudo` FROM `membres` WHERE `id-membre` = '$eliminator_id' LIMIT 1";
    $membre_result = mysqli_query($con, $membre_query);
    if ($membre_result && mysqli_num_rows($membre_result) > 0) {
        $membre_row = mysqli_fetch_array($membre_result);
        $eliminator_name = mysqli_real_escape_string($con, $membre_row['pseudo']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Membre éliminateur non trouvé par id']);
        exit;
    }
}

// enregistrer l'événement d'élimination (toujours)
$ins_sql = "INSERT INTO `eliminations` (`id_participation`, `id_membre`, `nom_membre`, `is_definitive`) VALUES ('$victim_id', '$eliminator_id', '$eliminator_name', '$is_definitive')";
if (!mysqli_query($con, $ins_sql)) {
    echo json_encode(['status' => 'error', 'message' => 'Erreur insertion élimination: '.mysqli_error($con)]);
    exit;
}

// Déterminer les nouvelles pertes
if ($is_definitive == 1) {
    // Si la case "définitive" est cochée, TOUJOURS définir pertes = 3
    $nouvelles_pertes = 3;
    $est_elimine = true;
    $update_sql = "UPDATE `participation` SET `nom-membre-vainqueur` = '$eliminator_name', `id-membre-vainqueur` = '$eliminator_id', `pertes` = '3' WHERE `id-participation` = '$victim_id'";
} else {
    // Sinon, incrémenter normalement
    $check_query = "SELECT `pertes` FROM `participation` WHERE `id-participation` = '$victim_id' LIMIT 1";
    $check_result = mysqli_query($con, $check_query);
    $pertes_actuelles = 0;
    if ($check_result && mysqli_num_rows($check_result) > 0) {
        $check_row = mysqli_fetch_array($check_result);
        $pertes_actuelles = intval($check_row['pertes']);
    }
    $nouvelles_pertes = $pertes_actuelles + 1;
    $est_elimine = ($nouvelles_pertes >= 3);
    
    if ($est_elimine) {
        // mise à jour définitive : renseigner vainqueur + pertes
        $update_sql = "UPDATE `participation` SET `nom-membre-vainqueur` = '$eliminator_name', `id-membre-vainqueur` = '$eliminator_id', `pertes` = '$nouvelles_pertes' WHERE `id-participation` = '$victim_id'";
    } else {
        // Mise à jour simple des pertes
        $update_sql = "UPDATE `participation` SET `pertes` = '$nouvelles_pertes' WHERE `id-participation` = '$victim_id'";
    }
}

// Exécuter la mise à jour
$update_result = mysqli_query($con, $update_sql);
if (!$update_result) {
    echo json_encode(['status' => 'error', 'message' => 'Erreur mise à jour: '.mysqli_error($con), 'sql' => $update_sql]);
    exit;
}

$affected_rows = mysqli_affected_rows($con);
if ($affected_rows === 0) {
    echo json_encode(['status' => 'error', 'message' => 'Aucune ligne modifiée. Participations ID: '.$victim_id, 'sql' => $update_sql, 'affected' => $affected_rows]);
    exit;
}

echo json_encode(['status' => 'success', 'message' => $est_elimine ? 'Joueur éliminé définitivement (pertes=3)' : 'Perte enregistrée ('.$nouvelles_pertes.'/3)', 'affected_rows' => $affected_rows, 'pertes_updated' => $nouvelles_pertes]);
?>
