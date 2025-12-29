<?php
require_once __DIR__ . '/../config.php';

$message = "";
if (isset($_POST['generate'])) {
    $pseudo = mysqli_real_escape_string($conx, $_POST['pseudo']);
    $network = isset($_POST['network']) ? $_POST['network'] : 'internet';
    $host = ($network === 'internet') ? 'viendez.com' : '192.168.1.30';
    
    if (!empty($pseudo)) {
        // Récupérer le mot de passe du membre
        $res_member = mysqli_query($conx, "SELECT password FROM membres WHERE pseudo = '$pseudo'");
        if ($member = mysqli_fetch_assoc($res_member)) {
            $password = $member['password'];
            $content = "http://$host/panel/quickview.php?pseudo=" . urlencode($pseudo) . "&passwd=" . urlencode($password);
            
            $sql = "INSERT INTO qrcodes (content) VALUES ('$content')";
            if (mysqli_query($conx, $sql)) {
                $last_id = mysqli_insert_id($conx);
                header("Location: index.php?id=$last_id");
                exit();
            } else {
                $message = "Error: " . mysqli_error($conx);
            }
        } else {
            $message = "Membre non trouvé.";
        }
    } else {
        $message = "Veuillez sélectionner un membre.";
    }
}

$qr_content = "";
if (isset($_GET['id'])) {
    $id = (int)$_GET['id'];
    $result = mysqli_query($conx, "SELECT content FROM qrcodes WHERE id = $id");
    if ($row = mysqli_fetch_assoc($result)) {
        $qr_content = $row['content'];
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Générateur de QR Code</title>
    <link rel="stylesheet" href="../css/base.css">
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; text-align: center; }
        .container { max-width: 500px; margin: auto; background: #f4f4f4; padding: 20px; border-radius: 8px; }
        input[type="text"] { width: 80%; padding: 10px; margin-bottom: 10px; }
        button { padding: 10px 20px; cursor: pointer; background-color: #007bff; color: white; border: none; border-radius: 4px; }
        .qr-result { margin-top: 20px; }
        .qr-container-wrapper {
            position: relative;
            display: inline-block;
            background: #000;
            padding: 2px;
            border-radius: 4px;
        }
        .qr-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: black;
            padding: 4px;
            border-radius: 4px;
            display: flex;
            flex-direction: column;
            align-items: center;
            box-shadow: 0 0 5px rgba(255,255,255,0.2);
        }
        .qr-logo {
            width: 80px;
            height: 80px;
        }
        .qr-user-text {
            font-size: 7px;
            font-weight: bold;
            margin-top: 4px;
            color: #ff0000;
            text-transform: capitalize;
        }
        .print-btn { background-color: #28a745; margin-top: 10px; }
        .print-btn.round { background-color: #6f42c1; }
        @media print {
            body * { visibility: hidden; }
            #printableArea, #printableArea * { visibility: visible; }
            #printableArea { position: absolute; left: 0; top: 0; width: 100%; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Générateur de QR Code</h1>
        <form method="post">
            <div style="margin-bottom: 15px;">
                <label><input type="radio" name="network" value="intranet"> Intranet (192.168.1.30)</label>
                <label style="margin-left: 15px;"><input type="radio" name="network" value="internet" checked> Internet (viendez.com)</label>
            </div>
            <select name="pseudo" required style="width: 80%; padding: 10px; margin-bottom: 10px;">
                <option value="">-- Sélectionner un membre --</option>
                <?php
                $members_list = mysqli_query($conx, "SELECT pseudo FROM membres ORDER BY pseudo ASC");
                while ($m = mysqli_fetch_assoc($members_list)) {
                    echo "<option value=\"" . htmlspecialchars($m['pseudo']) . "\">" . htmlspecialchars($m['pseudo']) . "</option>";
                }
                ?>
            </select>
            <br>
            <button type="submit" name="generate">Générer</button>
        </form>

        <?php if ($message): ?>
            <p style="color: red;"><?php echo $message; ?></p>
        <?php endif; ?>

        <?php if ($qr_content): ?>
            <?php 
            $display_user = $qr_content;
            if (preg_match('/pseudo=([^&]+)/', $qr_content, $matches)) {
                $display_user = urldecode($matches[1]);
            }
            ?>
            <div class="qr-result" id="printableArea">
                <h3>Votre QR Code :</h3>
                <div class="qr-container-wrapper">
                    <img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=<?php echo urlencode($qr_content); ?>&ecc=H&color=ffffff&bgcolor=000000&margin=1&v=<?php echo time(); ?>" alt="QR Code">
                    <div class="qr-overlay">
                        <img src="../panel/bg.png" class="qr-logo" alt="Logo">
                        <div class="qr-user-text"><?php echo htmlspecialchars($display_user); ?></div>
                    </div>
                </div>
            </div>
            <a href="print.php?id=<?php echo $id; ?>" target="_blank">
                <button class="print-btn">Imprimer Carré (3cm x 3cm)</button>
            </a>
            <a href="print.php?id=<?php echo $id; ?>&shape=round" target="_blank">
                <button class="print-btn round">Imprimer Rond (Ø 30mm)</button>
            </a>
        <?php endif; ?>

        <hr>
        <h3>Historique récents</h3>
        <ul>
            <?php
            $history = mysqli_query($conx, "SELECT * FROM qrcodes ORDER BY created_at DESC LIMIT 10");
            while ($h = mysqli_fetch_assoc($history)) {
                $h_pseudo = "Inconnu";
                if (preg_match('/pseudo=([^&]+)/', $h['content'], $m_h)) {
                    $h_pseudo = urldecode($m_h[1]);
                }
                echo "<li><strong>" . htmlspecialchars(ucfirst($h_pseudo)) . "</strong> : <a href='index.php?id={$h['id']}'>" . htmlspecialchars(substr($h['content'], 0, 40)) . "...</a> ({$h['created_at']})</li>";
            }
            ?>
        </ul>
    </div>
</body>
</html>
