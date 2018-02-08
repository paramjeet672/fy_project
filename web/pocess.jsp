<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Mysql.DbConnection"%>
<%@page import="twitter4j.Status" %>
<%@page import="graph.algo.Graph" %>
<%@page import="twitter4j.TwitterException" %>
<%@page import="twitter4j.TwitterFactory" %>
<%@page import="twitter4j.conf.ConfigurationBuilder" %>
<%
    long serialVersionUID = -2486285775626564821L;
    String URL_REGEX = "((www\\.[\\s]+)|(https?://[^\\s]+))";
    String CONSECUTIVE_CHARS = "([a-z])\\1{1,}";
    String STARTS_WITH_NUMBER = "[1-9]\\s*(\\w+)";
    String quest = "\\?";

    ConfigurationBuilder cf = new ConfigurationBuilder();
    cf.setDebugEnabled(true)
            .setOAuthConsumerKey("aV8lanFby7bTEMl2JXfJPiuB7")
            .setOAuthConsumerSecret("3Di9ULBEzWt1PJUtCgvUnU7vXvvVE74cdxrNA7pfVeF1sTSSty")
            .setOAuthAccessToken("759307560369303553-X1kMf7u6BapUEMqQIQRMaR9fCuXgoyd")
            .setOAuthAccessTokenSecret("awCfmbazBXRyk1ddMF7sUaCSD1XkR4cYc6T7QsAncpC2g");

    TwitterFactory tf = new TwitterFactory(cf.build());
    twitter4j.Twitter twitter = tf.getInstance();
    java.util.List<Status> status = twitter.getHomeTimeline();


    for (Status st : status) {
        Connection con = DbConnection.getConnection();
        Statement stt = con.createStatement();
        String tweet = st.getText().replace("'", " ");
        tweet = tweet.replaceAll(URL_REGEX, "");
        tweet = tweet.replaceAll("@([^\\s]+)", "");
        tweet = tweet.replaceAll(CONSECUTIVE_CHARS, "$1");
        tweet = tweet.replaceAll(STARTS_WITH_NUMBER, "");
        tweet = tweet.replaceAll("&", "&");
        tweet = tweet.replaceAll(quest, "");
        System.out.println("Replce Tweets *..-..* : " + tweet);
        Connection con1 = DbConnection.getConnection();
        Statement st1 = con1.createStatement();
        try {
            ResultSet rs = st1.executeQuery("select * from political");
            while (rs.next()) {
                String val1 = rs.getString("words");
                if (tweet.indexOf(val1) >= 0) {
                    stt.executeUpdate("insert into tweets (uid, img, uname, post, df) values ('" + st.getId() + "', '" + st.getUser().getBiggerProfileImageURL() + "', '" + st.getUser().getName() + "', '" + tweet + "', '1')");
                } else {
                    stt.executeUpdate("insert into tweets (uid, img, uname, post, df) values ('" + st.getId() + "', '" + st.getUser().getBiggerProfileImageURL() + "', '" + st.getUser().getName() + "', '" + tweet + "', '0')");
                }
            }
        } catch (Exception ex) {
            response.sendRedirect("Pre_Process.jsp");
        }
        
    }
%>