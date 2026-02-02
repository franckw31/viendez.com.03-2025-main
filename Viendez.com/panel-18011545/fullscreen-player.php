<?php
session_start();
error_reporting(0);
include('include/config.php');

// Vérification de session
if (strlen($_SESSION['id']) == 0) {
    header('location:logout.php');
    exit;
}

$id = intval($_GET['uid']);
$_SESSION["act"] = $id;

// --- LOGIQUE DE VÉRIFICATION DES MISES À JOUR (POLLING) ---
if (isset($_GET['check_updates'])) {
    header('Content-Type: application/json');
    
    // 1. Compte et Recaves des participants
    $q1 = mysqli_query($con, "SELECT COUNT(*) as nb, SUM(recave) as recaves FROM `participation` WHERE `id-activite` = '$id'");
    $d1 = mysqli_fetch_assoc($q1);
    
    // 2. Compte des éliminations
    $q2 = mysqli_query($con, "SELECT COUNT(*) as nb FROM `eliminations` WHERE `id_participation` IN (SELECT `id-participation` FROM `participation` WHERE `id-activite` = '$id')");
    $d2 = mysqli_fetch_assoc($q2);
    
    // 3. Classement (si quelqu'un est sorti)
    $q3 = mysqli_query($con, "SELECT SUM(classement) as sum_rank FROM `participation` WHERE `id-activite` = '$id'");
    $d3 = mysqli_fetch_assoc($q3);

    // Création d'une signature unique de l'état
    $checksum = md5($d1['nb'] . '-' . $d1['recaves'] . '-' . $d2['nb'] . '-' . $d3['sum_rank']);
    
    echo json_encode(['checksum' => $checksum]);
    exit;
}

// Récupération du titre de l'activité et des infos financières
$act_query = mysqli_query($con, "SELECT `titre-activite`, `buyin`, `recave_montant` FROM `activite` WHERE `id-activite` = '$id'");
$act_row = mysqli_fetch_array($act_query);
$activity_title = $act_row['titre-activite'];
$buyin = intval($act_row['buyin']);
$recave_montant = intval($act_row['recave_montant']);

