<?php
session_start();
error_reporting(0);
include('include/config.php');

if (strlen($_SESSION['id']) == 0) {
    header('location:logout.php');
} else {
    define('DB_CONFIG', [
        'host'     => 'localhost',
        'user'     => 'root',
        'password' => 'Kookies7*',
        'name'     => 'dbs9616600',
        'charset'  => 'utf8mb4'
    ]);
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

    function fetchParticipants() {
        $conn = getDBConnection();
        
        // Vérifier la structure de la table
        $check_sql = "SHOW COLUMNS FROM participation LIKE 'challenger'";
        $result = mysqli_query($conn, $check_sql);
        if (!$result || mysqli_num_rows($result) === 0) {
            error_log("Colonne challenger manquante - Exécuter fix_database.sql");
            return [];
        }
        
        $id_activite = isset($_POST['id_activite']) ? (int)$_POST['id_activite'] : 0;
        $where_clause = $id_activite > 0 ? "WHERE p.`id-activite` = $id_activite" : "";
        
        // Get rake value for activity
        $rake = 0;
        if ($id_activite > 0) {
            $rake_query = "SELECT rake FROM activite WHERE `id-activite` = $id_activite";
            $rake_result = mysqli_query($conn, $rake_query);
            if ($rake_result && $row = mysqli_fetch_assoc($rake_result)) {
                $rake = (int)$row['rake'];
            }
        }
        
        // Pass rake value to JavaScript
        echo "<script>var activityRake = " . json_encode($rake) . ";</script>";
        
        // Main query
        $query = "SELECT 
                    m.`id-membre`, 
                    COALESCE(p.challenger, 0) as challenger,
                    m.pseudo,
                    a.buyin,
                    a.bounty,
                    a.rake,
                    COALESCE(p.rake_0, 0) as rake_0,
                    COALESCE(p.rake_5, 0) as rake_5,
                    COALESCE(p.rake_10, 0) as rake_10,
                    COALESCE(p.rake_12, 0) as rake_12,
                    COALESCE(p.rake_15, 0) as rake_15,
                    COALESCE(p.rake_20, 0) as rake_20,
                    (a.buyin + a.bounty + a.rake + (CASE WHEN COALESCE(p.challenger, 0) = 1 THEN 5 ELSE 0 END)) as cout_in,
                    COALESCE(p.recave, 0) as recave,
                    COALESCE(p.classement, 1) as classement,
                    COALESCE(p.tf, 0) as tf,
                    COALESCE(p.points, 0) as points,
                    COALESCE(p.caisse_chal, 0) as caisse_chal
                FROM participation p
                JOIN membres m ON p.`id-membre` = m.`id-membre`
                LEFT JOIN activite a ON p.`id-activite` = a.`id-activite`
                $where_clause
                ORDER BY p.points DESC";
        
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
    <style>
        .col-small {
            width: 80px !important;
            text-align: center;
        }
        .current-user {
            color: #0d6efd;
            font-weight: bold;
        }
        tfoot tr th {
            text-align: center !important;
            padding: 8px !important;
        }
        #employeeTable {
            font-size: 20px;
            width: 100%;
            border-collapse: collapse;
        }
        #employeeTable thead th {
            font-size: 16px;
            font-weight: bold;
            background-color: #f5f5f5;
            position: sticky;
            top: 0;
        }
        #employeeTable tfoot th {
            font-size: 16px;
            font-weight: bold;
        }
        #employeeTable th, #employeeTable td {
            padding: 8px;
            border: 1px solid #ddd;
        }
        #employeeTable tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        #employeeTable tbody tr:hover {
            background-color: #f0f7ff;
        }
        .form-select, .btn {
            font-size: 16px;
        }
        .breadcrumb {
            font-size: 16px;
        }
        h1.mainTitle, h1.mt-4 {
            font-size: 24px;
        }
        .container-fluid.container-fullw.bg-white {
            background-color: transparent !important;
        }
        .panel-white {
            background: transparent !important;
        }
        .card {
            background: transparent !important;
        }
        .card-body {
            background: transparent !important;
        }
        .table {
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 4px;
        }
        .table thead th {
            background-color: #f8f9fa;
        }
        .table tbody tr:hover {
            background-color: rgba(0, 123, 255, 0.25);
        }
        .table-container {
            overflow-x: auto;
        }
        .table-controls {
            margin: 20px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .search-box {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 200px;
        }
        @media (max-width: 768px) {
            .col-lg-8 {
                width: 100% !important;
                padding: 0 10px;
            }
            
            #employeeTable {
                font-size: 14px;
            }

            .form-select {
                width: 100% !important;
            }

            .d-flex {
                flex-direction: column;
            }

            .btn-primary {
                width: 100%;
                margin-top: 10px;
            }

            .table-responsive {
                margin: 0 -10px;
                padding: 0 10px;
                width: calc(100% + 20px);
            }

            .col-small {
                width: 60px !important;
            }
        }

        @media (max-width: 480px) {
            #employeeTable {
                font-size: 12px;
            }

            .col-small {
                width: 45px !important;
            }

            h1.mainTitle, h1.mt-4 {
                font-size: 20px;
            }
        }
        h1.mt-4 {
            font-size: 26px;
            font-weight: 700;
            color: #2c3e50;
            text-align: center;
            margin: 30px auto !important;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            text-transform: uppercase;
            letter-spacing: 1px;
            max-width: 600px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        @media (max-width: 768px) {
            h1.mt-4 {
                font-size: 24px;
                margin: 15px auto !important;
                padding: 15px;
                width: calc(100% - 30px);
            }
        }
        .wrap-content {
            overflow-x: hidden;
        }
        
        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            max-width: 100%;
            margin: 0;
            padding: 0;
        }

        @media (max-width: 768px) {
            #employeeTable {
                width: 100% !important;
                min-width: 500px;
            }

            .col-lg-8 {
                padding: 0;
            }

            .container-fluid.px-4 {
                padding: 0 !important;
            }

            .card-body {
                padding: 0.5rem !important;
            }

            .col-small {
                width: 50px !important;
                min-width: 50px !important;
                padding: 4px !important;
            }

            td, th {
                padding: 4px !important;
                white-space: nowrap;
            }
        }

        html, body {
            overflow-x: hidden;
            width: 100%;
            position: relative;
        }

        .app-content, 
        .wrap-content,
        .container,
        .container-fluid,
        .row,
        .col-md-12,
        .panel-body,
        .card-body {
            max-width: 100%;
            padding-left: 0 !important;
            padding-right: 0 !important;
            margin-left: 0 !important;
            margin-right: 0 !important;
        }

        .table-responsive {
            margin: 0;
            border: none;
            width: 100%;
        }

        @media (max-width: 768px) {
            .container-fluid.px-4 {
                padding: 0 !important;
            }

            #employeeTable {
                display: block;
                width: 100% !important;
            }

            .col-small {
                min-width: auto !important;
            }

            td, th {
                padding: 4px !important;
                font-size: 12px;
            }
        }
        form.mb-4 {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px auto;
            max-width: 500px;
            padding: 15px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        form.mb-4 .d-flex {
            width: 100%;
            gap: 15px !important;
            justify-content: center !important;
        }

        form.mb-4 .form-select {
            max-width: 300px;
            flex: 1;
        }

        form.mb-4 .btn-primary {
            min-width: 100px;
        }

        @media (max-width: 768px) {
            form.mb-4 {
                margin: 10px;
                padding: 10px;
            }
            
            form.mb-4 .d-flex {
                flex-direction: column;
            }

            form.mb-4 .form-select {
                max-width: 100%;
            }
        }
        h1.mt-4 {
            margin: 0 auto 30px auto !important;
            max-width: 500px;
            width: 100%;
        }
        .table td {
            text-align: center;
        }
        td:nth-child(7),  /* rake_0 */
        td:nth-child(8),  /* rake_5 */
        td:nth-child(9),  /* rake_10 */
        td:nth-child(10), /* rake_12 */
        td:nth-child(11), /* rake_15 */
        td:nth-child(12)  /* rake_20 */ {
            font-size: 18px;
            color: #28a745;
        }
        .checkbox-cell {
            text-align: center;
            vertical-align: middle;
        }
        .challenger-checkbox {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }
        .editable {
            cursor: pointer;
            position: relative;
        }
        .editable:hover::after {
            content: '✎';
            position: absolute;
            right: 5px;
            color: #666;
        }
        .table tbody tr {
            cursor: default;
        }
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: rgba(40, 167, 69, 0.9);
            color: white;
            padding: 15px 25px;
            border-radius: 4px;
            display: none;
            z-index: 9999;
            animation: fadeInOut 2s ease-in-out;
            pointer-events: none;
        }
        
        @keyframes fadeInOut {
            0% { opacity: 0; }
            15% { opacity: 1; }
            85% { opacity: 1; }
            100% { opacity: 0; }
        }

        .save-all-btn {
            margin: 20px auto;
            display: block;
            padding: 10px 30px;
            font-size: 16px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
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
                                    <div class="col-lg-8 col-md-12">
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
                                                                            $selected = isset($_POST['id_activite']) && $_POST['id_activite'] == $activite['id-activite'] ? 'selected' : '';
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
                                                                                    <th style="display:none;">ID</th>
                                                                                    <th>Challenger</th>
                                                                                    <th>Pseudo</th>
                                                                                    <th class="col-small">Buyin</th>
                                                                                    <th class="col-small">Bounty</th>
                                                                                    <th class="col-small">Rake</th>
                                                                                    <th>Rake 0</th>
                                                                                    <th>Rake 5</th>
                                                                                    <th>Rake 10</th>
                                                                                    <th>Rake 12</th>
                                                                                    <th>Rake 15</th>
                                                                                    <th>Rake 20</th>
                                                                                    <th class="col-small">Coût-In</th>
                                                                                    <th class="col-small">Recave</th>
                                                                                    <th class="col-small">Classement</th>
                                                                                    <th class="col-small">TF</th>
                                                                                    <th>Points</th>
                                                                                    <th class="col-small">Cagnotte</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <?php foreach(fetchParticipants() as $index => $row): ?>
                                                                                <tr data-id="<?= $row['id-membre'] ?>">
                                                                                    <td><?= $index + 1 ?></td>
                                                                                    <td style="display:none;"><?= $row['id-membre'] ?></td>
                                                                                    <td class="checkbox-cell">
                                                                                        <input type="checkbox" class="challenger-checkbox" 
                                                                                               <?= $row['challenger'] ? 'checked' : '' ?>>
                                                                                    </td>
                                                                                    <td><?= ($qui == $row['id-membre']) ? 
                                                                                            '<span class="current-user">'.$row['pseudo'].'</span>' : 
                                                                                            $row['pseudo'] ?></td>
                                                                                    <td class="editable col-small" data-field="buyin"><?= $row['buyin'] ?></td>
                                                                                    <td class="editable col-small" data-field="bounty"><?= $row['bounty'] ?></td>
                                                                                    <td class="editable col-small" data-field="rake"><?= $row['rake'] ?></td>
                                                                                    <td class="editable checkbox-cell" data-field="rake_0"><?= $row['rake_0'] ? '1' : '0' ?></td>
                                                                                    <td class="editable checkbox-cell" data-field="rake_5"><?= $row['rake_5'] ? '1' : '0' ?></td>
                                                                                    <td class="editable checkbox-cell" data-field="rake_10"><?= $row['rake_10'] ? '1' : '0' ?></td>
                                                                                    <td class="editable checkbox-cell" data-field="rake_12"><?= $row['rake_12'] ? '1' : '0' ?></td>
                                                                                    <td class="editable checkbox-cell" data-field="rake_15"><?= $row['rake_15'] ? '1' : '0' ?></td>
                                                                                    <td class="editable checkbox-cell" data-field="rake_20"><?= $row['rake_20'] ? '1' : '0' ?></td>
                                                                                    <td class="editable col-small" data-field="cout_in"><?= $row['cout_in'] ?></td>
                                                                                    <td class="editable col-small" data-field="recave"><?= $row['recave'] ?></td>
                                                                                    <td class="editable col-small" data-field="classement"><?= $row['classement'] ?></td>
                                                                                    <td class="editable col-small" data-field="tf"><?= $row['tf'] ? '1' : '0' ?></td>
                                                                                    <td class="editable" data-field="points"><?= $row['points'] ?></td>
                                                                                    <td><?= $row['caisse_chal'] ?></td>
                                                                                </tr>
                                                                                <?php endforeach; ?>
                                                                            </tbody>
                                                                            <tfoot>
                                                                                <tr>
                                                                                    <th colspan="4" style="text-align:right">Total:</th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                    <th></th>
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
        jQuery(document).ready(function () {
            Main.init();
            FormElements.init();

            // Fonction de recherche simple
            $('#tableSearch').on('keyup', function() {
                const searchText = $(this).val().toLowerCase();
                $('#employeeTable tbody tr').each(function() {
                    const text = $(this).text().toLowerCase();
                    $(this).toggle(text.indexOf(searchText) > -1);
                });
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
                                row.find('td[data-field="classement"]').text(data.data.classement);
                                row.find('td[data-field="points"]').text(data.data.points);
                                row.find('td[data-field="tf"]').text(data.data.tf);
                                row.find('td[data-field="recave"]').text(data.data.recave);
                                row.find('td[data-field="cout_in"]').text(data.data.cout_in);
                                row.find('td[data-field="caisse_chal"]').text(data.data.caisse_chal);
                                row.find('.challenger-checkbox').prop('checked', data.data.challenger == 1);
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
                
                const cell = $(this);
                if (cell.find('input').length) return;
                
                const currentValue = cell.text().trim().replace(' €', '');
                const field = cell.data('field');
                const activite_id = $('select[name="id_activite"]').val();
                
                if (!activite_id) {
                    alert('Veuillez sélectionner une activité');
                    return;
                }

                if (['tf', 'rake_0', 'rake_5', 'rake_10', 'rake_12', 'rake_15', 'rake_20'].includes(field)) {
                    const newValue = currentValue === '1' ? '0' : '1';
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

            // Click handler for challenger checkbox
            $(document).on('change', '.challenger-checkbox', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                const checkbox = $(this);
                const row = checkbox.closest('tr');
                const id_membre = row.data('id');
                const newStatus = checkbox.prop('checked') ? 1 : 0;
                const activite_id = $('select[name="id_activite"]').val();

                if (!activite_id) {
                    alert('Veuillez sélectionner une activité');
                    checkbox.prop('checked', !newStatus);
                    return;
                }

                $.ajax({
                    url: 'update_challenger.php',
                    method: 'POST',
                    data: {
                        id_membre: id_membre,
                        id_activite: activite_id,
                        challenger: newStatus
                    },
                    success: function(response) {
                        try {
                            console.log('Response:', response);
                            const data = JSON.parse(response);
                            if (data.success) {
                                showNotification('Modification enregistrée');
                                refreshRowData(row); // Rafraîchir toute la ligne
                            } else {
                                checkbox.prop('checked', !newStatus);
                                alert('Erreur : ' + (data.error || 'Erreur inconnue'));
                            }
                        } catch(e) {
                            console.error('Parse error:', e);
                            checkbox.prop('checked', !newStatus);
                            alert('Erreur lors de la mise à jour');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Ajax error:', {xhr, status, error});
                        checkbox.prop('checked', !newStatus);
                        alert('Erreur lors de la mise à jour');
                    }
                });
            });

            // Save All button handler
            $('#saveAllChanges').on('click', function() {
                const activite_id = $('select[name="id_activite"]').val();
                
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
                        classement: $row.find('td[data-field="classement"]').text().trim(),
                        points: $row.find('td[data-field="points"]').text().trim(),
                        tf: $row.find('td[data-field="tf"]').text().trim(),
                        recave: $row.find('td[data-field="recave"]').text().trim(),
                        challenger: $row.find('.challenger-checkbox').prop('checked') ? 1 : 0
                    });
                });

                if (!updates.length) {
                    alert('Aucune donnée à mettre à jour');
                    return;
                }

                $.ajax({
                    url: 'update_all_participants.php',
                    method: 'POST',
                    data: {
                        id_activite: activite_id,
                        updates: JSON.stringify(updates)
                    },
                    success: function(response) {
                        try {
                            const data = JSON.parse(response);
                            if (data.success) {
                                showNotification('Toutes les modifications ont été enregistrées');
                                setTimeout(() => location.reload(), 1500);
                            } else {
                                alert('Erreur: ' + (data.error || 'Erreur inconnue'));
                            }
                        } catch(e) {
                            console.error(e);
                            alert('Erreur lors de la mise à jour');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error({xhr, status, error});
                        alert('Erreur lors de la mise à jour');
                    }
                });
            });
        });
    </script>
</body>
</html>
<?php } ?>