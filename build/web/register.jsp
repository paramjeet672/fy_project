<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Final Year Project</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">


        <link rel="stylesheet" href="css/style.css">
    </head>
    <body id="top">
        <div class="bgded overlay" style="background-image:url('images/bg.jpg');"> 
            <div class="wrapper row0">
                <div id="topbar" class="hoc clear"> 
                    <div class="fl_left">

                    </div>
                    <div class="fl_right">
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="user.jsp">User Login</a></li>
                            <li><a href="admin.jsp">Admin Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrapper row1">
                <header id="header" class="hoc clear"> 
                    <!-- ################################################################################################ -->
                    <div id="logo" class="fl_left">
                        <h1><a href="#">TWITTER</a></h1>
                    </div>
                    <!--- --->

                    <div class="container">
                        <div class="login">
                            <h2 class="login-heading">REGISTER HERE!!</h2>
                            <form method="post" action="uploadServlet" enctype="multipart/form-data" >
                                <input type="text" name="uname" placeholder="User Name" required="required" class="input-txt" />
                                <input type="text" name="email" placeholder="Email" required="required" class="input-txt" />
                                <input type="password" name="app_key" placeholder="Consumer Key (API Key)" required="required" class="input-txt" />
                                <input type="password" name="app_secret_key" placeholder="Consumer Secret (API Secret)" required="required" class="input-txt" />
                                <input type="password" name="access_key" placeholder="Access Token" required="required" class="input-txt" />
                                <input type="password" name="acc_token_key" placeholder="Access Token Secret" required="required" class="input-txt" />
                                <input type="password" name="password" placeholder="Password" required="required" class="input-txt" />
                                <input type="file" name="photo" required="required" class="input-txt" />
                                <div class="login-footer">
                                    <button type="submit" class="btn btn--right">Sign UP  </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--- --->


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
                                <!--<h3 style="font-size: 32px"><br><br>SociRank: Identifying and Ranking Prevalent News Topics Using Social Media Factors<br></h3>-->

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


        <div class="wrapper coloured">
            <article class="hoc cta clear"> 
                <!-- ################################################################################################ -->

                <!-- ################################################################################################ -->
            </article>
        </div>

        <div class="wrapper row5">
            <div id="copyright" class="hoc clear"> 
                <!-- ################################################################################################ -->
                <p class="fl_left">Copyright &copy; 2018 Paramjeet<a href="#"></a></p>
                <!-- ################################################################################################ -->
            </div>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
        <!-- JAVASCRIPTS -->
        <script src="layout/scripts/jquery.min.js"></script>
        <script  src="js/index.js"></script>
        <script src="layout/scripts/jquery.backtotop.js"></script>
        <script src="layout/scripts/jquery.mobilemenu.js"></script>
        <script src="layout/scripts/jquery.flexslider-min.js"></script>
    </body>
</html>