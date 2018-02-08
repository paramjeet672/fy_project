<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Final Year Project</title>
        <meta charset="utf-8">
        <style>
            .button {
                background-color: #B94A48; /* Green */
                border: none;
                font-family: fantasy;
                color: white;
                padding: 5px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }
        </style>
        <script>
            window.onload = function () {
                var va1 =0.4;
                var va2 =0.2;
                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    exportEnabled: true,
                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                    title:{
                        text: ""
                    },
                    data: [{
                            type: "column", //change type to bar, line, area, pie, etc
                            //indexLabel: "{y}", //Shows y value on all Data Points
                            indexLabelFontColor: "#5A5757",
                            indexLabelPlacement: "outside",
                            dataPoints: [
                                { x: 10, y: va1, indexLabel: "SociRank" },
                                { x: 22, y: va2, indexLabel: "Media Focus" },
                            ]
                        }]
                });
                chart.render();

            }
        </script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <%
            long serialVersionUID = -2486285775626564821L;
            String URL_REGEX = "((www\\.[\\s]+)|(https?://[^\\s]+))";
            String CONSECUTIVE_CHARS = "([a-z])\\1{1,}";
            String STARTS_WITH_NUMBER = "[1-9]\\s*(\\w+)";
            String quest = "\\?";

        %>
    </head>
    <body id="top">
        <div class="bgded overlay" style="background-image:url('images/bg.jpg');"> 
            <div class="wrapper row0">
                <div id="topbar" class="hoc clear"> 
                    <div class="fl_left">
                    </div>
                    <div class="fl_right">
                        <ul>
                            <li><a href="index.jsp">Logout</a></li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrapper row1">
                <header id="header" class="hoc clear"> 
                    <!-- ################################################################################################ -->
                    <div id="logo" class="fl_left">
                        <h1><a href="index.jsp">Score</a></h1>
                    </div>
                    <nav id="mainav" class="fl_right">
                        <!--        <ul class="clear">
                                  <li class="active"><a href="index.html">Home</a></li>
                                  <li><a class="drop" href="#">Pages</a>
                                    <ul>
                                      <li><a href="pages/gallery.html">Gallery</a></li>
                                      <li><a href="pages/full-width.html">Full Width</a></li>
                                      <li><a href="pages/sidebar-left.html">Sidebar Left</a></li>
                                      <li><a href="pages/sidebar-right.html">Sidebar Right</a></li>
                                      <li><a href="pages/basic-grid.html">Basic Grid</a></li>
                                    </ul>
                                  </li>
                                  <li><a class="drop" href="#">Dropdown</a>
                                    <ul>
                                      <li><a href="#">Level 2</a></li>
                                      <li><a class="drop" href="#">Level 2 + Drop</a>
                                        <ul>
                                          <li><a href="#">Level 3</a></li>
                                          <li><a href="#">Level 3</a></li>
                                          <li><a href="#">Level 3</a></li>
                                        </ul>
                                      </li>
                                      <li><a href="#">Level 2</a></li>
                                    </ul>
                                  </li>
                                  <li><a href="#">Link Text</a></li>
                                  <li><a href="#">Link Text</a></li>
                                </ul>-->
                    </nav>

                    <!-- ################################################################################################ -->
                </header>
            </div>
            <div id="pageintro" class="hoc clear"> 
                <!-- ################################################################################################ -->
                <div class="flexslider basicslider">
                    <ul class="slides">
                        <li>
                            <article>
                                <div id="chartContainer" style="height: 400px; width: 100%;"></div>
                                <script src="graph.js"></script>
                                <footer>
                                    <form class="group" method="post" action="#">
                                        <fieldset>
                                            <legend>Newsletter:</legend>
                                            <!--                  <input type="email" value="" placeholder="Email Here&hellip;">
                                                              <button class="fa fa-sign-in" type="submit" title="Submit"><em>Submit</em></button>-->
                                        </fieldset>
                                    </form>
                                </footer>
                            </article>
                        </li>
                    </ul>
                </div>
                <!-- ################################################################################################ -->
            </div>
            <!-- ################################################################################################ -->
        </div>
        <!--        <div class="wrapper row3">
                    <main class="hoc container clear"> 
                         main body 
                         ################################################################################################ 
                        <div class="center btmspace-80">
                            <h3 class="heading">Tweet's get from Twitter</h3>
                           
                        </div>
                         ################################################################################################ 
                        <div class="clear"></div>
                    </main>
                </div>-->


        <div class="wrapper coloured">
            <article class="hoc cta clear"> 
                <!-- ################################################################################################ -->

                <!-- ################################################################################################ -->
            </article>
        </div>

        <div class="wrapper row5">
            <div id="copyright" class="hoc clear"> 
                <!-- ################################################################################################ -->
                <p class="fl_left">Copyright &copy; 2018 Paramjeet</p>
                <!-- ################################################################################################ -->
            </div>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
        <!-- JAVASCRIPTS -->
        <script src="layout/scripts/jquery.min.js"></script>
        <script src="layout/scripts/jquery.backtotop.js"></script>
        <script src="layout/scripts/jquery.mobilemenu.js"></script>
        <script src="layout/scripts/jquery.flexslider-min.js"></script>
    </body>
</html>