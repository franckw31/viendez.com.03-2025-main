<?php
session_start();
include('include/config.php');

if (strlen($_SESSION['id']) == 0) {
    http_response_code(401);
    exit('Unauthorized');
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $id_membre = isset($_GET['id_membre']) ? (int)$_GET['id_membre'] : 0;
    $id_activite = isset($_GET['id_activite']) ? (int)$_GET['id_activite'] : 0;
    
    $conn = mysqli_connect('localhost', 'root', 'Kookies7*', 'dbs9616600');
    
    $sql = "SELECT p.*, 
            (a.buyin + a.bounty + a.rake + (CASE WHEN p.challenger = 1 THEN 5 ELSE 0 END)) as cout_in
            FROM participation p 
            INNER JOIN activite a ON p.`id-activite` = a.`id-activite`
            WHERE p.`id-membre` = ? AND p.`id-activite` = ?";
            
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "ii", $id_membre, $id_activite);
    
    if (mysqli_stmt_execute($stmt)) {
        $result = mysqli_stmt_get_result($stmt);
        $data = mysqli_fetch_assoc($result);
        echo json_encode(['success' => true, 'data' => $data]);
    } else {
        http_response_code(500);
        echo json_encode(['success' => false, 'error' => mysqli_error($conn)]);
    }
    
    mysqli_close($conn);
}
