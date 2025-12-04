<?php
// On garde juste la session et l'ID, le reste est géré par JS/API
session_start();
$id = intval($_GET['uid']);
$_SESSION["act"] = $id;
?>

<!-- Conteneur du Timer -->
<div class="timer-container" style="position: relative; text-align: center; padding: 20px;">
    
    <!-- Bouton pour activer l'audio (obligatoire sur les navigateurs modernes) -->
    <div id="audio-overlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.7); z-index: 100; display: flex; justify-content: center; align-items: center; border-radius: 8px; cursor: pointer;">
        <button class="btn btn-success btn-lg">
            <i class="fa fa-volume-up"></i> Activer le Son & Démarrer
        </button>
    </div>

    <!-- Affichage du Temps -->
    <div id="timer-display" style="color: red; font-size: 160px; font-weight: normal; line-height: 1;">
        --:--
    </div>
    
    <!-- Affichage des infos du niveau (Blindes / Ante) -->
    <div id="level-info" style="font-size: 80px; color: #ffc107 !important; margin-top: 10px;">
        Chargement...
    </div>

    <!-- Élément Audio caché -->
    <audio id="blind-alert-sound" preload="auto">
        <source src="/blinde.mp3" type="audio/mpeg">
    </audio>
</div>

<script>
class PokerTimer {
    constructor(activityId) {
        this.activityId = activityId;
        this.displayElement = document.getElementById('timer-display');
        this.infoElement = document.getElementById('level-info');
        this.audioElement = document.getElementById('blind-alert-sound');
        this.audioOverlay = document.getElementById('audio-overlay');
        
        this.secondsRemaining = 0;
        this.isPaused = false;
        this.lastLevelId = null;
        this.audioEnabled = false;
        this.currentBlindsRaw = ""; // Pour stocker "100/200"
        
        this.syncInterval = null;
        this.countdownInterval = null;

        this.init();
    }

    init() {
        // Gestion du clic pour activer l'audio (Politique Autoplay Navigateur)
        this.audioOverlay.addEventListener('click', () => {
            this.enableAudio();
            this.audioOverlay.style.display = 'none';
            this.start();
        });

        // Premier chargement visuel
        this.syncWithServer();
    }

    enableAudio() {
        // On joue un son vide ou on met en pause immédiatement pour "débloquer" l'audio context
        this.audioElement.play().then(() => {
            this.audioElement.pause();
            this.audioElement.currentTime = 0;
            this.audioEnabled = true;
            console.log("Audio activé avec succès");
        }).catch(e => console.error("Erreur activation audio:", e));
    }

    playAlert() {
        if (!this.audioEnabled) return;

        const defaultSound = "/bblinde.mp3";
        
        // 1. Construire le nom du fichier spécifique
        // On remplace les "/" par des "-" (ex: "100/200" devient "100-200.mp3")
        let cleanName = this.currentBlindsRaw ? this.currentBlindsRaw.replace(/\//g, '-').trim() : "default";
        let specificSound = "/" + cleanName + ".mp3";

        console.log("Tentative de lecture : " + specificSound);

        // 2. Gestionnaire d'erreur : Si le son spécifique n'existe pas, on joue le défaut
        this.audioElement.onerror = () => {
            // Eviter une boucle infinie si le son par défaut plante aussi
            if (this.audioElement.src.includes(defaultSound)) {
                console.error("Impossible de lire le son par défaut.");
                return;
            }
            console.log("Fichier spécifique non trouvé, repli sur : " + defaultSound);
            this.audioElement.src = defaultSound;
            this.audioElement.play();
        };

        // 3. Essayer de jouer le son spécifique
        this.audioElement.src = specificSound;
        this.audioElement.play().catch(e => {
            console.error("Erreur lecture:", e);
        });
    }

    start() {
        // Synchroniser avec le serveur toutes les 5 secondes
        this.syncInterval = setInterval(() => this.syncWithServer(), 5000);
        
        // Décompte local chaque seconde pour la fluidité
        this.countdownInterval = setInterval(() => this.tick(), 1000);
        
        this.syncWithServer(); // Appel immédiat
    }

    async syncWithServer() {
        try {
            const response = await fetch(`timer-api.php?uid=${this.activityId}`);
            const data = await response.json();

            if (data.status === 'success') {
                this.isPaused = data.is_paused;
                this.currentBlindsRaw = data.blinds_raw || data.blinds_text; // Récupérer le nom brut
                
                if (!this.isPaused) {
                    if (Math.abs(this.secondsRemaining - data.seconds_remaining) > 2) {
                        this.secondsRemaining = data.seconds_remaining;
                    }
                }

                let infoText = data.blinds_text;
                if (data.ante_text) infoText += ` <span style="color:blue">${data.ante_text}</span>`;
                this.infoElement.innerHTML = infoText;

                // Détection changement de niveau pour le son
                if (this.lastLevelId !== null && this.lastLevelId !== data.level_id && data.level_id !== 0) {
                    this.playAlert();
                }
                this.lastLevelId = data.level_id;

            } else if (data.status === 'finished') {
                this.secondsRemaining = 0;
                this.infoElement.innerHTML = "Tournoi Terminé";
                this.stop();
            }

            this.updateDisplay();

        } catch (error) {
            console.error("Erreur de sync:", error);
        }
    }

    tick() {
        if (!this.isPaused && this.secondsRemaining > 0) {
            this.secondsRemaining--;
            
            // Alerte sonore quand on arrive à 0
            if (this.secondsRemaining === 0) {
                // On force une synchro serveur immédiate pour récupérer le NOUVEAU niveau
                // et donc jouer le son du nouveau niveau
                setTimeout(() => {
                    this.syncWithServer().then(() => {
                        // playAlert sera déclenché par syncWithServer via la détection de changement d'ID
                    });
                }, 500); 
            }
        }
        this.updateDisplay();
    }

    updateDisplay() {
        if (this.isPaused) {
            this.displayElement.innerHTML = "PAUSE";
            this.displayElement.style.color = "orange";
            return;
        }

        this.displayElement.style.color = "red";
        
        if (this.secondsRemaining < 0) this.secondsRemaining = 0;

        const minutes = Math.floor(this.secondsRemaining / 60);
        const seconds = this.secondsRemaining % 60;

        const fmtMin = minutes.toString().padStart(2, '0');
        const fmtSec = seconds.toString().padStart(2, '0');

        this.displayElement.innerHTML = `${fmtMin}:${fmtSec}`;
    }

    stop() {
        clearInterval(this.syncInterval);
        clearInterval(this.countdownInterval);
    }
}

// Démarrage
document.addEventListener('DOMContentLoaded', () => {
    const timer = new PokerTimer(<?php echo $id; ?>);
});
</script>
