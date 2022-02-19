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
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    Connection conn;
    String checkException;

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
            String username = request.getParameter("uname");
            String password = request.getParameter("password");

            String iUsername = null, iPassword = null, iName = null, iRole = null;
            checkException = null;
            String query = "SELECT * FROM admin WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet records = stmt.executeQuery();

            while (records.next()) {
                iUsername = records.getString(1);
                iPassword = records.getString(2);
                iName = records.getString(3);
                iRole = records.getString(4);
            }

            if (username.equals(iUsername)) {
                if (password.equals(iPassword)) {
                    HttpSession session = request.getSession();

                    session.setAttribute("username", iUsername);
                    session.setAttribute("password", iPassword);
                    session.setAttribute("name", iName);
                    session.setAttribute("role", iRole);

                    request.getRequestDispatcher("Account/Success.jsp").forward(request, response);

                } else {
                    request.setAttribute("errorLogin", "Wrong password! Try again.");
                    request.getRequestDispatcher("Account/Login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorLogin", "Username does not exist.");
                request.getRequestDispatcher("Account/Login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            request.setAttribute("errorLogin", checkException);
            request.getRequestDispatcher("Account/Login.jsp").forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
