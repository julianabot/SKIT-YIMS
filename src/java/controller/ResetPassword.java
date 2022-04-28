/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Raphaelle
 */
public class ResetPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Connection conn;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        conn = (Connection) request.getServletContext().getAttribute("dbConnection");
        System.out.print("Server inside Forgot Password Servlet");

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");

        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

            try {
                String updateQuery = "UPDATE admin-info SET password = ? WHERE email = ?";
                String encryptedNew = Security.encrypt((confPassword));
                PreparedStatement pst = conn.prepareStatement(updateQuery);
                pst.setString(1, encryptedNew);
                pst.setString(2, (String) session.getAttribute("email"));

                pst.executeUpdate();

                session.setAttribute("status", "resetSuccess");
                response.sendRedirect(request.getContextPath() + "/Account/Login.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            session.setAttribute("status", "Passwords do not match. Please Try Again!");
            response.sendRedirect(request.getContextPath() + "/Account/NewPasswordOTP.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
