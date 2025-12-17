<?php
// IMPORTANT : PAS DE session_start() ICI !
// Ce fichier est inclus dans une page qui a déjà démarré la session.
// Le remettre provoquerait une Erreur 500 immédiate.

if(isset($_GET['uid'])) {
    $id = intval($_GET['uid']);
}
?>

<!-- Conteneur propre -->
<style>
    /* Conteneur principal du cercle - RESPONSIVE via vmin */
    .timer-circle-container {
        position: relative;
        width: 70vmin; /* Taille par défaut (Desktop/Paysage) */
        height: 70vmin;
        margin: 0 auto;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* Adaptation pour Mobile (Portrait) */
    @media (orientation: portrait) {
        .timer-circle-container {
            width: 90vmin; /* Plus grand sur mobile */
            height: 90vmin;
        }
    }

    /* SVG qui contient les cercles */
    .timer-svg {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        transform: rotate(-90deg); /* Pour commencer en haut */
    }

    /* Cercle de fond (gris foncé) */
    .timer-bg {
        fill: none;
        stroke: #222;
        stroke-width: 15; /* Epaisseur du trait */
    }

    /* Cercle de progression (bleu cyan) */
    .timer-progress {
        fill: none;
        stroke: #00d2ff; /* Couleur cyan comme sur l'image */
        stroke-width: 15;
        stroke-linecap: round; /* Bouts arrondis */
        stroke-dasharray: 1131; /* 2 * PI * 180 (rayon) */
        stroke-dashoffset: 1131; /* Commence vide */
        transition: stroke-dashoffset 1s linear;
        filter: drop-shadow(0 0 10px #00d2ff); /* Effet néon */
    }

    /* Contenu central (Texte) */
    .timer-content {
        position: absolute;
        text-align: center;
        color: white;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
        z-index: 10;
    }

    /* Niveau (Haut) */
    #level-name {
        font-size: 4vmin;
        font-weight: 300;
        margin-bottom: 0,25vh;
        color: #ffffff;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

    /* Heure (Centre) */
    #timer-display {
        font-size: 20vmin;
        font-weight: 700;
        line-height: 1;
        color: white;
        font-variant-numeric: tabular-nums; /* Chiffres de même largeur */
        transition: transform 0.3s ease; /* Animation fluide */
    }
    
    /* Effet au survol du conteneur */
    .timer-circle-container:hover #timer-display {
        transform: scale(1.1); /* Agrandissement */
        cursor: pointer;
    }
    
    #timer-display.paused {
        color: #ff0000; /* Rouge en pause */
        font-size: 10vmin;
    }

    /* Blindes (Bas) */
    #level-info {
        font-size: 8vmin;
        font-weight: 700;
        margin-top: 1vh;
        color: #ffc107;
    }
    
    .ante-text {
        color: #00d2ff;
        font-size: 0.7em;
        display: block; /* Ante sur une nouvelle ligne ou bloc */
    }

    /* Info Pause (Sous le cercle) */
    #car-pause {
        margin-top: 20px;
        font-size: 3.5vmin;
        color: #ff0000; /* Rouge pour le texte de pause */
        text-align: center;
        font-weight: 300;
    }
</style>

<!-- Structure HTML Circulaire -->
<div class="timer-circle-container">
    <svg class="timer-svg" viewBox="0 0 400 400">
        <!-- Rayon 180, Centre 200,200 -->
        <circle class="timer-bg" cx="200" cy="200" r="180"></circle>
        <circle class="timer-progress" id="progress-circle" cx="200" cy="200" r="180"></circle>
    </svg>
    
    <div class="timer-content">
        <div id="level-name">Niveau --</div>
        <div id="timer-display">--:--</div>
        <div id="level-info">-- / --</div>
    </div>
</div>

<!-- Info Pause en dehors du cercle -->
<div id="car-pause"></div>

<!-- BOUTONS DE TEST (Debug) -->
<div style="margin-top: 5px; opacity: 0.7; text-align: center;">
    <button onclick="manualTrigger()" style="cursor:pointer; font-size:10px; color:red; background:none; border:none;">
        🚨 Test Voix
    </button>
</div>

<script>
// --- LOGIQUE JS ---

