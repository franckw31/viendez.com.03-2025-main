<?php
require_once __DIR__ . '/../config.php';

if (!isset($_GET['id'])) {
    die("ID manquant");
}

$id = (int)$_GET['id'];
$shape = isset($_GET['shape']) ? $_GET['shape'] : 'square';
$result = mysqli_query($conx, "SELECT content FROM qrcodes WHERE id = $id");
if (!$row = mysqli_fetch_assoc($result)) {
    die("QR Code non trouvé");
}

$qr_content = $row['content'];
$display_user = $qr_content;
if (preg_match('/pseudo=([^&]+)/', $qr_content, $matches)) {
    $display_user = urldecode($matches[1]);
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Imprimer QR Code</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .qr-container {
            text-align: center;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            position: relative;
            -webkit-print-color-adjust: exact;
            print-color-adjust: exact;
            <?php if ($shape === 'round'): ?>
            width: 3cm;
            height: 3cm;
            border-radius: 50% !important;
            background: black !important;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0;
            border: none;
            overflow: hidden;
            box-shadow: inset 0 0 0 1.5cm black; /* Force le noir même si le background est désactivé */
            <?php endif; ?>
        }
        .qr-wrapper {
            position: relative;
            display: inline-block;
            background: #000;
            padding: 0.5px;
            <?php if ($shape === 'round'): ?>
            background: transparent;
            <?php endif; ?>
        }
        .qr-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: black;
            padding: 1px;
            border-radius: 2px;
            display: flex;
            flex-direction: column;
            align-items: center;
            box-shadow: 0 0 2px rgba(255,255,255,0.2);
        }
        .qr-logo {
            width: 1.1cm;
            height: 1.1cm;
            <?php if ($shape === 'round'): ?>
            width: 0.8cm;
            height: 0.8cm;
            <?php endif; ?>
        }
        .qr-user-text {
            font-size: 4pt;
            font-weight: bold;
            margin-top: 3pt;
            color: #ff0000;
            text-transform: capitalize;
            line-height: 1;
        }
        img.qr-code {
            width: 3cm;
            height: 3cm;
            <?php if ($shape === 'round'): ?>
            width: 2.1cm;
            height: 2.1cm;
            <?php endif; ?>
        }
        .content-text {
            margin-top: 20px;
            font-size: 18px;
            color: #555;
        }
        @media print {
            .no-print {
                display: none;
            }
            body {
                height: auto;
                background: white;
            }
            .qr-container {
                border: none;
                <?php if ($shape === 'round'): ?>
                width: 3cm;
                height: 3cm;
                border-radius: 50% !important;
                background: black !important;
                box-shadow: inset 0 0 0 1.5cm black !important;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
                <?php endif; ?>
            }
        }
    </style>
</head>
<body>
    <div class="qr-container">
        <div class="qr-wrapper">
            <img src="https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=<?php echo urlencode($qr_content); ?>&ecc=H&color=ffffff&bgcolor=000000&margin=1&v=<?php echo time(); ?>" class="qr-code" alt="QR Code">
            <div class="qr-overlay">
                <img src="../panel/bg.png" class="qr-logo" alt="Logo">
                <div class="qr-user-text"><?php echo htmlspecialchars($display_user); ?></div>
            </div>
        </div>
    </div>
    <br>
    <button class="no-print" onclick="window.print()">Imprimer maintenant</button>
    <button class="no-print" onclick="window.history.back()">Retour</button>

    <script>
        // Optionnel: lancer l'impression automatiquement
        // window.onload = function() { window.print(); }
    </script>
</body>
</html>