?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <meta http-equiv="refresh" content="30"> Rafraîchissement géré par JS désormais -->
    <title>Joueurs - <?php echo htmlspecialchars($activity_title); ?></title>
    
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <!-- <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700|Raleway:300,400,700" rel="stylesheet"> -->

    <style>
        /* Styles inspirés de fullscreen-timer.php */
        :root {
            --font-main: 'Raleway', sans-serif;
            --color-blue: #00d2ff;
            --color-red: #ff3333;
            --color-yellow: #ffc107;
        }

        body {
            background-color: #1a1a1a;
            color: white;
            margin: 0;
            padding: 20px;
            height: 100vh;
            width: 100vw;
            overflow: hidden;
            font-family: var(--font-main);
            position: relative;
            display: flex;
            flex-direction: column;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('bg.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 0.2;
            z-index: -1;
        }

        .header-title {
            text-align: center;
            color: var(--color-blue);
            text-transform: uppercase;
            font-weight: 700;
            font-size: 3vw;
            margin-bottom: 20px;
            text-shadow: 0 0 10px rgba(0, 210, 255, 0.5);
        }

        .content-wrapper {
            flex: 1;
            overflow-y: auto;
            padding: 0 50px;
            /* Scrollbar styling */
            scrollbar-width: thin;
            scrollbar-color: var(--color-blue) #333;
        }

        .content-wrapper::-webkit-scrollbar {
            width: 8px;
        }
        .content-wrapper::-webkit-scrollbar-track {
            background: #333;
        }
        .content-wrapper::-webkit-scrollbar-thumb {
            background-color: var(--color-blue);
            border-radius: 4px;
        }

        /* Table Styling */
        .player-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 1px;
        }

        .player-table thead th {
            color: #aaa;
            font-weight: 600;
            text-transform: uppercase;
            padding: 8px 5px;
            vertical-align: middle;
            font-size: 1.5vw;
            border-bottom: 2px solid #444;
            text-align: left;
        }

        .player-table tbody tr {
            background: rgba(255, 255, 255, 0.05);
            transition: transform 0.2s, background 0.2s;
            border-radius: 10px;
        }
        
        /* Astuce pour border-radius sur tr */
        .player-table tbody tr td:first-child { border-top-left-radius: 10px; border-bottom-left-radius: 10px; }
        .player-table tbody tr td:last-child { border-top-right-radius: 10px; border-bottom-right-radius: 10px; }

        .player-table tbody tr:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: scale(1.01);
        }

        .player-table tbody tr.eliminated {
            background: rgba(255, 0, 0, 0.15);
            opacity: 0.7;
        }

        .player-table td {
            padding: 1px 4px;
            font-size: 2.2vw;
            vertical-align: middle;
            line-height: 1;
        }

        .rank-cell {
            font-weight: bold;
            color: var(--color-yellow);
            width: 80px;
            text-align: center;
            font-size: 2.5vw !important;
        }

        .name-cell {
            font-weight: 700;
            color: white;
        }

        .eliminated .name-cell {
            /* text-decoration: line-through; */
            color: #ff6666;
        }

        .info-cell {
            text-align: center;
            color: #ccc;
            font-size: 1.5vw !important;
        }
        
        /* Style pour la colonne Sorti(e) Par */
        .player-table td:nth-child(4) {
            font-size: 1.8vw;
            color: #aaa;
        }

        .action-cell {
            width: 60px;
            text-align: center;
        }

        .btn-delete {
            background: rgba(255, 51, 51, 0.1);
            border: 1px solid #ff3333;
            color: #ff3333;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-delete:hover {
            background: #ff3333;
            color: white;
            transform: scale(1.1);
        }
        
        .eliminated .btn-delete {
            opacity: 0.3;
            cursor: not-allowed;
            pointer-events: none;
        }

        .status-badge {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 1vw;
            font-weight: bold;
            text-transform: uppercase;
            vertical-align: middle;
        }
        
        .status-active {
            background-color: rgba(76, 209, 55, 0.2);
            color: #4cd137;
            border: 1px solid #4cd137;
        }
        
        .status-out {
            background-color: rgba(255, 51, 51, 0.2);
            color: #ff3333;
            border: 1px solid #ff3333;
        }

        .back-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            color: white;
            opacity: 0.3;
            font-size: 24px;
            z-index: 100;
            transition: opacity 0.3s;
        }
        .back-btn:hover { opacity: 1; color: var(--color-blue); }

        /* Stats summary at bottom */
        .stats-footer {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 50px;
            font-size: 2.5vw;
            color: #888;
            border-top: 1px solid #333;
            padding-top: 20px;
        }
        .stat-item strong {
            color: white;
        }

    </style>
