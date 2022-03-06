package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditPasswordServlet extends HttpServlet {

    Connection conn;
    String checkException;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try {
            Class.forName(config.getInitParameter("jdbcClassName"));
            String username = config.getInitParameter("dbUserName");
            String password = config.getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(config.getInitParameter("dbHostName"))
                    .append(":")
                    .append(config.getInitParameter("dbPort"))
                    .append("/")
                    .append(config.getInitParameter("databaseName"));
            conn
                    = DriverManager.getConnection(url.toString(), username, password);
        } catch (SQLException sqle) {
            checkException = sqle.getMessage();
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            checkException = nfe.getMessage();
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String password = "string", currpass, newpass, confpass, username;
            currpass = request.getParameter("currpass");
            newpass = request.getParameter("newpass");
            confpass = request.getParameter("confpass");
            username = request.getParameter("username");

            checkException = null;
            String query = "SELECT username, password FROM `admin-info` WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            String oldEncryptedPassword = Security.encrypt(currpass);
            String currpassword1 = Security.encrypt(currpass);

            stmt.setString(1, username);
            stmt.setString(2, oldEncryptedPassword);

            ResultSet rec = stmt.executeQuery();

            while (!rec.next()) {
                request.setAttribute("update", "Incorrrect current password");
                request.getRequestDispatcher("Account/EditProfile.jsp").forward(request, response);
            }

            ResultSet records = stmt.executeQuery();

            while (records.next()) {
                password = records.getString(1);
            }

            if (newpass.equals(confpass) && password.equals(currpassword1)) {
                String newEncryptedPass = Security.encrypt(newpass);
                String insertQuery = "UPDATE `admin-info` SET password = ? WHERE username = ?";
                PreparedStatement ins = conn.prepareStatement(insertQuery);
                ins.setString(1, newEncryptedPass);
                ins.setString(2, username);

                ins.executeUpdate();

                request.setAttribute("update", "You have successfully changed your password.");
                request.getRequestDispatcher("Account/AccountInformation.jsp").forward(request, response);

            } else {
                request.setAttribute("update", "Incorrrect confirm password");
                request.getRequestDispatcher("Account/AccountInformation.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("update", checkException);
            request.getRequestDispatcher("Account/AccountInformation.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
