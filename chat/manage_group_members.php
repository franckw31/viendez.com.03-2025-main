<?php
session_start();
require_once(__DIR__ . '/../config.php');

if (!isset($_SESSION['id']) || !isset($_POST['group_id']) || !isset($_POST['action']) || !isset($_POST['member_id'])) {
    die(json_encode(['error' => 'Invalid request']));
}

$group_id = (int)$_POST['group_id'];
$member_id = (int)$_POST['member_id'];
$action = $_POST['action']; // 'add' or 'remove'
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

if ($action === 'add') {
    $sql = "INSERT IGNORE INTO `chat_group_members` (`group_id`, `member_id`) VALUES ($group_id, $member_id)";
} elseif ($action === 'remove') {
    // Prevent removing the last member? Or just allow it.
    $sql = "DELETE FROM `chat_group_members` WHERE `group_id` = $group_id AND `member_id` = $member_id";
} else {
    die(json_encode(['error' => 'Invalid action']));
}

if (mysqli_query($conx, $sql)) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['error' => mysqli_error($conx)]);
}
?>
