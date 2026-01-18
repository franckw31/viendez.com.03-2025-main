<?php
error_reporting(E_ALL);
ini_set('display_errors', 0);
ini_set('log_errors', 1);

session_start();

if (strlen($_SESSION['id']) == 0) {
    header('location:logout.php');
} else {
    if (!defined('DB_CONFIG')) {
        define('DB_CONFIG', [
            'host'     => 'localhost',
            'user'     => 'root',
            'password' => 'Kookies7*',
            'name'     => 'dbs9616600',
            'charset'  => 'utf8mb4'
        ]);
    }
    
    include('include/config.php');
    $qui = $_SESSION['id'];

    function getDBConnection() {
        static $conn = null;
        if ($conn === null) {
            $conn = mysqli_connect(DB_CONFIG['host'], DB_CONFIG['user'], DB_CONFIG['password'], DB_CONFIG['name']);
            if (!$conn) die('Erreur de connexion : ' . mysqli_connect_error());
            mysqli_set_charset($conn, DB_CONFIG['charset']);
        }
        return $conn;
    }

    function isUserAuthorized($user_id, $id_activite) {
        static $auth_cache = [];
        $cache_key = "$user_id:$id_activite";
        
        if (isset($auth_cache[$cache_key])) {
            return $auth_cache[$cache_key];
        }
        
        try {
            $conn = getDBConnection();
            
            // Vérifier si l'utilisateur est admin (droits = 2)
            $is_admin = false;
            $admin_sql = "SELECT droits FROM membres WHERE `id-membre` = " . (int)$user_id . " LIMIT 1";
            $admin_check = mysqli_query($conn, $admin_sql);
            
            if ($admin_check && mysqli_num_rows($admin_check) > 0) {
                $admin_row = mysqli_fetch_assoc($admin_check);
                $is_admin = ((int)$admin_row['droits'] == 2);
            }
            
            // Si admin, autoriser directement
            if ($is_admin) {
                $auth_cache[$cache_key] = true;
                return true;
            }
            
            // Sinon, vérifier si l'utilisateur est l'organisateur de l'activité
            $is_organizer = false;
            if ($id_activite > 0) {
                $org_sql = "SELECT `id-membre` FROM activite WHERE `id-activite` = " . (int)$id_activite . " LIMIT 1";
                $organizer_check = mysqli_query($conn, $org_sql);
                
                if ($organizer_check && mysqli_num_rows($organizer_check) > 0) {
                    $organizer_row = mysqli_fetch_assoc($organizer_check);
                    $is_organizer = ((int)$organizer_row['id-membre'] == (int)$user_id);
                }
            }
            
            $auth_cache[$cache_key] = $is_organizer;
            return $is_organizer;
        } catch (Exception $e) {
            error_log("isUserAuthorized exception: " . $e->getMessage());
            return false;
        }
    }

    function formatFrenchDate($dateStr) {
        if (!$dateStr || $dateStr == '0000-00-00 00:00:00') return '-';
        $date = new DateTime($dateStr);
        $months = [
            1 => 'Janvier', 2 => 'Février', 3 => 'Mars', 4 => 'Avril', 5 => 'Mai', 6 => 'Juin',
            7 => 'Juillet', 8 => 'Août', 9 => 'Septembre', 10 => 'Octobre', 11 => 'Novembre', 12 => 'Décembre'
        ];
        $day = $date->format('j');
        $month = $months[(int)$date->format('n')];
        $hour = $date->format('G');
        $minute = $date->format('i');
        return "$day $month {$hour}h{$minute}";
    }

    function fetchParticipants() {
        $conn = getDBConnection();
        
        // Vérifier la structure de la table
        $check_sql = "SHOW COLUMNS FROM participation LIKE 'challenger'";
        $result = mysqli_query($conn, $check_sql);
        if (!$result || mysqli_num_rows($result) === 0) {
            error_log("Colonne challenger manquante - Exécuter fix_database.sql");
            return [];
        }
        
        $id_activite = isset($_REQUEST['id_activite']) ? (int)$_REQUEST['id_activite'] : 0;
        $where_clause = $id_activite > 0 ? "WHERE p.`id-activite` = $id_activite" : "";
        
        // Main query
        $query = "SELECT 
                    m.`id-membre`, 
                    COALESCE(p.challenger, 0) as challenger,
                    m.pseudo,
                    a.buyin,
                    a.bounty,
                    a.rake,
                    (a.buyin + a.bounty + a.rake + (CASE WHEN COALESCE(p.challenger, 0) = 1 THEN 5 ELSE 0 END)) as cout_in,
                    COALESCE(p.recave, 0) as recave,
                    COALESCE(p.classement, 1) as classement,
                    COALESCE(p.tf, 0) as tf,
                    COALESCE(p.points, 0) as points,
                    COALESCE(p.caisse_chal, 0) as caisse_chal,
                    COALESCE(p.anonyme, 0) as anonyme,
                    COALESCE(p.latereg, 0) as latereg,
                    p.valide,
                    p.option,
                    COALESCE(p.gain, 0) as gain,
                    p.ds
                FROM participation p
                JOIN membres m ON p.`id-membre` = m.`id-membre`
                LEFT JOIN activite a ON p.`id-activite` = a.`id-activite`
                $where_clause
                ORDER BY m.pseudo ASC";
        
        $result = mysqli_query($conn, $query);
        if (!$result) {
            error_log("Erreur SQL: " . mysqli_error($conn));
            return [];
        }
        
        $participants = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $participants[] = $row;
        }
        
        return $participants;
    }
    
    // Récupérer les infos pour les variables JavaScript
    $id_activite_request = isset($_REQUEST['id_activite']) ? (int)$_REQUEST['id_activite'] : 0;
    $rake_for_js = 0;
    $is_authorized_for_js = false;
    
    if ($id_activite_request > 0) {
        try {
            $conn = getDBConnection();
            $rake_query = "SELECT rake FROM activite WHERE `id-activite` = " . $id_activite_request;
            $rake_result = mysqli_query($conn, $rake_query);
            if ($rake_result && mysqli_num_rows($rake_result) > 0) {
                $row = mysqli_fetch_assoc($rake_result);
                $rake_for_js = (int)$row['rake'];
            }
            $is_authorized_for_js = isUserAuthorized($qui, $id_activite_request);
        } catch (Exception $e) {
            error_log("Error retrieving activity info: " . $e->getMessage());
            $is_authorized_for_js = false;
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin | Liste des participants</title>
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
    <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script>
        var activityRake = <?= json_encode($rake_for_js) ?>;
        var userCanEdit = <?= json_encode($is_authorized_for_js) ?>;
    </script>
    <style>
        /* Base Styles */
        .col-small {
            width: 80px !important;
            text-align: center;
        }
        .current-user {
            color: #0d6efd;
            font-weight: bold;
        }
        
        /* Table Styles */
        #employeeTable {
            font-size: 18px;
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
        }
        #employeeTable thead th {
            font-size: 14px;
            font-weight: bold;
            background-color: #f8f9fa;
            position: sticky;
            top: 0;
            z-index: 10;
            text-align: center;
            padding: 12px 8px;
            border: 1px solid #ddd;
        }
        #employeeTable tfoot th {
            font-size: 14px;
            font-weight: bold;
            background-color: #f8f9fa;
            text-align: center;
            padding: 10px 8px;
            border: 1px solid #ddd;
        }
        #employeeTable td {
            padding: 10px 8px;
            border: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
        }
        #employeeTable tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        #employeeTable tbody tr:hover {
            background-color: rgba(0, 123, 255, 0.1);
        }
        
        /* Rake Column Color */
        td:nth-child(9) {
            font-weight: bold;
            color: #28a745;
        }

        /* Controls & Layout */
        .table-container {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .table-controls {
            margin: 15px 0;
            display: flex;
            justify-content: flex-end;
        }
        .search-box {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 250px;
        }
        
        h1.mt-4 {
            font-size: 24px;
            font-weight: 700;
            color: #2c3e50;
            text-align: center;
            margin: 20px auto !important;
            padding: 15px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            text-transform: uppercase;
            max-width: 600px;
        }

        form.mb-4 {
            margin: 20px auto;
            max-width: 600px;
            padding: 15px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .col-lg-12 {
                padding: 0 15px;
            }
        }

        @media (max-width: 768px) {
            h1.mt-4 {
                font-size: 20px;
                margin: 10px auto !important;
                width: 95%;
            }
            form.mb-4 {
                width: 95%;
                padding: 10px;
            }
            form.mb-4 .d-flex {
                flex-direction: column;
                gap: 10px !important;
            }
            form.mb-4 .form-select, 
            form.mb-4 .btn {
                width: 100% !important;
                max-width: none;
            }
            .search-box {
                width: 100%;
            }
            #employeeTable {
                font-size: 14px;
            }
            #employeeTable thead th {
                font-size: 12px;
                padding: 8px 4px;
            }
            #employeeTable td {
                padding: 6px 4px;
            }
            .col-small {
                width: 50px !important;
                min-width: 50px;
            }
        }

        /* Utility Classes */
        .checkbox-cell {
            text-align: center;
        }
        .challenger-checkbox {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }
        .editable {
            cursor: pointer;
            position: relative;
        }
        .editable:hover::after {
            content: '✎';
            position: absolute;
            right: 2px;
            top: 2px;
            font-size: 10px;
            color: #999;
        }
        
        .editable.disabled {
            cursor: not-allowed;
            opacity: 0.6;
            background-color: #f0f0f0;
        }
        
        .editable.disabled:hover::after {
            content: '🔒';
            color: #ccc;
        }
        
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #28a745;
            color: white;
            padding: 12px 20px;
            border-radius: 4px;
            display: none;
            z-index: 10000;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .save-all-btn {
            margin: 20px auto;
            display: block;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: bold;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            transition: background 0.2s;
        }
        .save-all-btn:hover {
            background: #218838;
        }
    </style>
