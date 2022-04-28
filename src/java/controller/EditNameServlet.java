package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditNameServlet extends HttpServlet {

    Connection conn;
    String errorEdit;
    String connectURL;

//    public void init(ServletConfig config) throws ServletException {
//        super.init(config);
//
//        try {
//            Class.forName(config.getInitParameter("jdbcClassName"));
//            String username = config.getInitParameter("dbUsername");
//            String password = config.getInitParameter("dbPassword");
//            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
//                    .append("://")
//                    .append(config.getInitParameter("dbHostName"))
//                    .append(":")
//                    .append(config.getInitParameter("dbPort"))
//                    .append("/")
//                    .append(config.getInitParameter("databaseName"));
//            conn
//                    = DriverManager.getConnection(url.toString(), username, password);
//            connectURL = url.toString();
//            conn.setAutoCommit(true);
//        } catch (SQLException sqle) {
//            System.out.println("SQLException error occured - "
//                    + sqle.getMessage());
//        } catch (ClassNotFoundException nfe) {
//            System.out.println("ClassNotFoundException error occured - "
//                    + nfe.getMessage());
//        }
//    }
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
        HttpSession session = request.getSession();
        session.removeAttribute("update");
        conn = (Connection) getServletContext().getAttribute("dbConnection");
        System.out.print("Server inside EditName Servlet");

        try {
            String username = request.getParameter("username");
            String editname = request.getParameter("editname");
            String iName = request.getParameter("SKname");

            String insertQuery = "UPDATE `admin-info` SET name = ? WHERE username = ?";
            PreparedStatement ins = conn.prepareStatement(insertQuery);
            ins.setString(1, editname);
            ins.setString(2, username);
            session.setAttribute("name", editname);
            ins.executeUpdate();

            String query = "INSERT INTO `audit-log` (username, name, changes) VALUES (?, ?, ?)";
            ins = conn.prepareStatement(query);

            ins.setString(1, username);
            ins.setString(2, editname);

            String changes = username + ": " + iName + " changed his/her name from " + iName + " to " + editname + ".";
            ins.setString(3, changes);

            ins.execute();

            query = "UPDATE `audit-log` SET timestamp = now() WHERE auditID = LAST_INSERT_ID()";
            ins = conn.prepareStatement(query);

            ins.execute();

            session.setAttribute("update", "Name changed successfully.");
            response.sendRedirect(request.getContextPath() + "/Account/AccountInformation.jsp");
//            request.getRequestDispatcher("Account/AccountInformation.jsp").forward(request, response);

        } catch (Exception e) {
            session.setAttribute("update", e);
            response.sendRedirect(request.getContextPath() + "/Account/AccountInformation.jsp");
//            request.getRequestDispatcher("Account/AccountInformation.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
