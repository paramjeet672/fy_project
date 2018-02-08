/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Upload;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import Mysql.Mail;
import Mysql.DbConnection;
/**
 *
 * @author java4
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class Registtration extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String uname = request.getParameter("uname");
        String email = request.getParameter("email");
        String app_key = request.getParameter("app_key");
        String app_secret_key = request.getParameter("app_secret_key");
        String access_token = request.getParameter("access_key");
        String token_secret_key = request.getParameter("acc_token_key");
        String Password = request.getParameter("password");
        System.out.println("User Name : " + uname);
        System.out.println("Email ID : " + email);
        System.out.println("App Key : " + app_key);
        System.out.println("App Secret Key : " + app_secret_key);
        System.out.println("Access Token : " + access_token);
        System.out.println("Access token Key :  " + token_secret_key);
        System.out.println("Password :  " + Password);
        System.out.println("User Information :" + uname + email + app_key + app_secret_key + access_token + token_secret_key + Password);
        InputStream inputStream = null;

        Part filePart = request.getPart("photo");
        if (filePart != null) {

            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            inputStream = filePart.getInputStream();
        }

        Connection conn = null;

        try {

            conn = DbConnection.getConnection();
            String sql = "INSERT INTO user_details (uname, email, app_key, app_secret, acc_key, acc_token, pass, photo) values (?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, uname);
            statement.setString(2, email);
            statement.setString(3, app_key);
            statement.setString(4, app_secret_key);
            statement.setString(5, access_token);
            statement.setString(6, token_secret_key);
            statement.setString(7, Password);

            if (inputStream != null) {
                statement.setBlob(8, inputStream);
            }
            int row = statement.executeUpdate();
            if (row > 0) {
                response.sendRedirect("user.jsp?msg=Success");
            } else {
                response.sendRedirect("register.jsp?msg=Error");
            }
        } catch (SQLException ex) {
//            ex.printStackTrace();
            response.sendRedirect("register.jsp?msg=This_mailID_already_uesd");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
