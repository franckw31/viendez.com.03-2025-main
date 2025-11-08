<?php
session_start();
error_reporting(0);
$idmembresession = $_SESSION['id']; //ok
if (strlen($idmembresession == 0)) {
    header('location:logout.php');
    exit;
} else 
{ if ($idmembresession == 265) 
	{
    // echo "-".$idmembresession."-";
    ?> 
    <div class="sidebar app-aside" id="sidebar">
	  <div class="sidebar-container perfect-scrollbar">
		<nav>
			<!-- start: MAIN NAVIGATION MENU -->
			<div class="navbar-title">
				<span>.</span>
			</div>
			<ul class="main-navigation-menu">
				<li>
					<a href="dashboard.php">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-home"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Menu Administrateurs</span>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-user"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Membres </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="creation-membre.php">
								<span class="title"> Ajouter Membre</span>
							</a>
						</li>
						<li>
							<a href="liste-membres-container.php">
								<span class="title"> Gérer les Membres </span>
							</a>
						</li>
						<li>
							<a href="recherche-competences.php">
								<span class="title"> Recherche par Compétence </span>
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-user"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Activités </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="ajout-activite.php">
								<span class="title"> Créer une Activité </span>
							</a>
						</li>
						<li>
							<a href="prochaines-activites.php">
								<span class="title"> Prochaines Activités </span>
							</a>
						</li>
						<li>
							<a href="liste-activites.php">
								<span class="title"> Gérer les Activités </span>
							</a>
						</li>
						<li>
							<a href="liste-participations-container.php">
								<span class="title"> Gérer les participations </span>
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-user"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Competences / Loisirs </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="ajout-competences.php">
								<span class="title"> Gestion des Competences </span>
							</a>
						</li>

						<li>
							<a href="ajout-loisirs.php">
								<span class="title"> Gestion des Loisirs </span>
							</a>
						</li>
						<li>
							<a href="ajout-collection.php">
								<span class="title"> Gestion des Collections </span>
							</a>
						</li>
						<li>
							<a href="ajout-blindes.php">
								<span class="title"> Gestion des Blindes </span>
							</a>
						</li>
						<li>
							<a href="ajout-structures.php">
								<span class="title"> Gestion des Structures </span>
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-user"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Challenges </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="ajout-challenge.php">
								<span class="title"> Ajouter challenge</span>
							</a>
						</li>
						<li>
							<a href="gestion-challenge.php">
								<span class="title"> Gérer les challenges </span>
							</a>
						</li>
						<li>
							<a href="recherche-competences.php">
								<span class="title"> Recherche par challenge </span>
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-files"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Conatctus Queries </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="unread-queries.php">
								<span class="title"> Unread Query </span>
							</a>
						</li>

						<li>
							<a href="read-query.php">
								<span class="title"> Read Query </span>
							</a>
						</li>

					</ul>
				</li>
				<li>
					<a href="doctor-logs.php">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-list"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Session Logs </span>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a href="user-logs.php">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-list"></i>
							</div>
							<div class="item-inner">
								<span class="title"> User Session Logs </span>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-files"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Reports </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="between-dates-reports.php">
								<span class="title">B/w dates reports </span>
							</a>
						</li>
					</ul>
				</li>

				<!--- Pages---->
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-file"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Résultats </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="liste-membres-part.php">
								<span class="title">Resultats Partie </span>
							</a>
						</li>
						<li>
							<a href="contact.php">
								<span class="title">Contact Us </span>
							</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="quick-geo.php">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-search"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Quick Géoloc. </span>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a href="quick-part.php">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-search"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Quick Particip. </span>
							</div>
						</div>
					</a>
				</li>
			</ul>
			<!-- end: CORE FEATURES -->

		</nav>
	</div>
</div>
<?php 
}
else 
{
	
	// echo "-".$idmembresession."-";
    ?> 
    <div class="sidebar app-aside" id="sidebar">
	  <div class="sidebar-container perfect-scrollbar">
		<nav>
			<!-- start: MAIN NAVIGATION MENU -->
			<div class="navbar-title">
				<span>.</span>
			</div>
			<ul class="main-navigation-menu">
				<li>
					<a href="dashboard.php">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-home"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Menu Utilisateur</span>
							</div>
						</div>
					</a>
				</li>
				<!-- <li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-user"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Membres </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="creation-membre.php">
								<span class="title"> Ajouter Membre</span>
							</a>
						</li>
						<li>
							<a href="liste-membres-container.php">
								<span class="title"> Gérer les Membres </span>
							</a>
						</li>
						<li>
							<a href="recherche-competences.php">
								<span class="title"> Recherche par Compétence </span>
							</a>
						</li>
					</ul>
				</li> -->
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-user"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Activités </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="ajout-activite.php">
								<span class="title"> Créer une Activité </span>
							</a>
						</li>
						<li>
							<a href="prochaines-activites.php">
								<span class="title"> Prochaines Activités </span>
							</a>
						</li>
						<li>
							<a href="liste-activites.php">
								<span class="title"> Gérer les Activités </span>
							</a>
						</li>
						<!-- <li>
							<a href="liste-participations-container.php">
								<span class="title"> Gérer les participations </span>
							</a>
						</li> -->
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-user"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Competences / Loisirs </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="ajout-competences.php">
								<span class="title"> Gestion des Competences </span>
							</a>
						</li>

						<li>
							<a href="ajout-loisirs.php">
								<span class="title"> Gestion des Loisirs </span>
							</a>
						</li>
						<li>
							<a href="ajout-blindes.php">
								<span class="title"> Gestion des Blindes </span>
							</a>
						</li>
						<li>
							<a href="ajout-structures.php">
								<span class="title"> Gestion des Structures </span>
							</a>
						</li>

					</ul>
				</li>
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-user"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Challenges </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="ajout-challenge.php">
								<span class="title"> Ajouter challenge</span>
							</a>
						</li>
						<li>
							<a href="gestion-challenge.php">
								<span class="title"> Gérer les challenges </span>
							</a>
						</li>
						<li>
							<a href="recherche-competences.php">
								<span class="title"> Recherche par challenge </span>
							</a>
						</li>
					</ul>
				</li>
				<!-- <li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-files"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Conatctus Queries </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="unread-queries.php">
								<span class="title"> Unread Query </span>
							</a>
						</li>

						<li>
							<a href="read-query.php">
								<span class="title"> Read Query </span>
							</a>
						</li>

					</ul>
				</li>
				<li>
					<a href="doctor-logs.php">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-list"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Session Logs </span>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a href="user-logs.php">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-list"></i>
							</div>
							<div class="item-inner">
								<span class="title"> User Session Logs </span>
							</div>
						</div>
					</a>
				</li> -->
				<!-- <li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-files"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Reports </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="between-dates-reports.php">
								<span class="title">B/w dates reports </span>
							</a>
						</li>
					</ul>
				</li>
-->
				<!--- Pages----
				<li>
					<a href="javascript:void(0)">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-file"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Pages </span><i class="icon-arrow"></i>
							</div>
						</div>
					</a>
					<ul class="sub-menu">

						<li>
							<a href="about-us.php">
								<span class="title">About Us </span>
							</a>
						</li>
						<li>
							<a href="contact.php">
								<span class="title">Cotnact Us </span>
							</a>
						</li>
					</ul>
				</li> -->

				<li>
					<a href="patient-search.php">
						<div class="item-content">
							<div class="item-media">
								<i class="ti-search"></i>
							</div>
							<div class="item-inner">
								<span class="title"> Recherches </span>
							</div>
						</div>
					</a>
				</li>

			</ul>
			<!-- end: CORE FEATURES -->

		</nav>
	</div>
</div>
<?php 
}	
}	; ?>
