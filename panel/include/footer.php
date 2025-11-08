<footer>
				<div class="footer-inner">
					<div class="pull-left">
					<span class="text-bold text-uppercase"> C(2023) Poker31.Org | <a href="/panel/dashboard.php">Dashboard</a></span>
					</div>
					<div class="pull-right">
						<span id="current-time"></span>
						<span class="go-top"><i class="ti-angle-up"></i></span>
					</div>
				</div>
			</footer>
			<script>
				function updateTime() {
					const now = new Date();
					const options = { 
						year: 'numeric', 
						month: '2-digit', 
						day: '2-digit', 
						hour: '2-digit', 
						minute: '2-digit', 
						second: '2-digit',
						hour12: false
					};
					const timeString = now.toLocaleDateString('fr-FR', options);
					document.getElementById('current-time').textContent = timeString;
				}
				
				// Update time immediately and then every second
				updateTime();
				setInterval(updateTime, 1000);
			</script>
