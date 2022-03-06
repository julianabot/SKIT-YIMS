package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PasswordServlet extends HttpServlet {

    Connection conn;
    String connectURL;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try {
            Class.forName(config.getInitParameter("jdbcClassName"));
            String username = config.getInitParameter("dbUsername");
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
            connectURL = url.toString();
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
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
            out.println("<title>Servlet EditPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPasswordServlet at " + request.getContextPath() + "</h1>");
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
            HttpSession session = request.getSession();

            String currpass = request.getParameter("currpass");
            String newpass = request.getParameter("newpass");
            String confpass = request.getParameter("confpass");
            String username = request.getParameter("username");

            String password = null;

            String query = "SELECT username, password FROM `admin-info` WHERE username = ? AND password = ?";

            String encryptedOld = Security.encrypt(currpass);
            PreparedStatement stmt = conn.prepareStatement(query);

            stmt.setString(1, username);
            stmt.setString(2, encryptedOld);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
            } else {
                request.setAttribute("update", "Incorrect current password. Try again.");
                request.getRequestDispatcher("Account/AccountInformation.jsp").forward(request, response);
            }

            ResultSet records = stmt.executeQuery();
            while (records.next()) {
                password = records.getString(2);
            }

            if (newpass.equals(confpass)) {
                String encryptedNew = Security.encrypt((newpass));
                String updateQuery = "UPDATE `admin-info` SET password = ? WHERE username = ?";
                stmt = conn.prepareStatement(updateQuery);

                stmt.setString(1, encryptedNew);
                stmt.setString(2, username);

                stmt.executeUpdate();
                request.setAttribute("update", "You have successfully changed your password.");
                request.getRequestDispatcher("Account/AccountInformation.jsp").forward(request, response);

            } else {
                request.setAttribute("update", "Incorrrect confirm new password. Try again.");
                request.getRequestDispatcher("Account/AccountInformation.jsp").forward(request, response);

            }
//            request.setAttribute("update", "Current Pass: " + currpass + " New Pass: " + newpass
//                    + " Conf Pass: " + confpass + " Username: " + username);
//            request.setAttribute("update", connectURL);
//            request.setAttribute("update", encryptedOld);
            request.getRequestDispatcher("Account/AccountInformation.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("update", e.toString());
            request.getRequestDispatcher("Account/AccountInformation.jsp").forward(request, response);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}