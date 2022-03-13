package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SortServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SortServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortServlet at " + request.getContextPath() + "</h1>");
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

        //FILTER
        String filterQuery = " WHERE ";
        String[] filterage = request.getParameterValues("filterage");
        String[] filtergender = request.getParameterValues("filtergender");
        String[] filterCivilStatus = request.getParameterValues("filterCivilStatus");
        String[] filterWorkStatus = request.getParameterValues("filterWorkStatus");
        String[] filterother = request.getParameterValues("filterother");

        if (filterage == null) {
            System.out.println("Walang laman ehe");
        } else {
            if (filterage.length == 1) {
                filterQuery = filterQuery + "(agegroup = " + filterage[0] + ")";
                System.out.println(filterQuery);
            } else {
                for (int i = 0; i < filterage.length; i++) {
                    if (i == 0) {
                        filterQuery = filterQuery + "(agegroup = " + filterage[i] + " OR ";
//                System.out.println(filterQuery);
                    } else if (i == filterage.length - 1) {
                        //Dito dapat magpprint ng query
                        filterQuery = filterQuery + "agegroup = " + filterage[i] + ")";
                        System.out.println(filterQuery);
                    } else {
                        filterQuery = filterQuery + "agegroup = " + filterage[i] + " OR ";
//                System.out.println(filterQuery);
                    }
//            filterQuery = "agegroup = " + filterage[i] + " OR";
                }
            }
        }

        if (filtergender == null) {
            System.out.println("Walang laman ehe");
        } else {
            if (filtergender.length == 1) {
                filterQuery = filterQuery + "(gender = " + filtergender[0] + ")";
                System.out.println(filterQuery);
            } else {
                for (int i = 0; i < filtergender.length; i++) {
                    if (i == 0) {
                        filterQuery = filterQuery + "(gender = " + filtergender[i] + " OR ";
                    } else if (i == filtergender.length - 1) {
                        filterQuery = filterQuery + "gender = " + filtergender[i] + ")";
                        System.out.println(filterQuery);
                    } else {
                        filterQuery = filterQuery + "gender = " + filtergender[i] + " OR ";
                    }
                }
            }
        }

        if (filterCivilStatus == null) {
            System.out.println("Walang laman ehe");
        } else {
            if (filterCivilStatus.length == 1) {
                filterQuery = filterQuery + "(civilStatus = " + filterCivilStatus[0] + ")";
                System.out.println(filterQuery);
            } else {
                for (int i = 0; i < filterCivilStatus.length; i++) {
                    if (i == 0) {
                        filterQuery = filterQuery + "(civilStatus = " + filterCivilStatus[i] + " OR ";
                    } else if (i == filterCivilStatus.length - 1) {
                        filterQuery = filterQuery + "civilStatus = " + filterCivilStatus[i] + ")";
                        System.out.println(filterQuery);
                    } else {
                        filterQuery = filterQuery + "civilStatus = " + filterCivilStatus[i] + " OR ";
                    }
                }
            }
        }

        if (filterWorkStatus == null) {
            System.out.println("Walang laman ehe");
        } else {
            if (filterWorkStatus.length == 1) {
                filterQuery = filterQuery + "(workingStatus = " + filterWorkStatus[0] + ")";
                System.out.println(filterQuery);
            } else {
                for (int i = 0; i < filterWorkStatus.length; i++) {
                    if (i == 0) {
                        filterQuery = filterQuery + "(workingStatus = " + filterWorkStatus[i] + " OR ";
                    } else if (i == filterWorkStatus.length - 1) {
                        filterQuery = filterQuery + "workingStatus = " + filterWorkStatus[i] + ")";
                        System.out.println(filterQuery);
                    } else {
                        filterQuery = filterQuery + "workingStatus = " + filterWorkStatus[i] + " OR ";
                    }
                }
            }
        }

        if (filterother == null) {
            System.out.println("Walang laman ehe");
        } else {
            if (filterother.length == 1) {
                if (filterother[0].equals("PWD")) {
                    filterQuery = filterQuery + "(PWD = Yes)";
                } else if (filterother[0].equals("Vaccinated")) {
                    filterQuery = filterQuery + "(vaccinated = Yes)";
                } else {
                    filterQuery = filterQuery + "(vaccinated = No)";
                }
                System.out.println(filterQuery);
            } else {
                for (int i = 0; i < filterother.length; i++) {
                    if (i == 0) {
                        if (filterother[i].equals("PWD")) {
                            filterQuery = filterQuery + "(PWD = Yes) OR";
                        } else if (filterother[i].equals("Vaccinated")) {
                            filterQuery = filterQuery + "(vaccinated = Yes OR";
                        } else {
                            filterQuery = filterQuery + "(vaccinated = No OR";
                        }
                    } else if (i == filterother.length - 1) {
                        if (filterother[i].equals("PWD")) {
                            filterQuery = filterQuery + "(PWD = Yes)";
                        } else if (filterother[i].equals("Vaccinated")) {
                            filterQuery = filterQuery + "(vaccinated = Yes)";
                        } else {
                            filterQuery = filterQuery + "(vaccinated = No)";
                        }
                        System.out.println(filterQuery);
                    } else {
                        if (filterother[i].equals("PWD")) {
                            filterQuery = filterQuery + "(PWD = Yes) OR ";
                        } else if (filterother[i].equals("Vaccinated")) {
                            filterQuery = filterQuery + "(vaccinated = Yes) OR ";
                        } else {
                            filterQuery = filterQuery + "(vaccinated = No) OR ";
                        }
                    }
                }
            }
        }

        //ORDER BY SQL
        String sortQuery = " ORDER BY ";
        String sortCommand = request.getParameter("sortSubmit");
        String sortBy = request.getParameter("sortBy");

        if (sortCommand.equals("Apply")) {

            if (sortBy == null) {
                session.setAttribute("sortQuery", " ");
            } else {
                if (sortBy.equals("A to Z")) {
                    sortQuery = sortQuery + "`basic-info`.name ASC";
                } else if (sortBy.equals("Z to A")) {
                    sortQuery = sortQuery + "`basic-info`.name DESC";
                } else if (sortBy.equals("Youngest to Oldest")) {
                    sortQuery = sortQuery + "`basic-info`.birthday ASC";
                } else if (sortBy.equals("Oldest to Youngest")) {
                    sortQuery = sortQuery + "`basic-info`.birthday DESC";
                }
                System.out.println(sortQuery);
                session.setAttribute("sortQuery", sortQuery);
            }

        } else {
            session.setAttribute("sortQuery", " ");
        }

//        if (sortCommand.equals("Apply")) {
//            if (sortColumn.equals("name")) {
//                sortQuery = sortQuery + "`basic-info`.name ";
//            } else if (sortColumn.equals("birthday")) {
//                sortQuery = sortQuery + "`basic-info`.birthday ";
//            };
//
//            if (sortOrder.equals("ASC")) {
//                sortQuery = sortQuery + "ASC";
//            } else if (sortOrder.equals("DESC")) {
//                sortQuery = sortQuery + "DESC";
//            }
//
//            session.setAttribute("sortQuery", sortQuery);
//        } else {
//            session.setAttribute("sortQuery", " ");
//        }
        response.sendRedirect("/SKIT-YIMS/Account/ViewDatabase.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