// Simulation manuelle
function manualTrigger() {
    document.dispatchEvent(new CustomEvent('trigger-alert'));
}

document.addEventListener('DOMContentLoaded', () => {
    // Récupération ID
    let uid = "<?php echo isset($id) ? $id : ''; ?>";
    if (!uid) uid = new URLSearchParams(window.location.search).get('uid');
    
    if (!uid) {
        document.getElementById('level-info').innerHTML = "Erreur ID";
        return;
    }

    const display = document.getElementById('timer-display');
    const info = document.getElementById('level-info');
    const levelNameDisplay = document.getElementById('level-name');
    const pauseInfo = document.getElementById('car-pause');
    const progressCircle = document.getElementById('progress-circle');
    
    // Circonférence pour le cercle (2 * PI * 180)
    const circumference = 2 * Math.PI * 180;
    
    let seconds = 0;
    let totalDuration = 0; // Durée totale du niveau en secondes
    let isPaused = false;
    let lastLevelId = null;
    let currentBlindsName = "";

    // 2. FONCTION ALERTE VOCALE
    function playAlert() {
        let textToSpeak = "Changement de niveau. ";
        
        if (currentBlindsName && currentBlindsName !== "default") {
             // Si c'est une pause (0/0, 0-0 ou contient PAUSE)
            if (currentBlindsName === "0/0" || currentBlindsName === "0-0" || currentBlindsName.toUpperCase().includes("PAUSE")) {
                textToSpeak += "C'est la pause.";
            } else {
                // Remplace le slash par " " pour une meilleure prononciation
                // Ex: "100/200" devient "Blindes 100 200"
                let blinds = currentBlindsName.replace('-', 'et ');
                textToSpeak += "Blinde, " + blinds;
            }
        }
        
        console.log("Speaking: " + textToSpeak);
        if (typeof responsiveVoice !== 'undefined') {
            // Stratégie de sélection de voix V4 (Spécial iOS - Thomas/Amelie)
            var voice = "French Female"; // Valeur sûre par défaut
            var voices = responsiveVoice.getVoices();
            
            var foundMale = false;
            var foundThomas = null;
            var foundAmelie = null;
            var foundFrench = null;
            
            for (var i = 0; i < voices.length; i++) {
                var v = voices[i];
                var name = v.name || "";
                var lang = v.lang || "";
                
                if (name === "French Male") foundMale = true;
                if (name.indexOf("Thomas") !== -1) foundThomas = name;
                if (name.indexOf("Amelie") !== -1) foundAmelie = name;
                
                // Détection par code langue
                if (!foundFrench && (lang.indexOf("fr") === 0 || name.indexOf("French") !== -1)) {
                    foundFrench = name;
                }
            }
            
            if (foundMale) voice = "French Male";
            else if (foundThomas) voice = foundThomas;
            else if (foundAmelie) voice = foundAmelie;
            else if (foundFrench) voice = foundFrench;
            
            console.log("Voix sélectionnée : " + voice);
            responsiveVoice.speak(textToSpeak, voice);
        } else {
            console.warn("ResponsiveVoice non chargé");
        }
    }
    document.addEventListener('trigger-alert', playAlert);

    // 3. MISE A JOUR AFFICHAGE (Chaque seconde)
    function updateTimer() {
        if (!isPaused && seconds > 0) {
            seconds--;
        }
        
        // Affichage Heure
        if (isPaused) {
            display.innerText = "PAUSE";
            display.classList.add('paused');
            display.style.color = ""; // Laisser la classe .paused gérer la couleur
        } else {
            let m = Math.floor(seconds / 60).toString().padStart(2, '0');
            let s = (seconds % 60).toString().padStart(2, '0');
            display.innerText = `${m}:${s}`;
            display.classList.remove('paused');
        }

        // Mise à jour du Cercle de Progression
        if (totalDuration > 0) {
            // Calcul du temps écoulé
            let elapsed = totalDuration - seconds;
            // Pourcentage d'avancement (0 à 1)
            let progress = elapsed / totalDuration;
            // Limites
            if (progress < 0) progress = 0;
            if (progress > 1) progress = 1;
            
            // Calcul de l'offset (Plein -> Vide ou Vide -> Plein ?)
            // L'image suggère une barre qui se remplit (bleu sur fond noir)
            // Si on veut qu'elle se remplisse : offset va de circumference à 0
            // Offset = circumference * (1 - progress)
            
            const offset = circumference * (1 - progress);
            progressCircle.style.strokeDashoffset = offset;

            // CHANGEMENT DE COULEUR (2 dernières minutes)
            if (seconds <= 120 && seconds > 0) {
                progressCircle.style.stroke = "#ff0000";
                progressCircle.style.filter = "drop-shadow(0 0 10px #ff0000)";
                display.style.color = "#ff0000";
            } else {
                progressCircle.style.stroke = "#00d2ff";
                progressCircle.style.filter = "drop-shadow(0 0 10px #00d2ff)";
                display.style.color = "#00d2ff";
            }
        } else {
            progressCircle.style.strokeDashoffset = circumference; // Vide si pas de durée
        }
    }

    // 4. SYNCHRONISATION API (Toutes les 5s)
    async function sync() {
        // Bloquer la sync si l'utilisateur interagit avec la molette
        if (typeof syncLocked !== 'undefined' && syncLocked) return;

        try {
            const res = await fetch(`timer-api.php?uid=${uid}`);
            if (!res.ok) return;
            const data = await res.json();
            
            if (data.status === 'error') return;

            isPaused = data.is_paused;
            currentBlindsName = data.blinds_raw || "default";
            
            // Mise à jour Durée Totale et Nom du Niveau
            if (data.duration_seconds) totalDuration = parseInt(data.duration_seconds);
            if (data.level_name) levelNameDisplay.innerText = data.level_name;
            else levelNameDisplay.innerText = "Niveau --";

            // Mise à jour Stats Joueurs
            const statsZone = document.getElementById('zone-stats');
            if (statsZone && data.players_active !== undefined) {
                statsZone.innerHTML = `${data.players_active} <a href="fullscreen-player.php?uid=${uid}" style="color:white; text-decoration:underline; cursor:pointer;">Joueurs</a> / ${data.players_total} &nbsp;|&nbsp; <span style="color:white">Stack Moyen </span> ${data.avg_stack}`;
            }

            // Sync du temps restant
            if (!isPaused && Math.abs(seconds - data.seconds_remaining) > 2) {
                seconds = data.seconds_remaining;
            } else if (isPaused) {
                seconds = data.seconds_remaining;
            }

            // Affichage Blindes
            let txt = data.blinds_text;
            if (data.ante_text) txt += `<div class="ante-text">${data.ante_text}</div>`;
            info.innerHTML = txt;

            // Affichage Pause
            if (pauseInfo) {
                let pVal = data.next_pause || "";
                let displayText = "";
                let isBreak = (data.blinds_raw === "0/0" || data.blinds_raw === "0-0" || data.blinds_text === "PAUSE");
                
                if (isBreak && seconds > 0) {
                    let d = new Date();
                    d.setSeconds(d.getSeconds() + seconds);
                    let endH = d.getHours().toString().padStart(2, '0');
                    let endM = d.getMinutes().toString().padStart(2, '0');
                    displayText = `Reprise du jeu : ${endH}:${endM}`;
                } 
                else if (pVal) {
                    let matchAbs = pVal.match(/^(\d{1,2}):(\d{2})/);
                    let isRelative = pVal.toLowerCase().includes("dans");

                    if (matchAbs) {
                        let h = parseInt(matchAbs[1]);
                        let m = parseInt(matchAbs[2]);
                        let now = new Date();
                        let target = new Date();
                        target.setHours(h); target.setMinutes(m); target.setSeconds(0);
                        let diffMs = target - now;
                        let diffMins = Math.max(0, Math.floor(diffMs / 60000));
                        displayText = `Pause <span style="color:white">dans</span> ${diffMins} <span style="color:white">Minutes, Soit</span> ${h.toString().padStart(2,'0')}h${m.toString().padStart(2,'0')}`;
                    } 
                    else if (isRelative) {
                        let matchH = pVal.match(/(\d+)\s*h/);
                        let matchM = pVal.match(/(\d+)\s*m/);
                        let addH = matchH ? parseInt(matchH[1]) : 0;
                        let addM = matchM ? parseInt(matchM[1]) : 0;
                        let totalMinutes = (addH * 60) + addM;
                        let d = new Date();
                        d.setHours(d.getHours() + addH); d.setMinutes(d.getMinutes() + addM);
                        let pauseH = d.getHours().toString().padStart(2, '0');
                        let pauseM = d.getMinutes().toString().padStart(2, '0');
                        displayText = `Pause <span style="color:white">dans</span> ${totalMinutes} <span style="color:white">Minutes, Soit</span> ${pauseH}h${pauseM}`;
                    } else {
                        displayText = pVal;
                    }
                }
                pauseInfo.innerHTML = displayText;
            }

            // Son au changement de niveau
            if (lastLevelId !== null && lastLevelId !== data.level_id && data.level_id !== 0) {
                playAlert();
            }
            lastLevelId = data.level_id;

        } catch (e) { console.error(e); }
    }

    setInterval(updateTimer, 1000);
    setInterval(sync, 5000);
    sync();

    // --- GESTION DE LA MOLETTE (SOURIS) ---
    let syncLocked = false;
    let scrollTimeout;
    let pendingMinutes = 0;
    let unlockSyncTimeout;

    const container = document.querySelector('.timer-circle-container');
    
    if (container) {
        container.addEventListener('wheel', (e) => {
            e.preventDefault();
            
            // 1. Bloquer la synchro serveur pour éviter les sauts
            syncLocked = true;
            clearTimeout(unlockSyncTimeout);
            
            // 2. Déterminer le sens (Haut = Ajout, Bas = Retrait)
            // deltaY < 0 : Scroll vers le haut
            const direction = e.deltaY < 0 ? 1 : -1;
            
            // 3. Accumuler les minutes à envoyer
            pendingMinutes += direction;
            
            // 4. Mise à jour visuelle immédiate (Feedback)
            seconds += direction * 60;
            if (seconds < 0) seconds = 0;
            updateTimer();
            
            // 5. Debounce : Envoyer la requête quand le scroll s'arrête (500ms)
            clearTimeout(scrollTimeout);
            scrollTimeout = setTimeout(() => {
                if (pendingMinutes !== 0) {
                    // Envoi de la requête AJAX (sans recharger la page)
                    // On utilise 'ajax_ignore' pour le paramètre 'sou' car on ignore la réponse
                    fetch(`modif-horloge.php?act=${uid}&min=${pendingMinutes}&sou=ajax_ignore`)
                        .then(() => {
                            console.log(`Temps mis à jour : ${pendingMinutes} min`);
                            pendingMinutes = 0;
                        })
                        .catch(err => console.error("Erreur update temps", err));
                }
                
                // Réactiver la synchro après 2 secondes (laisser le temps au serveur de traiter)
                unlockSyncTimeout = setTimeout(() => { 
                    syncLocked = false; 
                    sync(); // Forcer une sync pour être sûr d'être calé
                }, 2000);
                
            }, 500);
        }, { passive: false });

        // --- GESTION DU CLIC (PAUSE/RESUME) ---
        // Active le clic pour pause UNIQUEMENT si on n'est pas sur voir-blindes.php
        // (Sur voir-blindes.php, le clic sert à ouvrir le fullscreen)
        if (!window.location.href.includes('voir-blindes.php')) {
            container.addEventListener('click', (e) => {
                e.preventDefault();
                e.stopPropagation(); // Empêche la propagation

                // Bloquer la synchro
                syncLocked = true;
                clearTimeout(unlockSyncTimeout);

                // Déterminer l'action (Inverse de l'état actuel)
                const script = isPaused ? 'de-pause.php' : 'en-pause.php';
                
                // Mise à jour visuelle immédiate
                isPaused = !isPaused;
                updateTimer();

                // Appel AJAX
                fetch(`${script}?act=${uid}&sou=ajax_ignore`)
                    .then(() => console.log("Pause/Resume actionné"))
                    .catch(err => console.error("Erreur Pause/Resume", err))
                    .finally(() => {
                        // Réactiver la synchro après 1.5 seconde
                        unlockSyncTimeout = setTimeout(() => { 
                            syncLocked = false; 
                            sync(); 
                        }, 1500);
                    });
            });
        }
    }
});
</script>
