package controller;

import model.*;
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
//            conn.setAutoCommit(true);
//        } catch (SQLException sqle) {
//            checkException = sqle.getMessage();
//            System.out.println("SQLException error occured - "
//                    + sqle.getMessage());
//        } catch (ClassNotFoundException nfe) {
//            checkException = nfe.getMessage();
//            System.out.println("ClassNotFoundException error occured - "
//                    + nfe.getMessage());
//        }
//    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf;charset=UTF-8");
        conn = (Connection) getServletContext().getAttribute("dbConnection");
        System.out.print("Server inside PDF Servlet");

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        LocalDateTime current = LocalDateTime.now();
        String date = dtf.format(current);
        String filename = date + "-SKITYIMS" + ".pdf";

        response.setHeader("Content-Disposition", "inline; filename=" + filename);
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("name");
        String role = "SK Chairman";
        if (session.getAttribute("role") != null) {
            role = (String) session.getAttribute("role");
        }
        String filterQuery = (String) session.getAttribute("filterQuery");
        if (filterQuery == null) {
            filterQuery = " ";
        }
        System.out.print(filterQuery);
        String sortQuery = (String) session.getAttribute("sortQuery");
        if (sortQuery == null) {
            sortQuery = " ";
        }

        try {
            dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            current = LocalDateTime.now(); //Gets the current date and time
            date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

            String path = getServletContext().getRealPath("img/SK_Logo.png");

            Document record = new Document();
            PdfWriter.getInstance(record, response.getOutputStream());
            record.setPageSize(PageSize.LETTER.rotate());
            String button = request.getParameter("pdfdownload");

            int count = 1;
            if (conn != null) {
                System.out.print(button);
                if (button.equals("All")) {
                    String query = "SELECT `resident-info`.residentID, `contact-info`.emailAddress, `basic-info`.name, `basic-info`.agegroup, `basic-info`.birthday, `basic-info`.address, `basic-info`.gender, `contact-info`.contactNo, `resident-status`.civilStatus, `resident-status`.workingStatus, `resident-status`.jobEmployed, `resident-status`.educationAttainment, `resident-status`.PWD, `resident-status`.typeOfDisability, `contact-info`.fbNameURL, `basic-info`.validID, `fam-status`.motherName, `fam-status`.motherOccupation, `fam-status`.fatherName, `fam-status`.fatherOccupation, `fam-status`.vitalStatusMother, `fam-status`.vitalStatusFather, `fam-status`.noOfSiblings, `fam-status`.siblingEducation, `fam-status`.breadWinner, `resident-org`.residentVoter, `resident-org`.memberOfOrg, `resident-org`.nameOfOrg, `resident-org`.supportSK, `resident-org`.showSupport, `resident-org`.jobChance, `resident-org`.sayToSK, `vaccine-info`.vaccinated, `vaccine-info`.willingForVaccine, `vaccine-info`.brandOfVaccine, `vaccine-info`.vaccineStatus FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID " + filterQuery + sortQuery;
                    Statement stmt = conn.createStatement();
                    ResultSet result = stmt.executeQuery(query);

                    int numRecord = 0;
                    while (result.next()) {
                        numRecord++;
                    }

                    ResultSet rs = stmt.executeQuery(query);
                    AllPDF doc = new AllPDF();
                    doc.residentRecord(rs, username, role, filename, path, numRecord);
                    response.sendRedirect("/SKIT-YIMS/Extra/Loading.jsp");
//                    ServletOutputStream sos = response.getOutputStream();
//                    ByteArrayOutputStream pdf = doc.residentRecord(rs, username, role, filename, path, numRecord);
//                    pdf.writeTo(sos);
                }
                if (button.equals("Information")) {
                    String query = "SELECT * FROM `skit-yims`.`basic-info`" + filterQuery + sortQuery;
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
//                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    System.out.println(path);
                    doc.basicInfoRecord(rs, username, role, filename, path);
                    System.out.println(role);
                    response.sendRedirect("/SKIT-YIMS/Extra/Loading.jsp");
//                    pdf.writeTo(sos);
                }
                if (button.equals("Contact")) {
                    System.out.print("nasa Contact Info");
                    String query = "SELECT contactID, name, contactNo, emailAddress, fbNameURL FROM `skit-yims`.`contact-info` INNER JOIN `skit-yims`.`basic-info` ON `contact-info`.contactID = `basic-info`.basicID" + filterQuery + sortQuery;;
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    PDF doc = new PDF();
                    doc.contactInfoRecord(rs, username, role, filename, path);
                    System.out.println(path);
                    response.sendRedirect("/SKIT-YIMS/Extra/Loading.jsp");
//                    ByteArrayOutputStream pdf = doc.contactInfoRecord(rs, username, footer, path);
//                    pdf.writeTo(sos);
                }
                if (button.equals("Family")) {
                    System.out.print("nasa Family Info");
                    String query = "SELECT familyID, name, motherName, motherOccupation, fatherName, fatherOccupation, vitalStatusMother, vitalStatusFather, noOfSiblings, siblingEducation, breadWinner  FROM `fam-status` INNER JOIN `basic-info` ON `fam-status`.familyID = `basic-info`.basicID" + filterQuery + sortQuery;;
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    System.out.println(path);
                    doc.familyInfoRecord(rs, username, role, filename, path);
                    response.sendRedirect("/SKIT-YIMS/Extra/Loading.jsp");
//                    ByteArrayOutputStream pdf = doc.familyInfoRecord(rs, username, footer, path);
//                    pdf.writeTo(sos);
                }
                if (button.equals("Organization")) {
                    System.out.print("nasa Organization Info");
                    String query = "SELECT organizationID, name, residentVoter, memberOfOrg, nameOfOrg, supportSK, showSupport, jobChance, sayToSK FROM `resident-org` INNER JOIN `basic-info` ON `resident-org`.organizationID = `basic-info`.basicID" + filterQuery + sortQuery;;
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    doc.orgInfoRecord(rs, username, role, filename, path);
                    response.sendRedirect("/SKIT-YIMS/Extra/Loading.jsp");

//                    System.out.println(path);
//                    ByteArrayOutputStream pdf = doc.orgInfoRecord(rs, username, footer, path);
//                    pdf.writeTo(sos);
                }
                if (button.equals("Status")) {
                    System.out.print("nasa Status Info");
                    String query = "SELECT `resident-status`.statusID, `basic-info`.name, `resident-status`.civilStatus, `resident-status`.workingStatus, `resident-status`.educationAttainment, `resident-status`.jobEmployed, `resident-status`.PWD, `resident-status`.typeOfDisability FROM `resident-status` INNER JOIN `basic-info` ON `resident-status`.statusID = `basic-info`.basicID" + filterQuery + sortQuery;;
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    doc.statusInfoRecord(rs, username, role, filename, path);
                    response.sendRedirect("/SKIT-YIMS/Extra/Loading.jsp");
                }
                if (button.equals("Vaccine")) {
                    System.out.print("nasa Vaccine Info");
                    String query = "SELECT `vaccine-info`.vaccineID, `basic-info`.name, `vaccine-info`.vaccinated, `vaccine-info`.willingForVaccine, `vaccine-info`.brandOfVaccine, `vaccine-info`.vaccineStatus FROM `vaccine-info` INNER JOIN `basic-info` ON `vaccine-info`.vaccineID = `basic-info`.basicID" + filterQuery + sortQuery;;
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    ServletOutputStream sos = response.getOutputStream();
                    PDF doc = new PDF();
                    doc.vaccInfoRecord(rs, username, role, filename, path);
                    response.sendRedirect("/SKIT-YIMS/Extra/Loading.jsp");
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
