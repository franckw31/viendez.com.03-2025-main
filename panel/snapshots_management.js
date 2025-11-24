// Fonction pour sauvegarder les blindes actuelles
function saveSnapshot() {
    var snapshotName = document.getElementById('snapshotName').value.trim();
    
    if (!snapshotName) {
        alert('Veuillez entrer un nom pour la sauvegarde');
        return;
    }
    
    // Récupérer l'ID de l'activité depuis l'URL
    var urlParams = new URLSearchParams(window.location.search);
    var id_activite = urlParams.get('uid');
    
    $.ajax({
        url: 'save_blindes_snapshot.php',
        type: 'POST',
        data: {
            id_activite: id_activite,
            snapshot_name: snapshotName
        },
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success') {
                alert('Sauvegarde créée avec succès');
                document.getElementById('snapshotName').value = '';
                loadSnapshots();
            } else {
                alert('Erreur: ' + response.message);
            }
        },
        error: function(xhr, status, error) {
            alert('Erreur lors de la création de la sauvegarde');
            console.error('Erreur:', error);
        }
    });
}

// Fonction pour charger les sauvegardes disponibles
function loadSnapshots() {
    var urlParams = new URLSearchParams(window.location.search);
    var id_activite = urlParams.get('uid');
    
    $.ajax({
        url: 'get_blindes_snapshots.php?id_activite=' + id_activite,
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            var snapshotsList = document.getElementById('snapshots-list');
            
            if (response.status === 'success' && response.snapshots.length > 0) {
                var html = '';
                response.snapshots.forEach(function(snapshot) {
                    html += '<div style="padding: 8px; border-bottom: 1px solid #eee; display: flex; justify-content: space-between; align-items: center;">';
                    html += '<div style="flex: 1;">';
                    html += '<strong>' + snapshot.name + '</strong><br/>';
                    html += '<small style="color: #999;">' + snapshot.created_at + '</small>';
                    html += '</div>';
                    html += '<button class="btn btn-sm btn-info" onclick="restoreSnapshot(' + snapshot.id + ')" style="margin-left: 8px;">';
                    html += '<i class="fa fa-undo"></i> Restaurer';
                    html += '</button>';
                    html += '<button class="btn btn-sm btn-danger" onclick="deleteSnapshot(' + snapshot.id + ')" style="margin-left: 5px;">';
                    html += '<i class="fa fa-trash"></i>';
                    html += '</button>';
                    html += '</div>';
                });
                snapshotsList.innerHTML = html;
            } else {
                snapshotsList.innerHTML = '<p style="margin: 0; color: #999; font-size: 12px;">Aucune sauvegarde disponible</p>';
            }
        },
        error: function(xhr, status, error) {
            console.error('Erreur lors du chargement des sauvegardes:', error);
        }
    });
}

// Fonction pour restaurer une sauvegarde
function restoreSnapshot(snapshotId) {
    if (confirm('Êtes-vous sûr de vouloir restaurer cette sauvegarde ? Cela remplacera toutes les blindes actuelles.')) {
        var urlParams = new URLSearchParams(window.location.search);
        var id_activite = urlParams.get('uid');
        
        $.ajax({
            url: 'restore_blindes_snapshot.php',
            type: 'POST',
            data: {
                snapshot_id: snapshotId,
                id_activite: id_activite
            },
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    alert('Sauvegarde restaurée avec succès');
                    setTimeout(function() {
                        location.reload();
                    }, 1000);
                } else {
                    alert('Erreur: ' + response.message);
                }
            },
            error: function(xhr, status, error) {
                alert('Erreur lors de la restauration');
                console.error('Erreur:', error);
            }
        });
    }
}

// Fonction pour supprimer une sauvegarde
function deleteSnapshot(snapshotId) {
    if (confirm('Êtes-vous sûr de vouloir supprimer cette sauvegarde ?')) {
        $.ajax({
            url: 'delete_blindes_snapshot.php',
            type: 'POST',
            data: {
                snapshot_id: snapshotId
            },
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    alert('Sauvegarde supprimée');
                    loadSnapshots();
                } else {
                    alert('Erreur: ' + response.message);
                }
            },
            error: function(xhr, status, error) {
                alert('Erreur lors de la suppression');
                console.error('Erreur:', error);
            }
        });
    }
}

// Charger les sauvegardes au chargement de la page
document.addEventListener('DOMContentLoaded', function() {
    if (document.getElementById('snapshots-list')) {
        loadSnapshots();
    }
});
