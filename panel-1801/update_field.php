<?php
session_start();
include('include/config.php');

if (strlen($_SESSION['id']) == 0) {
    http_response_code(401);
    exit('Unauthorized');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_membre = isset($_POST['id_membre']) ? (int)$_POST['id_membre'] : 0;
    $id_activite = isset($_POST['id_activite']) ? (int)$_POST['id_activite'] : 0;
    $field = isset($_POST['field']) ? $_POST['field'] : '';
    $value = isset($_POST['value']) ? $_POST['value'] : '';
    
    $conn = mysqli_connect('localhost', 'root', 'Kookies7*', 'dbs9616600');
    
    if (!$conn) {
        http_response_code(500);
        echo json_encode(['success' => false, 'error' => 'Erreur de connexion à la base de données']);
        exit;
    }
    
    mysqli_set_charset($conn, 'utf8mb4');
    
    // Vérifier les permissions : seul un admin ou l'organisateur de l'activité peut modifier
    $current_user_id = $_SESSION['id'];
    $is_admin = false;
    $is_organizer = false;
    
    // Vérifier si l'utilisateur est admin (droits = 2)
    $admin_check = mysqli_query($conn, "SELECT droits FROM membres WHERE `id-membre` = " . (int)$current_user_id);
    if (!$admin_check) {
        http_response_code(500);
        echo json_encode(['success' => false, 'error' => 'Erreur SQL: ' . mysqli_error($conn)]);
        mysqli_close($conn);
        exit;
    }
    
    $admin_row = mysqli_fetch_assoc($admin_check);
    $is_admin = ($admin_row && (int)$admin_row['droits'] == 2);
    
    // Vérifier si l'utilisateur est l'organisateur de l'activité
    if ($id_activite > 0) {
        $organizer_check = mysqli_query($conn, "SELECT `id-membre` FROM activite WHERE `id-activite` = " . (int)$id_activite);
        if (!$organizer_check) {
            http_response_code(500);
            echo json_encode(['success' => false, 'error' => 'Erreur SQL: ' . mysqli_error($conn)]);
            mysqli_close($conn);
            exit;
        }
        $organizer_row = mysqli_fetch_assoc($organizer_check);
        $is_organizer = ($organizer_row && (int)$organizer_row['id-membre'] == (int)$current_user_id);
    }
    
    // Rejeter si l'utilisateur n'a pas les permissions
    if (!$is_admin && !$is_organizer) {
        http_response_code(403);
        error_log("Permission denied for user $current_user_id trying to modify activity $id_activite");
        echo json_encode(['success' => false, 'error' => 'Vous n\'avez pas la permission de modifier cette activité']);
        mysqli_close($conn);
        exit;
    }
    
    error_log("Updating field: $field with value: $value for membre: $id_membre and activite: $id_activite");
    
    // Validate field name - only fields that exist in 'participation' table
    $allowed_fields = [
        'classement', 'recave', 'points', 'tf',
        'rake', 'rake_0', 'rake_5', 'rake_10', 'rake_12', 'rake_15', 'rake_20',
        'cout_in', 'latereg', 'option', 'valide', 'gain',
        'addon', 'win', 'bonbon', 'ordre', 'position'
    ];
    if (!in_array($field, $allowed_fields)) {
        error_log("Invalid field: $field");
        http_response_code(400);
        echo json_encode(['success' => false, 'error' => 'Field not allowed']);
        exit;
    }

    // Convert value based on field type
    if ($field === 'tf') {
        $value = $value === '1' ? 1 : 0;
        $param_type = "i";
    } elseif ($field === 'option' || $field === 'valide') {
        $param_type = "s";
    } else {
        $param_type = "i"; // All other fields are integers
        $value = (int)$value;
    }

    // Logic for synchronization - build complete SQL
    if ($field === 'option') {
        if ($value === 'Présent') {
            $sql = "UPDATE participation 
                    SET `option` = ?, `valide` = 'Actif', `ds` = NOW()
                    WHERE `id-membre` = ? 
                    AND `id-activite` = ?";
        } else {
            $sql = "UPDATE participation 
                    SET `option` = ?, `valide` = 'Inactif', `ds` = NOW()
                    WHERE `id-membre` = ? 
                    AND `id-activite` = ?";
        }
    } elseif ($field === 'valide') {
        if ($value === 'Actif') {
            $sql = "UPDATE participation 
                    SET `valide` = ?, `option` = 'Présent', `ds` = NOW()
                    WHERE `id-membre` = ? 
                    AND `id-activite` = ?";
        } else {
            $sql = "UPDATE participation 
                    SET `valide` = ?, `option` = 'Réservation', `ds` = NOW()
                    WHERE `id-membre` = ? 
                    AND `id-activite` = ?";
        }
    } else {
        $sql = "UPDATE participation 
                SET `" . mysqli_real_escape_string($conn, $field) . "` = ?, `ds` = NOW()
                WHERE `id-membre` = ? 
                AND `id-activite` = ?";
    }
    
    error_log("SQL Query: $sql");
    error_log("Params: field=$field, value=$value, id_membre=$id_membre, id_activite=$id_activite");
    
    $stmt = mysqli_prepare($conn, $sql);
    
    if (!$stmt) {
        http_response_code(500);
        echo json_encode(['success' => false, 'error' => 'Erreur de préparation SQL: ' . mysqli_error($conn)]);
        error_log("Prepare error: " . mysqli_error($conn));
        mysqli_close($conn);
        exit;
    }
    
    mysqli_stmt_bind_param($stmt, $param_type."ii", $value, $id_membre, $id_activite);
    
    if (mysqli_stmt_execute($stmt)) {
        $affected = mysqli_stmt_affected_rows($stmt);
        error_log("Rows affected: $affected");
        echo json_encode(['success' => true, 'affected' => $affected]);
    } else {
        error_log("Execute error: " . mysqli_stmt_error($stmt));
        http_response_code(500);
        echo json_encode(['success' => false, 'error' => mysqli_stmt_error($stmt)]);
    }
    
    mysqli_stmt_close($stmt);
    mysqli_close($conn);
