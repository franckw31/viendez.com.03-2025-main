<?php
session_start();
error_reporting(0);
include(__DIR__ . '/include/config.php');
include(__DIR__ . '/../include/functions_logs.php');
$id = isset($_GET['id']) ? intval($_GET['id']) : intval($_GET['uid']);
$pseudo_get = isset($_GET['pseudo']) ? mysqli_real_escape_string($con, $_GET['pseudo']) : null;
$pass_get = isset($_GET['passwd']) ? mysqli_real_escape_string($con, $_GET['passwd']) : null;

// Authentification automatique via URL si paramètres fournis
if ($pseudo_get && $pass_get) {
	$q_auth = mysqli_query($con, "SELECT `id-membre`, `pseudo` FROM membres WHERE (pseudo = '$pseudo_get' OR email = '$pseudo_get') AND (password = '$pass_get' OR password_ext = '$pass_get')");
	if ($r_auth = mysqli_fetch_array($q_auth)) {
		$_SESSION['login'] = $r_auth['pseudo'];
		$_SESSION['id'] = $r_auth['id-membre'];
		$_SESSION['login_source'] = 'Quickview/QR';
		log_activity($con, "Auto-Login Quickview", "User: $pseudo_get via URL");
	} else {
		log_activity($con, "Auto-Login Failed Quickview", "Attempted User: $pseudo_get");
	}
}

// Si aucun ID n'est fourni, on cherche la prochaine activité
if ($id == 0) {
	$q_next = mysqli_query($con, "SELECT `id-activite` FROM activite WHERE date_depart >= NOW() ORDER BY date_depart ASC LIMIT 1");
	if (mysqli_num_rows($q_next) > 0) {
		$r_next = mysqli_fetch_array($q_next);
		$id = $r_next['id-activite'];
	} else {
		// Si aucune activité future, on prend la dernière passée
		$q_last = mysqli_query($con, "SELECT `id-activite` FROM activite ORDER BY date_depart DESC LIMIT 1");
		$r_last = mysqli_fetch_array($q_last);
		$id = $r_last['id-activite'];
	}
}

