<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Final Year Project</title>
        <meta charset="utf-8">
        <script>
            function countChar(val) {
                var len = val.value.length;
                if (len >= 140) {
                    val.value = val.value.substring(0, 140);
                } else {
                    $('#charNum').text(140 - len);
                }
            };
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
                            <li><a href="uhome.jsp">User Home</a></li>
                            <li><a id="myBtn" href="twe.jsp">Compose Tweet</a></li>
                            <li><a href="time_line.jsp">Time Line</a></li>
                            <li><a href="socirank.jsp">Ranked News Topics</a></li>
                            <li><a href="my_tweets.jsp">My Tweet's</a></li>
                            <li><a href="index.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrapper row1">
                <header id="header" class="hoc clear"> 
                    <!-- ################################################################################################ -->
                    <div id="logo" class="fl_left">
                        <h1><a href="#">COMPOSE TWEET HERE!!</a></h1>
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
                                <h3 style="font-size: 32px"><br><br><br></h3>

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
        <div class="wrapper row3">
            <main class="hoc container clear"> 
                 
                <div class="center btmspace-80">
                    <h3 class="heading">Compose New Tweet Here!!</h3>
                    <form action="Tweet" method="post"  enctype="multipart/form-data">
                    <center>
                            <textarea name="msg" onkeyup="countChar(this)" required="" style="width: 360px; height: 100px; border-bottom-color: #00abf0; color: #269abc"></textarea><br>
                            <div id="charNum"></div><br>
                            <button style="color: #000">Tweet</button><br>
                        </center>
                    </form>
                </div>
                
                <div class="clear"></div>
            </main>
        </div>
         
        
        
        
<!-- Modal content -->
        <div class="wrapper coloured">
            <article class="hoc cta clear"> 
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