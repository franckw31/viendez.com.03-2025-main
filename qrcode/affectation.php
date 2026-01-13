<?php
session_start();
error_reporting(0);

// Config DB
$config_path = dirname(__DIR__) . '/config.php';
if (!file_exists($config_path)) {
    die('Erreur: config.php introuvable');
}
require_once $config_path; // apporte $conx

if (!$conx) {
    die('Erreur de connexion DB');
}
mysqli_set_charset($conx, 'utf8mb4');

// API d'affectation via AJAX
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'link') {
    header('Content-Type: application/json; charset=utf-8');

    $wallet_code = isset($_POST['wallet']) ? trim($_POST['wallet']) : '';
    $member_code = isset($_POST['member']) ? trim($_POST['member']) : '';

    if ($wallet_code === '' || $member_code === '') {
        echo json_encode(['success' => false, 'message' => 'Deux scans sont requis.']);
        exit;
    }

    // Extraction du contenu du portefeuille (après le dernier '=')
    if (strpos($wallet_code, '=') !== false) {
        $wallet_code = substr($wallet_code, strrpos($wallet_code, '=') + 1);
    }

    $pseudo = '';
    $passwd = '';
    if (strpos($member_code, 'pseudo=') !== false) {
        preg_match('/pseudo=([^&]+)/', $member_code, $m_pseudo);
        $pseudo = isset($m_pseudo[1]) ? urldecode($m_pseudo[1]) : '';
        preg_match('/passwd=([^&]+)/', $member_code, $m_passwd);
        $passwd = isset($m_passwd[1]) ? urldecode($m_passwd[1]) : '';
    } else {
        $pseudo = $member_code;
    }

    // Trouver le portefeuille (collections)
    $stmt = $conx->prepare('SELECT id_collection, nom, valeur FROM collections WHERE id_collection = ? OR nom = ? LIMIT 1');
    $wallet_id_int = ctype_digit($wallet_code) ? intval($wallet_code) : 0;
    $stmt->bind_param('is', $wallet_id_int, $wallet_code);
    $stmt->execute();
    $wallet_res = $stmt->get_result();
    $wallet = $wallet_res ? $wallet_res->fetch_assoc() : null;
    $stmt->close();

    if (!$wallet) {
        echo json_encode(['success' => false, 'message' => 'Carte portefeuille introuvable.']);
        exit;
    }

    $wallet_valeur = isset($wallet['valeur']) ? intval($wallet['valeur']) : 1;

    // Trouver le membre
    if ($passwd !== '') {
        $stmt = $conx->prepare('SELECT `id-membre`, pseudo, email FROM membres WHERE (`id-membre` = ? OR pseudo = ?) AND (`password` = ? OR `password_ext` = ?) LIMIT 1');
        $member_id_int = ctype_digit($pseudo) ? intval($pseudo) : 0;
        $stmt->bind_param('isss', $member_id_int, $pseudo, $passwd, $passwd);
    } else {
        $stmt = $conx->prepare('SELECT `id-membre`, pseudo, email FROM membres WHERE `id-membre` = ? OR pseudo = ? OR email = ? LIMIT 1');
        $member_id_int = ctype_digit($pseudo) ? intval($pseudo) : 0;
        $stmt->bind_param('iss', $member_id_int, $pseudo, $pseudo);
    }
    
    $stmt->execute();
    $member_res = $stmt->get_result();
    $member = $member_res ? $member_res->fetch_assoc() : null;
    $stmt->close();

    if (!$member) {
        echo json_encode(['success' => false, 'message' => 'Membre introuvable ou mauvais mot de passe.']);
        exit;
    }

    $wallet_id = intval($wallet['id_collection']);
    $member_id = intval($member['id-membre']);

    // Vérifier si l'association existe déjà
    $stmt = $conx->prepare('SELECT id FROM `collections-individu` WHERE id_col = ? AND `id-indiv` = ? LIMIT 1');
    $stmt->bind_param('ii', $wallet_id, $member_id);
    $stmt->execute();
    $exists_res = $stmt->get_result();
    $already = $exists_res && $exists_res->num_rows > 0;
    $stmt->close();

    if ($already) {
        echo json_encode([
            'success' => true,
            'message' => 'Association déjà présente.',
            'wallet_id' => $wallet_id,
            'wallet_nom' => $wallet['nom'],
            'member_id' => $member_id,
            'member_pseudo' => $member['pseudo']
        ]);
        exit;
    }

    // Insérer l'association
    $stmt = $conx->prepare('INSERT INTO `collections-individu` (id_col, `id-indiv`, co, valeur) VALUES (?, ?, "Auto", ?)');
    $stmt->bind_param('iii', $wallet_id, $member_id, $wallet_valeur);
    $ok = $stmt->execute();
    $stmt->close();

    if ($ok) {
        echo json_encode([
            'success' => true,
            'message' => 'Association créée avec succès.',
            'wallet_id' => $wallet_id,
            'wallet_nom' => $wallet['nom'],
            'member_id' => $member_id,
            'member_pseudo' => $member['pseudo']
        ]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Erreur lors de la création de l\'association.']);
    }
    exit;
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Affectation Portefeuille v1.2</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5-qrcode/2.3.4/html5-qrcode.min.js"></script>
    <style>
        body {font-family: Arial, sans-serif; background: #f5f7fb; margin: 0; padding: 20px;}
        .container {max-width: 760px; margin: 0 auto; background: #fff; border-radius: 12px; padding: 24px; box-shadow: 0 12px 36px rgba(0,0,0,0.08);}    
        h1 {margin-top: 0; color: #222; text-align: center;}
        .actions {display: flex; gap: 12px; margin-bottom: 16px; flex-wrap: wrap;}
        button {padding: 12px 18px; border: none; border-radius: 8px; cursor: pointer; font-weight: 600; color: #fff; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);}    
        button.secondary {background: #f05a7e;}
        button:disabled {opacity: 0.6; cursor: not-allowed;}
        #qr-reader {width: 100%; max-width: 520px; margin: 0 auto 12px;}
        .status {text-align: center; margin-bottom: 12px; color: #555;}
        .pill {display: inline-block; padding: 8px 12px; border-radius: 999px; background: #eef2ff; color: #4c51bf; margin: 4px;}
        .result-box {background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 10px; padding: 14px; margin-top: 8px;}
        .alert {padding: 12px 14px; border-radius: 8px; margin-top: 12px; display: none;}
        .alert.success {background: #e6fffa; color: #0f766e; border: 1px solid #99f6e4;}
        .alert.error {background: #fff5f5; color: #c53030; border: 1px solid #fed7d7;}
    </style>
</head>
<body>
    <div class="container">
        <h1>Associer une carte portefeuille à un membre</h1>
        <p class="status">Étape 1 : scanner le QR de la carte portefeuille, puis Étape 2 : scanner le QR du membre.</p>

        <div id="qr-reader"></div>

        <div class="actions">
            <button id="scanWalletBtn" onclick="startScan('wallet')">Scanner portefeuille</button>
            <button id="scanMemberBtn" class="secondary" onclick="startScan('member')">Scanner membre</button>
            <button id="stopBtn" onclick="stopScan()" style="display:none; background:#6b7280;">Arrêter</button>
        </div>

        <div class="result-box">
            <div>Portefeuille scanné : <span id="walletValue" class="pill">—</span></div>
            <div>Membre scanné : <span id="memberValue" class="pill">—</span></div>
        </div>

        <div id="alert" class="alert"></div>
    </div>

    <script>
        let scanner = null;
        let currentStep = null;
        let walletCode = '';
        let memberCode = '';

        function startScan(step) {
            currentStep = step;
            showAlert('info', 'Caméra en cours...');
            document.getElementById('stopBtn').style.display = 'inline-block';

            if (!scanner) {
                scanner = new Html5Qrcode('qr-reader');
            }

            scanner.start(
                { facingMode: 'environment' },
                { fps: 15, qrbox: { width: 150, height: 150 }, disableFlip: false },
                onScanSuccess,
                () => {}
            ).catch(err => {
                showAlert('error', 'Impossible d\'accéder à la caméra: ' + err);
                document.getElementById('stopBtn').style.display = 'none';
            });
        }

        function stopScan() {
            if (scanner) {
                scanner.stop().then(() => {
                    document.getElementById('stopBtn').style.display = 'none';
                    showAlert('info', 'Caméra arrêtée');
                });
            }
        }

        function onScanSuccess(decodedText) {
            if (currentStep === 'wallet') {
                walletCode = decodedText.trim();
                document.getElementById('walletValue').textContent = walletCode;
                showAlert('success', 'Portefeuille scanné. Passez au membre.');
            } else if (currentStep === 'member') {
                memberCode = decodedText.trim();
                document.getElementById('memberValue').textContent = memberCode;
                showAlert('success', 'Membre scanné. Envoi en cours...');
            }

            stopScan();
            currentStep = null;
            maybeSendLink();
        }

        function maybeSendLink() {
            if (!walletCode || !memberCode) return;

            const params = new URLSearchParams();
            params.append('action', 'link');
            params.append('wallet', walletCode);
            params.append('member', memberCode);

            fetch(window.location.href, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: params.toString()
            })
            .then(r => r.json())
            .then(data => {
                if (data.success) {
                    showAlert('success', data.message);
                } else {
                    showAlert('error', data.message || 'Erreur.');
                }
            })
            .catch(() => showAlert('error', 'Erreur réseau.'));
        }

        function showAlert(type, msg) {
            const box = document.getElementById('alert');
            box.style.display = 'block';
            box.className = 'alert ' + (type === 'success' ? 'success' : (type === 'error' ? 'error' : ''));
            box.textContent = msg;
        }
    </script>
</body>
</html>
