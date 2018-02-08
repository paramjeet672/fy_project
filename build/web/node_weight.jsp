<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="graph.algo.Edge"%>
<%@page import="graph.algo.Graph"%>
<%@page import="graph.algo.Node"%>
<%@page import="graph.algo.Nodewight"%>
<%@page import="graph.algo.ShortestPath"%>
<%@page import="graph.algo.GraphSimple"%>
<%@page import="graph.algo.PublicPosts"%>
<%@page import="graph.algo.Vertex"%>
<%@page import="Mysql.DbConnection" %>
<%@page import="java.util.*" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socirank", "root", "root");
    ArrayList<String> list1 = new ArrayList<String>();
    Statement st = con.createStatement();
    Connection con1 = DbConnection.getConnection();
    Statement st1 = con1.createStatement();
    Statement st2 = con.createStatement();
    ResultSet rs1 = st1.executeQuery("select * from tweets");
    while (rs1.next()) {
        String str = rs1.getString("uid");
        Nodewight node = new Nodewight();
        node.getNode();
        String nodeweighting = node.getNodeWeight(str);
        st2.executeUpdate("update tweets set nodeweighting='" + nodeweighting + "' where uid='" + str + "'");
//        list1.add(rs1.getString("post"));
    }
    response.sendRedirect("node_weight1.jsp");

    for (String s : list1) {
        System.out.println(s);
        ResultSet rs2 = st.executeQuery("select * from political");
        while (rs2.next()) {
            String val1 = rs2.getString("words");
            System.out.println("value checking is :" + val1);
            if (s.indexOf(val1) >= 0) {
                System.out.println(s + "checking1" + val1);
                st2.executeUpdate("update tweets set df='1' where post='" + s + "'");
            }
        }
    }


    ResultSet rs2 = st.executeQuery("select * from political");
    while (rs1.next()) {
        String words = rs1.getString("post");
        System.out.println("Post ---------- : " + words);
        while (rs2.next()) {
            String val1 = rs2.getString("words");
            System.out.println("value checking is :" + val1);
            if (words.indexOf(val1) >= 0) {
                System.out.println(words + "checking1" + val1);
                st2.executeUpdate("update tweets set df='1' where post='" + words + "'");
            }
        }
    }

%>
