				<div id="header-inner">
					<table cellpadding="0" cellspacing="0" style="width:100%;">							
						<tr>
							<td rowspan="2" style="width:20px;">
							</td>
							<td style="height:52px;">
								<div style="color:#fff;font-size:22px;font-weight:bold;">
									<a href="home.php" style="color:#fff;font-size:22px;font-weight:bold;text-decoration:none">Data Management SOC FSC</a>
								</div>
								<div style="color:#fff">
									<a href="home.php" style="color:#fff;text-decoration:none">CRO Aviano</a>
								</div>
							</td>
							<td style="padding-right:5px;text-align:right;vertical-align:bottom;">
							
								<p style="color:#fff;text-decoration:none;font-size:9px">Logged as protocol: <?php echo $_SESSION['protocol']?> | User:  <?php echo $_SESSION['name']?></p>
								
								<div id="topmenu" style="font-size:10px">
									<a href="home.php">Home</a> |
									<a href="ricerche.php">Data Search</a> |
									<a href="gestione_dati.php">Data Management</a> |
									<a href="laboratorio.php">Lab Activity</a> |
									<?php 
										if ($_SESSION['is_admin']){
									?>
									<!--<a href="/download/index.php">Statistiche</a>-->
									<a href="amministrazione.php">Administration</a> |
									<?php 
								}
							?>

									<a href="controller/logout.php">Logout</a>
									
								</div>
							</td>
						</tr>
					</table>
				</div>