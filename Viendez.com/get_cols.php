<?php
$conn = mysqli_connect('localhost', 'root', 'Kookies7*', 'dbs9616600');
if (!$conn) die("Connection failed: " . mysqli_connect_error());
$result = mysqli_query($conn, "SHOW COLUMNS FROM participation");
if (!$result) die("Query failed: " . mysqli_error($conn));
$cols = [];
while($row = mysqli_fetch_assoc($result)) {
    $cols[] = $row['Field'];
}
if (file_put_contents('cols.txt', implode("\n", $cols)) === false) {
    die("Failed to write to file.");
}
mysqli_close($conn);
?>