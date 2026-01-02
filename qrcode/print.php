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
            <?php elseif ($shape === 'card'): ?>
            width: 80mm;
            height: 50mm;
            background-color: black !important;
            background-image: url('joker_bg.jpg') !important;
            background-size: cover !important;
            background-position: calc(50% - 15mm) center !important;
            background-repeat: no-repeat !important;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding-right: 3mm;
            border: none;
            border-radius: 3mm;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
            -webkit-print-color-adjust: exact;
            print-color-adjust: exact;
            <?php endif; ?>
        }
        .qr-wrapper {
            position: relative;
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            background: #000;
            padding: 0.5px;
            <?php if ($shape === 'round'): ?>
            background: transparent;
            <?php elseif ($shape === 'card'): ?>
            transform: translateY(-5mm);
            <?php endif; ?>
        }
        .qr-overlay {
            position: absolute;
            top: 14mm; /* Centre du QR 28mm */
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 0;
            border-radius: 2px;
            display: flex;
            flex-direction: column;
            align-items: center;
            box-shadow: 0 0 2px rgba(255,255,255,0.2);
        }
        .qr-logo {
            width: 7mm;
            height: 7mm;
            background: black !important;
            <?php if ($shape === 'round'): ?>
            width: 6mm;
            height: 6mm;
            <?php elseif ($shape === 'card'): ?>
            width: 8.5mm;
            height: 8.5mm;
            <?php endif; ?>
        }
        .qr-user-text {
            font-size: 9pt;
            font-weight: bold;
            margin-top: 2mm;
            color: #ffffff;
            text-transform: capitalize;
            line-height: 1;
            text-shadow: 1px 1px 2px rgba(0,0,0,1);
        }
        img.qr-code {
            width: 28mm;
            height: 28mm;
            <?php if ($shape === 'round'): ?>
            width: 21mm;
            height: 21mm;
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
                <?php elseif ($shape === 'card'): ?>
                width: 80mm;
                height: 50mm;
                background-color: black !important;
                background-image: url('joker_bg.jpg') !important;
                background-size: cover !important;
                background-position: calc(50% - 15mm) center !important;
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
                <img src="vip.png" class="qr-logo" alt="Logo">
            </div>
            <div class="qr-user-text"><?php echo htmlspecialchars($display_user); ?></div>
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
