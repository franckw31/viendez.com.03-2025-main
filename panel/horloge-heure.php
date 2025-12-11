<?php
// IMPORTANT : PAS DE session_start() ICI !
// Ce fichier est inclus dans une page qui a déjà démarré la session.
// Le remettre provoquerait une Erreur 500 immédiate.

if(isset($_GET['uid'])) {
    $id = intval($_GET['uid']);
}
?>

<!-- Conteneur propre -->
<div id="clock-wrapper" style="position: relative; text-align: center; width: 100%;">
    <!-- HEURE -->
    <div id="timer-display">
        --:--
    </div>
    
    <!-- BLINDES -->
    <div id="level-info">
        Chargement...
    </div>

    <!-- INFO PAUSE (Style géré par fullscreen-timer.php désormais) -->
    <div id="car-pause"></div>

    <!-- BOUTONS DE TEST (Visibles uniquement pour debug) -->
    <div style="margin-top: 5px; opacity: 0.7;">
        <!-- <button onclick="forceTestSound()" style="cursor:pointer; font-size:10px;">
            🔊 Test Fichier
        </button> -->
        <button onclick="manualTrigger()" style="cursor:pointer; font-size:10px; color:red;">
            🚨 Ecouter Blindes
        </button>
    </div>

    <!-- Lecteur Audio par DÉFAUT (Son générique si le spécifique n'existe pas) -->
    <audio id="blind-alert-sound" preload="auto">
        <!-- On essaie plusieurs chemins possibles pour trouver le fichier -->
        
        <source src="/blinde.mp3" type="audio/mpeg">
        <source src="blinde.mp3" type="audio/mpeg">
        
    </audio>
</div>

<script>
// Test simple du fichier par défaut
function forceTestSound() {
    const audio = document.getElementById('blind-alert-sound');
    audio.volume = 1.0;
    audio.currentTime = 0;
    audio.play().then(() => console.log("Test OK")).catch(e => alert("Erreur lecture: " + e));
}

// Simulation manuelle d'un changement de niveau
function manualTrigger() {
    console.log("Simulation alerte...");
    // On appelle la fonction interne via un événement personnalisé ou on la rend globale
    // Ici on va tricher en accédant à la fonction définie dans le scope
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
    const pauseInfo = document.getElementById('car-pause');
    const audio = document.getElementById('blind-alert-sound');
    
    let seconds = 0;
    let isPaused = false;
    let lastLevelId = null;
    let audioEnabled = false;
    let currentBlindsName = "";

    // 1. DÉBLOCAGE AUDIO
    function unlockAudio() {
        if(!audioEnabled) {
            // On joue et on coupe tout de suite pour "chauffer" le moteur audio
            audio.volume = 1.0;
            audio.play().then(() => {
                audio.pause();
                audio.currentTime = 0;
                audioEnabled = true;
            }).catch((e) => {});
        }
    }
    document.addEventListener('click', unlockAudio);
    document.addEventListener('touchstart', unlockAudio);

    // 2. FONCTION INTELLIGENTE
    function playAlert() {
        // Nom du fichier espéré : /200-400.mp3
        let cleanName = currentBlindsName.replace('/', '-');
        let specificSound = "/" + cleanName + ".mp3";
        
        console.log("ALERTE ! Tentative lecture : " + specificSound);

        let tempAudio = new Audio(specificSound);
        tempAudio.volume = 1.0;
        
        tempAudio.play().then(() => {
            console.log("--> Son spécifique trouvé et joué !");
        }).catch((e) => {
            console.log("--> Son spécifique introuvable, lecture du son par défaut.");
            audio.volume = 1.0;
            audio.currentTime = 0;
            audio.play().catch(err => console.error("Erreur totale : ", err));
        });
    }

    // Ecouteur pour le bouton de test manuel
    document.addEventListener('trigger-alert', playAlert);

    function updateTimer() {
        if (!isPaused && seconds > 0) {
            seconds--;
            let m = Math.floor(seconds / 60).toString().padStart(2, '0');
            let s = (seconds % 60).toString().padStart(2, '0');
            display.innerText = `${m}:${s}`;
        } else if (isPaused) {
            display.innerText = "PAUSE";
            display.classList.add('paused');
        }
    }

    async function sync() {
        try {
            const res = await fetch(`timer-api.php?uid=${uid}`);
            if (!res.ok) return;
            const data = await res.json();
            
            if (data.status === 'error') return;

            isPaused = data.is_paused;
            currentBlindsName = data.blinds_raw || "default";

            if (!isPaused && Math.abs(seconds - data.seconds_remaining) > 2) {
                seconds = data.seconds_remaining;
            } else if (isPaused) {
                seconds = data.seconds_remaining;
            }

            let txt = data.blinds_text;
            if (data.ante_text) txt += ` <span class="ante-text">${data.ante_text}</span>`;
            info.innerHTML = txt;

            if (pauseInfo) {
                let pVal = data.next_pause || "";
                let displayText = "";

                // Si on est en pause (blindes 0/0), on affiche l'heure de reprise calculée via le timer
                let isBreak = (data.blinds_raw === "0/0" || data.blinds_raw === "0-0" || data.blinds_text === "PAUSE");
                
                if (isBreak && seconds > 0) {
                    let d = new Date();
                    d.setSeconds(d.getSeconds() + seconds);
                    let endH = d.getHours().toString().padStart(2, '0');
                    let endM = d.getMinutes().toString().padStart(2, '0');
                    displayText = `Reprise du jeu : ${endH}:${endM}`;
                } 
                else if (pVal) {
                    // 1. Essai format absolu HH:MM au début
                    let matchAbs = pVal.match(/^(\d{1,2}):(\d{2})/);
                    
                    // 2. Essai format relatif "Pause dans Xh Ym"
                    let isRelative = pVal.toLowerCase().includes("dans");

                    if (matchAbs) {
                        let h = parseInt(matchAbs[1]);
                        let m = parseInt(matchAbs[2]);
                        
                        let d = new Date();
                        d.setHours(h);
                        d.setMinutes(m + 10);
                        
                        let endH = d.getHours().toString().padStart(2, '0');
                        let endM = d.getMinutes().toString().padStart(2, '0');
                        
                        displayText = `${h.toString().padStart(2,'0')}:${m.toString().padStart(2,'0')} (+ 3 Mains = ${endH}:${endM})`;
                    } 
                    else if (isRelative) {
                        // Extraction des heures et minutes restantes dans le texte "Pause dans..."
                        let matchH = pVal.match(/(\d+)\s*h/);
                        let matchM = pVal.match(/(\d+)\s*m/);
                        
                        let addH = matchH ? parseInt(matchH[1]) : 0;
                        let addM = matchM ? parseInt(matchM[1]) : 0;

                        // Calcul de l'heure de la pause
                        let d = new Date();
                        d.setHours(d.getHours() + addH);
                        d.setMinutes(d.getMinutes() + addM);
                        
                        let pauseH = d.getHours().toString().padStart(2, '0');
                        let pauseM = d.getMinutes().toString().padStart(2, '0');

                        // Calcul de l'heure de reprise (+10 min)
                        d.setMinutes(d.getMinutes() + 10);
                        let endH = d.getHours().toString().padStart(2, '0');
                        let endM = d.getMinutes().toString().padStart(2, '0');

                        displayText = `Pause à ${pauseH}:${pauseM} (+ 3 Mains = ${endH}:${endM})`;
                    } else {
                        displayText = pVal;
                    }
                }
                pauseInfo.innerText = displayText;
            }

            // --- DETECTION CHANGEMENT DE NIVEAU ---
            // On ne joue le son que si l'ID change ET que ce n'est pas le premier chargement (lastLevelId != null)
            if (lastLevelId !== null && lastLevelId !== data.level_id && data.level_id !== 0) {
                playAlert();
            }
            
            lastLevelId = data.level_id;
            // --------------------------------------

            if (isPaused) display.classList.add('paused');
            else display.classList.remove('paused');

            let m = Math.floor(seconds / 60).toString().padStart(2, '0');
            let s = (seconds % 60).toString().padStart(2, '0');
            if (!isPaused) display.innerText = `${m}:${s}`;

        } catch (e) { console.error(e); }
    }

    setInterval(updateTimer, 1000);
    setInterval(sync, 5000);
    sync();
});
</script>
