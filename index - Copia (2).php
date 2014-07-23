<?php
    session_start();
    require_once('config/dbconfig.inc.php');
  
    
    $dbh = dbConn::getConnection();

?>

                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
                        <link rel="stylesheet" href="js/jqwidgets/styles/jqx.base.css" type="text/css" />                       
                        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css" />
           
                        <title>Configuratore prodotti L&amp;S</title>
                        <style type="text/css">                    
                         
                          body {
                            padding-top: 10px; /* 60px to make the container go all the way to the bottom of the topbar */
                          }
                        </style>

                    </head>
                    <body class='default'>
                       
                        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                          <div class="container">
                            <div class="navbar-header">
                              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                              </button>
                              <a class="navbar-brand" href="#">Configuratore L&amp;S </a>                              
                            </div>
                            <div class="collapse navbar-collapse">
                              <ul class="nav navbar-nav">
                                <li class="active" ><a href="index.php">Home</a></li>
                                <li><a href="statistiche.php">Statistiche</a></li>
                                <li><a href="amministrazione.php">Amministrazione</a></li>
                                <li><a href="controller/logout.php">Log out</a></li>

                              </ul>
                      
                            </div><!--/.nav-collapse -->

                          </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <div class="container">
                             <div id="createPrice" style="font-family: Verdana; font-size: 13px;">
                                 <div><strong>Configuratore prezzi</strong></div>
                                
                                   <div style="font-family: Verdana; font-size: 13px;">
                                        <form id="calcolo_prezzo" style="overflow: hidden; margin: 10px;" action="./">
                                            <table >
                                                <tr>
                                                    <td>Prodotto:</td>
                                                </tr>     
                                                <tr>
                                                    <td><div  id="prodotto"></div></td>
                                                
                                                </tr>   
                                                <tr></tr>
                                                <tr>
                                                    <td>Lunghezza:</td>
                                                </tr>     
                                                <tr>
                                                    <td><input type="text"  id="lunghezza" maxlength="4" /></td>
                                                </tr>
                                                <tr></tr>
                                                <tr>
                                                    <td>Motore Led:</td>
                                                </tr>     
                                                <tr>
                                                    <td><div id="motore_led"> </div></td>
                                                </tr>
                                                <tr></tr>
                                                <tr>
                                                    <td>Colore luce:</td>
                                                </tr>     
                                                <tr>
                                                    <td><div  id="colore_luce"> </div></td>
                                                </tr>
                                                <tr></tr>
                                                 <tr>
                                                    <td>Sistema fissaggio:</td>
                                                </tr>     
                                                <tr>
                                                    <td><div  id="sistema_fissaggio"> </div></td>
                                                </tr>
                                                <tr></tr>
                                                 <tr>
                                                    <td>Sistema accensione:</td>
                                                </tr>     
                                                <tr>
                                                    <td><div  id="sistema_accensione"> </div></td>
                                                 </tr>
                                                <tr></tr>
                                                <tr>
                                                    <td>Connettore alimentazione:</td>
                                                </tr>     
                                                <tr>
                                                    <td><div  id="connettore_alimentazione"> </div></td>
                                                 </tr>
                                                <tr></tr>
                                                <tr>
                                                    <td>Lunghezza cavo alimentazione:</td>
                                                </tr>     
                                                <tr>
                                                   <td><input type="text"  id="lunghezza_cavo_alim"   disabled maxlength="4" /></td>
                                                </tr>
                                                <tr></tr>
                                                <tr>
                                                    <td>Giunzione M/F:</td>
                                                </tr>     
                                                <tr>
                                                   <!--<input type="checkbox"  id="giunzione_MF" disabled="true"  />-->
                                                   <td><div  id='giunzione_MF'> </div></td>
                                                </tr>
                                                <tr></tr>
                                                <tr>
                                                    <td>Uscita Cavo:</td>
                                                </tr>     
                                                <tr>
                                                   <td><div  id="uscita_cavo"> </div></td>
                                                </tr>
                                                <tr></tr>
                                                <tr>
                                                    <td>Schermo:</td>
                                                </tr>     
                                                <tr>
                                                   <td><div  id="tipo_schermo"> </div></td>
                                                </tr>
                                                <tr></tr>
                                                <tr>
                                                    <td>Quantit&agrave; richiesta:</td>
                                                </tr>     
                                                <tr>
                                                   <td><input type="text"  id="qta"   maxlength="3" /></td>
                                                </tr>
                                                <tr></tr>
                                              
                                            </table>
                                           <input type="button" value="Determina prezzo" id="sendButton" />
                                        </form>
                                          
                                    </div>
                                </div>
                                <div style='font-size: 12px; font-family: Verdana; margin-top: 10px;'>
                                                <div>Events:</div>
                                                <div id='events'></div>
                                        </div>
                        </div>
                               
                       

                    </body>

                        <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
                    <!--    <script type="text/javascript" src="js/jqwidgets/jqxcore.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxdata.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxsplitter.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxnavigationbar.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxtabs.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.js"></script>
                   
                        
                        <script type="text/javascript" src="js/jqwidgets/jqxscrollbar.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxbuttons.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxdropdownlist.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxlistbox.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxcombobox.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxmenu.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxvalidator.js"></script> 
                      
                        <script type="text/javascript" src="js/jqwidgets/jqxinput.js"></script>
                        <script type="text/javascript" src="JS/jqwidgets/jqxcheckbox.js"></script>

                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.selection.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.pager.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxdata.export.js"></script> 
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.export.js"></script> 
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.filter.js"></script> 
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.sort.js"></script> 
                        
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.columnsresize.js"></script> -->
                        <script type="text/javascript" src="js/jqwidgets/jqx-all.js"></script> 
                     
                        <script type="text/javascript" src="js/bootstrap/bootstrap.min.js"></script>
                        <script type="text/javascript">

                            function loadPage(title, url) {
                                $.get(url).done(function (data) {
                                    $('#jqxTabs').jqxTabs('addLast', title, data);           
                                });    
                            }

                            function tab_is_open(name){
                                var tabsCount = $("#jqxTabs").jqxTabs('length');
                                var position;
                                if (tabsCount>0){
                                    for (var i = 0; i < tabsCount; i++) {
                                        var tabTitle = $("#jqxTabs").jqxTabs('getTitleAt', i);
                                        if (tabTitle == name) {
                                            return i;
                                            break;
                                        }
                                    }
                                }else{
                                    return 0;    
                                }
                            }

                             function open1(plugin,title_tab){
                                var tab;
                                tab = tab_is_open(title_tab);
                                if (tab>0){
                                    //mi posizione sul tab aperto
                                    $('#jqxTabs').jqxTabs('select', tab); 
                                
                                }else{
                                    href = plugin + '.php';
                                    loadPage(title_tab, href);
                                }

                            }
                            $(document).ready(function () {
                               
                               
                               $("#createPrice").jqxExpander({  toggleMode: 'none', width: '550px', showArrow: false });
                               $("#giunzione_MF").jqxCheckBox({ width: 150, height: 25, disabled:true });
                              
                                $('#sendButton').on('click', function () {
                                     $('#calcolo_prezzo').jqxValidator('validate');
                               });
                               
                            });

                            var productsSource ={
                                                    dataType: "json",
                                                    dataFields: [
                                                        { name: 'prodotto'},
                                                        { name: 'prodotto'}
                                                    ],
                                                    id:'prodotto',
                                                    root:'rows',

                                                    url: 'data/enumerate_products.php'
                                                };
                            var productssAdapter = new $.jqx.dataAdapter(productsSource);

                            var motoreLedSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'codice_motore_led'},
                                                    { name: 'descrizione'},
                                                    { name: 'VDC'}
                                                ],
                                                url: 'data/enumerate_motore_led.php'
                                            };
                            var motoreLedAdapter = new $.jqx.dataAdapter(motoreLedSource);


                            var coloreLuceSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'codice_motore_led'},
                                                    { name: 'descrizione_colore'}
                                                ],
                                                url: 'data/enumerate_temperatura_luce.php'
                                            };
                            var coloreLuceAdapter = new $.jqx.dataAdapter(coloreLuceSource);

                            var sistemaFissaggioSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'id_sistema_fissaggio'},
                                                    { name: 'descrizione_sistema_fissaggio'}
                                                ],
                                                url: 'data/enumerate_sistema_fissaggio.php'
                                            };
                            var sistemaFissaggioAdapter = new $.jqx.dataAdapter(sistemaFissaggioSource);


                            var sistemaAccensioneSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'id_sistema_accensione'},
                                                    { name: 'descrizione'}                                                   

                                                ],
                                                root:'rows',
                                                id:'id_sistema_accensione',
                                                url: 'data/enumerate_sistema_accensione.php',
                                              
                                            };
                            var sistemaAccensioneAdapter = new $.jqx.dataAdapter(sistemaAccensioneSource);

                            var connettoreAlimentazioneSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'id_connettore'},
                                                    { name: 'descrizione_connettore'} ,                                                  
                                                    { name: 'giunzione_MF'} ,                                                  
                                                    { name: 'uscita_cavo'} ,                                                  
                                                    { name: 'lunghezza_cavo'} ,                                                  
                                                    { name: 'sdoppiabile'}                                           

                                                ],
                                                root:'rows',
                                                id:'id_connettore',
                                                url: 'data/enumerate_connettore_alimentazione.php',
                                              
                                            };
                            var connettoreAlimentazioneAdapter = new $.jqx.dataAdapter(connettoreAlimentazioneSource);

                             $("#prodotto").bind('select', function(event){
                                if (event.args) {
                                    $("#motore_led").jqxComboBox({ disabled: false, selectedIndex: -1});        
                                    
                                    var value = event.args.item.value;

                                    motoreLedSource.data = {prodotto: value};
                                    motoreLedAdapter = new $.jqx.dataAdapter(motoreLedSource);
                                    $("#motore_led").jqxComboBox({source: motoreLedAdapter});
                                }
                            });                              

                            $("#motore_led").bind('select', function(event){
                                if (event.args) {
                                    var codice_motore_led = event.args.item.value;
                                    var nome_prodotto=$("#prodotto").jqxComboBox('getSelectedItem').value;  

                                    //attivo la selezione del colore della luce
                                    $("#colore_luce").jqxComboBox({ disabled: false, selectedIndex: -1});        
                                    coloreLuceSource.data = {motore_led: codice_motore_led};
                                    coloreLuceAdapter = new $.jqx.dataAdapter(coloreLuceSource);
                                    $("#colore_luce").jqxComboBox({source: coloreLuceAdapter});

                                    //attivo la selezione della scelta per il sistema di fissaggio
                                    $("#sistema_fissaggio").jqxComboBox({ disabled: false, selectedIndex: -1});
                                    sistemaFissaggioSource.data = {prodotto: nome_prodotto};
                                    sistemaFissaggioAdapter = new $.jqx.dataAdapter(sistemaFissaggioSource);
                                    $("#sistema_fissaggio").jqxComboBox({source: sistemaFissaggioAdapter});
                                }
                            });  
                            
                            $("#sistema_fissaggio").bind('select', function(event){
                                  if (event.args) {
                                    var sistema_fissaggio = event.args.item.value;
                                    var lunghezza_prodotto= $('#lunghezza').val();
                                    var nome_prodotto=$("#prodotto").jqxComboBox('getSelectedItem').value;
                                    var codice_motore_led=$("#motore_led").jqxComboBox('getSelectedItem').value;
                                    
                                    var vdc=motoreLedAdapter.records[$("#motore_led").jqxComboBox('getSelectedIndex')]['VDC'];

                                    $("#sistema_accensione").jqxComboBox({ disabled: false, selectedIndex: -1});
                                    
                                    sistemaAccensioneSource.data={
                                        prodotto:nome_prodotto,
                                        motore_led:codice_motore_led,
                                        lunghezza_lampada:lunghezza_prodotto,
                                        sistema_fissaggio:sistema_fissaggio,
                                        vdc:vdc
                                    };

                                    sistemaAccensioneAdapter=new $.jqx.dataAdapter(sistemaAccensioneSource);
                                     $("#sistema_accensione").jqxComboBox({   source: sistemaAccensioneAdapter});



                                  }
                               
                            });    

                            $("#sistema_accensione").bind('select', function(event){
                                if (event.args) {
                                    var sistema_accensione = event.args.item.value;
                                    var sistema_fissaggio = $("#sistema_fissaggio").jqxComboBox('getSelectedItem').value;
                                    var lunghezza_prodotto= $('#lunghezza').val();
                                    var nome_prodotto=$("#prodotto").jqxComboBox('getSelectedItem').value;
                                    var codice_motore_led=$("#motore_led").jqxComboBox('getSelectedItem').value;
                                    
                                    var vdc=motoreLedAdapter.records[$("#motore_led").jqxComboBox('getSelectedIndex')]['VDC'];
                                    
                                    $("#connettore_alimentazione").jqxComboBox({ disabled: false, selectedIndex: -1});
                                   
                                    connettoreAlimentazioneSource.data={
                                        prodotto:nome_prodotto,
                                        motore_led:codice_motore_led,
                                        lunghezza_lampada:lunghezza_prodotto,
                                        sistema_fissaggio:sistema_fissaggio,
                                        vdc:vdc,
                                        sistema_accensione:sistema_accensione
                                    };

                                    connettoreAlimentazioneAdapter=new $.jqx.dataAdapter(connettoreAlimentazioneSource);
                                     $("#connettore_alimentazione").jqxComboBox({   source: connettoreAlimentazioneAdapter});

                                        
                                  }
                            });  
                            $("#connettore_alimentazione").bind('select',function(event){
                                /*in sequenza devo riempire:
                                    lunghezza cavo alimentazione
                                    giunzione M/F
                                    Uscita cavo
                                */
                                if (event.args) {
                                    var connettore_alimentazione= connettoreAlimentazioneAdapter.records[$('#connettore_alimentazione').jqxComboBox('getSelectedIndex')]['descrizione_connettore'];
                                    var lunghezza_cavo  = connettoreAlimentazioneAdapter.records[$('#connettore_alimentazione').jqxComboBox('getSelectedIndex')]['lunghezza_cavo'];
                                    var giunzione_MF    = connettoreAlimentazioneAdapter.records[$('#connettore_alimentazione').jqxComboBox('getSelectedIndex')]['giunzione_MF'];
                                    var uscita_cavo     = connettoreAlimentazioneAdapter.records[$('#connettore_alimentazione').jqxComboBox('getSelectedIndex')]['uscita_cavo'];
                                  

                                    switch (connettore_alimentazione){
                                        case 'Sliding':
                                            break;
                                        default:
                                            if(lunghezza_cavo !=""){
                                                $('#lunghezza_cavo_alim').jqxInput({disabled: false });
                                                $('#lunghezza_cavo_alim').val(lunghezza_cavo);
                                            }

                                            switch(giunzione_MF){
                                                case 'SI':
                                                    $("#giunzione_MF").jqxCheckBox({disabled:false});
                                                    break;
                                                case 'STD':
                                                    $('#giunzione_MF').jqxCheckBox('check');
                                                    break;
                                            }
                                            switch (uscita_cavo){
                                                case 'REVER':
                                                    var source_cable=['sinistra','destra'];
                                                    
                                                    $("#uscita_cavo").jqxComboBox({   source: source_cable});
                                                    $("#uscita_cavo").jqxComboBox({ disabled: false, selectedIndex:0});                                  
                                                    break;
                                                default:
                                                    var source_cable=['sinistra'];
                                                    
                                                    $("#uscita_cavo").jqxComboBox({   source: source_cable});
                                                      $("#uscita_cavo").jqxComboBox({selectedIndex: 0});   

                                                    break;
                                            }
                                        break;
                                    }
                                    
                                }
                            });



                            $("#prodotto").jqxComboBox({
                                source: productssAdapter,   
                                width: 300,
                                height: 25,
                                promptText: "Select a products...",
                                displayMember: 'prodotto',
                                valueMember: 'prodotto'
                            }); 

                            $("#motore_led").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of led...",
                                displayMember: 'descrizione',
                                valueMember: 'codice_motore_led'
                            });

                            $("#colore_luce").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of led color...",
                                displayMember: 'descrizione_colore',
                                valueMember: 'id_tipo_luce'
                            });  

                            $("#sistema_fissaggio").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of fix system...",
                                displayMember: 'descrizione_sistema_fissaggio',
                                valueMember: 'id_sistema_fissaggio'
                            });  

                            $("#sistema_accensione").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of ignition system...",
                                displayMember: 'descrizione',
                                valueMember: 'id_sistema_accensione'
                            });    
                            $("#connettore_alimentazione").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of connector...",
                                displayMember: 'descrizione_connettore',
                                valueMember: 'id_connettore'
                            });  
                             $("#uscita_cavo").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of cable exit..."
                                
                            }); 
                            $("#tipo_schermo").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of screen...",
                                displayMember: 'descrizione_schermo',
                                valueMember: 'id_schermo'
                            });      
  


                        </script>
                    </html>
  