<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include('include/config.php');

header('Content-Type: application/json');

try {
    // Vérification de la connexion
    if (!$conn) {
        throw new Exception("Erreur de connexion à la base de données");
    }

    // Vérification des champs requis
    if (!isset($_POST['title'], $_POST['start_date'])) {
        throw new Exception('Les champs titre et date de début sont requis');
    }

    // Préparation des données
    $title = trim($_POST['title']);
    $buyin = isset($_POST['buyin']) ? intval($_POST['buyin']) : 0;
    $date_depart = date('Y-m-d H:i:s', strtotime($_POST['start_date']));
    $heure_depart = !empty($_POST['heure_depart']) ? 
                    date('Y-m-d H:i:s', strtotime($_POST['heure_depart'])) : 
                    $date_depart;
    $ville = isset($_POST['ville']) ? trim($_POST['ville']) : '';

    // Requête préparée
    $query = "INSERT INTO activite (`titre-activite`, `buyin`, `date_depart`, `heure_depart`, `ville`) 
              VALUES (?, ?, ?, ?, ?)";
              
    $stmt = mysqli_prepare($conn, $query);
    if (!$stmt) {
        throw new Exception("Erreur de préparation de la requête: " . mysqli_error($conn));
    }

    // Liaison des paramètres et exécution
    if (!mysqli_stmt_bind_param($stmt, 'sisss', $title, $buyin, $date_depart, $heure_depart, $ville)) {
        throw new Exception("Erreur de liaison des paramètres: " . mysqli_stmt_error($stmt));
    }

    if (!mysqli_stmt_execute($stmt)) {
        throw new Exception("Erreur d'exécution de la requête: " . mysqli_stmt_error($stmt));
    }

    $id_activite = mysqli_insert_id($conn);

    // Réponse en cas de succès
    echo json_encode([
        'success' => true,
        'id' => $id_activite,
        'message' => "L'activité a été créée avec succès"
    ]);

} catch (Exception $e) {
    // Réponse en cas d'erreur
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage()
    ]);
}

// Nettoyage
if (isset($stmt)) mysqli_stmt_close($stmt);
if (isset($conn)) mysqli_close($conn);
?>