</head>
<body>
    <div class="notification" id="updateNotification">Modification enregistrée</div>
    <div id="app">
        <?php include('include/sidebar.php'); ?>
        <div class="app-content">
            <?php include('include/header.php'); ?>
            <div class="main-content">
                <div class="wrap-content container" id="container">
                    <div class="container-fluid container-fullw bg-white">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row margin-top-30">
                                    <div class="col-lg-12 col-md-12">
                                        <div class="panel panel-white">
                                            <div class="panel-body">
                                                <div id="layoutSidenav_content">
                                                    <main>
                                                        <div class="container-fluid px-4">
                                                            <h1 class="mt-4">Liste des Participants</h1>
                                                            <form method="post" class="mb-4">
                                                                <div class="d-flex align-items-center justify-content-start" style="gap: 10px;">
                                                                    <select name="id_activite" class="form-select" style="width: 300px;">
                                                                        <option value="0">Toutes les activités</option>
                                                                        <?php
                                                                        $conn = getDBConnection();
                                                                        $sql = "SELECT `id-activite`, `titre-activite`, date_depart FROM activite ORDER BY date_depart DESC";
                                                                        $result = mysqli_query($conn, $sql);
                                                                        while ($activite = mysqli_fetch_assoc($result)) {
                                                                            $selected = isset($_REQUEST['id_activite']) && $_REQUEST['id_activite'] == $activite['id-activite'] ? 'selected' : '';
                                                                            $date = date('d/m/Y', strtotime($activite['date_depart']));
                                                                            echo "<option value='{$activite['id-activite']}' $selected>{$date} - {$activite['titre-activite']}</option>";
                                                                        }
                                                                        ?>
                                                                    </select>
                                                                    <button type="submit" class="btn btn-primary ms-2">Filtrer</button>
                                                                </div>
                                                            </form>

                                                            <div class="card mb-4">
                                                                <div class="card-body">
                                                                    <div class="table-controls">
                                                                        <input type="text" id="tableSearch" class="search-box" placeholder="Rechercher...">
                                                                    </div>
                                                                    <div class="table-container">
                                                                        <table id="employeeTable" class="table table-hover">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>#</th>
                                                                                    <th>Présent</th>
                                                                                    <th>Option</th>
                                                                                    <th>Pseudo</th>
                                                                                    <th>Latereg</th>
                                                                                    <th>Date Inscription</th>
                                                                                    <th class="col-small">Buyin</th>
                                                                                    <th class="col-small">Bounty</th>
                                                                                    <th class="col-small">Rake</th>
                                                                                    <th class="col-small">Coût-In</th>
                                                                                    <th class="col-small">Classement</th>
                                                                                    <th class="col-small">Gains</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <?php foreach(fetchParticipants() as $index => $row): ?>
                                                                                <tr data-id="<?= $row['id-membre'] ?>">
                                                                                    <td><?= $index + 1 ?></td>
                                                                                    <td class="checkbox-cell">
                                                                                        <input type="checkbox" class="present-checkbox" 
                                                                                               <?= $row['option'] == 'Présent' ? 'checked' : '' ?>>
                                                                                    </td>
                                                                                    <td class="editable" data-field="option"><?= $row['option'] ?></td>
                                                                                    <td><?php 
                                                                                        $displayName = ($row['anonyme'] == 1 && $qui != $row['id-membre']) ? 'Anonyme' : $row['pseudo'];
                                                                                        echo ($qui == $row['id-membre']) ? 
                                                                                            '<span class="current-user">'.$displayName.'</span>' : 
                                                                                            $displayName; 
                                                                                    ?></td>
                                                                                    <td class="editable checkbox-cell" data-field="latereg"><?= $row['latereg'] ? 'Oui' : 'Non' ?></td>
                                                                                    <td><?= formatFrenchDate($row['ds']) ?></td>
                                                                                    <td class="col-small"><?= $row['buyin'] ?></td>
                                                                                    <td class="col-small"><?= $row['bounty'] ?></td>
                                                                                    <td class="col-small"><?= $row['rake'] ?></td>
                                                                                    <td class="editable col-small" data-field="cout_in"><?= $row['cout_in'] ?></td>
                                                                                    <td class="editable col-small" data-field="classement"><?= $row['classement'] ?></td>
                                                                                    <td class="editable col-small" data-field="gain"><?= $row['gain'] ?></td>
                                                                                </tr>
                                                                                <?php endforeach; ?>
                                                                            </tbody>
                                                                            <tfoot>
                                                                                <tr>
                                                                                    <th colspan="6" style="text-align:right">Total:</th>
                                                                                    <th class="col-small" data-total-field="buyin"></th>
                                                                                    <th class="col-small" data-total-field="bounty"></th>
                                                                                    <th class="col-small" data-total-field="rake"></th>
                                                                                    <th class="col-small" data-total-field="cout_in"></th>
                                                                                    <th class="col-small"></th>
                                                                                    <th class="col-small" data-total-field="gain"></th>
                                                                                </tr>
                                                                            </tfoot>
                                                                        </table>
                                                                    </div>
                                                                    <button type="button" class="save-all-btn" id="saveAllChanges">
                                                                        Valider toutes les modifications
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </main>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php include('include/footer.php'); ?>
        <?php include('include/setting.php'); ?>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/modernizr/modernizr.js"></script>
    <script src="vendor/jquery-cookie/jquery.cookie.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="vendor/switchery/switchery.min.js"></script>
    <script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
    <script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script src="vendor/autosize/autosize.min.js"></script>
    <script src="vendor/selectFx/classie.js"></script>
    <script src="vendor/selectFx/selectFx.js"></script>
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/form-elements.js"></script>
    <script>
        function showNotification(message) {
            const $notif = $('#updateNotification');
            $notif.text(message).fadeIn();
            setTimeout(() => $notif.fadeOut(), 2000);
        }

        function updateField(id_membre, field, value, callback) {
            const activite_id = $('select[name="id_activite"]').val();
            $.ajax({
                url: 'update_field.php',
                method: 'POST',
                data: {
                    id_membre: id_membre,
                    id_activite: activite_id,
                    field: field,
                    value: value
                },
                success: function(response) {
                    try {
                        const data = JSON.parse(response);
                        if (data.success) {
                            showNotification('Modification enregistrée');
                            if (callback) callback(true);
                        } else {
                            alert('Erreur : ' + (data.error || 'Erreur inconnue'));
                            console.error('Server error:', data);
                            if (callback) callback(false);
                        }
                    } catch(e) {
                        console.error('JSON parse error:', e);
                        console.error('Response was:', response);
                        alert('Erreur JSON: ' + response);
                        if (callback) callback(false);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX error:', {
                        status: status,
                        error: error,
                        statusCode: xhr.status,
                        responseText: xhr.responseText
                    });
                    alert('Erreur serveur: ' + xhr.responseText);
                    if (callback) callback(false);
                }
            });
        }

        function calculateTotals() {
            let totals = {
                buyin: 0, bounty: 0, rake: 0, cout_in: 0, gain: 0
            };

            $('#employeeTable tbody tr:visible').each(function() {
                const $row = $(this);
                totals.buyin += parseFloat($row.find('[data-field="buyin"]').text()) || 0;
                totals.bounty += parseFloat($row.find('[data-field="bounty"]').text()) || 0;
                totals.rake += parseFloat($row.find('[data-field="rake"]').text()) || 0;
                totals.cout_in += parseFloat($row.find('[data-field="cout_in"]').text()) || 0;
                totals.gain += parseFloat($row.find('[data-field="gain"]').text()) || 0;
            });

            const $tfoot = $('#employeeTable tfoot tr');
            $tfoot.find('[data-total-field="buyin"]').text(totals.buyin + ' €');
            $tfoot.find('[data-total-field="bounty"]').text(totals.bounty + ' €');
            $tfoot.find('[data-total-field="rake"]').text(totals.rake + ' €');
            $tfoot.find('[data-total-field="cout_in"]').text(totals.cout_in + ' €');
            $tfoot.find('[data-total-field="gain"]').text(totals.gain + ' €');
        }

        jQuery(document).ready(function () {
            Main.init();
            FormElements.init();
            calculateTotals();
            
            // Appliquer la classe "disabled" aux cellules éditables si l'utilisateur n'est pas autorisé
            if (!userCanEdit) {
                $('.editable').addClass('disabled');
                $('#saveAllChanges').prop('disabled', true).css('opacity', '0.5').css('cursor', 'not-allowed');
                $('.present-checkbox').prop('disabled', true);
            }

            // Fonction de recherche simple
            $('#tableSearch').on('keyup', function() {
                const searchText = $(this).val().toLowerCase();
                $('#employeeTable tbody tr').each(function() {
                    const text = $(this).text().toLowerCase();
                    $(this).toggle(text.indexOf(searchText) > -1);
                });
                calculateTotals();
            });

            // Ajouter cette fonction dans le script JavaScript
            function refreshRowData(row) {
                const id_membre = row.data('id');
                const activite_id = $('select[name="id_activite"]').val();
                
                $.ajax({
                    url: 'get_participant_data.php',
                    method: 'GET',
                    data: {
                        id_membre: id_membre,
                        id_activite: activite_id
                    },
                    success: function(response) {
                        try {
                            const data = JSON.parse(response);
                            if (data.success && data.data) {
                                // Mise à jour des cellules
                                row.find('td[data-field="cout_in"]').text(data.data.cout_in);
                                row.find('td[data-field="option"]').text(data.data.option);
                                row.find('td[data-field="latereg"]').text(data.data.latereg == 1 ? 'Oui' : 'Non');
                                row.find('td[data-field="classement"]').text(data.data.classement);
                                row.find('td[data-field="gain"]').text(data.data.gain);
                                row.find('.present-checkbox').prop('checked', data.data.option == 'Présent');
                                calculateTotals();
                            }
                        } catch(e) {
                            console.error('Error refreshing row:', e);
                        }
                    }
                });
            }

            // Click handler for editable cells
            $(document).on('click', '.editable', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                // Vérifier les permissions
                if (!userCanEdit) {
                    alert('Vous n\'avez pas la permission de modifier cette activité.\nSeuls l\'administrateur et l\'organisateur peuvent modifier les données.');
                    return;
                }
                
                const cell = $(this);
                if (cell.find('input').length) return;
                
                const currentValue = cell.text().trim().replace(' €', '');
                const field = cell.data('field');
                const activite_id = $('select[name="id_activite"]').val();
                
                if (!activite_id) {
                    alert('Veuillez sélectionner une activité');
                    return;
                }

                if (['latereg'].includes(field)) {
                    const newValue = currentValue === 'Oui' ? '0' : '1';
                    updateField(cell.closest('tr').data('id'), field, newValue, function(success) {
                        if (success) refreshRowData(cell.closest('tr')); // Rafraîchir toute la ligne
                    });
                    return;
                }
                
                cell.html(`<input type="text" value="${currentValue}" style="width:100%;text-align:center;">`);
                const input = cell.find('input');
                input.focus();

                input.on('blur', function() {
                    const newValue = $(this).val().trim();
                    if (newValue !== currentValue) {
                        updateField(cell.closest('tr').data('id'), field, newValue, function(success) {
                            if (success) {
                                refreshRowData(cell.closest('tr')); // Rafraîchir toute la ligne
                            } else {
                                cell.text(currentValue);
                            }
                        });
                    } else {
                        cell.text(currentValue);
                    }
                });

                input.on('keypress', function(e) {
                    if (e.which === 13) input.blur();
                });
            });

            // Click handler for present checkbox
            $(document).on('change', '.present-checkbox', function(e) {
                // Vérifier les permissions
                if (!userCanEdit) {
                    // Restaurer l'état précédent
                    $(this).prop('checked', !$(this).prop('checked'));
                    alert('Vous n\'avez pas la permission de modifier cette activité.\nSeuls l\'administrateur et l\'organisateur peuvent modifier les données.');
                    return;
                }
                
                const checkbox = $(this);
                const row = checkbox.closest('tr');
                const id_membre = row.data('id');
                const newStatus = checkbox.prop('checked') ? 'Actif' : 'Inactif';
                
                updateField(id_membre, 'valide', newStatus, function(success) {
                    if (success) {
                        refreshRowData(row);
                    } else {
                        checkbox.prop('checked', !checkbox.prop('checked'));
                    }
                });
            });

            // Save All button handler
            $('#saveAllChanges').on('click', function(e) {
                e.preventDefault();
                console.log('Save All button clicked');
                console.log('userCanEdit:', userCanEdit);
                console.log('Button disabled:', $(this).prop('disabled'));
                
                // Vérifier les permissions
                if (!userCanEdit) {
                    alert('Vous n\'avez pas la permission de modifier cette activité.\nSeuls l\'administrateur et l\'organisateur peuvent modifier les données.');
                    return;
                }
                
                const activite_id = $('select[name="id_activite"]').val();
                console.log('Activity ID:', activite_id);
                
                if (!activite_id) {
                    alert('Veuillez sélectionner une activité');
                    return;
                }

                if (!confirm('Êtes-vous sûr de vouloir valider toutes les modifications ?')) {
                    return;
                }

                const updates = [];
                $('#employeeTable tbody tr').each(function() {
                    const $row = $(this);
                    updates.push({
                        id_membre: $row.data('id'),
                        valide: $row.find('.present-checkbox').prop('checked') ? 'Actif' : 'Inactif'
                    });
                });

                console.log('Updates to send:', updates);
                
                if (!updates.length) {
                    alert('Aucune donnée à mettre à jour');
                    return;
                }

                console.log('Sending AJAX request...');
                console.log('Data to send:', {
                    id_activite: activite_id,
                    updates: JSON.stringify(updates)
                });

                $.ajax({
                    url: 'update_all_participants.php',
                    method: 'POST',
                    data: {
                        id_activite: activite_id,
                        updates: JSON.stringify(updates)
                    },
                    success: function(response) {
                        console.log('Raw response:', response);
                        try {
                            const data = JSON.parse(response);
                            console.log('Parsed response:', data);
                            if (data.success) {
                                showNotification('Toutes les modifications ont été enregistrées');
                                setTimeout(() => location.reload(), 1500);
                            } else {
                                alert('Erreur: ' + (data.error || 'Erreur inconnue'));
                                console.error('Server error:', data);
                            }
                        } catch(e) {
                            console.error('JSON parse error:', e);
                            console.error('Response:', response);
                            alert('Erreur JSON: ' + response);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('AJAX error details:', {
                            status: status,
                            error: error,
                            statusCode: xhr.status,
                            responseText: xhr.responseText
                        });
                        alert('Erreur serveur: ' + (xhr.responseText || status));
                    }
                });
            });
        });
    </script>
</body>
</html>
<?php } ?>