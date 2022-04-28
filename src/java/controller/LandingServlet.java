package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LandingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LandingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LandingServlet at " + request.getContextPath() + "</h1>");
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
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);

        System.out.println(verify);
        HttpSession session = request.getSession();

        if (verify) {
            response.sendRedirect(request.getContextPath() + "/Survey Forms/Survey.jsp");
            session.setAttribute("errorCaptcha", "");
            session.setAttribute("captchaSurvey", "true");
        } else {
            session.setAttribute("errorCaptcha", "Please accomplish CAPTCHA.");
            session.removeAttribute("captchaSurvey");
            response.sendRedirect(request.getContextPath() + "/Survey Forms/Landing.jsp");

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
