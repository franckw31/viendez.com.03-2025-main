<?php
// filepath: c:\Users\MSI\Desktop\www\panel\timer-api.php
ob_start();
session_start();
error_reporting(0);
include('include/config.php');
ob_clean();

header('Content-Type: application/json');
date_default_timezone_set('Europe/Paris');

$response = [
    'status' => 'error',
    'message' => 'Init',
    'seconds_remaining' => 0,
    'blinds_text' => 'Chargement...',
    'next_pause' => ''
];

try {
    if (!isset($con)) throw new Exception("DB Connection failed");

    $id = isset($_GET['uid']) ? intval($_GET['uid']) : 0;
    $now = time();

    // 1. Niveau en cours
    // On cherche le premier niveau qui finit dans le futur
    // Cela évite les problèmes si 'debut' est mal calé ou si on a ajouté du temps (décalant le début théorique)
    $sql = "SELECT * FROM `blindes-live` WHERE `id-activite` = '$id' 
            AND fin > FROM_UNIXTIME($now) 
            ORDER BY fin ASC LIMIT 1";
            
    $q = mysqli_query($con, $sql);
    if (!$q) throw new Exception("Erreur SQL Current: " . mysqli_error($con));
    
    $current = mysqli_fetch_assoc($q);

    // 2. Pause globale (Tableau activite ou blindes-live ?)
    // D'après votre SQL, 'en_pause' est bien dans 'blindes-live'
    $q_pause = mysqli_query($con, "SELECT `en_pause` FROM `blindes-live` WHERE `id-activite` = '$id' LIMIT 1");
    $r_pause = ($q_pause) ? mysqli_fetch_assoc($q_pause) : null;
    $is_paused = ($r_pause && $r_pause['en_pause'] == 1);

    // 3. Prochaine pause
    $next_pause_text = "";
    // On cherche dans la colonne 'nom' le texte 'ause' (pour Pause)
    $sql_np = "SELECT * FROM `blindes-live` WHERE `id-activite` = '$id' 
               AND `nom` LIKE '%ause%' 
               AND DATE_SUB(fin, INTERVAL minutes MINUTE) > FROM_UNIXTIME($now) 
               ORDER BY fin ASC LIMIT 1";
               
    $q_np = mysqli_query($con, $sql_np);
    
    if ($q_np && $r_np = mysqli_fetch_assoc($q_np)) {
        // Calcul du début : Fin - Minutes
        $start_timestamp = strtotime($r_np['fin']) - ($r_np['minutes'] * 60);
        $diff = $start_timestamp - $now;
        
        if ($diff > 0) {
            $h = floor($diff / 3600);
            $m = floor(($diff % 3600) / 60);
            $next_pause_text = "Pause dans " . ($h > 0 ? $h."h " : "") . $m . "m";
        }
    }

    // 4. Stats Joueurs
    $act_query = mysqli_query($con, "SELECT jetons, recave_jetons FROM activite WHERE `id-activite` = '$id'");
    $act_row = mysqli_fetch_array($act_query);
    $start_chips = intval($act_row['jetons']);
    $rebuy_chips = intval($act_row['recave_jetons']);

    $part_query = mysqli_query($con, "SELECT `id-participation`, `recave`, `addon` FROM `participation` WHERE `id-activite` = '$id'");
    $total_players = 0;
    $total_rebuys = 0;
    $total_addons = 0;
    $active_players = 0;

    while ($row = mysqli_fetch_array($part_query)) {
        $total_players++;
        $total_rebuys += intval($row['recave']);
        $total_addons += intval($row['addon']);
        
        $pid = $row['id-participation'];
        // Check definitive elimination
        $elim_query = mysqli_query($con, "SELECT is_definitive FROM eliminations WHERE id_participation = '$pid' AND is_definitive = 1");
        if (mysqli_num_rows($elim_query) == 0) {
            $active_players++;
        }
    }

    $total_chips = ($total_players * $start_chips) + ($total_rebuys * $rebuy_chips) + ($total_addons * $rebuy_chips);
    $avg_stack = ($active_players > 0) ? floor($total_chips / $active_players) : 0;

    $response['players_active'] = $active_players;
    $response['players_total'] = $total_players;
    $response['avg_stack'] = number_format($avg_stack, 0, ',', ' ');


    $response['status'] = 'success';
    $response['is_paused'] = $is_paused;
    $response['next_pause'] = $next_pause_text;

    if ($current) {
        $response['seconds_remaining'] = strtotime($current['fin']) - $now;
        // CORRECTION : Utilisation de 'sb' et 'bb' au lieu de small_blind/big_blind
        $response['blinds_text'] = $current['sb'] . " / " . $current['bb'];
        $response['ante_text'] = !empty($current['ante']) ? "Ante " . $current['ante'] : "";
        $response['level_id'] = $current['id'];
        $response['blinds_raw'] = $current['sb'] . "-" . $current['bb'];
        
        // Calcul de la durée basé sur 'minutes' (plus stable que debut/fin)
        $remaining = strtotime($current['fin']) - $now;
        $theoretical_duration = intval($current['minutes']) * 60;
        
        // Si le temps restant est supérieur à la durée théorique (cas d'ajout de temps), on agrandit la jauge
        // Sinon on garde la durée théorique du niveau (ex: 20min)
        $response['duration_seconds'] = max($theoretical_duration, $remaining);
        
        $response['level_name'] = "Niveau " . $current['ordre']; 
    } else {
        // Pas de niveau actif -> On cherche le prochain niveau à venir
        $sql_next = "SELECT * FROM `blindes-live` WHERE `id-activite` = '$id' 
                     AND DATE_SUB(fin, INTERVAL minutes MINUTE) > FROM_UNIXTIME($now) 
                     ORDER BY fin ASC LIMIT 1";
        $q_next = mysqli_query($con, $sql_next);
        
        if ($q_next && $next = mysqli_fetch_assoc($q_next)) {
            $response['blinds_text'] = "Prochain: " . $next['sb'] . "/" . $next['bb'];
            $response['status'] = 'waiting';
        } else {
            $response['blinds_text'] = "Terminé ou Non Configuré";
            $response['status'] = 'finished';
        }
    }

} catch (Exception $e) {
    $response['message'] = $e->getMessage();
    // On affiche l'erreur SQL dans le texte des blindes pour que vous la voyiez
    $response['blinds_text'] = "Erreur SQL : " . $e->getMessage();
}

echo json_encode($response);
?>