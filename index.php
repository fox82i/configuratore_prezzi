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
                        
                        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css" />
                        <title>Gestione preventivi L&amp;S</title>
                        <style type="text/css">
                            html, body
                            {
                                height: 100%;
                                width: 100%;
                                margin: 0px;
                                padding: 0px;
                            }
                            body{
                                position: relative;
                                top: 71px;
                            }                            
                        </style>

                    </head>
                    <body role="document">
                       
                        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                          <div class="container">
                            <div class="navbar-header">
                              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                              </button>
                              <a class="navbar-brand" href="#">Gestione preventivi L&amp;S </a>                              
                            </div>
                            <div class="collapse navbar-collapse">
                              <ul class="nav navbar-nav">
                                <li class="active" ><a href="index.php">Home</a></li>
                                <li><a href="statistiche.php">Statistiche</a></li>
                                <li><a href="amministrazione.php">Amministrazione</a></li>
                                <li><a href="controller/logout.php">Log out</a></li>

                              </ul>
                      
                            </div   ><!--/.nav-collapse -->

                          </div>
                        </div>
                       
                         <div class="container theme-showcase" role="main">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <form  role="form" id="calcolo_prezzo" action="./">
                                        <div class="form-group">
                                            <label for="prodotto">Prodotto:</label>
                                            <div class="form-control" id="prodotto"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="lunghezza">Lunghezza:</label>
                                            <input type="text"  class="form-control" style="width:300px"   id="lunghezza" maxlength="4" />
                                           
                                        </div>
                                       <div class="form-group">
                                            <label for="motore_led">Motore Led:</label>
                                            <div class="form-control"   id="motore_led"></div>
                                        </div>
                                       <div class="form-group">
                                            <label for="colore_luce">Colore luce:</label>
                                            <div class="form-control"   id="colore_luce"></div>
                                        </div>
                                         <div class="form-group">
                                            <label for="tipo_schermo">Schermo:</label>
                                            <div class="form-control"   id="tipo_schermo"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sistema_fissaggio">Sistema fissaggio:</label>
                                            <div class="form-control"   id="sistema_fissaggio"></div>
                                        </div>
                                       <div class="form-group">
                                            <label for="sistema_accensione">Sistema accensione:</label>
                                            <div class="form-control"   id="sistema_accensione"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="connettore_alimentazione">Connettore alimentazione:</label>
                                            <div class="form-control"   id="connettore_alimentazione"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="lunghezza_cavo_alim">Lunghezza cavo alimentazione:</label>
                                            <input type="text" class="form-control"   id="lunghezza_cavo_alim"   style="width:300px" disabled maxlength="4" />
                                        </div>
                                        <div class="form-group" >
                                            <label for="giunzione_MF"> Giunzione M/F: </label>
                                               <!-- <input type="checkbox"  id="giunzione_MF" disabled>-->
                                            <div id='giunzione_MF' ></div>
                                          
                                        </div>
                                        <div class="form-group">
                                            <label for="uscita_cavo">Uscita Cavo:</label>
                                           <div class="form-control"   id="uscita_cavo"></div>
                                        </div>
                                       
                                        <div class="form-group">
                                            <label for="qta">Quantit&agrave; richiesta:</label>
                                            <input type="text" class="form-control"   style="width:300px" id="qta"   maxlength="3" />
                                        </div>
                                        <p>
                                            <input type="button"  class="btn btn-primary" value="Determina prezzo" id="sendButton" />
                                        </p>
                                    </form>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div style='font-size: 12px; font-family: Verdana; margin-left: 20px; margin-top: 10px; float: left;'>
                                        <span>
                                            Costruzione prezzo:</span>
                                        <div id='events'></div> 
                                    </div>
                                </div>
                            </div>
                                                              
                           
                        </div>

                    </body>

                        <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqx-all.js"></script>                     
                        <script type="text/javascript" src="js/bootstrap/bootstrap.min.js"></script>
                        <script type="text/javascript">
                            var costo_prodotto=0;
                            $(document).ready(function () {
                                //$('#mainSplitter').jqxSplitter({width: '100%', height: '100%', panels: [{ size: '260', min: 150 }, { size: '80%'}] });
                              
                                $("#giunzione_MF").jqxCheckBox({ width: 150, height: 25, disabled:true });
                                $('#events').jqxPanel({  height: '250px', width: '200px' });
                                $('#events').css('border', 'none');
                                $('#calcolo_prezzo').jqxValidator({
                                    hintType: 'label',
                                    animationDuration: 0,
                                    rules: [
                                            { input: '#lunghezza', message: 'La lunghezza lampada &egrave; richiesta!', action: 'keyup, blur', rule: 'required' }
                                            ]
                                });

                                $('#sendButton').on('click', function () {
                                     $('#calcolo_prezzo').jqxValidator('validate');
                               });
                               
                            });

                            var productsSource ={
                                                    dataType: "json",
                                                    dataFields: [
                                                        { name: 'prodotto'},
                                                        { name: 'lunghezza_massima_accettata'},
                                                        { name: 'lunghezza_minima_accettata'}
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

                            var schermoSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'codice_schermo'},
                                                    { name: 'descrizione_schermo'}
                                                ],
                                                url: 'data/enumerate_schermo.php'
                                            };
                            var schermoAdapter = new $.jqx.dataAdapter(schermoSource);

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
                                    
                                    if (value != null) {
                                            $('#events').jqxPanel('clearcontent');
                                            $('#events').jqxPanel('prepend',  '<div style="margin-top: 5px;">Avanzamento: ' + costo_prodotto + '</div>');
                                    }
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

                                    //attivo la selezione della scelta per lo schermo
                                    $("#tipo_schermo").jqxComboBox({ disabled: false, selectedIndex: -1});        
                                    schermoSource.data = {prodotto: nome_prodotto};
                                    schermoAdapter = new $.jqx.dataAdapter(schermoSource);
                                    $("#tipo_schermo").jqxComboBox({source: schermoAdapter});

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
                                promptText: "Select type of switching system...",
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
                                valueMember: 'codice_schermo'
                            });      
  


                        </script>
                    </html>
  