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
                        <link rel="stylesheet" href="js/jqwidgets/styles/jqx.energyblue.css" type="text/css" />
                        <link rel="stylesheet" href="js/jqwidgets/styles/jqx.bootstrap.css" type="text/css" />
                        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css" />
                        <title>Gestione preventivi L&amp;S</title>
                        <style type="text/css">
                            html, body
                            {
                                height: 100%;
                                width: 100%;
                                margin: 0px;
                                padding: 0px;
                                overflow: hidden;
                            },
                            .text-input
                            {
                                height: 21px;
                                width: 150px;
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
                              <a class="navbar-brand" href="#">Gestione preventivi L&amp;S </a>                              
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
                       
                        <div id="mainSplitter">
                            <div class="splitter-panel">
                                   <?php include ("layout/menu/menu_ricerche.php");?>
                            </div>
                            <div class="splitter-panel">
                                <div id='jqxTabs' style="float: left;">
                                    <ul style="margin-left: 10px;" id="unorderedList">
                                        <li hasclosebutton='false'>Configuratore</li>                               
                                    </ul>
                                  
                                    <div style="margin-top: 15px; margin-left: 10px;">
                                        <form id="calcolo_prezzo" action="./">
                                             <span style="margin-top: 25px; font-size: 12px; font-family: verdana; float: left;">Prodotto:</span>
                                             <div style="margin-left: 5px; float: left;margin-top: 20px;" id="prodotto"></div>
                                           
                                             <div style='clear: both;'></div>

                                             <div style='margin-top: 40px;'>
                                                <span style="margin-top: 6px; font-size: 12px; font-family: verdana; float: left;">Lunghezza:</span>
                                                <input type="text" style="margin-left: 5px; float: left;" id="lunghezza" maxlength="4" />
                                            </div>
                                            <div style='margin-top: 90px;'>
                                                <span style="margin-top: 6px; font-size: 12px; font-family: verdana; float: left;">Motore Led:</span>
                                                <div style="margin-left: 5px; float: left;" id="motore_led"></div>
                                            </div>
                                             <div style='margin-top: 140px;'>
                                                <span style="margin-top: 6px; font-size: 12px; font-family: verdana; float: left;">Colore luce:</span>
                                                <div style="margin-left: 5px; float: left;" id="colore_luce"></div>
                                            </div>

                                             <div style='margin-top: 190px;'>
                                                <span style="margin-top: 6px; font-size: 12px; font-family: verdana; float: left;">Sistema fissaggio:</span>
                                                <div style="margin-left: 5px; float: left;" id="sistema_fissaggio"></div>
                                            </div>
                                             <div style='margin-top: 230px;'>
                                                <span style="margin-top: 6px; font-size: 12px; font-family: verdana; float: left;">Sistema accensione:</span>
                                                <div style="margin-left: 5px; float: left;" id="sistema_accensione"></div>
                                            </div>
                                            <div style='margin-top: 280px;'>
                                             <input type="button" value="Determina prezzo" id="sendButton" />
                                            </div>
                                        </form>
                                          <div style='font-size: 12px; font-family: Verdana; margin-top: 10px;'>
                                        <div>Events:</div>
                                        <div id='events'>
                                        </div>
                                    </div>
                                    </div>

                                    
                                </div>
                            </div>
                        </div>
                       

                    </body>

                        <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxcore.js"></script>
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

                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.selection.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.pager.js"></script>
                        <script type="text/javascript" src="js/jqwidgets/jqxdata.export.js"></script> 
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.export.js"></script> 
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.filter.js"></script> 
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.sort.js"></script> 
                        
                        <script type="text/javascript" src="js/jqwidgets/jqxgrid.columnsresize.js"></script> 
                     
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
                                $('#mainSplitter').jqxSplitter({width: '100%', height: '100%', panels: [{ size: '260', min: 150 }, { size: '80%'}] });
                                $("#jqxnavigationbar_richerche").jqxNavigationBar({ width: '100%', expandMode: 'multiple', expandedIndexes: [0, 0]});
                                $('#jqxTabs').jqxTabs({ height: '100%', width: '100%', showCloseButtons: true, animationType: 'fade',scrollPosition: 'both'});
                                $('#calcolo_prezzo').jqxValidator({
                                    hintType: 'label',
                                    animationDuration: 0,
                                    rules:[
                                            {input:'#lunghezza',  message: 'La lunghezza &egrave; richiesta!', action: 'keyup', rule: 'required' }
                                        ],
                                   
                                });
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
                                  console.log(sistemaAccensioneAdapter);
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
  


                        </script>
                    </html>
  