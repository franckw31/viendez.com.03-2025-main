<?php
require_once __DIR__ . '/../config.php';

if (!isset($_GET['ids']) || !is_array($_GET['ids'])) {
    die("Aucune étiquette sélectionnée");
}

$start_pos = isset($_GET['start']) ? (int)$_GET['start'] : 1;
if ($start_pos < 1) $start_pos = 1;
if ($start_pos > 10) $start_pos = 10;

$max_labels = 11 - $start_pos; // Nombre max d'étiquettes restantes sur la page
$ids = array_map('int_val', array_slice($_GET['ids'], 0, $max_labels));
$ids_string = implode(',', $ids);

$result = mysqli_query($conx, "SELECT * FROM qrcodes WHERE id IN ($ids_string) ORDER BY FIELD(id, $ids_string)");
$qrcodes = [];
while ($row = mysqli_fetch_assoc($result)) {
    $display_user = $row['content'];
    if (preg_match('/pseudo=([^&]+)/', $row['content'], $matches)) {
        $display_user = urldecode($matches[1]);
    }
    $qrcodes[] = [
        'content' => $row['content'],
        'user' => $display_user
    ];
}

function int_val($v) { return (int)$v; }
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Impression Planche A4 (10 étiquettes)</title>
    <style>
        @page {
            size: A4;
            margin: 0;
        }
        body {
            margin: 0;
            padding: 10mm; /* Marges de sécurité A4 */
            font-family: Arial, sans-serif;
            background: #f0f0f0;
        }
        .page-a4 {
            width: 210mm;
            height: 297mm;
            background: white;
            margin: auto;
            display: grid;
            grid-template-columns: repeat(2, 80mm);
            grid-template-rows: repeat(5, 50mm);
            gap: 5mm; /* Espace entre les étiquettes */
            padding: 15mm; /* Marges identiques de tous les côtés */
            box-sizing: border-box;
            justify-content: center; /* Centre horizontalement le contenu */
        }
        .label-card {
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
            border-radius: 2mm;
            position: relative;
            overflow: hidden;
            -webkit-print-color-adjust: exact;
            print-color-adjust: exact;
            box-sizing: border-box;
            border: 0.1mm solid #eee;
        }
        .qr-wrapper {
            position: relative;
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            background: #000;
            padding: 0.5px;
            transform: translateY(-5mm);
        }
        .qr-code {
            width: 28mm;
            height: 28mm;
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
        }
        .qr-logo {
            width: 8.5mm;
            height: 8.5mm;
            background: black !important;
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
        .no-print-zone {
            position: fixed;
            top: 10px;
            right: 10px;
            z-index: 1000;
        }
        button {
            padding: 10px 20px;
            cursor: pointer;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-weight: bold;
        }
        @media print {
            body { background: none; padding: 0; }
            .no-print-zone { display: none; }
            .page-a4 { margin: 0; border: none; box-shadow: none; }
            .label-card { border: none; }
        }
    </style>
</head>
<body>
    <div class="no-print-zone">
        <button onclick="window.print()">Imprimer la planche A4</button>
        <button onclick="window.close()" style="background: #6c757d;">Fermer</button>
    </div>

    <div class="page-a4">
        <?php 
        // Ajouter les emplacements vides
        for ($i = 1; $i < $start_pos; $i++) {
            echo '<div class="label-empty" style="width: 80mm; height: 50mm;"></div>';
        }

        foreach ($qrcodes as $qr): ?>
            <div class="label-card">
                <div class="qr-wrapper">
                    <img src="https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=<?php echo urlencode($qr['content']); ?>&ecc=H&color=ffffff&bgcolor=000000&margin=1&v=<?php echo time(); ?>" class="qr-code" alt="QR Code">
                    <div class="qr-overlay">
                        <img src="vip.png" class="qr-logo" alt="Logo">
                    </div>
                    <div class="qr-user-text"><?php echo htmlspecialchars($qr['user']); ?></div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</body>
</html>
