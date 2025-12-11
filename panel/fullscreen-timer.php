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

// --- LOGIQUE PHP ---
if (isset($_POST['moins'])) { ?> <script>window.location.replace("/panel/modif-horloge.php?act=<?php echo $id ?>&min=-2&sou=/panel/fullscreen-timer.php?uid=");</script> <?php }
if (isset($_POST['plus'])) { ?> <script>window.location.replace("/panel/modif-horloge.php?act=<?php echo $id ?>&min=+2&sou=/panel/fullscreen-timer.php?uid=");</script> <?php }
if (isset($_POST['pauseresume'])) {
    $check_pause = mysqli_query($con, "SELECT `en_pause` FROM `blindes-live` WHERE `id-activite` = '$id' LIMIT 1");
    $row_pause = mysqli_fetch_array($check_pause);
    if (intval($row_pause['en_pause']) == 0) { ?> <script>window.location.replace("/panel/en-pause.php?act=<?php echo $id ?>&sou=/panel/fullscreen-timer.php?uid=");</script> <?php } 
    else { ?> <script>window.location.replace("/panel/de-pause.php?act=<?php echo $id ?>&sou=/panel/fullscreen-timer.php?uid=");</script> <?php }
}
if (isset($_POST['next_blind']) || isset($_POST['prev_blind']) || isset($_POST['reset_blind'])) {
    $now = time();
    
    // 1. On récupère toutes les blindes
    $q = mysqli_query($con, "SELECT * FROM `blindes-live` WHERE `id-activite` = '$id' ORDER BY `ordre` ASC");
    $blinds = [];
    while($b = mysqli_fetch_assoc($q)) { $blinds[] = $b; }
    
    // 2. On cherche l'index de la blinde ACTUELLE
    $currentIndex = -1;
    foreach($blinds as $k => $b) { 
        if (strtotime($b['fin']) > $now) { 
            $currentIndex = $k; 
            break; 
        }
    }
    
    // 3. On détermine la cible (Target)
    $targetIndex = $currentIndex;

    if (isset($_POST['next_blind'])) {
        // Si pas fini et qu'il reste des niveaux après
        if ($currentIndex != -1 && $currentIndex < count($blinds) - 1) {
            $targetIndex = $currentIndex + 1;
        }
    }
    
    if (isset($_POST['prev_blind'])) {
        if ($currentIndex == -1) {
            // Si fini, "Précédent" réactive le dernier niveau
            $targetIndex = count($blinds) - 1;
        } elseif ($currentIndex > 0) {
            $targetIndex = $currentIndex - 1;
        } else {
            $targetIndex = 0; // Sécurité
        }
    }
    
    if (isset($_POST['reset_blind'])) {
        if ($currentIndex == -1) {
            // Si fini, "Reset" réactive le dernier niveau
            $targetIndex = count($blinds) - 1;
        } else {
            $targetIndex = $currentIndex;
        }
    }

    // 4. MISE A JOUR DE LA BASE DE DONNEES
    if ($targetIndex >= 0 && $targetIndex < count($blinds)) {
        $runningTime = time();
        
        // IMPORTANT : On force la fin du niveau précédent pour éviter les chevauchements
        if ($targetIndex > 0) {
            $prevId = $blinds[$targetIndex - 1]['id'];
            $sql_prev_end = date("Y-m-d H:i:s", $runningTime);
            // On met à jour la fin du niveau d'avant à "Maintenant"
            mysqli_query($con, "UPDATE `blindes-live` SET `fin` = '$sql_prev_end' WHERE `id` = '$prevId'");
        }

        // On décale le niveau cible et tous les suivants
        for ($i = $targetIndex; $i < count($blinds); $i++) {
            // Durée théorique du niveau (ou 20min par défaut si erreur)
            $duree = strtotime($blinds[$i]['fin']) - strtotime($blinds[$i]['debut']);
            if ($duree <= 0) $duree = 20 * 60; 
            
            $newStart = $runningTime;
            $newEnd = $runningTime + $duree;
            
            $u_id = $blinds[$i]['id'];
            $sql_s = date("Y-m-d H:i:s", $newStart);
            $sql_e = date("Y-m-d H:i:s", $newEnd);
            
            mysqli_query($con, "UPDATE `blindes-live` SET `debut` = '$sql_s', `fin` = '$sql_e' WHERE `id` = '$u_id'");
            
            // Le prochain niveau commencera quand celui-ci finit
            $runningTime = $newEnd;
        }
    }
    
    header("Location: fullscreen-timer.php?uid=$id");
    exit;
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Timer Fullscreen</title>
    
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700|Raleway:300,400,700" rel="stylesheet">

    <style>
        /* ==========================================================================
           REGLAGES DES TAILLES
           ========================================================================== */
        :root {
            --size-clock: 20vw;    /* HORLOGE (Rouge) */
            --size-blinds: 10vw;   /* BLINDES (Jaune) */
            --size-message: 3vw;
            --size-estim: 2vw;
            
            /* --- CONFIGURATION LIGNE PAUSE --- */
            --size-pause: 4vw;     /* Taille du texte */
            --color-pause: #ffffff; /* Couleur (blanc) */
            --font-pause: 'Raleway', sans-serif; /* Police */
        }

        body {
            background-color: #1a1a1a;
            color: white;
            margin: 0;
            padding: 0;
            height: 100vh;
            width: 100vw;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-family: 'Raleway', sans-serif;
        }

        .timer-container {
            width: 100%;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        /* --- CIBLAGE PRECIS DES ELEMENTS DE L'HORLOGE --- */
        
        /* 1. L'HEURE (ID défini dans horloge-heure.php) */
        #timer-display {
            font-size: var(--size-clock) !important;
            color: #ff3333 !important; /* Rouge */
            line-height: 1 !important;
            font-weight: bold;
            text-shadow: 0 0 40px rgba(255, 0, 0, 0.4);
        }
        
        /* Style spécifique quand en pause (ajouté par JS) */
        #timer-display.paused {
            color: orange !important;
        }

        /* 2. LES BLINDES (ID défini dans horloge-heure.php) */
        #level-info {
            font-size: var(--size-blinds) !important;
            color: #ffc107 !important; /* Jaune */
            line-height: 1.2 !important;
            font-weight: bold;
            margin-top: 10px;
        }
        
        /* Style pour les Ante (si présents) */
        .ante-text {
            color: #4a90e2 !important; /* Bleu */
            font-size: 0.8em; /* Un peu plus petit que les blindes */
        }

        /* 3. MESSAGES */
        #zone-message {
            font-size: var(--size-message) !important;
            color: #fcfcfaff !important;
            margin-top: 20px;
            min-height: 1.2em;
        }

        /* 4. LIGNE PAUSE (Ajout) */
        #car-pause {
            font-size: var(--size-pause) !important;
            color: var(--color-pause) !important;
            font-family: var(--font-pause) !important;
            margin-top: 15px;
            font-weight: bold;
            text-shadow: 0 0 10px rgba(0,0,0,0.5);
        }

        #zone-estim {
            font-size: var(--size-estim) !important;
            color: grey !important;
            margin-top: 5px;
        }

        /* CONTROLES */
        .controls-area {
            margin-top: 30px;
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 15px;
            width: 80%;
            max-width: 1200px;
        }
        .controls-area .btn { font-size: 24px !important; padding: 15px; }
        .btn-block { font-weight: bold; text-transform: uppercase; margin-bottom: 10px; }
        .btn-primaryg { background-color: #4a90e2; color: white; border: none; }
        .btn-primary-rouge { background-color: #e74c3c; color: white; border: none; }
        
        .back-btn { position: absolute; top: 20px; left: 20px; opacity: 0.3; transition: opacity 0.3s; z-index: 999; }
        .back-btn:hover { opacity: 1; }
    </style>
</head>
<body>

    <a href="voir-blindes.php?uid=<?php echo $id; ?>" class="btn btn-default back-btn">
        <i class="fa fa-arrow-left"></i> Retour Admin
    </a>

    <div class="timer-container">
        
        <!-- ZONE HORLOGE & BLINDES -->
        <div id="zone-clock-container">
            <?php include('horloge-heure.php'); ?>
        </div>

        <!-- ZONE MESSAGE -->
        <!-- <div id="zone-message">
            <div id="car-pause"></div>
        </div> -->

        <!-- ZONE ESTIMATION -->
        <!-- <div id="zone-estim">
            <?php include('horloge-estim.php'); ?>
            <div style="color:inherit"></div>
        </div> -->

        <!-- CONTROLES -->
        <div class="controls-area">
            <form method="post">
                <div class="row">
                    <div class="col-md-4"><button type="submit" id="moins" class="btn btn-primaryg btn-block" name="moins"><i class="fa fa-minus"></i> 2 Min</button></div>
                    <div class="col-md-4"><button type="submit" class="btn btn-primary btn-block" name="pauseresume" style="background-color: #007bff !important;"><i class="fa fa-play"></i> / <i class="fa fa-pause"></i></button></div>
                    <div class="col-md-4"><button type="submit" class="btn btn-primaryg btn-block" name="plus"><i class="fa fa-plus"></i> 2 Min</button></div>
                </div>
                <!--<div class="row" style="margin-top: 15px;">
                     <div class="col-md-4"><button type="submit" id="prev_blind" class="btn btn-warning btn-block" name="prev_blind" style="color: black !important; background-color: #ffc107 !important;"><i class="fa fa-backward"></i> Blinde Préc.</button></div>
                    <div class="col-md-4"><button type="submit" class="btn btn-primary-rouge btn-block" name="reset_blind"><i class="fa fa-refresh"></i> Reset Blinde</button></div>
                    <div class="col-md-4"><button type="submit" id="next_blind" class="btn btn-warning btn-block" name="next_blind" style="color: black !important; background-color: #ffc107 !important;">Blinde Suiv. <i class="fa fa-forward"></i></button></div>
                </div> -->
            </form>
        </div>

        <!-- Remplacer l'include de la pause par ce bloc complet -->
        <!-- <div style="display: flex; justify-content: center; align-items: center; gap: 30px; margin-top: 20px;">
            Wrapper pour le décompte 
            <div id="wrapper-pause" style="color:white ; font-size: 50px ; text-align: center; white-space: nowrap;">
                <?php include('car-pause.php'); ?>
            </div>
            
             Wrapper pour l'heure estimée 
            <div id="estim-pause" style="color:#00ff00 ; font-size: 50px ; text-align: center; font-weight: bold;"></div>
        </div>
 -->
        <!-- <script>
            setInterval(function() {
                var text = "";
                var wrapper = document.getElementById('wrapper-pause');
                
                // 1. Récupérer le texte visible
                if (wrapper) {
                    text = wrapper.innerText || wrapper.textContent;
                }
                
                // Si le wrapper est vide, chercher par ID spécifique potentiel
                if (!text || text.trim() === "") {
                    var el = document.getElementById('car-pause') || document.getElementById('timer-pause');
                    if (el) text = el.innerText || el.textContent;
                }

                var ep = document.getElementById('estim-pause');

                if(text && ep) {
                    // Nettoyage
                    text = text.trim();
                    
                    var totalSec = -1;
                    
                    // Regex pour MM:SS ou HH:MM:SS avec espaces optionnels
                    var matchTime = text.match(/(\d+)\s*:\s*(\d+)(?:\s*:\s*(\d+))?/);
                    
                    if (matchTime) {
                        if (matchTime[3]) {
                            // H:M:S
                            totalSec = parseInt(matchTime[1]) * 3600 + parseInt(matchTime[2]) * 60 + parseInt(matchTime[3]);
                        } else {
                            // M:S
                            totalSec = parseInt(matchTime[1]) * 60 + parseInt(matchTime[2]);
                        }
                    } else {
                        // Regex pour "XX min"
                        var matchMin = text.match(/(\d+)\s*min/i);
                        if (matchMin) {
                            totalSec = parseInt(matchMin[1]) * 60;
                        }
                    }

                    if (totalSec >= 0 && totalSec < 86400) {
                        var now = new Date();
                        var estim = new Date(now.getTime() + (totalSec+900) * 1000);
                        
                        var h = estim.getHours();
                        var m = estim.getMinutes();
                        if(m < 10) m = '0' + m;
                        
                        ep.innerText = "vers " + h + 'h' + m;
                    } else {
                        ep.innerText = ""; 
                    }
                }
            }, 1000);
        </script> -->
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>