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