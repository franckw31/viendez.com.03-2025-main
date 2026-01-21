<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
session_start();

include('include/config.php');

// Check if user is logged in
if (strlen($_SESSION['id']) == 0) {
    header('location:logout.php');
    exit;
}

// Check if user is admin
$is_admin = (isset($_SESSION['role']) && ($_SESSION['role'] === 'admin' || $_SESSION['role'] === 'superadmin')) || (isset($_SESSION['id']) && intval($_SESSION['id']) === 265);

if (!$is_admin) {
    header('location:../index.php');
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Tombolas</title>
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            background-color: #1a1a1a;
            color: white;
            padding: 20px;
        }
        .panel {
            background-color: #222;
            border-color: #444;
        }
        .panel-heading {
            background-color: #2e6da4;
            border-color: #2e6da4;
            color: white;
        }
        .table {
            background-color: #2a2a2a;
            color: white;
            border: 1px solid #444;
            margin-bottom: 20px;
        }
        .table thead th {
            background-color: #2e6da4;
            color: white;
            border-color: #444;
            padding: 15px;
            font-weight: bold;
            text-align: center;
        }
        .table thead th a {
            color: white;
            text-decoration: none;
            cursor: pointer;
            padding: 5px 10px;
            border-radius: 3px;
            transition: background-color 0.2s;
        }
        .table thead th a:hover {
            background-color: rgba(255,255,255,0.1);
        }
        .table tbody tr {
            border-bottom: 1px solid #444;
            transition: background-color 0.2s;
        }
        .table tbody tr:hover {
            background-color: #333;
        }
        .table tbody tr.table-success {
            background-color: rgba(76, 175, 80, 0.1);
            border-left: 4px solid #4CAF50;
        }
        .table tbody tr.table-success:hover {
            background-color: rgba(76, 175, 80, 0.2);
        }
        .table tbody tr.table-warning {
            background-color: rgba(255, 152, 0, 0.1);
            border-left: 4px solid #FF9800;
        }
        .table tbody tr.table-warning:hover {
            background-color: rgba(255, 152, 0, 0.2);
        }
        .table tbody td {
            border-color: #444;
            padding: 12px 15px;
        }
        h2 {
            color: #2e6da4;
            margin-bottom: 20px;
            text-align: center;
            font-size: 28px;
            border-bottom: 2px solid #2e6da4;
            padding-bottom: 10px;
        }
        h3 {
            color: #2e6da4;
            font-size: 20px;
            border-left: 4px solid #2e6da4;
            padding-left: 10px;
        }
        .container-wrapper {
            max-width: 100%;
            margin: 0 auto;
        }
        .stat-row {
            display: flex;
            gap: 20px;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        .stat-card {
            flex: 1;
            min-width: 200px;
            background: linear-gradient(135deg, #2e6da4, #1e4a7a);
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #444;
            text-align: center;
        }
        .stat-card strong {
            display: block;
            font-size: 14px;
            color: #aaa;
            margin-bottom: 10px;
        }
        .stat-card .value {
            display: block;
            font-size: 28px;
            font-weight: bold;
            color: #4CAF50;
        }
        .stat-card.warning .value {
            color: #FF9800;
        }
        .stat-card.danger .value {
            color: #F44336;
        }
        .stat-card.success .value {
            color: #4CAF50;
        }
        .badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }
        .badge-success {
            background-color: #4CAF50;
            color: white;
        }
        .badge-danger {
            background-color: #F44336;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container-wrapper">
        <div class="panel panel-white">
            <div class="panel-heading">
                <h2 style="color: white; margin: 0;">Gestion Globale des Tombolas</h2>
            </div>
            <div class="panel-body">
                <?php
                echo htmlentities($_SESSION['msg'] = "");
                
                // Gestion du tri
                $sort_by = isset($_GET['sort']) ? $_GET['sort'] : 'pseudo';
                $sort_order = isset($_GET['order']) && $_GET['order'] === 'DESC' ? 'DESC' : 'ASC';
                $next_order = ($sort_order === 'ASC') ? 'DESC' : 'ASC';
                
                // Fonction pour générer les liens de tri
                function getSortLink($column, $label, $current_sort, $current_order) {
                    $next_order = ($current_sort === $column && $current_order === 'ASC') ? 'DESC' : 'ASC';
                    $arrow = '';
                    if ($current_sort === $column) {
                        $arrow = ($current_order === 'ASC') ? ' ▲' : ' ▼';
                    }
                    return '<a href="?sort=' . $column . '&order=' . $next_order . '" style="color: white; text-decoration: none; cursor: pointer;">' . $label . $arrow . '</a>';
                }
                ?>
                
                <!-- Tableau complet de tous les tickets de tombolas -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th><?php echo getSortLink('pseudo', 'Membre', $sort_by, $sort_order); ?></th>
                                <th><?php echo getSortLink('qrcode', 'QRcode', $sort_by, $sort_order); ?></th>
                                <th><?php echo getSortLink('valeur', 'Valeur', $sort_by, $sort_order); ?></th>
                                <th><?php echo getSortLink('date', 'Date', $sort_by, $sort_order); ?></th>
                                <th>Titre Activité</th>
                                <th><?php echo getSortLink('aff_rake', 'Aff. Rake', $sort_by, $sort_order); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            try {
                                // Récupérer tous les tickets de tombolas de tous les membres
                                $query = "SELECT 
                                    ci.`id`,
                                    ci.`id-indiv` as id_indiv,
                                    ci.`id_col`,
                                    ci.`aff_rake`,
                                    ci.`date`,
                                    c.`nom` as qrcode,
                                    c.`valeur`,
                                    m.`pseudo`,
                                    m.`fname`,
                                    m.`lname`
                                    FROM `collections-individu` ci
                                    JOIN `collections` c ON ci.`id_col` = c.`id_collection`
                                    JOIN `membres` m ON ci.`id-indiv` = m.`id-membre`
                                    ORDER BY " . ($sort_by === 'valeur' ? 'c.valeur' : ($sort_by === 'qrcode' ? 'c.nom' : ($sort_by === 'aff_rake' ? 'ci.aff_rake' : 'm.' . $sort_by))) . " $sort_order";
                                
                                $result = mysqli_query($con, $query);
                                
                                if (!$result) {
                                    throw new Exception("Erreur requête: " . mysqli_error($con));
                                }
                                
                                $has_data = false;
                                
                                while ($row = mysqli_fetch_array($result)) {
                                    $has_data = true;
                                    $id_indiv = $row['id_indiv'];
                                    $id_col = $row['id_col'];
                                    $qrcode = $row['qrcode'];
                                    $valeur = $row['valeur'];
                                    $date = $row['date'];
                                    $pseudo = $row['pseudo'];
                                    $aff_rake = $row['aff_rake'];
                                    
                                    // Récupérer le titre de l'activité - date au format simple sans heure
                                    $date_simple = date('Y-m-d', strtotime($date));
                                    $activite_query = mysqli_query($con, "SELECT `titre-activite` FROM `activite` WHERE DATE(`date_depart`) = '$date_simple'");
                                    $activite_row = mysqli_fetch_array($activite_query);
                                    $titre_activite = $activite_row ? $activite_row['titre-activite'] : '-';
                                    
                                    // Déterminer la classe de style pour la ligne
                                    $row_class = (intval($aff_rake) === 1) ? 'table-success' : 'table-warning';
                                    $rake_label = (intval($aff_rake) === 1) ? '<span class="badge badge-success">OUI</span>' : '<span class="badge badge-danger">NON</span>';
                                    
                                    echo "<tr class='$row_class'>";
                                    echo "<td><strong><a href='voir-membre.php?id=$id_indiv' style='color: #2e6da4;'>" . htmlspecialchars($pseudo) . "</a></strong></td>";
                                    echo "<td>" . htmlspecialchars($qrcode) . "</td>";
                                    echo "<td>" . number_format($valeur, 2, ',', ' ') . " €</td>";
                                    echo "<td>" . date('d/m/Y', strtotime($date)) . "</td>";
                                    echo "<td>" . htmlspecialchars($titre_activite) . "</td>";
                                    echo "<td>" . $rake_label . "</td>";
                                    echo "</tr>";
                                }
                                
                                if (!$has_data) {
                                    echo "<tr><td colspan='6' style='text-align: center; padding: 20px; color: #ccc;'>Aucun ticket trouvé</td></tr>";
                                }
                                
                            } catch (Exception $e) {
                                echo "<tr><td colspan='6' style='text-align: center; color: #f00;'>Erreur: " . htmlspecialchars($e->getMessage()) . "</td></tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>

                <!-- Traitement du tirage au sort -->
                <?php
                if (isset($_POST['tirage_au_sort'])) {
                    $tirage_query = mysqli_query($con, "SELECT 
                        ci.`id`,
                        ci.`id-indiv` as id_indiv,
                        ci.`id_col`,
                        ci.`date`,
                        c.`nom` as qrcode,
                        c.`valeur`,
                        m.`pseudo`,
                        m.`fname`,
                        m.`lname`
                        FROM `collections-individu` ci
                        JOIN `collections` c ON ci.`id_col` = c.`id_collection`
                        JOIN `membres` m ON ci.`id-indiv` = m.`id-membre`
                        WHERE ci.`aff_rake` = 0 OR ci.`aff_rake` IS NULL
                        ORDER BY RAND() LIMIT 1");
                    
                    if ($tirage_query && mysqli_num_rows($tirage_query) > 0) {
                        $ticket_gagne = mysqli_fetch_array($tirage_query);
                        $pseudo_gagne = $ticket_gagne['pseudo'];
                        $qrcode_gagne = $ticket_gagne['qrcode'];
                        $valeur_ticket = $ticket_gagne['valeur'];
                        $date_gagnee = $ticket_gagne['date'];
                        
                        // Récupérer le titre de l'activité
                        $date_simple = date('Y-m-d', strtotime($date_gagnee));
                        $activite_query_tirage = mysqli_query($con, "SELECT `titre-activite` FROM `activite` WHERE DATE(`date_depart`) = '$date_simple'");
                        $activite_row_tirage = mysqli_fetch_array($activite_query_tirage);
                        $titre_gagnee = $activite_row_tirage ? $activite_row_tirage['titre-activite'] : '-';
                        
                        // Calculer le montant gagnant = somme de tous les tickets non affectés
                        $montant_total_query = mysqli_query($con, "SELECT SUM(c.`valeur`) as total FROM `collections-individu` ci JOIN `collections` c ON ci.`id_col` = c.`id_collection` WHERE ci.`aff_rake` = 0 OR ci.`aff_rake` IS NULL");
                        $montant_row = mysqli_fetch_array($montant_total_query);
                        $valeur_gagnee = $montant_row['total'] ?: 0;
                    }
                }
                ?>

                <!-- Ticket gagnant du tirage -->
                <?php if (isset($ticket_gagne)): ?>
                <div style="margin-top: 30px; padding: 25px; background: linear-gradient(135deg, #FFD700, #FFA500); border: 3px solid #FF8C00; border-radius: 15px; text-align: center; box-shadow: 0 8px 16px rgba(0,0,0,0.3);">
                    <h2 style="color: #8B4513; margin-top: 0; font-size: 32px; border: none;">🎉 TICKET GAGNANT! 🎉</h2>
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-top: 20px; background-color: rgba(255,255,255,0.95); padding: 20px; border-radius: 10px;">
                        <div style="text-align: left; padding: 10px; border-bottom: 2px solid #FFD700;">
                            <div style="color: #666; font-size: 12px; font-weight: bold; margin-bottom: 5px;">👤 MEMBRE</div>
                            <div style="color: #000; font-size: 18px; font-weight: bold;"><?php echo htmlspecialchars($pseudo_gagne); ?></div>
                        </div>
                        <div style="text-align: left; padding: 10px; border-bottom: 2px solid #FFD700;">
                            <div style="color: #666; font-size: 12px; font-weight: bold; margin-bottom: 5px;">📱 QRCODE</div>
                            <div style="color: #000; font-size: 16px; font-weight: bold;"><?php echo htmlspecialchars($qrcode_gagne); ?></div>
                        </div>
                        <div style="text-align: left; padding: 10px; border-bottom: 2px solid #FFD700;">
                            <div style="color: #666; font-size: 12px; font-weight: bold; margin-bottom: 5px;">📅 DATE</div>
                            <div style="color: #000; font-size: 16px; font-weight: bold;"><?php echo date('d/m/Y', strtotime($date_gagnee)); ?></div>
                        </div>
                        <div style="text-align: left; padding: 10px; border-bottom: 2px solid #FFD700;">
                            <div style="color: #666; font-size: 12px; font-weight: bold; margin-bottom: 5px;">🎮 ACTIVITÉ</div>
                            <div style="color: #000; font-size: 16px; font-weight: bold;"><?php echo htmlspecialchars($titre_gagnee); ?></div>
                        </div>
                        <div style="grid-column: 1 / -1; text-align: center; padding: 15px; background: linear-gradient(135deg, #4CAF50, #45a049); border-radius: 8px; margin-top: 10px;">
                            <div style="color: #fff; font-size: 14px; margin-bottom: 5px;">💰 MONTANT GAGNANT</div>
                            <div style="color: #fff; font-size: 32px; font-weight: bold;"><?php echo number_format($valeur_gagnee, 2, ',', ' '); ?> €</div>
                        </div>
                    </div>
                </div>
                <?php endif; ?>

                <!-- Tableau des tickets non affectés au Rake -->
                <div style="margin-top: 40px;">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                        <h3 style="color: #2e6da4; margin: 0;">Tickets Non Affectés au Rake</h3>
                        <form method="post" style="margin: 0;">
                            <button type="submit" name="tirage_au_sort" class="btn btn-warning btn-lg" style="font-weight: bold; font-size: 16px;">
                                🎲 Tirer au Sort
                            </button>
                        </form>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th><?php echo getSortLink('pseudo', 'Membre', $sort_by, $sort_order); ?></th>
                                    <th><?php echo getSortLink('qrcode', 'QRcode', $sort_by, $sort_order); ?></th>
                                    <th><?php echo getSortLink('valeur', 'Valeur', $sort_by, $sort_order); ?></th>
                                    <th><?php echo getSortLink('date', 'Date', $sort_by, $sort_order); ?></th>
                                    <th>Titre Activité</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                try {
                                    // Récupérer tous les tickets non affectés au Rake
                                    $query_not_rake = "SELECT 
                                        ci.`id`,
                                        ci.`id-indiv` as id_indiv,
                                        ci.`id_col`,
                                        ci.`date`,
                                        c.`nom` as qrcode,
                                        c.`valeur`,
                                        m.`pseudo`
                                        FROM `collections-individu` ci
                                        JOIN `collections` c ON ci.`id_col` = c.`id_collection`
                                        JOIN `membres` m ON ci.`id-indiv` = m.`id-membre`
                                        WHERE ci.`aff_rake` = 0 OR ci.`aff_rake` IS NULL
                                        ORDER BY " . ($sort_by === 'valeur' ? 'c.valeur' : ($sort_by === 'qrcode' ? 'c.nom' : 'm.' . $sort_by)) . " $sort_order";
                                    
                                    $result_not_rake = mysqli_query($con, $query_not_rake);
                                    
                                    if (!$result_not_rake) {
                                        throw new Exception("Erreur requête: " . mysqli_error($con));
                                    }
                                    
                                    $has_data_not_rake = false;
                                    
                                    while ($row_not = mysqli_fetch_array($result_not_rake)) {
                                        $has_data_not_rake = true;
                                        $id_indiv = $row_not['id_indiv'];
                                        $qrcode = $row_not['qrcode'];
                                        $valeur = $row_not['valeur'];
                                        $date = $row_not['date'];
                                        $pseudo = $row_not['pseudo'];
                                        
                                        // Récupérer le titre de l'activité - date au format simple sans heure
                                        $date_simple = date('Y-m-d', strtotime($date));
                                        $activite_query = mysqli_query($con, "SELECT `titre-activite` FROM `activite` WHERE DATE(`date_depart`) = '$date_simple'");
                                        $activite_row = mysqli_fetch_array($activite_query);
                                        $titre_activite = $activite_row ? $activite_row['titre-activite'] : '-';
                                        
                                        echo "<tr>";
                                        echo "<td><strong><a href='voir-membre.php?id=$id_indiv' style='color: #2e6da4;'>" . htmlspecialchars($pseudo) . "</a></strong></td>";
                                        echo "<td>" . htmlspecialchars($qrcode) . "</td>";
                                        echo "<td>" . number_format($valeur, 2, ',', ' ') . " €</td>";
                                        echo "<td>" . date('d/m/Y', strtotime($date)) . "</td>";
                                        echo "<td>" . htmlspecialchars($titre_activite) . "</td>";
                                        echo "</tr>";
                                    }
                                    
                                    if (!$has_data_not_rake) {
                                        echo "<tr><td colspan='5' style='text-align: center; padding: 20px; color: #ccc;'>Tous les tickets sont affectés au Rake</td></tr>";
                                    }
                                    
                                } catch (Exception $e) {
                                    echo "<tr><td colspan='5' style='text-align: center; color: #f00;'>Erreur: " . htmlspecialchars($e->getMessage()) . "</td></tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Résumé statistique -->
                <div style="margin-top: 50px;">
                    <h3>📊 Résumé Statistique</h3>
                    <div class="stat-row">
                        <?php
                        try {
                            // Total des tickets
                            $total_query = mysqli_query($con, "SELECT COUNT(*) as total FROM `collections-individu`");
                            $total_row = mysqli_fetch_array($total_query);
                            $total_tickets = $total_row['total'];
                            
                            // Tickets affectés au Rake
                            $rake_query = mysqli_query($con, "SELECT COUNT(*) as total FROM `collections-individu` WHERE `aff_rake` = 1");
                            $rake_row = mysqli_fetch_array($rake_query);
                            $rake_tickets = $rake_row['total'];
                            
                            // Tickets non affectés
                            $not_rake_tickets = $total_tickets - $rake_tickets;
                            
                            // Montants
                            $montant_total_query = mysqli_query($con, "SELECT SUM(c.`valeur`) as total FROM `collections-individu` ci JOIN `collections` c ON ci.`id_col` = c.`id_collection`");
                            $montant_row = mysqli_fetch_array($montant_total_query);
                            $montant_total = $montant_row['total'] ?: 0;
                            
                            $montant_rake_query = mysqli_query($con, "SELECT SUM(c.`valeur`) as total FROM `collections-individu` ci JOIN `collections` c ON ci.`id_col` = c.`id_collection` WHERE ci.`aff_rake` = 1");
                            $montant_rake_row = mysqli_fetch_array($montant_rake_query);
                            $montant_rake = $montant_rake_row['total'] ?: 0;
                            
                            $montant_not_rake = $montant_total - $montant_rake;
                            
                            echo '<div class="stat-card success">';
                            echo '<strong>📦 Total Tickets</strong>';
                            echo '<span class="value">' . $total_tickets . '</span>';
                            echo '</div>';
                            
                            echo '<div class="stat-card success">';
                            echo '<strong>✅ Affectés au Rake</strong>';
                            echo '<span class="value">' . $rake_tickets . '</span>';
                            echo '</div>';
                            
                            echo '<div class="stat-card warning">';
                            echo '<strong>❌ Non Affectés</strong>';
                            echo '<span class="value">' . $not_rake_tickets . '</span>';
                            echo '</div>';
                        } catch (Exception $e) {
                            echo '<div class="stat-card danger"><strong>Erreur</strong><span class="value">!</span></div>';
                        }
                        ?>
                    </div>

                    <div class="stat-row">
                        <?php
                        try {
                            echo '<div class="stat-card success">';
                            echo '<strong>💰 Montant Total</strong>';
                            echo '<span class="value">' . number_format($montant_total, 2, ',', ' ') . ' €</span>';
                            echo '</div>';
                            
                            echo '<div class="stat-card success">';
                            echo '<strong>✅ Montant Affecté</strong>';
                            echo '<span class="value">' . number_format($montant_rake, 2, ',', ' ') . ' €</span>';
                            echo '</div>';
                            
                            echo '<div class="stat-card warning">';
                            echo '<strong>❌ Montant Non Affecté</strong>';
                            echo '<span class="value">' . number_format($montant_not_rake, 2, ',', ' ') . ' €</span>';
                            echo '</div>';
                        } catch (Exception $e) {
                            echo '<div class="stat-card danger"><strong>Erreur</strong><span class="value">!</span></div>';
                        }
                        ?>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>
