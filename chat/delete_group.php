<?php
session_start();
require_once(__DIR__ . '/../config.php');

if (!isset($_SESSION['id']) || !isset($_POST['group_id'])) {
    die(json_encode(['error' => 'Invalid request']));
}

$group_id = (int)$_POST['group_id'];
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

// Delete group members
mysqli_query($conx, "DELETE FROM `chat_group_members` WHERE `group_id` = $group_id");

// Delete group messages
mysqli_query($conx, "DELETE FROM `chat_messages` WHERE `group_id` = $group_id");

// Delete the group itself
$sql = "DELETE FROM `chat_groups` WHERE `id` = $group_id";

if (mysqli_query($conx, $sql)) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => mysqli_error($conx)]);
}
?>
