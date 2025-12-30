<?php
session_start();
require_once(__DIR__ . '/../config.php');

if (!isset($_SESSION['id']) || !isset($_GET['group_id'])) {
    die(json_encode(['error' => 'Invalid request']));
}

$group_id = (int)$_GET['group_id'];
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

// Get current members
$sql_members = "SELECT m.`id-membre` as id, m.`pseudo`, m.`photo` FROM `membres` m
                JOIN `chat_group_members` gm ON m.`id-membre` = gm.`member_id`
                WHERE gm.`group_id` = $group_id";
$result_members = mysqli_query($conx, $sql_members);
$current_members = [];
while ($row = mysqli_fetch_assoc($result_members)) {
    $current_members[] = $row;
}

// Get non-members (to add)
$sql_non_members = "SELECT `id-membre` as id, `pseudo`, `photo` FROM `membres` 
                    WHERE `id-membre` NOT IN (SELECT `member_id` FROM `chat_group_members` WHERE `group_id` = $group_id)
                    ORDER BY `pseudo` ASC";
$result_non_members = mysqli_query($conx, $sql_non_members);
$non_members = [];
while ($row = mysqli_fetch_assoc($result_non_members)) {
    $non_members[] = $row;
}

echo json_encode([
    'current_members' => $current_members,
    'non_members' => $non_members
]);
?>
