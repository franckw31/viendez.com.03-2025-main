<?php
session_start();
error_reporting(0);
include ('include/config.php');
if (strlen($_SESSION['id'] == 0)) {
    header('location:logout.php');
} else {

    
    if (isset($_POST['submit'])) {
        $idmembre = $_SESSION['id'];
        $titreactivite = $_POST['titre-activite'];
        $date_depart = $_POST['date_depart'];
        $heure_depart = $_POST['heure_depart'];
        $ville = $_POST['ville'];
        $places = $_POST['places'];
        $rake = $_POST['rake'];
        $buyin = $_POST['buyin'];
        $bounty = $_POST['bounty'];
        $recave = $_POST['recave'];
        $addon = $_POST['addon'];
        $ante = $_POST['ante'];
        $longitude = $_POST['longitude'];
        $latitude = $_POST['latitude'];
        //$commentaire = $_POST['commentaire'];
        $idstructure = $_POST['id-structure'];
        $jetons = $_POST['jetons'];
        $bonus = $_POST['bonus'];
        $addon = $_POST['addon'];
        date_default_timezone_set('Arctic/Longyearbyen');
        $departh = date("H:i:s", time());
        $departd = date("Y-m-d", time());
        $maintenant = date("Y-m-d H:i:s", time());
        echo "av insert";
        echo $longitude;
        echo $latitude;
        echo $departd;
        echo $departh;
        echo $maintenant;
        $msg = mysqli_query($con, "INSERT INTO `activite` (`id-activite`, `id-structure`, `id-membre`, `titre-activite`, `date_depart`, `heure_depart`, `ville`, `lng`, `lat`, `places`,  `buyin`, `rake`, `bounty`, `jetons`, `recave`, `addon`, `ante`, `bonus`) VALUES (NULL, '$idstructure', '$idmembre', '$titreactivite',  '$maintenant',  '$maintenant', '$ville', '$longitude', '$latitude', '$places', '$buyin', '$rake', '$bounty', '$jetons', '$recave', '$addon', '$ante', '$bonus')");
        $_SESSION['msg'] = "Activité ajoutée avec succés !!";
        echo "apres insert";
        $acti = mysqli_query($con, "SELECT `id-activite` FROM `activite` ORDER BY `id-activite` DESC");
        $choix = mysqli_fetch_assoc($acti);
        $numact = $choix['id-activite'];
        echo $numact;
        ?>
<script language="JavaScript" type="text/javascript">
window.location.replace("/panel/creation-blindes-init.php?act=<?php echo $numact ?>");
</script>';
<?php

        //    header('location:/panel/liste-activites.php');
        //    exit;
    }
    ;
    //Code Deletion
    if (isset($_GET['del'])) {
        $sid = $_GET['id'];
        mysqli_query($con, "delete from competences where id = '$sid'");
        $_SESSION['msg'] = "data deleted !!";
    }
    ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Admin | Ajout Activité</title>
    <link
        href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic"
        rel="stylesheet" type="text/css" />
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
</head>

<body>
    <div id="app">
        <?php include ('include/sidebar.php'); ?>
        <div class="app-content">
            <?php include ('include/header.php'); ?>
            <!-- end: TOP NAVBAR -->
            <div class="main-content">
                <div class="wwrap-content container" id="container">
                    <!-- start: PAGE TITLE -->
                    <section id="page-title">
                        <div class="row">
                            <!--<div class="col-sm-8">
                                <h1 class="mainTitle">Admin | AJOUTER PARTIE </h1>
                            </div>-->
                            <ol class="breadcrumb">
                                <li>
                                    <span>Admin</span>
                                </li>
                                <li class="active">
                                    <span>Ajouter PARTIE</span>
                                </li>
                            </ol>
                        </div>
                    </section>
                    <!-- end: PAGE TITLE -->
                    <!-- start: BASIC EXAMPLE -->
                    <?php $idorg = $_SESSION['id'];
                        $qorg = mysqli_query($con, "SELECT * FROM `membres` WHERE `id-membre` = $idorg");
                        $result = mysqli_fetch_assoc($qorg);
                        $org = $result['id-membre'];
                        ?>
                    <div class="container-fluid container-fullw bg-white">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row mmargin-top-30">
                                    <div class="col-lg-6 col-md-12">
                                        <div class="panel panel-white">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">NOUVELLE PARTIE : </h5>
                                            </div>
                                            <div class="panel-body">
                                                <p style="color:red;">
                                                    <?php echo htmlentities($_SESSION['msg']); ?>
                                                    <?php echo htmlentities($_SESSION['msg'] = ""); ?>
                                                    <?php echo "-" . $org . "-"; ?>
                                                </p>
                                                <form role="form" name="dcotorspcl" method="post">
                                                    <div class="card-body">
                                                        <table class="table table-bordered">
                                                            <tr>
                                                                <th>Titre</th>
                                                                <td>
                                                                    <input class="form-control" id="titre-activite"
                                                                        name="titre-activite" type="text"
                                                                        value="<?php echo $result['titre-activite']; ?>"
                                                                        required />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>Date</th>
                                                                <td><input class="form-control" id="date_depart"
                                                                        name="date_depart" type="date"
                                                                        value="<?php echo $result['date_depart']; ?>">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>Heure</th>
                                                                <td><input class="form-control" id="heure_depart"
                                                                        name="heure_depart" type="date"
                                                                        value="<?php echo $result['heure_depart']; ?>">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>Ville</th>
                                                                <td><input class="form-control" id="ville" name="ville"
                                                                        type="text"
                                                                        value="<?php echo $result['ville']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Longitude</th>
                                                                <td><input class="form-control" id="longitude"
                                                                        name="longitude" type="text"
                                                                        value="<?php echo $result['longitude']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Latitude</th>
                                                                <td><input class="form-control" id="latitude"
                                                                        name="latitude" type="text"
                                                                        value="<?php echo $result['latitude']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Nb Joueurs Max</th>
                                                                <td><input class="form-control" id="places"
                                                                        name="places" type="text"
                                                                        value="<?php echo $result['def_nbj']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Buyin</th>
                                                                <td><input class="form-control" id="buyin" name="buyin"
                                                                        type="text"
                                                                        value="<?php echo $result['def_buy']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Rake</th>
                                                                <td><input class="form-control" id="rake" name="rake"
                                                                        type="text"
                                                                        value="<?php echo $result['def_rak']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Bounty</th>
                                                                <td><input class="form-control" id="bounty"
                                                                        name="bounty" type="text"
                                                                        value="<?php echo $result['def_bou']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Nb Recave</th>
                                                                <td><input class="form-control" id="recave"
                                                                        name="recave" type="text"
                                                                        value="<?php echo $result['def_rec']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Addon</th>
                                                                <td><input class="form-control" id="addon" name="addon"
                                                                        type="text"
                                                                        value="<?php echo $result['def_add']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Ante</th>
                                                                <td><input class="form-control" id="ante" name="ante"
                                                                        type="text"
                                                                        value="<?php echo $result['def_ant']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Structure</th>
                                                                <td><input class="form-control" id="id-structure"
                                                                        name="id-structure" type="text"
                                                                        value="<?php echo $result['defstr']; ?>"
                                                                        required />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>Stack</th>
                                                                <td><input class="form-control" id="jetons"
                                                                        name="jetons" type="text"
                                                                        value="<?php echo $result['def_jet']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Bonus</th>
                                                                <td><input class="form-control" id="bonus" name="bonus"
                                                                        type="text"
                                                                        value="<?php echo $result['def_bon']; ?>"
                                                                        required /></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" style="text-align:center ;"><button
                                                                        type="submit" class="btn btn-primary btn-block"
                                                                        name="submit">Creation</button></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end: BASIC EXAMPLE -->
            <!-- end: SELECT BOXES -->
        </div>
        <!-- start: FOOTER -->
        <?php include ('include/footer.php'); ?>
        <!-- end: FOOTER -->
        <!-- start: SETTINGS -->
        <?php include ('include/setting.php'); ?>
        <!-- end: SETTINGS -->
    </div>
    <!-- start: MAIN JAVASCRIPTS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/modernizr/modernizr.js"></script>
    <script src="vendor/jquery-cookie/jquery.cookie.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="vendor/switchery/switchery.min.js"></script>
    <!-- end: MAIN JAVASCRIPTS -->
    <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
    <script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script src="vendor/autosize/autosize.min.js"></script>
    <script src="vendor/selectFx/classie.js"></script>
    <script src="vendor/selectFx/selectFx.js"></script>
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
    <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <!-- start: CLIP-TWO JAVASCRIPTS -->
    <script src="assets/js/main.js"></script>
    <!-- start: JavaScript Event Handlers for this page -->
    <script src="assets/js/form-elements.js"></script>
    <script>
    jQuery(document).ready(function() {
        Main.init();
        FormElements.init();
    });
    </script>
    <!-- end: JavaScript Event Handlers for this page -->
    <!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>
<?php } ?>