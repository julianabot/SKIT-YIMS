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

public class EditServlet extends HttpServlet {

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
            conn = (Connection) getServletContext().getAttribute("dbConnection");
            System.out.print("Server inside Edit Servlet");

            //Basic info table
            String bID = request.getParameter("basicID");
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String birthday = request.getParameter("birthday");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");

            String cID = request.getParameter("contactID");
            String contactNo = request.getParameter("contactNo");
            String email = request.getParameter("emailAddress");
            String fbName = request.getParameter("fbNameURL");

            String fID = request.getParameter("familyID");
            String motherName = request.getParameter("motherName");
            String motherOccupation = request.getParameter("motherOccupation");
            String fatherName = request.getParameter("fatherName");
            String fatherOccupation = request.getParameter("fatherOccupation");
            String vitalStatusMother = request.getParameter("vitalStatusMother");
            String vitalStatusFather = request.getParameter("vitalStatusFather");
            String noOfSiblings = request.getParameter("noOfSiblings");
            String siblingEducation = request.getParameter("siblingEducation");
            String breadWinner = request.getParameter("breadWinner");

            String oID = request.getParameter("organizationID");
            String residentVoter = request.getParameter("residentVoter");
            String memberOfOrg = request.getParameter("memberOfOrg");
            String nameOfOrg = request.getParameter("nameOfOrg");
            String supportSK = request.getParameter("supportSK");
            String showSupport = request.getParameter("showSupport");
            String jobChance = request.getParameter("jobChance");
            String sayToSK = request.getParameter("sayToSK");

            String sID = request.getParameter("statusID");
            String civilStatus = request.getParameter("civilStatus");
            String workingStatus = request.getParameter("workingStatus");
            String educationAttainment = request.getParameter("educationAttainment");
            String jobEmployed = request.getParameter("jobEmployed");
            String PWD = request.getParameter("PWD");
            String typeOfDisability = request.getParameter("typeOfDisability");

            String vID = request.getParameter("vaccineID");
            String vaccinated = request.getParameter("vaccinated");
            String willingForVaccine = request.getParameter("willingForVaccine");
            String brandOfVaccine = request.getParameter("brandOfVaccine");
            String vaccineStatus = request.getParameter("vaccineStatus");

