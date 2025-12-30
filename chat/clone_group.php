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

// 1. Create the new group
$sql_create = "INSERT INTO `chat_groups` (`name`, `created_by`) VALUES ('$new_name', $current_user_id)";
if (mysqli_query($conx, $sql_create)) {
    $new_group_id = mysqli_insert_id($conx);
    
    // 2. Copy members from the old group to the new group
    $sql_copy_members = "INSERT INTO `chat_group_members` (`group_id`, `member_id`, `joined_at`)
                         SELECT $new_group_id, `member_id`, NOW()
                         FROM `chat_group_members`
                         WHERE `group_id` = $group_id";
    
    if (mysqli_query($conx, $sql_copy_members)) {
        echo json_encode(['success' => true, 'new_group_id' => $new_group_id]);
    } else {
        echo json_encode(['error' => 'Failed to copy members: ' . mysqli_error($conx)]);
    }
} else {
    echo json_encode(['error' => 'Failed to create group: ' . mysqli_error($conx)]);
}
?>
