<?php
// Script de test pour la règle bounty (transfert moitié bounty lors d'une élimination)
// Usage : php test_bounty_transfer.php <victim_id> <eliminator_id>

if ($argc < 3) {
    echo "Usage: php test_bounty_transfer.php <victim_id> <eliminator_id>\n";
    exit(1);
}

$victim_id = intval($argv[1]);
$eliminator_id = intval($argv[2]);

require_once __DIR__ . '/include/config.php';

function get_bounty($con, $id) {
    $q = mysqli_query($con, "SELECT bounty FROM participation WHERE id-participation = '$id' LIMIT 1");
    if ($q && ($r = mysqli_fetch_array($q))) return intval($r['bounty']);
    return null;
}

$bounty_victim_before = get_bounty($con, $victim_id);
$bounty_elim_before = get_bounty($con, $eliminator_id);

if ($bounty_victim_before === null || $bounty_elim_before === null) {
    echo "Erreur : impossible de récupérer les bounties initiaux.\n";
    exit(1);
}

echo "Avant élimination :\n";
echo "Victime ($victim_id) : $bounty_victim_before\n";
echo "Eliminateur ($eliminator_id) : $bounty_elim_before\n";

// Simuler l'appel à la règle (copie du code de record_elimination.php)
$bounty_half = (int)floor($bounty_victim_before / 2);
if ($bounty_half > 0) {
    $new_bounty_victim = $bounty_victim_before - $bounty_half;
    $new_bounty_elim = $bounty_elim_before + $bounty_half;
    mysqli_query($con, "UPDATE participation SET bounty = '$new_bounty_victim' WHERE id-participation = '$victim_id'");
    mysqli_query($con, "UPDATE participation SET bounty = '$new_bounty_elim' WHERE id-participation = '$eliminator_id'");
    echo "Transfert de $bounty_half bounty de la victime à l'éliminateur.\n";
} else {
    echo "Aucun transfert (bounty victime < 2).\n";
}

// Vérifier après
$bounty_victim_after = get_bounty($con, $victim_id);
$bounty_elim_after = get_bounty($con, $eliminator_id);

echo "Après élimination :\n";
echo "Victime ($victim_id) : $bounty_victim_after\n";
echo "Eliminateur ($eliminator_id) : $bounty_elim_after\n";
