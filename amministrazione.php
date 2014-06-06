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
                                <li><a href="index.php">Home</a></li>
                                <li><a href="statistiche.php">Statistiche</a></li>
                                <li  class="active" ><a href="amministrazione.php">Amministrazione</a></li>
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
                                   <?php include ("layout/menu/menu_amministrazione.php");?>
                            </div>
                            <div class="splitter-panel">
                                <div id='jqxTabsAdmin' style="float: left;">                                    
                                      <ul style="margin-left: 10px;" id="unorderedList">
                                        <li hasclosebutton='false'>Associazioni - Helps</li>                               
                                    </ul>
                                     <div style="margin-top: 15px; margin-left: 10px;">
                                        <p>Breve spiegazione di come si esegue il lavoro dell'amministratore</p>
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
                        <script type="text/javascript" src="js/jqwidgets/jqxvalidator.js"></script> 
                        
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
                                    $('#jqxTabsAdmin').jqxTabs('addLast', title, data);           
                                });    
                            }

                            function tab_is_open(name){
                                var tabsCount = $("#jqxTabsAdmin").jqxTabs('length');
                                var position;
                                if (tabsCount>0){
                                    for (var i = 0; i < tabsCount; i++) {
                                        var tabTitle = $("#jqxTabsAdmin").jqxTabs('getTitleAt', i);
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
                                    $('#jqxTabsAdmin').jqxTabs('select', tab); 
                                
                                }else{
                                    href = plugin + '.php';
                                    loadPage(title_tab, href);
                                }

                            }
                            $(document).ready(function () {
                                $('#mainSplitter').jqxSplitter({width: '100%', height: '100%', panels: [{ size: '260', min: 150 }, { size: '80%'}] });
                                $("#jqxnavigationbar_amministrazione").jqxNavigationBar({ width: '100%', expandMode: 'multiple', expandedIndexes: [0, 0]});
                                $('#jqxTabsAdmin').jqxTabs({ height: '100%', width: '100%', showCloseButtons: true, animationType: 'fade',scrollPosition: 'both'});
                               
                            });

                           

                        </script>
                    </html>
  