            //
            if (bID != null && name != null && address != null
                    && cID != null && contactNo != null && email != null && fbName != null
                    && fID != null && motherName != null && motherOccupation != null && fatherName != null && fatherOccupation != null && vitalStatusMother != null && vitalStatusFather != null && noOfSiblings != null && siblingEducation != null && breadWinner != null
                    && oID != null && residentVoter != null && memberOfOrg != null && nameOfOrg != null && supportSK != null && showSupport != null && jobChance != null && sayToSK != null
                    && sID != null && civilStatus != null && workingStatus != null && educationAttainment != null && jobEmployed != null && PWD != null && typeOfDisability != null
                    && vID != null && vaccinated != null && willingForVaccine != null && brandOfVaccine != null && vaccineStatus != null) {
                String basic_query = "UPDATE `skit-yims`.`basic-info` SET `name` = ?, `birthday` = ?, `address` = ? WHERE (`basicID` = '" + bID + "')";
                PreparedStatement stmt = conn.prepareStatement(basic_query);
                stmt.setString(1, name);
                stmt.setString(2, birthday);
                stmt.setString(3, address);
                stmt.execute();

                String contact_query = "UPDATE `skit-yims`.`contact-info` SET `contactNo` = ?, `emailAddress` = ?, `fbNameURL` = ?  WHERE (`contactID` = '" + cID + "')";
                stmt = conn.prepareStatement(contact_query);
                stmt.setString(1, contactNo);
                stmt.setString(2, email);
                stmt.setString(3, fbName);
                stmt.execute();

                String family_query = "UPDATE `skit-yims`.`fam-status` SET `motherName` = ?, `motherOccupation` = ?, `fatherName` = ? , `fatherOccupation` = ?, `vitalStatusMother` = ?, `vitalStatusFather` = ?, `noOfSiblings` = ?, `siblingEducation` = ?, `breadWinner` = ? WHERE (`familyID` = '" + fID + "')";
                stmt = conn.prepareStatement(family_query);
                stmt.setString(1, motherName);
                stmt.setString(2, motherOccupation);
                stmt.setString(3, fatherName);
                stmt.setString(4, fatherOccupation);
                stmt.setString(5, vitalStatusMother);
                stmt.setString(6, vitalStatusFather);
                stmt.setString(7, noOfSiblings);
                stmt.setString(8, siblingEducation);
                stmt.setString(9, breadWinner);
                stmt.execute();

                String org_query = "UPDATE `skit-yims`.`resident-org` SET `residentVoter` = ?, `memberOfOrg` = ?, `nameOfOrg` = ? , `supportSK` = ?, `showSupport` = ?, `jobChance` = ?, `sayToSK` = ? WHERE (`organizationID` = '" + oID + "')";
                stmt = conn.prepareStatement(org_query);
                stmt.setString(1, residentVoter);
                stmt.setString(2, memberOfOrg);
                stmt.setString(3, nameOfOrg);
                stmt.setString(4, supportSK);
                stmt.setString(5, showSupport);
                stmt.setString(6, jobChance);
                stmt.setString(7, sayToSK);
                stmt.execute();

                String status_query = "UPDATE `skit-yims`.`resident-status` SET `civilStatus` = ?, `workingStatus` = ?, `educationAttainment` = ? , `jobEmployed` = ?, `PWD` = ?, `typeOfDisability` = ? WHERE (`statusID` = '" + sID + "')";
                stmt = conn.prepareStatement(status_query);
                stmt.setString(1, civilStatus);
                stmt.setString(2, workingStatus);
                stmt.setString(3, educationAttainment);
                stmt.setString(4, jobEmployed);
                stmt.setString(5, PWD);
                stmt.setString(6, typeOfDisability);
                stmt.execute();

                String vaccine_query = "UPDATE `skit-yims`.`vaccine-info` SET `vaccinated` = ?, `willingForVaccine` = ?, `brandOfVaccine` = ? , `vaccineStatus` = ? WHERE (`vaccineID` = '" + vID + "')";
                stmt = conn.prepareStatement(vaccine_query);
                stmt.setString(1, vaccinated);
                stmt.setString(2, willingForVaccine);
                stmt.setString(3, brandOfVaccine);
                stmt.setString(4, vaccineStatus);
                stmt.execute();

                String iUsername = (String) request.getSession(false).getAttribute("username");
                String iName = (String) request.getSession(false).getAttribute("name");

                String query = "INSERT INTO `audit-log` (username, name, changes) VALUES (?, ?, ?)";
                stmt = conn.prepareStatement(query);

                stmt.setString(1, iUsername);
                stmt.setString(2, iName);

                String changes = iUsername + ": " + iName + " edited Resident " + bID + ": " + name;
                stmt.setString(3, changes);

                stmt.execute();

                query = "UPDATE `audit-log` SET timestamp = now() WHERE auditID = LAST_INSERT_ID()";
                stmt = conn.prepareStatement(query);

                stmt.execute();

                response.sendRedirect(request.getContextPath() + "/Account/ViewDatabase.jsp");

            } else {
                System.out.println("empty fields!");

                System.out.println(bID);
                System.out.println(name);
                System.out.println(address);

                System.out.println(cID);
                System.out.println(contactNo);
                System.out.println(fbName);

                System.out.println(fID);
                System.out.println(motherName);
                System.out.println(motherOccupation);
                System.out.println(fatherName);
                System.out.println(fatherOccupation);
                System.out.println(vitalStatusMother);
                System.out.println(vitalStatusFather);
                System.out.println(noOfSiblings);
                System.out.println(siblingEducation);
                System.out.println(breadWinner);

                System.out.println(oID);
                System.out.println(residentVoter);
                System.out.println(memberOfOrg);
                System.out.println(nameOfOrg);
                System.out.println(supportSK);
                System.out.println(showSupport);
                System.out.println(jobChance);
                System.out.println(sayToSK);

                System.out.println(sID);
                System.out.println(civilStatus);
                System.out.println(workingStatus);
                System.out.println(educationAttainment);
                System.out.println(jobEmployed);
                System.out.println(PWD);
                System.out.println(typeOfDisability);

                System.out.println(vID);
                System.out.println(vaccinated);
                System.out.println(willingForVaccine);
                System.out.println(brandOfVaccine);
                System.out.println(vaccineStatus);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
