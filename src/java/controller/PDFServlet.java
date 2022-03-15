package controller;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
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
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

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
        response.setContentType("application/pdf;charset=UTF-8");
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time
        //and is converted into a String variable;
        String filename = date + "-SKITYIMS" + ".pdf"; //Current date and time is used as the name of the CSV File

        //String footer = request.getServletContext().getInitParameter("footer");
        String footer = "Footer";
        response.addHeader("Content-Disposition", "inline; filename=" + filename);
        //HttpSession session = request.getSession(); TO BE ADDED AFTER FILE PATHING
        //(String) request.getSession().getAttribute("username") ipapalit sa parameter ng ByteOutputStream
        String username = "Raph";

        try {
            dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            current = LocalDateTime.now(); //Gets the current date and time
            date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

            ClassLoader loader = Thread.currentThread().getContextClassLoader();
            String path = getServletContext().getRealPath("img/SK_Logo.png");
            //String path = loader.getResource("../img/SK_Logo.png").getPath();

            Document record = new Document();
            PdfWriter.getInstance(record, response.getOutputStream());
            record.setPageSize(PageSize.LETTER.rotate());
            String button = request.getParameter("pdfdownload");

            int count = 1;
            if (conn != null) {
                System.out.print(button);
                if (button.equals("Information")) {
                    String query = "SELECT * FROM `skit-yims`.`basic-info`;";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
//                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    System.out.println(path);
                    doc.basicInfoRecord(rs, username, filename, path);
                    response.sendRedirect("/SKIT-YIMS/Account/ViewDatabase.jsp");
//                    pdf.writeTo(sos);
                }
                if (button.equals("Contact")) {
                    System.out.print("nasa Contact Info");
                    String query = "SELECT contactID, name, contactNo, emailAddress, fbNameURL FROM `skit-yims`.`contact-info` INNER JOIN `skit-yims`.`basic-info` ON `contact-info`.contactID = `basic-info`.basicID ;";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    doc.contactInfoRecord(rs, username, filename, path);
                    System.out.println(path);
                    response.sendRedirect("/SKIT-YIMS/Account/ViewDatabase.jsp");
//                    ByteArrayOutputStream pdf = doc.contactInfoRecord(rs, username, footer, path);
//                    pdf.writeTo(sos);
                }
                if (button.equals("Family")) {
                    System.out.print("nasa Family Info");
                    String query = "SELECT familyID, name, motherName, motherOccupation, fatherName, fatherOccupation, vitalStatusMother, vitalStatusFather, noOfSiblings, siblingEducation, breadWinner  FROM `fam-status` INNER JOIN `basic-info` ON `fam-status`.familyID = `basic-info`.basicID;";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    System.out.println(path);
                    doc.familyInfoRecord(rs, username, filename, path);
                    response.sendRedirect("/SKIT-YIMS/Account/ViewDatabase.jsp");
//                    ByteArrayOutputStream pdf = doc.familyInfoRecord(rs, username, footer, path);
//                    pdf.writeTo(sos);
                }
                if (button.equals("Organization")) {
                    System.out.print("nasa Organization Info");
                    String query = "SELECT organizationID, name, residentVoter, memberOfOrg, nameOfOrg, supportSK, showSupport, jobChance, sayToSK FROM `resident-org` INNER JOIN `basic-info` ON `resident-org`.organizationID = `basic-info`.basicID;";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    doc.orgInfoRecord(rs, username, filename, path);
                    response.sendRedirect("/SKIT-YIMS/Account/ViewDatabase.jsp");

//                    System.out.println(path);
//                    ByteArrayOutputStream pdf = doc.orgInfoRecord(rs, username, footer, path);
//                    pdf.writeTo(sos);
                }
                if (button.equals("Status")) {
                    System.out.print("nasa Status Info");
                    String query = "SELECT `resident-status`.statusID, `basic-info`.name, `resident-status`.civilStatus, `resident-status`.workingStatus, `resident-status`.educationAttainment, `resident-status`.jobEmployed, `resident-status`.PWD, `resident-status`.typeOfDisability FROM `resident-status` INNER JOIN `basic-info` ON `resident-status`.statusID = `basic-info`.basicID;";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    doc.statusInfoRecord(rs, username, filename, path);
                    response.sendRedirect("/SKIT-YIMS/Account/ViewDatabase.jsp");
                }
                if (button.equals("Vaccine")) {
                    System.out.print("nasa Vaccine Info");
                    String query = "SELECT `vaccine-info`.vaccineID, `basic-info`.name, `vaccine-info`.vaccinated, `vaccine-info`.willingForVaccine, `vaccine-info`.brandOfVaccine, `vaccine-info`.vaccineStatus FROM `vaccine-info` INNER JOIN `basic-info` ON `vaccine-info`.vaccineID = `basic-info`.basicID;";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    doc.vaccInfoRecord(rs, username, filename, path);
                    response.sendRedirect("/SKIT-YIMS/Account/ViewDatabase.jsp");
                }

            }

        } catch (Exception sqle) {
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
