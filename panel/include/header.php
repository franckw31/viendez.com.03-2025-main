<?php error_reporting(0);?>
<header class="navbar nnavbar-default navbar-static-top">
					<!-- start: NAVBAR HEADER -->
	<div class="navbar-header">
		<a href="/index.php" class="sidebar-mobile-toggler pull-left hidden-md hidden-lg" class="btn btn-navbar sidebar-toggle" data-toggle-class="app-slide-off" data-toggle-target="#app" data-toggle-click-outside="#sidebar">
			<i class="ti-align-justify"></i>
		</a>
		<a class="navbar-brand" href="/index.php">
			<img src="assets/images/toulouse.jfif" height="120" width="120" >
			<!-- <h2 style="padding-top:20%; color:#fff ">Admin</h2> --> 
		</a>
		<a href="#" class="sidebar-toggler pull-right visible-md visible-lg" data-toggle-class="app-sidebar-closed" data-toggle-target="#app">
			<i class="ti-align-justify"></i>
		</a>
		<a class="pull-right menu-toggler visible-xs-block" id="menu-toggler" data-toggle="collapse" href=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<i class="ti-view-grid"></i>
		</a>
	</div>
					<!-- end: NAVBAR HEADER -->
					<!-- start: NAVBAR COLLAPSE -->
	<div class="navbar-collapse collapse">
		<ul class="nav navbar-right">
					<!-- start: MESSAGES DROPDOWN -->
			<li  style="padding-top:3% ">
				<h1>Console de Gestion</h1>
			</li>
			<?php
			$id=intval($_GET['id']);
			$id=265;
			$id=$_SESSION['id'];
			$sql=mysqli_query($con,"SELECT * FROM `membres` WHERE `id-membre` = '$id'");
			while($row=mysqli_fetch_array($sql))
				{														
				?>	
				<li class="dropdown current-user">
					<a href class="dropdown-toggle" data-toggle="dropdown">
						<img src="images/<?php  echo $row['photo'];?>" width="60" height="50"  ;> <span class="username"> <?php  echo $row['pseudo'];?>
						<i class="ti-angle-down"></i></i></span>
					</a>
					<?php
				}
				?>
					<ul class="dropdown-menu dropdown-dark">
						<li>
							<a href="voir-membre.php?id=<?php  echo $id;?>">
								Modifier Informations
							</a>
						</li>
						<li>
							<a href="logout.php">
								Logout
							</a>
						</li>
					</ul>
				</li>
							<!-- end: USER OPTIONS DROPDOWN -->
		</ul>
						<!-- start: MENU TOGGLER FOR MOBILE DEVICES -->
		<div class="close-handle visible-xs-block menu-toggler" data-toggle="collapse" href=".navbar-collapse">
			<div class="arrow-left"></div>
			<div class="arrow-right"></div>
		</div>
						<!-- end: MENU TOGGLER FOR MOBILE DEVICES -->
	</div>
					<!-- end: NAVBAR COLLAPSE -->
</header>
