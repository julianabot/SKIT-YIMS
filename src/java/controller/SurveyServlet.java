package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SurveyServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SurveyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SurveyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            HttpSession session = request.getSession();

            //1. Resident Information
            String residentName = request.getParameter("name");
            String ageRange = request.getParameter("age");
            String birthday = request.getParameter("birthday");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String validID = request.getParameter("validID");

            session.setAttribute("residentName", residentName);
            session.setAttribute("ageRange", ageRange);
            session.setAttribute("birthday", birthday);
            session.setAttribute("address", address);
            session.setAttribute("gender", gender);
            session.setAttribute("validID", validID);

            //2. Resident Status
            String civilStatus = request.getParameter("civil");
            String working = request.getParameter("working");
            String jobEmployed = request.getParameter("jobEmployed");
            String education = request.getParameter("education");
            String pwd = request.getParameter("pwd");
            String typePWD = request.getParameter("typePWD");

            session.setAttribute("civilStatus", civilStatus);
            session.setAttribute("working", working);
            session.setAttribute("jobEmployed", jobEmployed);
            session.setAttribute("education", education);
            session.setAttribute("pwd", pwd);
            session.setAttribute("typePWD", typePWD);

            //3. Contact Details
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String fb = request.getParameter("fb");

            session.setAttribute("phone", phone);
            session.setAttribute("email", email);
            session.setAttribute("fb", fb);

            //4. Family Status
            String mother = request.getParameter("mother");
            String motherStatus = request.getParameter("motherstat");
            String motherWork = request.getParameter("motherwork");
            String father = request.getParameter("father");
            String fatherStatus = request.getParameter("fatherstat");
            String fatherWork = request.getParameter("fatherwork");
            String noSiblings = request.getParameter("nosibs");
            String workingSibs = request.getParameter("workingsib");
            String breadwinner = request.getParameter("breadwinner");

            session.setAttribute("mother", mother);
            session.setAttribute("motherStatus", motherStatus);
            session.setAttribute("motherWork", motherWork);
            session.setAttribute("father", father);
            session.setAttribute("fatherStatus", fatherStatus);
            session.setAttribute("fatherWork", fatherWork);
            session.setAttribute("noSiblings", noSiblings);
            session.setAttribute("workingSibs", workingSibs);
            session.setAttribute("breadwinner", breadwinner);

            //5. Survey
            String residentVoter = request.getParameter("voter");
            String memberOfOrg = request.getParameter("org");
            String nameOfOrg = request.getParameter("orgname");
            String supportSK = request.getParameter("proj");
            String showSupport = request.getParameter("support");
            String jobChance = request.getParameter("jobchance");
            String sayToSK = request.getParameter("message");

            session.setAttribute("residentVoter", residentVoter);
            session.setAttribute("memberOfOrg", memberOfOrg);
            session.setAttribute("nameOfOrg", nameOfOrg);
            session.setAttribute("supportSK", supportSK);
            session.setAttribute("showSupport", showSupport);
            session.setAttribute("jobChance", jobChance);
            session.setAttribute("sayToSK", sayToSK);

            //6. Vaccination
            String vaccinated = request.getParameter("vax");
            String willingForVaccine = request.getParameter("willing");
            String brandOfVaccine = request.getParameter("brand");
            String vaccineStatus = request.getParameter("vstatus");

            session.setAttribute("vaccinated", vaccinated);
            session.setAttribute("willingForVaccine", willingForVaccine);
            session.setAttribute("brandOfVaccine", brandOfVaccine);
            session.setAttribute("vaccineStatus", vaccineStatus);

            String basicTable = "INSERT INTO `basic-info` (name, agegroup, birthday, address, gender, validID) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement insBasic = conn.prepareStatement(basicTable);

            insBasic.setString(1, residentName);
            insBasic.setString(2, ageRange);
            insBasic.setString(3, birthday);
            insBasic.setString(4, address);
            insBasic.setString(5, gender);
            insBasic.setString(6, validID);

            insBasic.execute();

            String resStatTable = "INSERT INTO `resident-status` (civilStatus, workingStatus, educationAttainment, jobEmployed, PWD, typeOfDisability) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement insResStat = conn.prepareStatement(resStatTable);

            insResStat.setString(1, civilStatus);
            insResStat.setString(2, working);
            insResStat.setString(3, education);
            insResStat.setString(4, jobEmployed);
            insResStat.setString(5, pwd);
            insResStat.setString(6, typePWD);

            insResStat.execute();

            String contactTable = "INSERT INTO `contact-info` (contactNo, emailAddress, fbNameURL) VALUES (?, ?, ?)";
            PreparedStatement insContact = conn.prepareStatement(contactTable);

            insContact.setString(1, phone);
            insContact.setString(2, email);
            insContact.setString(3, fb);

            insContact.execute();

            String familyTable = "INSERT INTO `fam-status` (motherName, motherOccupation, fatherName, fatherOccupation, vitalStatusMother, vitalStatusFather, noOfSiblings, siblingEducation, breadWinner) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement insFamily = conn.prepareStatement(familyTable);

            insFamily.setString(1, mother);
            insFamily.setString(2, motherWork);
            insFamily.setString(3, father);
            insFamily.setString(4, fatherWork);
            insFamily.setString(5, motherStatus);
            insFamily.setString(6, fatherStatus);
            insFamily.setString(7, noSiblings);
            insFamily.setString(8, workingSibs);
            insFamily.setString(9, breadwinner);

            insFamily.execute();

            String surveyTable = "INSERT INTO `resident-org` (residentVoter, memberOfOrg, nameOfOrg, supportSK, showSupport, jobChance, sayToSK) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement insSurvey = conn.prepareStatement(surveyTable);

            insSurvey.setString(1, residentVoter);
            insSurvey.setString(2, memberOfOrg);
            insSurvey.setString(3, nameOfOrg);
            insSurvey.setString(4, supportSK);
            insSurvey.setString(5, showSupport);
            insSurvey.setString(6, jobChance);
            insSurvey.setString(7, sayToSK);

            insSurvey.execute();

            String vaxTable = "INSERT INTO `vaccine-info` (vaccinated, willingForVaccine, brandOfVaccine, vaccineStatus) VALUES (?, ?, ?, ?)";
            PreparedStatement insVax = conn.prepareStatement(vaxTable);

            insVax.setString(1, vaccinated);
            insVax.setString(2, willingForVaccine);
            insVax.setString(3, brandOfVaccine);
            insVax.setString(4, vaccineStatus);

            insVax.execute();

            String trialTable = "INSERT INTO trial (trialcol) VALUES (?) ";
            PreparedStatement insTrial = conn.prepareStatement(trialTable);

            insTrial.setString(1, vaccinated);
            insTrial.execute();

            request.getRequestDispatcher("Survey Forms/ViewSubmitted.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("errorLogin", checkException);
            request.getRequestDispatcher("Survey Forms/ViewSubmitted.jsp").forward(request, response);

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
