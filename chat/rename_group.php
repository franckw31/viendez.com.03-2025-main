<?php
session_start();
require_once(__DIR__ . '/../config.php');

if (!isset($_SESSION['id']) || !isset($_POST['group_id']) || !isset($_POST['new_name'])) {
    die(json_encode(['error' => 'Invalid request']));
}

$group_id = (int)$_POST['group_id'];
$new_name = mysqli_real_escape_string($conx, $_POST['new_name']);
$current_user_id = $_SESSION['id'];

// Check if user is admin (ID 265 or droits = 2)
$is_admin = false;
$res = mysqli_query($conx, "SELECT `droits` FROM `membres` WHERE `id-membre` = $current_user_id");
if ($row = mysqli_fetch_assoc($res)) {
    if ($current_user_id == 265 || $row['droits'] == '2') {
        $is_admin = true;
    }
}

if (!$is_admin) {
    die(json_encode(['error' => 'Permission denied']));
}

if (empty($new_name)) {
    die(json_encode(['error' => 'Group name cannot be empty']));
}

$sql = "UPDATE `chat_groups` SET `name` = '$new_name' WHERE `id` = $group_id";

if (mysqli_query($conx, $sql)) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => mysqli_error($conx)]);
}
?>