</head>
<body>
    <a href="voir-blindes.php?uid=<?php echo $id; ?>" class="back-btn"><i class="fa fa-arrow-left"></i> Retour</a>

    <div class="header-title">
        <a href="fullscreen-timer.php?uid=<?php echo $id; ?>" style="color:inherit; text-decoration:none; cursor:pointer;"><?php echo htmlspecialchars($activity_title); ?></a> <span style="color: white; opacity: 0.5;">
    </div>

    <div class="content-wrapper">
        <table class="player-table">
            <thead>
                <tr>
                    <th style="text-align: center;">#</th>
                    <th>Joueur</th>
                    <th style="text-align: center;">Bounty</th>
                    <th style="text-align: center;">Recaves</th>
                    <th>Sorti(e) Par</th>
                    <th style="text-align: center;">Statut</th>
                    <th style="text-align: center;">Actions</th>
                </tr>
            </thead>
            <tbody id="joueurs-list">
                <?php
                // Requête identique à voir-blindes.php pour la cohérence
                $req = mysqli_query($con, "SELECT p.* FROM `participation` p WHERE p.`id-activite` = '$id' ORDER BY (p.`classement` = 0 OR p.`classement` IS NULL) DESC, p.`classement` ASC, p.`nom-membre` ASC");
                
                $rankingCounter = 1;
                $totalPlayers = 0;
                $activePlayers = 0;
                $totalRecaves = 0;
                
                while ($row = mysqli_fetch_array($req)) {
                    $totalPlayers++;
                    $totalRecaves += intval($row['recave']);
                    
                    // Récupération ID membre (comme dans voir-blindes.php)
                    $membre_id = 0;
                    $pseudo_clean = mysqli_real_escape_string($con, $row['nom-membre']);
                    $mq = mysqli_query($con, "SELECT `id-membre` FROM `membres` WHERE `pseudo` = '$pseudo_clean' LIMIT 1");
                    if ($mq && mysqli_num_rows($mq) > 0) {
                        $mr = mysqli_fetch_array($mq);
                        $membre_id = intval($mr['id-membre']);
                    }

                    // Compter le nombre de joueurs éliminés par ce pseudo (Bounty)
                    $elimCount = 0;
                    $countElimQuery = mysqli_query($con, "SELECT COUNT(*) as cnt FROM `eliminations` e JOIN `participation` p ON e.`id_participation` = p.`id-participation` WHERE p.`id-activite` = '$id' AND e.`nom_membre` = '" . mysqli_real_escape_string($con, $row['nom-membre']) . "'");
                    if ($countElimQuery) {
                        $countElimRow = mysqli_fetch_array($countElimQuery);
                        $elimCount = intval($countElimRow['cnt']);
                    }

                    // Vérification élimination
                    $isEliminated = false;
                    $eliminatorsList = array();
                    
                    // On récupère TOUTES les éliminations pour afficher l'historique
                    $elim_q = mysqli_query($con, "SELECT * FROM `eliminations` WHERE `id_participation` = '" . intval($row['id-participation']) . "' ORDER BY created_at ASC");
                    
                    while ($er = mysqli_fetch_array($elim_q)) {
                        $eliminatorsList[] = $er['nom_membre'];
                        
                        // Si une des éliminations est définitive, le joueur est OUT
                        if (intval($er['is_definitive']) === 1) {
                            $isEliminated = true;
                        }
                    }

                    if (!$isEliminated) {
                        $activePlayers++;
                    }

                    $rowClass = $isEliminated ? 'eliminated' : '';
                    
                    // Affichage du rang
                    if (!$isEliminated) {
                        $rankDisplay = $rankingCounter;
                        $rankingCounter++;
                    } else {
                         // Si éliminé, on affiche son classement final s'il existe, sinon une croix
                         if($row['classement'] > 0) $rankDisplay = $row['classement'];
                         else $rankDisplay = '<i class="fa fa-times"></i>';
                    }

                    echo '<tr class="' . $rowClass . '" 
                              data-id="' . intval($row['id-participation']) . '" 
                              data-member-id="' . $membre_id . '" 
                              data-pseudo="' . htmlspecialchars($row['nom-membre'], ENT_QUOTES) . '">';
                    
                    echo '<td class="rank-cell">' . $rankDisplay . '</td>';
                    echo '<td class="name-cell">' . htmlspecialchars($row['nom-membre']) . '</td>';
                    
                    // Colonne Bounty
                    echo '<td style="text-align: center; color: #4cd137; font-weight: bold;">' . ($elimCount > 0 ? $elimCount : '<span style="opacity:0.3">-</span>') . '</td>';

                    echo '<td style="text-align: center; color: #ff3333; font-weight: bold;">' . ($row['recave'] > 0 ? $row['recave'] : '<span style="opacity:0.3">-</span>') . '</td>';
                    
                    // Colonne Sorti(e) Par
                    echo '<td>';
                    if (!empty($eliminatorsList)) {
                         // On affiche la liste séparée par des virgules
                         echo '<span class="eliminated-by">' . htmlspecialchars(implode(', ', $eliminatorsList)) . '</span>';
                    } else {
                         echo '<span class="eliminated-by"></span>';
                    }
                    echo '</td>';

                    echo '<td class="info-cell">';
                    if ($isEliminated) {
                        echo '<span class="status-badge status-out">OUT</span>';
                    } else {
                        echo '<span class="status-badge status-active">EN JEUX</span>';
                    }
                    echo '</td>';
                    
                    // Colonne Actions
                    echo '<td class="action-cell">';
                    echo '<button class="btn-delete" onclick="confirmDeletePlayer(this)" 
                            data-id="' . intval($row['id-participation']) . '" 
                            data-member-id="' . $membre_id . '" 
                            data-name="' . htmlspecialchars($row['nom-membre'], ENT_QUOTES) . '"
                            data-activity-id="' . $id . '">
                            <i class="fa fa-sign-out"></i>
                          </button>';
                    echo '</td>';
                    
                    echo '</tr>';
                }
                ?>
            </tbody>
        </table>
    </div>

    <div class="stats-footer">
        <div class="stat-item">Joueurs: <strong><?php echo $activePlayers; ?> / <?php echo $totalPlayers; ?></strong></div>
        <div class="stat-item">Total Recaves: <strong><?php echo $totalRecaves; ?></strong></div>
        <?php 
            $pricepool = ($totalPlayers * $buyin) + ($totalRecaves * $recave_montant);
        ?>
        <div class="stat-item">Pricepool: <strong><?php echo number_format($pricepool, 0, ',', ' '); ?> €</strong></div>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <script>
        // --- LOGIQUE DE SUPPRESSION (Adaptée de voir-blindes.js) ---

        // Fonction utilitaire pour parler avec une voix masculine si possible
        function speakWithMaleVoice(text) {
            if ('speechSynthesis' in window) {
                var msg = new SpeechSynthesisUtterance(text);
                msg.lang = 'fr-FR';
                
                // Essayer de trouver une voix masculine
                var voices = window.speechSynthesis.getVoices();
                var maleVoice = voices.find(function(v) {
                    return v.lang.startsWith('fr') && (v.name.includes('Male') || v.name.includes('Paul') || v.name.includes('Mathieu') || v.name.includes('Google français'));
                });

                if (maleVoice) {
                    msg.voice = maleVoice;
                }
                
                window.speechSynthesis.speak(msg);
            }
        }

        // Action du bouton POUBELLE / SORTIE
        window.confirmDeletePlayer = function(button) {
            console.log("%c[Action] Clic sur bouton SORTIE", "color: red; font-weight: bold;");
            var participationId = button.getAttribute('data-id');
            var memberId = button.getAttribute('data-member-id');
            var name = button.getAttribute('data-name');
            var activityId = button.getAttribute('data-activity-id');
            
            console.log(" -> Joueur ciblé: " + name + " (ID Part: " + participationId + ")");
            openEliminationModal(participationId, name, activityId);
        };

        window.openEliminationModal = function(victimParticipationId, victimName, activityId) {
            console.log("[Modale] Ouverture pour éliminer: " + victimName);
            
            // Nettoyage ancienne modale
            var oldModal = document.querySelector('.elimination-modal-overlay');
            if(oldModal) oldModal.remove();

            var rows = document.querySelectorAll('#joueurs-list tr');
            var options = '<option value="" data-member-id="">-- Sélectionner un joueur --</option>';
            var countPlayers = 0;

            rows.forEach(function (r) {
                var partId = r.getAttribute('data-id');
                var membreId = r.getAttribute('data-member-id');
                var pseudo = r.getAttribute('data-pseudo');
                
                if (!partId || !pseudo) return;
                
                // On ne peut pas s'éliminer soi-même
                if (String(partId) === String(victimParticipationId)) return; 
                
                // FILTRE : On ne propose que les joueurs EN JEUX (pas éliminés)
                if (r.classList.contains('eliminated')) return;

                options += '<option value="' + pseudo + '" data-member-id="' + membreId + '">' + pseudo + '</option>';
                countPlayers++;
            });
            console.log(" -> Joueurs disponibles pour éliminer: " + countPlayers);

            var overlay = document.createElement('div');
            overlay.className = 'elimination-modal-overlay';
            overlay.style = 'position:fixed;inset:0;background:rgba(0,0,0,0.8);display:flex;align-items:center;justify-content:center;z-index:99999; color: black;';
            
            overlay.innerHTML = `
                <div style="background:#fff;padding:20px;border-radius:10px;min-width:400px;box-shadow:0 0 30px rgba(0,0,0,0.8);">
                    <h3 style="margin:0 0 15px; color: #333;">Sortie de <strong>${victimName}</strong></h3>
                    <p style="margin-bottom: 5px; font-weight: bold;">Qui l'a éliminé ?</p>
                    <select id="eliminatorSelect" class="form-control" style="width:100%; height: 50px; padding:10px; margin-bottom:15px; font-size:16px; color: #333; background-color: #fff;">${options}</select>
                    
                    <div style="margin-top:12px;padding:15px;border:1px solid #ddd;border-radius:4px;background-color:#f9f9f9;">
                        <label style="display:flex;align-items:center;margin:0;cursor:pointer;">
                            <input type="checkbox" id="definitiveElimination" style="margin-right:10px;transform:scale(1.5);cursor:pointer;" />
                            <span style="color:red; font-size:16px; font-weight:bold;">Éliminé définitivement (OUT)</span>
                        </label>
                    </div>
                    
                    <div style="text-align:right;margin-top:20px; display: flex; justify-content: flex-end; gap: 10px;">
                        <button class="btn btn-secondary" id="elimCancel">Annuler</button>
                        <button class="btn btn-danger" id="elimConfirm">CONFIRMER SORTIE</button>
                    </div>
                </div>
            `;
            
            document.body.appendChild(overlay);

            overlay.querySelector('#elimCancel').onclick = function () {
                document.body.removeChild(overlay);
            };

            overlay.querySelector('#elimConfirm').onclick = function () {
                var select = overlay.querySelector('#eliminatorSelect');
                var eliminatorName = select.value;
                var selectedOption = select.options[select.selectedIndex];
                var eliminatorMemberId = selectedOption.getAttribute('data-member-id');
                var isDefinitive = overlay.querySelector('#definitiveElimination').checked;

                if (eliminatorName === "") {
                    alert("Veuillez sélectionner un joueur.");
                    return;
                }

                document.body.removeChild(overlay);
                applyElimination(victimParticipationId, eliminatorMemberId, eliminatorName, isDefinitive, activityId, victimName);
            };
        };

        window.applyElimination = function(victimParticipationId, eliminatorMemberId, eliminatorName, isDefinitiveElim, activityId, victimName) {
            console.log("%c[Process] Application de l'élimination...", "color: purple; font-weight: bold;");
            
            var markAsEliminatedUI = function() {
                console.log(" -> Mise à jour UI");
                var rows = document.querySelectorAll('#joueurs-list tr');
                rows.forEach(function (r) {
                    if (String(r.getAttribute('data-id')) === String(victimParticipationId)) {
                        // Ajouter classe eliminated
                        r.classList.add('eliminated');
                        
                        // Mettre à jour le statut
                        var infoCell = r.querySelector('.info-cell');
                        if (infoCell) {
                            infoCell.innerHTML = '<span class="status-badge status-out">OUT</span>';
                        }

                        // Mettre à jour la colonne "Sorti(e) Par" (4ème colonne)
                        var eliminatedByCell = r.querySelector('td:nth-child(4)');
                        if (eliminatedByCell) {
                             var currentText = eliminatedByCell.innerText.trim();
                             var newContent = currentText ? currentText + ', ' + eliminatorName : eliminatorName;
                             eliminatedByCell.innerHTML = '<span class="eliminated-by">' + newContent + '</span>';
                        }
                        
                        // Désactiver le bouton
                        var btn = r.querySelector('.btn-delete');
                        if (btn) {
                            btn.style.opacity = '0.3';
                            btn.style.pointerEvents = 'none';
                        }
                    }
                });
            };

            var executeElimination = function() {
                var finalizeElimination = function() {
                    if (isDefinitiveElim) {
                        markAsEliminatedUI();
                    }

                    console.log(" -> Envoi AJAX record_elimination.php");
                    
                    $.ajax({
                        url: 'record_elimination.php',
                        type: 'POST',
                        data: {
                            victim_id: victimParticipationId,
                            eliminator_id: eliminatorMemberId,
                            eliminator_name: eliminatorName,
                            is_definitive: isDefinitiveElim ? 1 : 0,
                            activity_id: activityId
                        },
                        dataType: 'json',
                        success: function (resp) {
                            if (resp && resp.status === 'success') {
                                // Recharger pour mettre à jour les stats et l'ordre
                                setTimeout(function() { location.reload(); }, 500);
                            } else {
                                alert('Erreur: ' + (resp ? resp.message : 'Réponse vide'));
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error('[AJAX Error]', error);
                            alert('Erreur AJAX: ' + error);
                        }
                    });
                };

                if (isDefinitiveElim) {
                    // Calcul du classement
                    var totalJoueurs = document.querySelectorAll('#joueurs-list tr').length;
                    var dejaElimines = document.querySelectorAll('#joueurs-list tr.eliminated').length;
                    
                    // Si le joueur n'était pas déjà marqué comme éliminé, on l'ajoute au compte
                    // (Mais ici on calcule AVANT de le marquer visuellement, donc c'est bon)
                    
                    var rangCalcule = totalJoueurs - dejaElimines;
                    console.log(" -> Rang calculé: " + rangCalcule);
                    
                    // On envoie le classement
                    $.ajax({
                        url: 'update_recave.php',
                        type: 'POST',
                        data: {
                            updates: JSON.stringify([]),
                            classements: JSON.stringify([{
                                'id-participation': victimParticipationId,
                                'classement': rangCalcule
                            }])
                        },
                        dataType: 'json',
                        success: function(response) {
                            // Message vocal : Elimination définitive avec classement
                            var suffixe = (rangCalcule == 1) ? "ère" : "ème";
                            speakWithMaleVoice(victimName + " est éliminé définitivement par " + eliminatorName + " et termine la partie en " + rangCalcule + suffixe + " position");
                            
                            finalizeElimination();
                        },
                        error: function(xhr, status, error) {
                            console.error("Erreur sauvegarde classement:", error);
                            finalizeElimination();
                        }
                    });
                } else {
                    // Si PAS définitif (Recave)
                    console.log(" -> Recave détectée, incrémentation...");
                    
                    // 1. Trouver la valeur actuelle de recave
                    var currentRecave = 0;
                    var rows = document.querySelectorAll('#joueurs-list tr');
                    rows.forEach(function (r) {
                        if (String(r.getAttribute('data-id')) === String(victimParticipationId)) {
                            // On cherche la cellule recave (4ème colonne maintenant, car Bounty ajouté en 3ème)
                            var recaveCell = r.querySelector('td:nth-child(4)');
                            if (recaveCell) {
                                var val = parseInt(recaveCell.innerText);
                                if (!isNaN(val)) currentRecave = val;
                            }
                        }
                    });
                    
                    var newRecave = currentRecave + 1;
                    console.log(" -> Recave: " + currentRecave + " => " + newRecave);

                    // 2. Mettre à jour la recave via AJAX
                    $.ajax({
                        url: 'update_recave.php',
                        type: 'POST',
                        data: {
                            updates: JSON.stringify([{
                                'id-participation': victimParticipationId,
                                'recave': newRecave
                            }]),
                            classements: JSON.stringify([])
                        },
                        dataType: 'json',
                        success: function(response) {
                            console.log(" -> Recave mise à jour.");
                            
                            // Mise à jour UI immédiate pour la colonne "Sorti(e) Par"
                            var rows = document.querySelectorAll('#joueurs-list tr');
                            rows.forEach(function (r) {
                                if (String(r.getAttribute('data-id')) === String(victimParticipationId)) {
                                    var eliminatedByCell = r.querySelector('td:nth-child(4)');
                                    if (eliminatedByCell) {
                                         var currentText = eliminatedByCell.innerText.trim();
                                         var newContent = currentText ? currentText + ', ' + eliminatorName : eliminatorName;
                                         eliminatedByCell.innerHTML = '<span class="eliminated-by">' + newContent + '</span>';
                                    }
                                }
                            });

                            // Message vocal : Qui a éliminé qui
                            speakWithMaleVoice(eliminatorName + " a éliminé " + victimName);

                            finalizeElimination();
                        },
                        error: function(xhr, status, error) {
                            console.error("Erreur mise à jour recave:", error);
                            finalizeElimination();
                        }
                    });
                }
            };

            executeElimination();
        };

        // --- AUTO-REFRESH INTELLIGENT ---
        $(document).ready(function() {
            var currentChecksum = null;
            var activityId = "<?php echo $id; ?>";

            // Fonction de vérification
            function checkUpdates() {
                $.ajax({
                    url: 'fullscreen-player.php',
                    type: 'GET',
                    data: { 
                        uid: activityId, 
                        check_updates: 1 
                    },
                    dataType: 'json',
                    success: function(data) {
                        if (data && data.checksum) {
                            if (currentChecksum === null) {
                                currentChecksum = data.checksum;
                            } else if (currentChecksum !== data.checksum) {
                                console.log("Changement détecté ! Rechargement...");
                                location.reload();
                            }
                        }
                    },
                    error: function(err) {
                        console.warn("Erreur polling updates", err);
                    }
                });
            }

            // Premier appel pour initialiser
            checkUpdates();

            // Vérification toutes les 5 secondes
            setInterval(checkUpdates, 5000);
        });
    </script>
</body>
</html>
