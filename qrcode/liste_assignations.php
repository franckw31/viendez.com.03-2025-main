<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Inclure le fichier de configuration
$config_path = dirname(__DIR__) . '/config.php';
if (!file_exists($config_path)) die('Erreur: config.php introuvable');
require_once $config_path;

if (!$conx) die('Erreur de connexion DB');
mysqli_set_charset($conx, 'utf8mb4');

// Requête pour lister les QR codes et leurs propriétaires
$sql = "SELECT c.id_collection, c.nom, c.valeur, m.pseudo, m.fname, m.lname 
        FROM collections c
        LEFT JOIN `collections-individu` ci ON c.id_collection = ci.id_col
        LEFT JOIN membres m ON ci.`id-indiv` = m.`id-membre`
        ORDER BY c.id_collection DESC";

$result = mysqli_query($conx, $sql);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des QR Codes Assignés</title>
    <style>
        body { font-family: sans-serif; background: #f4f7f6; padding: 20px; color: #333; }
        .container { max-width: 900px; margin: 0 auto; background: #fff; padding: 25px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { text-align: center; color: #2c3e50; margin-bottom: 30px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #3498db; color: white; }
        tr:hover { background-color: #f9f9f9; }
        .valeur-tag { padding: 4px 8px; border-radius: 4px; font-size: 11px; font-weight: bold; }
        .val-1 { background: #e8f4fd; color: #3498db; border: 1px solid #3498db; }
        .val-2 { background: #eafaf1; color: #27ae60; border: 1px solid #27ae60; }
        .owner-none { color: #999; font-style: italic; }
        .owner-found { color: #2c3e50; font-weight: bold; }
        .btn-back { display: inline-block; margin-bottom: 20px; text-decoration: none; color: #3498db; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <a href="/panel/qrcodes.php" class="btn-back">← Retour au Dashboard</a>
        <h1>Liste des QR Codes et Propriétaires</h1>

        <table>
            <thead>
                <tr>
                    <th>QRcode</th>
                    <th>Point</th>
                    <th>Propriétaire</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = mysqli_fetch_assoc($result)): ?>
                    <tr>
                        <td><code><?php echo htmlspecialchars($row['nom']); ?></code></td>
                        <td>
                            <span class="valeur-tag <?php echo ($row['valeur'] == 2) ? 'val-2' : 'val-1'; ?>">
                                <?php echo ($row['valeur'] == 2) ? '2' : '1'; ?>
                            </span>
                        </td>
                        <td>
                            <?php if ($row['pseudo']): ?>
                                <span class="owner-found"><?php echo htmlspecialchars($row['pseudo']); ?></span>
                            <?php else: ?>
                                <span class="owner-none">Non assigné</span>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</body>
</html>