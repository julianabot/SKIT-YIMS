/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
public class ForgotPasswordServlet extends HttpServlet {

    //Connection conn;
    String checkException;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();
        String host = "smtp.gmail.com";
        if (email != null || !email.equals("")) {
            // sending otp
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            String to = email;// change accordingly
            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.auth", true);
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", 587);
            props.put("mail.smtp.ssl.trust", host);

            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("systers.se@gmail.com", "pdbpsbfldtvpcybw");// Put your email
                    // id and
                    // password here
                }
            });
            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("OTP number");
                message.setText("Your OTP is: " + otpvalue);
                // send message
                Transport.send(message);
                System.out.println("message sent successfully");
//                dispatcher = request.getRequestDispatcher("/SKIT-YIMS/Account/EnterOtp.jsp");
                request.setAttribute("message", "OTP is sent to your email id");
                //request.setAttribute("connection", con);
                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("email", email);
//                dispatcher.forward(request, response);
                response.sendRedirect("/SKIT-YIMS/Account/EnterOtp.jsp");
                //request.setAttribute("status", "success");
            } catch (Exception e) {
                e.printStackTrace();
            }

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
