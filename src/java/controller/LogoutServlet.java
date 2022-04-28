/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

    Connection conn;
    String checkException;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LogoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LogoutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        conn = (Connection) request.getServletContext().getAttribute("dbConnection");

        try {
            String query = "INSERT INTO `audit-log` (username, name, changes) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);

            String iUsername = request.getParameter("SKusername");
            String iName = request.getParameter("SKname");

            stmt = conn.prepareStatement(query);

            stmt.setString(1, iUsername);
            stmt.setString(2, iName);

            String changes = iUsername + ": " + iName + " successfully logged out.";
            stmt.setString(3, changes);

            stmt.execute();

            query = "UPDATE `audit-log` SET timestamp = now() WHERE auditID = LAST_INSERT_ID()";
            stmt = conn.prepareStatement(query);

            stmt.execute();
        } catch (Exception e) {
            request.setAttribute("errorLogin", checkException);
            e.printStackTrace();
//            request.getRequestDispatcher("/Account/Login.jsp").forward(request, response);
            response.sendRedirect(request.getContextPath() + "/Account/Login.jsp");
        }

        HttpSession session = request.getSession();
        session.removeAttribute("loggedIn");
        session.invalidate();
        response.sendRedirect(request.getContextPath() + "/Extra/Logout.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
