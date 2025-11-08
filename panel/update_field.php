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
    
    error_log("Updating field: $field with value: $value for membre: $id_membre and activite: $id_activite");
    
    // Validate field name
    $allowed_fields = [
        'classement', 'recave', 'points', 'tf',
        'buyin', 'bounty', 'rake',
        'rake_0', 'rake_5', 'rake_10', 'rake_12', 'rake_15', 'rake_20',
        'cout_in'
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
    } else {
        $param_type = "i"; // All other fields are integers
        $value = (int)$value;
    }

    $sql = "UPDATE participation 
            SET `$field` = ? 
            WHERE `id-membre` = ? 
            AND `id-activite` = ?";
    
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, $param_type."ii", $value, $id_membre, $id_activite);
    
    if (mysqli_stmt_execute($stmt)) {
        $affected = mysqli_stmt_affected_rows($stmt);
        error_log("Rows affected: $affected");
        echo json_encode(['success' => true, 'affected' => $affected]);
    } else {
        error_log("SQL Error: " . mysqli_error($conn));
        http_response_code(500);
        echo json_encode(['error' => mysqli_error($conn)]);
    }
    
    mysqli_close($conn);
}
