package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
            String validID = request.getParameter("validID");

            session.setAttribute("residentName", residentName);
            session.setAttribute("ageRange", ageRange);
            session.setAttribute("birthday", birthday);
            session.setAttribute("address", address);
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
            String residentVoter = request.getParameter("org");
            String memberOfOrg = request.getParameter("orgname");
            String supportSK = request.getParameter("proj");
            String showSupport = request.getParameter("support");
            String jobChance = request.getParameter("jobchance");
            String sayToSK = request.getParameter("message");

            session.setAttribute("residentVoter", residentVoter);
            session.setAttribute("memberOfOrg", memberOfOrg);
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
