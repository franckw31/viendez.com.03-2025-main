<?php
session_start();
include('include/config.php');

if (strlen($_SESSION['id']) == 0) {
    http_response_code(401);
    exit('Unauthorized');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    error_log("Received POST data in update_all_participants.php:");
    
    $id_activite = isset($_POST['id_activite']) ? (int)$_POST['id_activite'] : 0;
    $updates = isset($_POST['updates']) ? json_decode($_POST['updates'], true) : [];
    
    error_log("Activity ID: " . $id_activite);
    error_log("Updates: " . print_r($updates, true));
    
    if (empty($updates) || !$id_activite) {
        error_log("Invalid data received");
        http_response_code(400);
        echo json_encode(['success' => false, 'error' => 'Invalid data']);
        exit;
    }

    $conn = mysqli_connect('localhost', 'root', 'Kookies7*', 'dbs9616600');
    if (!$conn) {
        error_log("Database connection failed: " . mysqli_connect_error());
        echo json_encode(['success' => false, 'error' => 'Database connection failed']);
        exit;
    }
    
    $sql = "UPDATE participation 
            SET valide = ?,
                `option` = CASE WHEN ? = 'Actif' THEN 'Présent' ELSE 'Réservation' END
            WHERE `id-membre` = ? AND `id-activite` = ?";
            
    $stmt = mysqli_prepare($conn, $sql);
    if (!$stmt) {
        error_log("Failed to prepare statement: " . mysqli_error($conn));
        echo json_encode(['success' => false, 'error' => 'Failed to prepare statement']);
        exit;
    }
    
    mysqli_begin_transaction($conn);
    
    try {
        foreach ($updates as $update) {
            $id_membre = (int)$update['id_membre'];
            $valide = $update['valide'];
            
            error_log("Processing update for member $id_membre: " . print_r($update, true));
            
            mysqli_stmt_bind_param($stmt, "ssii", 
                $valide,
                $valide,
                $id_membre,
                $id_activite
            );
            
            if (!mysqli_stmt_execute($stmt)) {
                throw new Exception("Failed to update member $id_membre: " . mysqli_stmt_error($stmt));
            }
            
            $affected = mysqli_stmt_affected_rows($stmt);
            error_log("Updated member $id_membre - Affected rows: $affected");
        }
        
        mysqli_commit($conn);
        error_log("All updates committed successfully");
        echo json_encode(['success' => true, 'message' => 'Updates completed']);
        
    } catch (Exception $e) {
        mysqli_rollback($conn);
        error_log("Error during update: " . $e->getMessage());
        echo json_encode(['success' => false, 'error' => $e->getMessage()]);
    } finally {
        mysqli_stmt_close($stmt);
        mysqli_close($conn);
    }
}
