<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="graph.algo.Edge"%>
<%@page import="graph.algo.Graph"%>
<%@page import="graph.algo.Vertex"%>
<%@page import="graph.algo.Node"%>
<%@page import="graph.algo.GraphSimple"%>
<%@page import="Mysql.DbConnection"%>
<%@page import="twitter4j.Status" %>
<%@page import="twitter4j.TwitterException" %>
<%@page import="twitter4j.TwitterFactory" %>
<%@page import="twitter4j.conf.ConfigurationBuilder" %>
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
                            <li><a href="index.jsp">Home</a></li>
<!--                            <li><a href="user.jsp">User Login</a></li>
                            <li><a href="admin.jsp">Admin Login</a></li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrapper row1">
                <header id="header" class="hoc clear"> 
                    <!-- ################################################################################################ -->
                    <div id="logo" class="fl_left">
                        <h1><a href="index.html">TWITTER</a></h1>
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
                    <%
                   


%>

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
                <!-- main body -->
                <!-- ################################################################################################ -->
                <div class="center btmspace-80">
                    <h3 class="heading">Node Weighting</h3>
                    <%

                        ConfigurationBuilder cf = new ConfigurationBuilder();
                        cf.setDebugEnabled(true)
                                .setOAuthConsumerKey("aV8lanFby7bTEMl2JXfJPiuB7")
                                .setOAuthConsumerSecret("3Di9ULBEzWt1PJUtCgvUnU7vXvvVE74cdxrNA7pfVeF1sTSSty")
                                .setOAuthAccessToken("759307560369303553-X1kMf7u6BapUEMqQIQRMaR9fCuXgoyd")
                                .setOAuthAccessTokenSecret("awCfmbazBXRyk1ddMF7sUaCSD1XkR4cYc6T7QsAncpC2g");

                        TwitterFactory tf = new TwitterFactory(cf.build());
                        twitter4j.Twitter twitter = tf.getInstance();
                        java.util.List<Status> status = twitter.getHomeTimeline();
                         
                    %>
                    <!-- / Main body -->
                    <table>
                        <tr>
                            
                            <th>User ID</th>
                            <th>Profile Images</th>
                            <th>User Name</th>
                            <th>Post</th>
                            <th>Betweenness</th>
                            <th>Node Weight</th>
                        </tr>
                        <%
                            for (Status st : status) {

                                String tweet = st.getText().replace("'", " ");
                                tweet = tweet.replaceAll(URL_REGEX, "");
                                tweet = tweet.replaceAll("@([^\\s]+)", "");
                                tweet = tweet.replaceAll(CONSECUTIVE_CHARS, "$1");
                                tweet = tweet.replaceAll(STARTS_WITH_NUMBER, "");
                                tweet = tweet.replaceAll("&", "&");
                                tweet = tweet.replaceAll(quest, "");
                                System.out.println("Replce Tweets *-* : " + tweet);
                            }
                            Connection con = DbConnection.getConnection();
                            Statement stt = con.createStatement();
                            try {
                                ResultSet rs = stt.executeQuery("select * from tweets ORDER BY df ASC");
                                while (rs.next()) {
                                    String uid = rs.getString("post");
                                    String post = uid.replace("?", "");
                                    System.out.println("User ID :----- " + uid);
                        %>
                        <tr>
                            <td style="color: black"><%=rs.getString("uid")%></td>
                            <td><img src="<%=rs.getString("img")%>" width="50" height="50" /></td>
                            <td style="color: darkblue"><%=rs.getString("uname")%></td>
                            <td style="color: blueviolet"><%=post%></td>
                            <td style="color: #B94A48"><%=rs.getString("df")%></td>
                            <td style="color: #B94A48"><%=rs.getString("nodeweighting")%></td>
                        </tr>
                        <%
                                }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                        %>
                    </table>
                    <a href="media_socirank.jsp"><input type="Submit" value="Media Focus & SociRank" class="button" ></a>
                    <!-- / End body -->

                </div>

                <!-- ################################################################################################ -->

                <div class="clear"></div>
            </main>
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