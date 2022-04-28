/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SortAuditServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SortAuditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortAuditServlet at " + request.getContextPath() + "</h1>");
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
        
        HttpSession session = request.getSession();
        String filterQuery = " WHERE ";
        String[] filterAudit = request.getParameterValues("filterAudit");
        
        if (filterAudit == null) {
            System.out.println("Walang laman ehe");
        } else {
            if (filterAudit.length == 1) {
                filterQuery = filterQuery + "(changes LIKE '%" + filterAudit[0] + "%')";
            } else {
                for (int i = 0; i < filterAudit.length; i++) {
                    if (i == 0) {
                        filterQuery = filterQuery + "(changes LIKE '%" + filterAudit[i] + "%' OR ";
                    } else if (i == filterAudit.length - 1) {
                        filterQuery = filterQuery + "changes LIKE '%" + filterAudit[i] + "%')";
                    } else {
                        filterQuery = filterQuery + "changes LIKE '%" + filterAudit[i] + "%'";
                    }
                }
            }
            System.out.println(filterQuery);
        }
        
        String sortQuery = " ORDER BY ";
        String sortCommand = request.getParameter("sortSubmit");
        String sortBy = request.getParameter("sortBy");
        
        if (sortCommand.equals("Apply")) {
            if (sortBy == null) {
                session.setAttribute("sortAuditQuery", " ");
            } else {
                if (sortBy.equals("Oldest to Newest")) {
                    sortQuery = sortQuery + "`audit-log`.timestamp ASC";
                } else if (sortBy.equals("Newest to Oldest")) {
                    sortQuery = sortQuery + "`audit-log`.timestamp DESC";
                }
                System.out.println(sortQuery);
                session.setAttribute("sortAuditQuery", sortQuery);
            }
            System.out.println(filterQuery);
            System.out.println(sortQuery);
            
            if (filterQuery.equals(" WHERE ")) {
                session.setAttribute("filterAuditQuery", " ");
            } else {
                session.setAttribute("filterAuditQuery", filterQuery);
            }
            
        } else {
            session.setAttribute("sortAuditQuery", " ");
            session.setAttribute("filterAuditQuery", " ");
            
        }
        response.sendRedirect("/SKIT-YIMS/Account/AuditLog.jsp");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
