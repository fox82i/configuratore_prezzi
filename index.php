<?php
    session_start();
    require_once('config/dbconfig.inc.php');
  
    
    $dbh = dbConn::getConnection();

?>

                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <link rel="icon" href="favicon.ico" type="image/x-icon">                       
                        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css" />
                        <link rel="stylesheet" href="js/jqwidgets/styles/jqx.base.css" type="text/css" />
                        
                        
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
                              <a class="navbar-brand" href="#">Gestione preventivi </a>      
                             <img height="50" width="45" src="images/logo.jpg"/>                        
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
                                            <label for="lunghezza">Lunghezza(mm):</label>
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
                                    <div style='font-size: 12px; font-family: Verdana; margin-left: 5px; margin-top: 10px; float: left;'>
                                        <span>
                                            Messaggi server:</span>
                                            <div id='events'></div>      
                                                                         
                                           
                                    </div>
                                     
                                    <div id='results'>
                                       <div id='tab_risultati'></div>                                        
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
                                $('#events').jqxPanel({  height: '100px', width: '800px' });
                                $('#events').css('border', 'none');

                                $('#results').jqxPanel({ height: '150px' , width: '800px' });
                                $('#results').css('border', 'none');

                                $('#calcolo_prezzo').jqxValidator({
                                    hintType: 'label',
                                    animationDuration: 0,
                                    rules: [
                                            { input: '#lunghezza', message: 'La lunghezza lampada &egrave; richiesta!', action: 'keyup, blur', rule: 'required' },
                                            { input: '#qta', message: 'Inserire la quantit&agrave; richiesta dal cliente!', action: 'keyup, blur', rule: 'required' }
                                            ]
                                });


                                $("#tab_risultati").on('columnresized', function (event) {
                                                        var column = event.args.columntext;
                                                        var newwidth = event.args.newwidth
                                                        var oldwidth = event.args.oldwidth;
                                                        console.log("Column: " + column + ", " + "New Width: " + newwidth + ", Old Width: " + oldwidth);
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
                           // var motoreLedAdapter = new $.jqx.dataAdapter(motoreLedSource);


                            var coloreLuceSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'codice_motore_led'},
                                                    { name: 'descrizione_colore'}
                                                ],
                                                url: 'data/enumerate_temperatura_luce.php'
                                            };
                          //  var coloreLuceAdapter = new $.jqx.dataAdapter(coloreLuceSource);

                            var schermoSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'codice_schermo'},
                                                    { name: 'descrizione_schermo'}
                                                ],
                                                url: 'data/enumerate_schermo.php'
                                            };
                           // var schermoAdapter = new $.jqx.dataAdapter(schermoSource);

                            var sistemaFissaggioSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'id_sistema_fissaggio'},
                                                    { name: 'descrizione_sistema_fissaggio'}
                                                ],
                                                url: 'data/enumerate_sistema_fissaggio.php'
                                            };
                          //  var sistemaFissaggioAdapter = new $.jqx.dataAdapter(sistemaFissaggioSource);


                            var sistemaAccensioneSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'id_sistema_accensione'},
                                                    { name: 'descrizione'}  ,
                                                    {name : 'potenza_reel'} ,                                                
                                                    {name : 'portata_max'}  ,
                                                    {name: 'errore'} ,                                                  
                                                    { name: 'sdoppiabile'}                                                  

                                                ],
                                                root:'rows',
                                                id:'id_sistema_accensione',
                                                url: 'data/enumerate_sistema_accensione.php',
                                              
                                            };
                           // var sistemaAccensioneAdapter = new $.jqx.dataAdapter(sistemaAccensioneSource);

                            var connettoreAlimentazioneSource ={
                                                dataType: "json",
                                                dataFields: [
                                                    { name: 'id_connettore'},
                                                    { name: 'descrizione_connettore'} ,                                                  
                                                    { name: 'giunzione_MF'} ,                                                  
                                                    { name: 'uscita_cavo'} ,                                                  
                                                    { name: 'lunghezza_cavo'}                                      
                                                                                            

                                                ],
                                                root:'rows',
                                                id:'id_connettore',
                                                url: 'data/enumerate_connettore_alimentazione.php',

                                              /*  beforeprocessing: function (data) {
                                                  connettoreAlimentazioneSource.costo = data.costo;
                                                  connettoreAlimentazioneSource.potenza_reel=data.potenza_reel;
                                                } */
                                              
                                            };
                       //     var connettoreAlimentazioneAdapter = new $.jqx.dataAdapter(connettoreAlimentazioneSource) ;

                             $("#prodotto").bind('select', function(event){
                                if (event.args) {
                                    $("#motore_led").jqxComboBox({ disabled: false, selectedIndex: -1});        
                                    
                                    var value = event.args.item.value;

                                    motoreLedSource.data = {prodotto: value};
                                    motoreLedAdapter = new $.jqx.dataAdapter(motoreLedSource);
                                    $("#motore_led").jqxComboBox({source: motoreLedAdapter});
                                    
                                /*    if (value != null) {
                                            $('#events').jqxPanel('clearcontent');
                                            $('#events').jqxPanel('prepend',  '<div style="margin-top: 5px;">Avanzamento: ' + costo_prodotto + '</div>');
                                    }*/
                                }
                            });                              

                            $("#motore_led").bind('select', function(event){
                                if (event.args) {
                                    var index = $("#motore_led").jqxComboBox('selectedIndex');  
                                    if (index != -1){
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
                                   
                                }
                            }); 


                            $("#sistema_fissaggio").bind('select', function(event){
                                  if (event.args) {
                                    var index = $("#sistema_fissaggio").jqxComboBox('selectedIndex');  
                                    if (index != -1){
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
                                        $("#sistema_accensione").on('bindingComplete', function (event) {

                                            var messaggio=sistemaAccensioneAdapter.records['0']['errore'];
                                            var sdoppiato=sistemaAccensioneAdapter.records['0']['sdoppiabile'];
                                            var reel_w=sistemaAccensioneAdapter.records['0']['potenza_reel'];


                                             $('#events').jqxPanel('clearcontent');

                                             switch(sdoppiato){
                                                case 'errore':
                                                    $('#events').jqxPanel('prepend',  '<div style="margin-top: 5px;color:red">'+ messaggio + '</div>');
                                                    break;
                                                case 'SI':
                                                    $('#events').jqxPanel('prepend',  '<div style="margin-top: 5px;color:red">'+ messaggio + '</div>');
                                                    break;
                                                default:
                                                    $('#events').jqxPanel('prepend',  '<div style="margin-top: 5px;">Potenza reel nominale rilevata ' + reel_w + 'W </div>');
                                                    break;
                                             }
                                           
                                          });

                                    }

                                  }
                               
                            });    

                            $("#sistema_accensione").bind('select', function(event){
                              
                                if (event.args) {
                                    var index = $("#sistema_accensione").jqxComboBox('selectedIndex');  
                                    if (index != -1){

                                        var sistema_accensione = event.args.item.value;
                                        var sistema_fissaggio = $("#sistema_fissaggio").jqxComboBox('getSelectedItem').value;
                                        var lunghezza_prodotto= $('#lunghezza').val();
                                        var nome_prodotto=$("#prodotto").jqxComboBox('getSelectedItem').value;
                                        var codice_motore_led=$("#motore_led").jqxComboBox('getSelectedItem').value;
                                        var schermo=$("#tipo_schermo").jqxComboBox('getSelectedItem').value;

                                        
                                        var vdc=motoreLedAdapter.records[$("#motore_led").jqxComboBox('getSelectedIndex')]['VDC'];
                                        
                                        $("#connettore_alimentazione").jqxComboBox({ disabled: false, selectedIndex: -1});
                                        var sdoppiato=sistemaAccensioneAdapter.records[$('#sistema_accensione').jqxComboBox('getSelectedIndex')]['sdoppiabile'];
                                       
                                        connettoreAlimentazioneSource.data={
                                            prodotto:nome_prodotto,
                                            motore_led:codice_motore_led,
                                            lunghezza_lampada:lunghezza_prodotto,
                                            sistema_fissaggio:sistema_fissaggio,
                                            vdc:vdc,
                                            sistema_accensione:sistema_accensione,
                                            sdoppiabile:sdoppiato

                                          
                                        };

                                        connettoreAlimentazioneAdapter=new $.jqx.dataAdapter(connettoreAlimentazioneSource);
                                        $("#connettore_alimentazione").jqxComboBox({   source: connettoreAlimentazioneAdapter});

                                    }
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
                                  
                                  /*  $('#events').jqxPanel('clearcontent');
                                    $('#events').jqxPanel('prepend',  '<div style="margin-top: 5px;">Avanzamento: ' + connettoreAlimentazioneSource.costo + '</div>');
                                    $('#events').jqxPanel('prepend',  '<div style="margin-top: 5px;">Potenza lampada: ' + connettoreAlimentazioneSource.potenza_reel + 'W</div>');
                              */
                                    switch (connettore_alimentazione){
                                        case 'Sliding':
                                            alert('Procedi pure alla determinazione del prezzo');
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

                             $('#sendButton').on('click', function () {
                                    if($('#calcolo_prezzo').jqxValidator('validate')){  
                                      
                                        var nome_prodotto=              $("#prodotto").jqxComboBox('getSelectedItem').value;
                                        var lunghezza_prodotto=         $('#lunghezza').val();
                                        var codice_motore_led=          $("#motore_led").jqxComboBox('getSelectedItem').value;
                                        var tipo_schermo=               $("#tipo_schermo").jqxComboBox('getSelectedItem').value;
                                        var sistema_fissaggio =         $("#sistema_fissaggio").jqxComboBox('getSelectedItem').value;                                      
                                        var sistema_accensione =        $("#sistema_accensione").jqxComboBox('getSelectedItem').value;    
                                        var connettore_alimentazione=   $('#connettore_alimentazione').jqxComboBox('getSelectedItem').value;
                                        var lunghezza_cavo  =           $('#lunghezza_cavo_alim').val();
                                        var giunzione_MF    =           $('#giunzione_MF').jqxCheckBox('checked');
                                        var qta_richiesta   =           $('#qta').val();
                                        
                                        var productResultSource={
                                                    dataType: "json",
                                                    dataFields: [

                                                        { name: 'potenza_reel'},
                                                        { name: 'costo'},
                                                        { name: 'preventivo'},
                                                        { name: 'prezzo'},                                                       
                                                        { name: 'lunghezza_reel'},
                                                        { name: 'nome_prodotto'}
                                                    ],
                                                    
                                                    root:'rows',
                                                    url: 'data/determina_prezzo.php',
                                                    data:{
                                                        prodotto:nome_prodotto,
                                                        lunghezza_lampada:lunghezza_prodotto,
                                                        motore_led:codice_motore_led,
                                                        tipo_schermo:tipo_schermo,
                                                        sistema_fissaggio:sistema_fissaggio,
                                                        sistema_accensione:sistema_accensione,
                                                        connettore_alimentazione:connettore_alimentazione,
                                                        lunghezza_cavo:lunghezza_cavo,
                                                        giunzione_MF:giunzione_MF,
                                                        qta_richiesta:qta_richiesta

                                                    }
                                        };

                                        risultatoFinaleAdapter=new $.jqx.dataAdapter(productResultSource);
                                        var imagerenderer = function (row, datafield, value) {
                                            return '<img style="margin-left: 5px;  margin-top: 5px" height="100" width="100" src="images/prodotti/' + value + '.jpg"/>';
                                        };

                                        $("#tab_risultati").jqxGrid({ 
                                            source: risultatoFinaleAdapter,                                           
                                            columnsresize: true,
                                            rowsheight: 110,
                                            autoheight: true,
                                            width: '100%',
                                            columns: 
                                            [
                                                {datafield: "nome_prodotto",text: '<strong>Foto ' + nome_prodotto +'</strong>', width:110, cellsrenderer: imagerenderer },
                                                {datafield: "costo",  text: "<strong>Costo (&euro;/pz)</strong>"},
                                                {datafield: "prezzo", text: "<strong>Prezzo lordo (&euro;/pz)</strong>"},
                                              //  {datafield: "preventivo", text: "Preventivo (&euro;)"},
                                                {datafield: "potenza_reel",  text: "<strong>Potenza (W)</strong>"},                                             
                                                {datafield: "lunghezza_reel",  text: "<strong>Lunghezza reel (mm)</strong>"}/*,
                                                {datafield: "descrizione_aggiuntiva", text: "Note"}*/
                                              
                                            ]
                                        });
                                       

                                    }else{
                                        $('#calcolo_prezzo').jqxValidator('validate');
                                    }
                               });


                            $("#prodotto").jqxComboBox({
                                source: productssAdapter,   
                                width: 300,
                                height: 25,
                                promptText: "Select a products...",
                                displayMember: 'prodotto',
                                valueMember: 'prodotto',
                                animationType:'slide',
                                renderer: function (index, label, value) {                                  
                                    var imgurl = 'images/prodotti/' + value + '.jpg';
                                    var img = '<img height="50" width="45" src="' + imgurl + '"/>';
                                    var table = '<table style="min-width: 150px;"><tr><td style="width: 55px;" rowspan="2">' + img + '</td><td>' + value + '</td></tr></table>';
                                    return table;                                   
                                }
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
                                valueMember: 'id_tipo_luce',
                                animationType:'slide',
                                renderer: function (index, label, value) {    
                               
                                    var imgurl = 'images/temperatura_colore/' + label + '.jpg';
                                    var img = '<img height="50" width="45" src="' + imgurl + '"/>';
                                    var table = '<table style="min-width: 150px;"><tr><td style="width: 55px;" rowspan="2">' + img + '</td><td>' + label + '</td></tr></table>';
                                    return table;                                   
                                }
                            });  
                            $("#tipo_schermo").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of screen...",
                                displayMember: 'descrizione_schermo',
                                valueMember: 'codice_schermo',
                                animationType:'slide',
                                renderer: function (index, label, value) {    
                               
                                    var imgurl = 'images/schermi/' + label + '.jpg';
                                    var img = '<img height="50" width="45" src="' + imgurl + '"/>';
                                    var table = '<table style="min-width: 150px;"><tr><td style="width: 55px;" rowspan="2">' + img + '</td><td>' + label + '</td></tr></table>';
                                    return table;                                   
                                }
                            });     

                            $("#sistema_fissaggio").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of fix system...",
                                displayMember: 'descrizione_sistema_fissaggio',
                                valueMember: 'id_sistema_fissaggio',
                                animationType:'slide',
                                renderer: function (index, label, value) {    
                               
                                    var imgurl = 'images/sistema_fissaggio/' + label + '.jpg';
                                    var img = '<img height="50" width="45" src="' + imgurl + '"/>';
                                    var table = '<table style="min-width: 150px;"><tr><td style="width: 55px;" rowspan="2">' + img + '</td><td>' + label + '</td></tr></table>';
                                    return table;                                   
                                }
                            });  

                            $("#sistema_accensione").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of switching system...",
                                displayMember: 'descrizione',
                                valueMember: 'id_sistema_accensione',
                                animationType:'slide'
                            });    
                            $("#connettore_alimentazione").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of connector...",
                                displayMember: 'descrizione_connettore',
                                valueMember: 'id_connettore',
                                animationType:'slide'
                            });  
                             $("#uscita_cavo").jqxComboBox({            
                                width: 300,
                                height: 25,
                                disabled: true,
                                promptText: "Select type of cable exit...",
                                animationType:'slide'
                                
                            }); 
                             
  


                        </script>
                    </html>
  