$query_act = mysqli_query($con, "SELECT * FROM activite WHERE `id-activite` = '$id'");
$row_act = mysqli_fetch_array($query_act);
$id_act = $row_act['id-activite'];
if (strlen($_SESSION['login']) == 0) {
	$_SESSION['redirect'] = 'panel/quickview.php?uid='.$id;
	header('location:logout.php');
} else {
	// Si l'ID n'est pas en session, on le récupère via le login
	if (!isset($_SESSION['id']) || $_SESSION['id'] == 0) {
		$login = $_SESSION['login'];
		$q_u = mysqli_query($con, "SELECT `id-membre` FROM membres WHERE pseudo = '$login'");
		$r_u = mysqli_fetch_array($q_u);
		$_SESSION['id'] = $r_u['id-membre'];
	}
	$user_id = $_SESSION['id'];
	log_activity($con, "Quickview Access", "Activity ID: $id_act");

	// Récupérer le statut actuel de participation
	$q_current = mysqli_query($con, "SELECT `option`, `anonyme`, `latereg` FROM participation WHERE `id-membre` = '$user_id' AND `id-activite` = '$id_act'");
	$r_current = mysqli_fetch_array($q_current);
	$current_status = $r_current ? $r_current['option'] : 'None';
	$current_anonyme = $r_current ? $r_current['anonyme'] : 0;
	$current_latereg = $r_current ? $r_current['latereg'] : 0;

	// Gestion de l'inscription rapide
	if(isset($_POST['quick_reg'])) {
		$user_id = intval($_SESSION['id']);
		$act_id = intval($row_act['id-activite']);
		$challenge_id = intval($row_act['id_challenge']);
		
		if ($user_id > 0 && $act_id > 0) {
			$check = mysqli_query($con, "SELECT * FROM participation WHERE `id-membre` = '$user_id' AND `id-activite` = '$act_id'");
			$exists = mysqli_num_rows($check) > 0;

			if(isset($_POST['status']) || isset($_POST['id_rake'])) {
				$status = isset($_POST['status']) ? mysqli_real_escape_string($con, $_POST['status']) : null;
				$id_rake = isset($_POST['id_rake']) ? intval($_POST['id_rake']) : null;
				$anonyme = isset($_POST['anonyme']) ? intval($_POST['anonyme']) : 0;
				$latereg = isset($_POST['latereg']) ? intval($_POST['latereg']) : 0;

				if($exists) {
					$update_fields = [];
					if($status !== null) {
						$val = ($status == 'None') ? 'Desinscrit' : $status;
						$update_fields[] = "`option` = '$val'";
						if ($val === 'Présent') {
							$update_fields[] = "`valide` = 'Actif'";
						} else {
							$update_fields[] = "`valide` = 'Inactif'";
						}
					}
					if($id_rake !== null) {
						$update_fields[] = "`id_rake` = '$id_rake'";
					}
					
					// Toujours mettre à jour le mode anonyme et latereg si fournis
					$update_fields[] = "`anonyme` = '$anonyme'";
					$update_fields[] = "`latereg` = '$latereg'";
					
					if(!empty($update_fields)) {
						$update_fields[] = "`ds` = NOW()";
						$sql = "UPDATE participation SET " . implode(", ", $update_fields) . " WHERE `id-membre` = '$user_id' AND `id-activite` = '$act_id'";
						mysqli_query($con, $sql);
						log_activity($con, "Quick Participation Update", "Activity ID: $act_id, Status: $status");
					}
				} else {
					// Création de la participation
					$m_q = mysqli_query($con, "SELECT pseudo FROM membres WHERE `id-membre` = '$user_id'");
					$m_r = mysqli_fetch_array($m_q);
					$m_name = mysqli_real_escape_string($con, $m_r['pseudo']);
					
					$q_ordre = mysqli_query($con, "SELECT MAX(ordre) as max_o FROM participation WHERE `id-activite` = '$act_id'");
					$r_ordre = mysqli_fetch_array($q_ordre);
					$next_ordre = intval($r_ordre['max_o']) + 1;
					
					$final_status = ($status !== null && $status != 'None') ? $status : 'None';
					$final_rake = ($id_rake !== null) ? $id_rake : 1;
					
					mysqli_query($con, "INSERT INTO participation (`id-membre`, `id-activite`, `nom-membre`, `option`, `id-challenge`, `ordre`, `valide`, `classement`, `id_rake`, `anonyme`, `latereg`, `ds`) 
										VALUES ('$user_id', '$act_id', '$m_name', '$final_status', '$challenge_id', '$next_ordre', 'Actif', '1', '$final_rake', '$anonyme', '$latereg', NOW())");
					log_activity($con, "Quick Participation Create", "Activity ID: $act_id, Status: $final_status");
				}
			}
		}
		header("Location: quickview.php?uid=".$id);
		exit;
	}
	?>
	<!DOCTYPE html>
	<html lang="en">
	<head>
		<title>Admin | Dashboard</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
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
		<link rel="stylesheet" href="vendor/sweetalert/sweet-alert.css">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
		
		<!-- Modern Dashboard CSS -->
		<link rel="stylesheet" href="assets/css/modern-dashboard.css">
		<style>
			.clip-radio.radio-square label:before, 
			.clip-radio.radio-square label:after {
				border-radius: 0 !important;
			}
			.radio-lightred input[type="radio"]:checked + label:after {
				background-color: #ff6666 !important;
			}
			.radio-lightred label:before {
				border-color: #ff6666 !important;
			}
		</style>
	</head>

	<body>
		<div id="app">
			<?php
			$fiche = $_SESSION['id'];
			include('include/sidebar.php');
			?>
			<div class="app-content">
				<?php include('include/header.php'); ?>
				
				<div class="main-content">
					<div class="wrap-content container" id="container">
						<!-- Page Title -->
						<section id="page-title">
							<div class="row">
								<div class="col-sm-12 text-center">
									<!-- <h1 class="mainTitle">Tableau de Bord</h1> -->
                                     <span class="mainDescription">.</span>
									<h2 class="mainTitle" style="color:white" >Bienvenue sur votre espace d'inscription</h2>
									<a href="fullscreen-timer.php?uid=<?php echo $id_act; ?>" style="text-decoration: none;">
										<h1 style="color: #3c6fdfff; font-weight: bold; margin-top: 10px; text-transform: uppercase; letter-spacing: 3px; font-size: 32px; text-shadow: 2px 2px 4px rgba(0,0,0,0.5);">
											<?php echo htmlentities($row_act['titre-activite']); ?>
										</h1>
									</a>
								</div>
								<!-- <ol class="breadcrumb">
									<li><span>Admin</span></li>
									<li class="active"><span>Dashboard</span></li>
								</ol> -->
							</div>
						</section>

						<!-- Stats Overview -->
						<div class="row">
							<div class="col-sm-4">
								<a href="prochaines-activites.php" class="dashboard-card card-blue">
									<div class="card-icon"><i class="fa fa-rocket" style="background: linear-gradient(45deg, #FF512F 0%, #DD2476 50%, #FF512F 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; display: inline-block;"></i></div>
									<div class="card-title"> Rdv: <?php echo date('d/m/Y H:i', strtotime($row_act['date_depart'])); ?></div>
									<div class="card-stat" style="font-size: 18px;">Buy-in: <?php echo htmlentities($row_act['buyin']); ?>€ , Rake: <?php echo htmlentities($row_act['rake']); ?>€</div>
									<div class="card-stat" style="font-size: 18px;">Recave(s): <?php echo htmlentities($row_act['recave']); ?> (<?php echo htmlentities($row_act['recave_montant']); ?>€)</div>
									<div class="card-description" style="color: rgba(255,255,255,0.8); margin-top: 5px;">
										<?php 
										$q_total_next = mysqli_query($con, "SELECT COUNT(*) as total FROM activite WHERE date_depart >= CURDATE()");
										$r_total_next = mysqli_fetch_array($q_total_next);
										echo $r_total_next['total'];
										?> activités à venir
									</div>
								</a>
							</div>
							<div class="col-sm-4">
								<a href="voir-activite.php?uid=<?php echo $id_act; ?>" class="dashboard-card card-orange">
									<div class="card-icon"><i class="fa fa-table"></i></div>
									<div class="card-title">Configuration</div>
									<div class="card-stat" style="font-size: 18px;">Nombre de tables: <?php echo htmlentities($row_act['nb-tables']); ?></div>
									<div class="card-stat" style="font-size: 18px;">Nombre de places: <?php echo htmlentities($row_act['places']); ?></div>
								</a>
							</div>
							<div class="col-sm-4">
								<a href="#" class="dashboard-card card-green">
									<div class="card-icon"><i class="fa fa-clock-o"></i></div>
									<div class="card-title">Horaires</div>
									<div class="card-stat" style="font-size: 18px;">Départ: <?php 
										$start_ts = strtotime($row_act['date_depart']);
										echo date('H:i', $start_ts);

										echo " , Fin Estimée: ";
										$q_total_min = mysqli_query($con, "SELECT SUM(minutes) as total FROM `blindes-live` WHERE `id-activite` = '$id_act'");
										$r_total_min = mysqli_fetch_array($q_total_min);
										$total_min = intval($r_total_min['total']);
										if ($total_min > 0) {
											echo date('H:i', $start_ts + ($total_min * 60));
										} else {
											echo "N/A";
										}
									?></div>
									<div class="card-stat" style="font-size: 18px;">Pause vers : <?php 
										$q_pause = mysqli_query($con, "SELECT `ordre` FROM `blindes-live` WHERE `id-activite` = '$id_act' AND (`sb` = 0 OR `nom` LIKE '%Pause%' OR `nom` LIKE '%Break%') ORDER BY `ordre` ASC LIMIT 1");
										if($r_pause = mysqli_fetch_array($q_pause)) {
											$p_ordre = $r_pause['ordre'];
											$q_min_pause = mysqli_query($con, "SELECT SUM(minutes) as total FROM `blindes-live` WHERE `id-activite` = '$id_act' AND `ordre` < $p_ordre");
											$r_min_pause = mysqli_fetch_array($q_min_pause);
											$min_pause = intval($r_min_pause['total']);
											echo date('H:i', $start_ts + ($min_pause * 60));
										} else {
											echo "N/A";
										}
									?></div>
								</a>
							</div>
						</div>

						<!-- Main Navigation Sections -->
						
						<!-- Gestion -->
						<div class="row">
							<div class="col-sm-4">
								<a href="voir-blindes.php?uid=<?php echo $id_act; ?>&tab=t3" class="dashboard-card">
									<div class="card-icon"><i class="fa fa-list-ol"></i></div>
									<div class="card-title" style="color: black;">Structure du Tournoi</div>
									<div class="card-stat" style="font-size: 14px; font-weight: normal; line-height: 1.2; color: black;">
										<?php 
                                        
										$id_str = $row_act['id_structure'];
										$q_str = mysqli_query($con, "SELECT nom, Detail FROM structure_modele WHERE id_modele_structure = '$id_str' LIMIT 1");
										if($r_str = mysqli_fetch_array($q_str)) {
											/* echo "<strong>" . htmlentities($r_str['nom']) . "</strong><br>"; */
											echo nl2br(htmlentities($r_str['Detail']));
										} else {
											echo "Aucune structure définie";
										}
										?>
									</div>
								</a>
							</div>
							<div class="col-sm-4">
								<a href="liste-participants-activite.php?id_activite=<?php echo $id_act; ?>" class="dashboard-card card-purple">
									<div class="card-icon"><i class="fa fa-users"></i></div>
									<div class="card-title">Inscriptions</div>
									<div class="card-stat" style="font-size: 18px;">
										<?php 
										$q_ins = mysqli_query($con, "SELECT COUNT(*) as total FROM participation WHERE `id-activite` = '$id_act' AND `option` IN ('Réservation', 'Inscrit', 'Confirmé', 'Eliminé', 'Présent')");
										$r_ins = mysqli_fetch_array($q_ins);
										$nb_inscrits = intval($r_ins['total']);
										
										$q_opt = mysqli_query($con, "SELECT COUNT(*) as total FROM participation WHERE `id-activite` = '$id_act' AND `option` = 'Option'");
										$r_opt = mysqli_fetch_array($q_opt);
										$nb_options = intval($r_opt['total']);
										
										$places_dispo = intval($row_act['places']) - $nb_inscrits;
										
										echo "Inscrits: " . $nb_inscrits . "<br>";
										echo "Option: " . $nb_options . "<br>";
										echo "Places Libres: " . ($places_dispo > 0 ? $places_dispo : 0);
										?>
									</div>
								</a>
							</div>
							<div class="col-sm-4">
								<div class="dashboard-card card-orange">
									<div class="card-icon"><i class="fa fa-cutlery"></i></div>
									<div class="card-title">Variante du Rake</div>
									<div class="card-stat" style="font-size: 14px; font-weight: normal; text-align: left; padding-left: 20px;">
										<form method="post">
											<input type="hidden" name="quick_reg" value="1">
											<?php 
											$user_id = intval($_SESSION['id']);
											$id_act = intval($row_act['id-activite']);
											$q_rake = mysqli_query($con, "SELECT * FROM rake ORDER BY id_rake ASC");
											$q_p_rake = mysqli_query($con, "SELECT `id_rake` FROM participation WHERE `id-membre` = '$user_id' AND `id-activite` = '$id_act'");
											$r_p_rake = mysqli_fetch_array($q_p_rake);
											$current_rake = $r_p_rake ? $r_p_rake['id_rake'] : 1;

											while($row_rake = mysqli_fetch_array($q_rake)) {
												?>
												<div class="radio clip-radio radio-primary radio-square" style="margin-bottom: 15px;">
													<input type="radio" id="rake_<?php echo $row_rake['id_rake']; ?>" name="id_rake" value="<?php echo $row_rake['id_rake']; ?>" <?php echo ($current_rake == $row_rake['id_rake']) ? 'checked' : ''; ?> onchange="this.form.submit()">
													<label for="rake_<?php echo $row_rake['id_rake']; ?>" style="color: brown; font-weight: bold;">
														<?php echo htmlentities($row_rake['nom']); ?> (<?php echo $row_rake['montant']; ?>€)
													</label>
												</div>
												<?php
											}
											?>
										</form>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-4">
								<a href="voir-membre.php?id=<?php echo $user_id; ?>&tab=col" class="dashboard-card card-yellow">
									<div class="card-icon" style="color: #ffcc00 !important;"><i class="fa fa-star"></i></div>
									<div class="card-title">Point(s) de Fidélité</div>
									<div class="card-stat" style="font-size: 24px; color: #ffcc00 !important;">
										<?php 
										$q_pts = mysqli_query($con, "SELECT SUM(valeur) as total_points FROM `collections-individu` WHERE `id-indiv` = '$user_id'");
										$r_pts = mysqli_fetch_array($q_pts);
										echo intval($r_pts['total_points']);
										?>
									</div>
								</a>
							</div>
							<div class="col-sm-4">
								<a href="voir-membre.php?id=<?php echo $user_id; ?>&tab=portefeuille" class="dashboard-card card-green">
									<div class="card-icon"><i class="fa fa-eur"></i></div>
									<div class="card-title">Solde Carte Virtuelle</div>
									<div class="card-stat" style="font-size: 24px;">
										<?php 
										$q_solde = mysqli_query($con, "SELECT 
											COALESCE(SUM(CASE WHEN id_type_mvt = 4 THEN montant ELSE 0 END), 0) + COALESCE(SUM(CASE WHEN id_type_mvt = 5 THEN montant ELSE 0 END), 0) -
											COALESCE(SUM(CASE WHEN id_type_mvt = 1 THEN montant ELSE 0 END), 0) - COALESCE(SUM(CASE WHEN id_type_mvt = 2 THEN montant ELSE 0 END), 0) - COALESCE(SUM(CASE WHEN id_type_mvt = 3 THEN montant ELSE 0 END), 0) as balance
											FROM portefeuille 
											WHERE id_mvt_membre = '$user_id'");
										$r_solde = mysqli_fetch_array($q_solde);
										$solde = floatval($r_solde['balance']);
										echo number_format($solde, 2, ',', ' ') . " €";
										?>
									</div>
								</a>
							</div>
							<div class="col-sm-4">
								<a href="voir-membre.php?id=<?php echo $user_id; ?>&tab=ks" class="dashboard-card card-blue">
									<div class="card-icon"><i class="fa fa-line-chart"></i></div>
									<div class="card-title">Statistiques</div>
									<div class="card-stat" style="font-size: 14px; font-weight: normal; text-align: left; padding-left: 20px;">
										<?php 
										$q_stats = mysqli_query($con, "
											SELECT 
												COUNT(*) as nb_parties,
												SUM(p.gain) as total_gains,
												SUM(CASE WHEN p.gain > 0 THEN 1 ELSE 0 END) as nb_gains,
												SUM(COALESCE(a.buyin, 0) + COALESCE(a.rake, 0) + (p.recave * COALESCE(a.recave_montant, 0)) + (p.addon * COALESCE(a.recave_montant, 0))) as total_buyins
											FROM participation p
											JOIN activite a ON p.`id-activite` = a.`id-activite`
											WHERE p.`id-membre` = '$user_id' 
											AND p.`option` NOT IN ('Desinscrit', 'None')
										");
										$r_stats = mysqli_fetch_array($q_stats);
										?>
										<div style="margin-bottom: 5px;">Buy-ins : <strong><?php echo number_format(floatval($r_stats['total_buyins']), 2, ',', ' '); ?> € </strong><strong><?php echo " (".intval($r_stats['nb_parties']).")"; ?></strong></div>
										<div style="margin-bottom: 5px;">Gains : <strong><?php echo number_format(floatval($r_stats['total_gains']), 2, ',', ' '); ?> €</strong><strong><?php echo " (".intval($r_stats['nb_gains']).")"; ?></strong></div>
									</div>
								</a>
							</div>
						</div>

						<!-- Inscription & Options -->
						<div class="row">
							<div class="col-sm-4">
								<div class="dashboard-card">
									<div class="card-stat" style="font-size: 16px; font-weight: normal; padding-top: 10px;">
										<strong>Lieu:</strong> 
										<a href="map-location.php?id_act=<?php echo $row_act['id-activite']; ?>&lat=<?php echo $row_act['lat']; ?>&lng=<?php echo $row_act['lng']; ?>" style="color: inherit; text-decoration: underline;">
											<?php echo htmlentities($row_act['rue']) . ", " . htmlentities($row_act['ville']); ?>
										</a>
										<a href="map-location.php?id_act=<?php echo $row_act['id-activite']; ?>&lat=<?php echo $row_act['lat']; ?>&lng=<?php echo $row_act['lng']; ?>" style="display: block; margin-top: 10px; height: 220px; border-radius: 8px; overflow: hidden; border: 1px solid #ddd; position: relative;">
											<iframe src="map-location.php?id_act=<?php echo $row_act['id-activite']; ?>&lat=<?php echo $row_act['lat']; ?>&lng=<?php echo $row_act['lng']; ?>&mini=1" width="100%" height="100%" frameborder="0" style="border:0; pointer-events: none;"></iframe>
											<div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 5;"></div>
										</a>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="dashboard-card card-red animated pulse infinite" style="animation-duration: 2s;">
									<div class="card-icon"><i class="fa fa-pencil-square-o"></i></div>
									<div class="card-title">Ma Participation</div>
									<div class="card-stat" style="font-size: 16px; font-weight: normal; text-align: left; padding-left: 20px;">
										<form method="post">
											<input type="hidden" name="quick_reg" value="1">
											<?php 
											$user_id = intval($_SESSION['id']);
											$id_act = intval($row_act['id-activite']);
											$q_p = mysqli_query($con, "SELECT `option` FROM participation WHERE `id-membre` = '$user_id' AND `id-activite` = '$id_act'");
											$r_p = mysqli_fetch_array($q_p);
											$current_status = $r_p ? $r_p['option'] : 'None';
											// Vérifier si le joueur est inscrit (incluant Réservation et Présent)
											$is_registered = in_array($current_status, ['Inscrit', 'Réservation', 'Présent', 'Confirmé', 'Eliminé']);

											// Compter les messages non lus (privés)
											$q_unread = mysqli_query($con, "SELECT COUNT(*) as total FROM chat_messages WHERE receiver_id = '$user_id' AND is_read = 0 AND group_id IS NULL");
											$r_unread = mysqli_fetch_array($q_unread);
											$unread_count = intval($r_unread['total']);

											// Compter les messages non lus (groupes)
											$q_unread_groups = mysqli_query($con, "
												SELECT COUNT(*) as total 
												FROM chat_messages m
												JOIN chat_group_members gm ON m.group_id = gm.group_id
												WHERE gm.member_id = '$user_id' 
												AND m.sender_id != '$user_id'
												AND m.timestamp > gm.last_read_at
											");
											$r_unread_groups = mysqli_fetch_array($q_unread_groups);
											$unread_count += intval($r_unread_groups['total']);

											// Trouver le groupe de chat correspondant à l'activité
											$months = ["", "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"];
											$d_obj = strtotime($row_act['date_depart']);
											$formatted_date = date('j', $d_obj) . ' ' . $months[intval(date('n', $d_obj))];
											$id_orga = $row_act['id-membre'];
											$q_orga_pseudo = mysqli_query($con, "SELECT pseudo FROM membres WHERE `id-membre` = '$id_orga' LIMIT 1");
											$r_orga_pseudo = mysqli_fetch_array($q_orga_pseudo);
											$expected_group_name = $formatted_date . " " . ($r_orga_pseudo ? $r_orga_pseudo['pseudo'] : "");

											$q_target_grp = mysqli_query($con, "SELECT id FROM chat_groups WHERE name = '".mysqli_real_escape_string($con, $expected_group_name)."' ORDER BY id DESC LIMIT 1");
											$r_target_grp = mysqli_fetch_array($q_target_grp);
											$target_group_id = $r_target_grp ? $r_target_grp['id'] : null;
											?>
											<input type="hidden" name="anonyme" id="anonyme_input" value="<?php echo $current_anonyme; ?>">
											<input type="hidden" name="latereg" id="latereg_input" value="<?php echo $current_latereg; ?>">
											<div class="radio clip-radio radio-primary" style="margin-bottom: 15px;">
												<input type="radio" id="reg_inscrit" name="status" value="Inscrit" <?php echo ($is_registered) ? 'checked' : ''; ?> onchange="handleRegistration(this)">
												<label for="reg_inscrit" style="color: lime; font-weight: bold; font-size: 18px;">INSCRIPTION</label>
											</div>
											<div class="radio clip-radio radio-primary" style="margin-bottom: 15px;">
												<input type="radio" id="reg_option" name="status" value="Option" <?php echo ($current_status == 'Option') ? 'checked' : ''; ?> onchange="this.form.submit()">
												<label for="reg_option" style="color: #FFCC00; font-weight: bold; font-size: 18px;">OPTION</label>
											</div>
											<div class="radio clip-radio radio-primary radio-lightred" style="margin-bottom: 5px;">
												<input type="radio" id="reg_none" name="status" value="None" <?php echo ($current_status == 'None' || $current_status == 'Desinscrit') ? 'checked' : ''; ?> onchange="this.form.submit()">
												<label for="reg_none" style="color: #f91919ff; font-weight: bold; font-size: 18px;">DÉSINCRIPTION</label>
											</div>
											<div style="margin-top: 10px; text-align: center;">
												<a href="chat.php<?php echo $target_group_id ? '?group_id='.$target_group_id : ''; ?>" style="color: #007bff; text-decoration: underline !important; font-weight: bold; font-size: 16px;">
													<i class="fa fa-comments"></i> Accéder au Chat du Tournoi
													<?php if ($unread_count > 0): ?>
														<span class="badge badge-danger" style="background-color: #d9534f;"><?php echo $unread_count; ?></span>
													<?php endif; ?>
												</a>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="dashboard-card card-blue">
									<div class="card-icon"><i class="fa fa-forward"></i></div>
									<?php 
									$current_date = $row_act['date_depart'];
									$q_next_acts = mysqli_query($con, "SELECT * FROM activite WHERE date_depart > '$current_date' ORDER BY date_depart ASC LIMIT 1");
									$first_next_id = "";
									if(mysqli_num_rows($q_next_acts) > 0) {
										$r_temp = mysqli_fetch_array($q_next_acts);
										$first_next_id = $r_temp['id-activite'];
										mysqli_data_seek($q_next_acts, 0); // Reset pointer for the loop below
									}
									?>
									<div class="card-title">
										<a href="<?php echo $first_next_id ? "quickview.php?uid=$first_next_id" : "#"; ?>" style="color: #007bff; text-decoration: underline !important;">Prochaine Activité</a>
									</div>
									<div class="card-stat" style="font-size: 14px; font-weight: normal; text-align: left; padding-left: 20px; color: black;">
										<?php 
										if(mysqli_num_rows($q_next_acts) > 0) {
											while($r_next_act = mysqli_fetch_array($q_next_acts)) {
												$next_act_id = $r_next_act['id-activite'];
												$q_count = mysqli_query($con, "SELECT COUNT(*) as total FROM participation WHERE `id-activite` = '$next_act_id' AND `option` IN ('Reservation', 'Inscrit', 'Confirme', 'Elimine')");
												$r_count = mysqli_fetch_array($q_count);
												$nb_ins = intval($r_count['total']);
												$total_p = intval($r_next_act['places']);
												$libres = $total_p - $nb_ins;
												?>
												<div style="margin-bottom: 25px; line-height: 1.6;">
													<a href="quickview.php?uid=<?php echo $r_next_act['id-activite']; ?>" style="color: black; text-decoration: none;">
														<strong><?php echo date('d/m/Y H:i', strtotime($r_next_act['date_depart'])); ?></strong><br>
														Buy-in: <?php echo $r_next_act['buyin']; ?>€ + <?php echo $r_next_act['rake']; ?>€<br>
														Recaves: <?php echo $r_next_act['recave']; ?><br>
														Libres: <?php echo ($libres > 0 ? $libres : 0); ?> / <?php echo $total_p; ?>
													</a>
												</div>
												<?php
											}
										} else {
											echo "<span style='color: black;'>Aucune autre activité prévue</span>";
										}
										?>
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

		<!-- Scripts -->
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
		<script src="vendor/sweetalert/sweet-alert.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/form-elements.js"></script>
		<script>
			jQuery(document).ready(function () {
				Main.init();
				FormElements.init();
			});

			function handleRegistration(radio) {
				if (radio.value === 'Inscrit') {
					swal({
						title: "Anonyme ?",
						text: "Souhaitez-vous activer le mode Anonyme pour cette inscription ?",
						type: "info",
						showCancelButton: true,
						confirmButtonColor: "#007AFF",
						confirmButtonText: "Non",
						cancelButtonText: "Oui",
						closeOnConfirm: false,
						closeOnCancel: false
					}, function(isConfirm) {
						// isConfirm est vrai si on a cliqué sur "Non" (le bouton de confirmation)
						document.getElementById('anonyme_input').value = isConfirm ? '0' : '1';
						
						setTimeout(function() {
							swal({
								title: "Latereg ?",
								text: "Etes vous en Latereg ?",
								type: "info",
								showCancelButton: true,
								confirmButtonColor: "#007AFF",
								confirmButtonText: "Non",
								cancelButtonText: "Oui",
								closeOnConfirm: true,
								closeOnCancel: true
							}, function(isConfirmLatereg) {
								// isConfirmLatereg est vrai si on a cliqué sur "Non"
								document.getElementById('latereg_input').value = isConfirmLatereg ? '0' : '1';
								radio.form.submit();
							});
						}, 200);
					});
				} else {
					radio.form.submit();
				}
			}
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>

	</html>
<?php } ?>
