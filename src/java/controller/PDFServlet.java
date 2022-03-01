package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.PDF;


public class PDFServlet extends HttpServlet {
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
            conn.setAutoCommit(true);
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
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time
        //and is converted into a String variable;
        String filename = date + ".pdf"; //Current date and time is used as the name of the CSV File
        
        //String footer = request.getServletContext().getInitParameter("footer");
        String footer = ""; 
        response.addHeader("Content-Disposition", "inline; filename=" + filename);
        //HttpSession session = request.getSession(); TO BE ADDED AFTER FILE PATHING
        //(String) request.getSession().getAttribute("username") ipapalit sa parameter ng ByteOutputStream
        String username = "Raph";
        
        try {
            if (conn != null){
                String query = "SELECT * FROM `skit-yims`.`basic-info`;";
                Statement stmt = conn.createStatement();
                ResultSet result = stmt.executeQuery(query);
                
                int numRecord = 0;
                while (result.next()) {
                    numRecord++;
                }
                
                ResultSet rs = stmt.executeQuery(query);
                ServletOutputStream sos = response.getOutputStream();
                PDF doc = new PDF();
                String path = getServletContext().getRealPath("img/SK_Logo.png");
                System.out.println(path);
                ByteArrayOutputStream pdf = doc.userRecord(rs, username, footer, numRecord, path);
                pdf.writeTo(sos);
            }
            
        } catch (SQLException sqle) {
            sqle.printStackTrace();
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
