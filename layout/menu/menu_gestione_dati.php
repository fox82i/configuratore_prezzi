				


			<?php 
				if ($_SESSION['is_admin']){
			?>
				<ul class="easyui-tree" id='menu_gestione_dati' data-options="animate:true">
					<li iconCls="icon-base"><span>General data management</span>
						<ul>
							<li iconCls="icon-base"><span>SNPs</span>
								<ul>
									<li iconCls="icon-base"><span>Insert new SNP</span>
										<ul>
											<li iconCls="icon-gears"><a href="#" onclick="open1('inserimento_nuovo_snp','Single SNP insertion')">Single</a></li>
											<li iconCls="icon-gears"><a href="#" onclick="open1('inserimento_massivo_snp','Multiple SNP insertion')">Multiple</a></li>
										</ul>
									</li>
									<li iconCls="icon-gears"><a href="#" onclick="open1('modifica_singolo_snp','Modify SNP data')">Modify SNPs data</a></li>							
									<li iconCls="icon-gears"><a href="#" onclick="open1('modifica_nome_rs','Modify RS ID name')">Modify id_RS name</a></li>							
								</ul>
							</li>
							<li iconCls="icon-base"><span>Selection parameters</span>
								<ul>
									<li iconCls="icon-gears"><a href="#" onclick="open1('nuovo_valore_elegibilita','New parameter value')">New parameter value</a></li>
									<li iconCls="icon-gears"><a href="#" onclick="open1('modifica_valore_elegibilita','Modify parameter value')">Modify parameter value</a></li>
																
								</ul>
							</li>
							<li iconCls="icon-base"><span>Assay</span>
								<ul>
									<li iconCls="icon-gears"><a href="#" onclick="open1('nuovo_assay_name','New instrument')">New instrument</a></li>
									<li iconCls="icon-gears"><a href="#" onclick="open1('nuovo_saggio_snp','New SNP assay')">New SNP assay</a></li>							
									<li iconCls="icon-gears"><a href="#" onclick="open1('aggiornamento_saggio_snp','Update assay')">Update Assay</a></li>							
									<li iconCls="icon-gears"><a href="#" onclick="open1('elimina_saggio_snp','Delete Assay')">Delete Assay</a></li>							
								</ul>
							</li>
							<li iconCls="icon-base"><span>Biological Sample managment</span>
								<ul>
									<li iconCls="icon-gears"><a href="#" onclick="open1('nuovo_campione_biologico','New biological sample type')">New biological sample type</a></li>									
								</ul>
							</li>
							<li iconCls="icon-base"><span>Taqman Encoding Genotype</span>
								<ul>
									<li iconCls="icon-gears"><a href="#" onclick="open1('visualizza_codfica_taqman','Display Taqman encoding genotype')">Dispaly Taqman encoding</a></li>
									<li iconCls="icon-gears"><a href="#" onclick="open1('nuova_codifica_taqman','New Taqman encoding genotype')">New Taqman encoding</a></li>
									<li iconCls="icon-gears"><a href="#" onclick="open1('modifica_codifica_taqman','Modify Taqman encoding genotype')">Modify Taqman encoding</a></li>
									
								</ul>
							</li>
						</ul>
					</li>
				</ul>
					<?php 
								}
							?>
				<ul class="easyui-tree" id='menu_gestione_dati_protocollo' data-options="animate:true">
					<li iconCls="icon-base"><span>Data management of <?php echo $_SESSION['protocol'] ?></span>
						<ul>
							<li iconCls="icon-base"><span>Biological Sample managment</span>
								<ul>
									<li iconCls="icon-gears"><a href="#" onclick="open1('nuovo_campione_paziente','New patient biological sample')">New patient biological sample</a></li>
									<li iconCls="icon-gears"><a href="#" onclick="open1('gestione_quantita_campione_biologico','Sample situation <?php echo $_SESSION['protocol']?>')">Quantity managment</a></li>														
								</ul>
							</li>
							<li iconCls="icon-base"><span>Provider managment</span>
								<ul>
									<li iconCls="icon-gears"><a href="#" onclick="open1('','Nuovo provider')">New provider</a></li>
									<li iconCls="icon-gears"><a href="#" onclick="open1('','Modifica provider')">Modify provider</a></li>							
								</ul>
							</li>
							
							<li iconCls="icon-base"><span>Patient</span>
								<ul>
									<!--<li iconCls="icon-gears"><a href="#" onclick="open1('nuovo_paziente_doppio','New patient twice <?php echo $_SESSION['protocol']?>')">New patient twice</a></li>	-->									
									<li iconCls="icon-gears"><a href="#" onclick="open1('nuovo_paziente','Add new patient')">Add new patient</a></li>									
									<li iconCls="icon-gears"><a href="#" onclick="open1('modifica_paziente','Modifiy patient data of <?php echo $_SESSION['protocol']?>')">Modify patient data</a></li>
									<li iconCls="icon-gears"><a href="#" onclick="open1('gestione_paziente_protocollo','Patient protocol management')">Patient protocol management</a></li>
									<li iconCls="icon-gears"><a href="#" onclick="open1('modifica_elegibilita_paziente','Modify parameter value patient <?php echo $_SESSION['protocol']?>')">Modify patient parameter value</a></li>
								</ul>
							</li>
							
						</ul>
					</li>
				</ul>
