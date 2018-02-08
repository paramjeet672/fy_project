<%@page import="java.sql.ResultSet"%>
<%@page import="Mysql.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String mail = request.getParameter("name");
    String pass = request.getParameter("pass");
    System.out.println("User Name" + mail);
    System.out.println("password" + pass);

    int status = Integer.parseInt(request.getParameter("status"));
    System.out.println("Status : " + status);

    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from user_details where email='" + mail + "' AND pass='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("sapp_key", rs.getString("app_key"));
                        session.setAttribute("sapp_secret", rs.getString("app_secret"));
                        session.setAttribute("sacc_key", rs.getString("acc_key"));
                        session.setAttribute("sacc_token", rs.getString("acc_token"));
                        session.setAttribute("semail", rs.getString("email"));
                        session.setAttribute("suname", rs.getString("uname"));
                        
                        response.sendRedirect("uhome.jsp?msg=success");
                    } else {
                        response.sendRedirect("user.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:

                try {
                    con = DbConnection.getConnection();
                    st = con.createStatement();

                    if (mail.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin")) {
                        st.executeUpdate("TRUNCATE tweets");
                        response.sendRedirect("ahome.jsp?msg=success");
                    } else {
                        response.sendRedirect("admin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 5:
                try {
                    rs = st.executeQuery("select * from reg where yyys='" + pass + "' AND role='Soldier'");
                    if (rs.next()) {
                        response.sendRedirect("s_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("s_one_p.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 6:
                try {
                    rs = st.executeQuery("select * from reg where yyys='" + pass + "' AND role='Commander'");
                    if (rs.next()) {

                        response.sendRedirect("c_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("c_one_p.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                break;

            case 8:
                try {
                    if (mail.equalsIgnoreCase("Admin") && pass.equalsIgnoreCase("Admin")) {
                        response.sendRedirect("admin_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("admin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

           
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>
