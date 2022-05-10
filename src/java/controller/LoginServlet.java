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
            conn = (Connection) request.getServletContext().getAttribute("dbConnection");
            System.out.print("Server inside Login Servlet");

            //Captcha
            String captchaInput = request.getParameter("captcha-input");
            String captchaGenerated = request.getParameter("captcha-generated");

            String username = request.getParameter("uname");
            String password = request.getParameter("password");

            String iUsername = null, iPassword = null, iName = null, iRole = null;
            checkException = null;
            String query = "SELECT * FROM `admin-info` WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            ResultSet records = stmt.executeQuery();

            while (records.next()) {
                iUsername = records.getString(1);
                iPassword = records.getString(2);
                iName = records.getString(3);
                iRole = records.getString(4);

                //Encrypting the password
                String ePassword = Security.decrypt(iPassword);
                iPassword = ePassword;
            }
            HttpSession session = request.getSession();
            
            System.out.println("ETO INPUT: " + captchaInput);
            System.out.println("ETO GENERATED: " + captchaGenerated);

            if (username.equals(iUsername) && captchaGenerated.equals(captchaInput)) {
                if (password.equals(iPassword)) {

                    session.setAttribute("username", iUsername);
                    session.setAttribute("password", iPassword);
                    session.setAttribute("name", iName);
                    session.setAttribute("role", iRole);
                    session.setAttribute("loggedIn", "yes");

//                    request.getRequestDispatcher("/Account/AccountInformation.jsp").forward(request, response);
                    response.sendRedirect(request.getContextPath() + "/Account/AccountInformation.jsp");

                    query = "INSERT INTO `audit-log` (username, name, changes) VALUES (?, ?, ?)";
                    stmt = conn.prepareStatement(query);

                    stmt.setString(1, iUsername);
                    stmt.setString(2, iName);

                    String changes = iUsername + ": " + iName + " successfully logged in.";
                    stmt.setString(3, changes);

                    stmt.execute();

                    query = "UPDATE `audit-log` SET timestamp = now() WHERE auditID = LAST_INSERT_ID()";
                    stmt = conn.prepareStatement(query);

                    stmt.execute();
                    System.out.println("hello");
                } else {
                    session.setAttribute("errorLogin", "Wrong password! Try again.");
//                    request.getRequestDispatcher("/Account/Login.jsp").forward(request, response);
                    response.sendRedirect(request.getContextPath() + "/Account/Login.jsp");
                }
            } else if (username.equals(iUsername) && !captchaGenerated.equals(captchaInput)) {
                session.setAttribute("errorLogin", "Please accomplish CAPTCHA.");
//                request.getRequestDispatcher("/Account/Login.jsp").forward(request, response);
                response.sendRedirect(request.getContextPath() + "/Account/Login.jsp");
            } else {
                session.setAttribute("errorLogin", "Username does not exist.");
//                request.getRequestDispatcher("/Account/Login.jsp").forward(request, response);
                response.sendRedirect(request.getContextPath() + "/Account/Login.jsp");

            }
            System.out.println("hello 2");

        } catch (Exception e) {
            request.setAttribute("errorLogin", checkException);
            e.printStackTrace();
//            request.getRequestDispatcher("/Account/Login.jsp").forward(request, response);
            response.sendRedirect(request.getContextPath() + "/Account/Login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
