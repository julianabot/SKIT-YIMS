package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class SurveyServlet extends HttpServlet {

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
            conn = (Connection) getServletContext().getAttribute("dbConnection");
            System.out.print("Server inside Survey Servlet");

            HttpSession session = request.getSession();

            String message = null;
            InputStream inputStream = null; // input stream of the upload file

            // obtains the upload file part in this multipart request
            Part filePart = request.getPart("validID");
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }

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
            String workingSibs1 = request.getParameter("workingsib1");
            String workingSibs2 = request.getParameter("workingsib2");
            String workingSibs3 = request.getParameter("workingsib3");
            String workingSibs4 = request.getParameter("workingsib4");
            String workingSibs5 = request.getParameter("workingsib5");
            String breadwinner = request.getParameter("breadwinner");

            session.setAttribute("mother", mother);
            session.setAttribute("motherStatus", motherStatus);
            session.setAttribute("motherWork", motherWork);
            session.setAttribute("father", father);
            session.setAttribute("fatherStatus", fatherStatus);
            session.setAttribute("fatherWork", fatherWork);
            session.setAttribute("noSiblings", noSiblings);

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

            //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FOR IMAGE ONLY~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                insBasic.setBlob(6, inputStream);
            }

            int row = insBasic.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }

            // sets the message in request scope
            request.setAttribute("Message", message);

            //insBasic.setString(6, validID);
            //insBasic.execute();
            String factTable = "INSERT INTO `resident-info` (basicID) VALUES(LAST_INSERT_ID())";
            insBasic = conn.prepareStatement(factTable);
            insBasic.execute();

            String resStatTable = "INSERT INTO `resident-status` (civilStatus, workingStatus, educationAttainment, jobEmployed, PWD, typeOfDisability) VALUES (?, ?, ?, ?, ?, ?)";
            insBasic = conn.prepareStatement(resStatTable);

            insBasic.setString(1, civilStatus);
            insBasic.setString(2, working);
            insBasic.setString(3, education);
            insBasic.setString(4, jobEmployed);
            insBasic.setString(5, pwd);
            insBasic.setString(6, typePWD);

            //insResStat.execute();
            insBasic.execute();

            factTable = "UPDATE `resident-info` SET statusID = LAST_INSERT_ID() WHERE residentID = LAST_INSERT_ID()";
            insBasic = conn.prepareStatement(factTable);
            insBasic.execute();

            String contactTable = "INSERT INTO `contact-info` (contactNo, emailAddress, fbNameURL) VALUES (?, ?, ?)";
            insBasic = conn.prepareStatement(contactTable);

            insBasic.setString(1, phone);
            insBasic.setString(2, email);
            insBasic.setString(3, fb);

            //insContact.execute();
            insBasic.execute();

            factTable = "UPDATE `resident-info` SET contactID = LAST_INSERT_ID() WHERE residentID = LAST_INSERT_ID()";
            insBasic = conn.prepareStatement(factTable);
            insBasic.execute();

            String familyTable = "INSERT INTO `fam-status` (motherName, motherOccupation, fatherName, fatherOccupation, vitalStatusMother, vitalStatusFather, noOfSiblings, siblingEducation, breadWinner) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            insBasic = conn.prepareStatement(familyTable);

            insBasic.setString(1, mother);
            insBasic.setString(2, motherWork);
            insBasic.setString(3, father);
            insBasic.setString(4, fatherWork);
            insBasic.setString(5, motherStatus);
            insBasic.setString(6, fatherStatus);
            insBasic.setString(7, noSiblings);

            String[] workingSibsArr = {workingSibs1, workingSibs2, workingSibs3, workingSibs4, workingSibs5};
            String workingSibsFinal = "";

            if (Integer.parseInt(noSiblings) == 0) {
                workingSibsFinal = "Not Applicable";
            } else {
                for (int i = 0; i < Integer.parseInt(noSiblings); i++) {
                    workingSibsFinal = workingSibsFinal + workingSibsArr[i] + ", ";
                }
                workingSibsFinal = workingSibsFinal.substring(0, workingSibsFinal.length() - 2);
            }

            insBasic.setString(8, workingSibsFinal);
            session.setAttribute("workingSibs", workingSibsFinal);
            insBasic.setString(9, breadwinner);

            //insFamily.execute();
            insBasic.execute();

            factTable = "UPDATE `resident-info` SET familyID = LAST_INSERT_ID() WHERE residentID = LAST_INSERT_ID()";
            insBasic = conn.prepareStatement(factTable);
            insBasic.execute();

            String surveyTable = "INSERT INTO `resident-org` (residentVoter, memberOfOrg, nameOfOrg, supportSK, showSupport, jobChance, sayToSK) VALUES (?, ?, ?, ?, ?, ?, ?)";
            insBasic = conn.prepareStatement(surveyTable);

            insBasic.setString(1, residentVoter);
            insBasic.setString(2, memberOfOrg);
            insBasic.setString(3, nameOfOrg);
            insBasic.setString(4, supportSK);
            insBasic.setString(5, showSupport);
            insBasic.setString(6, jobChance);
            insBasic.setString(7, sayToSK);

            //insSurvey.execute();
            insBasic.execute();

            factTable = "UPDATE `resident-info` SET organizationID = LAST_INSERT_ID() WHERE residentID = LAST_INSERT_ID()";
            insBasic = conn.prepareStatement(factTable);
            insBasic.execute();

            String vaxTable = "INSERT INTO `vaccine-info` (vaccinated, willingForVaccine, brandOfVaccine, vaccineStatus) VALUES (?, ?, ?, ?)";
            insBasic = conn.prepareStatement(vaxTable);

            insBasic.setString(1, vaccinated);
            insBasic.setString(2, willingForVaccine);
            insBasic.setString(3, brandOfVaccine);
            insBasic.setString(4, vaccineStatus);

            insBasic.execute();

            factTable = "UPDATE `resident-info` SET vaccineID = LAST_INSERT_ID() WHERE residentID = LAST_INSERT_ID()";
            insBasic = conn.prepareStatement(factTable);
            insBasic.execute();
//            String trialTable = "INSERT INTO trial (trialcol) VALUES (?) ";
//            PreparedStatement insTrial = conn.prepareStatement(trialTable);
//
//            insTrial.setString(1, vaccinated);
//            insTrial.execute();

            session.removeAttribute("errorCaptcha");
            session.removeAttribute("captchaSurvey");
            response.sendRedirect("/SKIT-YIMS/Survey Forms/Success.jsp");
            //response.sendRedirect("/SKIT-YIMS/Survey Forms/ViewSubmitted.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorLogin", e.toString());
            //request.getRequestDispatcher("Survey Forms/ViewSubmitted.jsp").forward(request, response);
            response.sendRedirect("/SKIT-YIMS/Extra/MissingField.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
