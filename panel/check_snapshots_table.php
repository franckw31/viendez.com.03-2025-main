<?php
session_start();
include('include/config.php');

// Vérifier si la table existe
$check_table = mysqli_query($con, "SHOW TABLES LIKE 'blindes_snapshots'");
if(mysqli_num_rows($check_table) == 0) {
    echo "La table blindes_snapshots n'existe pas. Création...<br>";
    
    $create_table = "CREATE TABLE IF NOT EXISTS `blindes_snapshots` (
        `id` INT(11) NOT NULL AUTO_INCREMENT,
        `id_activite` INT(11) NOT NULL,
        `id_membre` INT(11) NOT NULL,
        `snapshot_name` VARCHAR(255) NOT NULL,
        `snapshot_data` LONGTEXT NOT NULL,
        `created_at` DATETIME NOT NULL,
        PRIMARY KEY (`id`),
        INDEX `idx_activite` (`id_activite`),
        INDEX `idx_membre` (`id_membre`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
    
    if(mysqli_query($con, $create_table)) {
        echo "✅ Table créée avec succès<br>";
    } else {
        echo "❌ Erreur création table: " . mysqli_error($con) . "<br>";
    }
} else {
    echo "✅ La table blindes_snapshots existe<br>";
}

// Vérifier la structure
$structure = mysqli_query($con, "DESCRIBE blindes_snapshots");
echo "<br>Structure de la table:<br>";
echo "<table border='1'><tr><th>Champ</th><th>Type</th><th>Null</th><th>Key</th></tr>";
while($row = mysqli_fetch_array($structure)) {
    echo "<tr><td>{$row['Field']}</td><td>{$row['Type']}</td><td>{$row['Null']}</td><td>{$row['Key']}</td></tr>";
}
echo "</table>";

// Tester une insertion
$id_membre = intval($_SESSION['id']);
$test_data = json_encode(array(array('ordre' => 1, 'sb' => 10, 'bb' => 20, 'ante' => 0, 'minutes' => 10)));
$test_data_escaped = mysqli_real_escape_string($con, $test_data);

echo "<br><br>Test d'insertion...<br>";
$test_insert = mysqli_query($con, "INSERT INTO `blindes_snapshots` (`id_activite`, `id_membre`, `snapshot_name`, `snapshot_data`, `created_at`) VALUES (1, $id_membre, 'Test', '$test_data_escaped', NOW())");

if($test_insert) {
    echo "✅ Insertion de test réussie<br>";
    $last_id = mysqli_insert_id($con);
    echo "ID inséré: $last_id<br>";
    
    // Supprimer le test
    mysqli_query($con, "DELETE FROM `blindes_snapshots` WHERE id = $last_id");
    echo "Test supprimé<br>";
} else {
    echo "❌ Erreur insertion test: " . mysqli_error($con) . "<br>";
}
?>