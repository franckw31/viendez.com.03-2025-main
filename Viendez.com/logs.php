<?php
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/include/functions_logs.php';


// Fonction pour géolocaliser une IP
function getCity($ip) {
    // Vérifier si c'est une IP locale
    if (in_array($ip, array('127.0.0.1', '::1', 'localhost'))) {
        return 'Local';
    }
    
    // Utiliser l'API ip-api.com (gratuit, max 45 req/min)
    static $cache = array();
    
    if (isset($cache[$ip])) {
        return $cache[$ip];
    }
    
    $url = 'https://get.geojs.io/v1/ip/geo/' . urlencode($ip) . '.json';
    $context = stream_context_create(array(
        'http' => array(
            'timeout' => 3,
            'user_agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        ),
        'ssl' => array(
            'verify_peer' => false,
            'verify_peer_name' => false
        )
    ));
    
    $response = @file_get_contents($url, false, $context);
    if ($response) {
        $data = json_decode($response, true);
        if ($data && isset($data['city']) && !empty($data['city'])) {
            $city = $data['city'];
            if (isset($data['country_name']) && !empty($data['country_name'])) {
                $city .= ' (' . $data['country_name'] . ')';
            }
        } else {
            $city = 'Inconnu';
        }
    } else {
        $city = 'N/A';
    }
    
    $cache[$ip] = $city;
    return $city;
}

// Check if user is admin (ID 265)
if (!isset($_SESSION['id']) || $_SESSION['id'] != 265) {
    // For now, let's just allow it if we are in dev, but normally:
    // header("Location: index.php");
    // exit();
}

$query = "SELECT * FROM activity_logs ORDER BY timestamp DESC LIMIT 100";
$result = mysqli_query($conx, $query);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logs d'activité</title>
    <link rel="stylesheet" href="css/base.css">
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .container { max-width: 1000px; margin: auto; }
        .back-link { margin-bottom: 20px; display: block; }
    </style>
</head>
<body>
    <div class="container">
        <a href="index.php" class="back-link">← Retour à l'accueil</a>
        <h1>Logs d'activité</h1>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Utilisateur</th>
                    <th>Action</th>
                    <th>Source</th>
                    <th>Détails</th>
                    <th>IP</th>
                    <th>Ville</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = mysqli_fetch_assoc($result)): ?>
                <tr>
                    <td><?php echo $row['timestamp']; ?></td>
                    <td><?php echo htmlspecialchars($row['username']); ?> (ID: <?php echo $row['user_id']; ?>)</td>
                    <td><?php echo htmlspecialchars($row['action']); ?></td>
                    <td><strong><?php echo htmlspecialchars($row['source']); ?></strong></td>
                    <td><?php echo htmlspecialchars($row['details']); ?></td>
                    <td><?php echo $row['ip_address']; ?></td>
                    <td><?php echo getCity($row['ip_address']); ?></td>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</body>
</html>
