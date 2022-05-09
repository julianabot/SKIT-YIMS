<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/Account/AccountCSS/ViewDatabase.css" rel="stylesheet" type="text/css">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/SK_Logo.png" /> 
        <title>Search Database</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>

            /* Style the tab */
            .tab {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: white;
                width: 100%;
                margin: auto;
                text-align: center;
                display: flex;
                justify-content: space-between;
            }



            /* Style the buttons inside the tab */
            .tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 1em;
                width: 100%;
                border: none;
                font-family: 'Montserrat';
                font-weight: bold;
            }

            /* Change background color of buttons on hover */
            .tab button:hover {
                background-color: #E9DEDE;
            }

            /* Create an active/current tablink class */
            .tab button.active {
                background-color: #8B3535;
                color: white;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border-top: none;

            }

            /* for button */
            .wrapper {
                border:1px solid #000;
                display:inline-block;
            }
        </style>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <%
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("loggedIn") == null) {
            response.sendRedirect(request.getContextPath() + "/Extra/InvalidSession.jsp");
        }
        if (session.getAttribute("residentName").equals("")) {
            response.sendRedirect(request.getContextPath() + "/Account/ViewDatabase.jsp");
        }
    %>
    <body>
        <!--HEADER-->
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="${pageContext.request.contextPath}/img/SK_Logo.png" class="header-logo">

            <div class="logo"><a id="SK-Text-NavBar">Sangguniang Kabataan Ibayo-Tipas</a></div>

            <ul class="links">
                <% if ((session.getAttribute("username").equals("skkagawad1db")) || (session.getAttribute("username").equals("skkagawad2db")) || (session.getAttribute("username").equals("skchairman"))) {%>
                <li class="Events"><a href="${pageContext.request.contextPath}/Account/AuditLog.jsp">Audit Log</a></li> 
                    <% }%>
                <li class="Events"><a href="${pageContext.request.contextPath}/Account/ViewDatabase.jsp">Database</a></li>

                <% if ((session.getAttribute("username").equals("skkagawad1db")) || (session.getAttribute("username").equals("skkagawad2db")) || (session.getAttribute("username").equals("skchairman"))) {%>
                <li class = "Events">
                    <form action="../ArchiveServlet" method="POST">
                        <!--                    <div class="archive-button-container">-->
                        <button type="submit" class="archive-button">Archive</button>
                        <!--                    </div>-->
                    </form>
                    <% }%>
                </li>

                <li class="Events"><a href="${pageContext.request.contextPath}/Account/AccountInformation.jsp">Account</a></li>

                <li class="Login">
                    <form action = "../LogoutServlet" method = "GET">
                        <input type="hidden" name="SKusername" value="${username}"/>
                        <input type="hidden" name="SKname" value="${name}"/>
                        <button id="Login" class="logout-btn" type="submit">Log Out</button>
                    </form>
                </li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>
        <div class="navbar-spacer"></div> 
        <div>
            <%
                String residentName = session.getAttribute("residentName").toString();
                residentName = residentName.replace("%", "");
            %>
            <div class="search-archive">
                <div class="wrapper">
                    <form action="../SearchServlet" method="POST">
                        <input id="search-field" name="searchResident" type="text" value="<%=residentName%>" placeholder="Search for a resident" id="searchResident">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i>&nbsp; Search</button>
                    </form>
                </div>

                <div class="horizontal-spacer"></div>
                <%
                    try {

                        String resName = (String) session.getAttribute("residentName");
                        if (resName == null) {
                            resName = " ";
                        }

                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");

                        String sql = "SELECT GROUP_CONCAT(emailAddress) AS emails"
                                + " FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID"
                                + " WHERE `basic-info`.name LIKE '" + resName + "'";
                        System.out.println(resName);
                        PreparedStatement stmt = con.prepareStatement(sql);
                        String emails = "";
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                            emails = rs.getString(1);
                        }
                        System.out.println(emails);
                        session.setAttribute("emails", emails);

                        System.out.println(emails);
                    } catch (Exception e) {
                    }

                %>
                <% if ((session.getAttribute("username").equals("skkagawad1db")) || (session.getAttribute("username").equals("skkagawad2db")) || (session.getAttribute("username").equals("skchairman"))) {%>
                <!--                <form action="../ArchiveServlet" method="POST">-->
                <div class="email-button-container">
                    <button type="submit" class="email-button"><a href="mailto:ibayotipas.skcouncil@gmail.com?&bcc=${emails}">Send Announcements</a></button>
                </div>

                <% }%>
            </div>

            <div class="database-title-container">
                <div class="database-title">SK Ibayo-Tipas Youth Residents Database</div>
                <!--                <div class="sort-filter">
                                    <button type="button"><i class='fas fa-sort'></i>&nbsp;&nbsp;Sort</button> 
                                    <button type="button"><i class='fas fa-filter'></i>&nbsp;&nbsp;Filter</button> 
                                </div>-->
            </div>

            <div class="tab">
                <button class="tablinks" onclick="showTab(event, 'All')"  id="defaultOpen">All</button>
                <button class="tablinks" onclick="showTab(event, 'Information')">Basic Information</button>
                <button class="tablinks" onclick="showTab(event, 'Contact')">Contact Information</button>
                <button class="tablinks" onclick="showTab(event, 'Family')">Family</button>
                <button class="tablinks" onclick="showTab(event, 'Organization')">Resident Organization</button>
                <button class="tablinks" onclick="showTab(event, 'Status')"  >Resident Status</button>
                <button class="tablinks" onclick="showTab(event, 'Vaccine')">Vaccine Information</button>
            </div>
            <div id="All" class="tabcontent">
                <%                    try {
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `resident-info`.residentID, `contact-info`.emailAddress, `basic-info`.name, `basic-info`.agegroup, `basic-info`.birthday, `basic-info`.address, `basic-info`.gender, `contact-info`.contactNo, `resident-status`.civilStatus, `resident-status`.workingStatus, `resident-status`.jobEmployed, `resident-status`.educationAttainment, `resident-status`.PWD, `resident-status`.typeOfDisability, `contact-info`.fbNameURL, `basic-info`.validID, `fam-status`.motherName, `fam-status`.motherOccupation, `fam-status`.fatherName, `fam-status`.fatherOccupation, `fam-status`.vitalStatusMother, `fam-status`.vitalStatusFather, `fam-status`.noOfSiblings, `fam-status`.siblingEducation, `fam-status`.breadWinner, `resident-org`.residentVoter, `resident-org`.memberOfOrg, `resident-org`.nameOfOrg, `resident-org`.supportSK, `resident-org`.showSupport, `resident-org`.jobChance, `resident-org`.sayToSK, `vaccine-info`.vaccinated, `vaccine-info`.willingForVaccine, `vaccine-info`.brandOfVaccine, `vaccine-info`.vaccineStatus FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID WHERE `basic-info`.name LIKE ?";
                        PreparedStatement stmt = con.prepareStatement(sql);
                        stmt.setString(1, session.getAttribute("residentName").toString());
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Resident Found.");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>E-mail</th><th>Name</th><th>Age</th><th>Birthday</th><th>Complete Address</th><th>Gender</th>
                        <th>Contact No.</th><th>Civil Status</th><th>Working Status</th><th>Job Employed</th><th>Education Attainment</th><th>PWD</th><th>Type of Disability</th>
                        <th>Facebook Name or URL</th><th>Valid ID</th><th>Mother's Name</th><th>Mother's Occupation</th><th>Father's Name</th><th>Father's Occupation</th>
                        <th>Vital Status Mother</th><th>Vital Status Father</th><th>No. of Siblings</th><th>Sibling Education</th><th>BreadWinner</th><th>Resident Voter</th>
                        <th>Member of Organization</th><th>Name of Organization</th><th>Support SK</th><th>Show Support</th><th>Job Chance</th><th>Say to SK</th>
                        <th>Vaccinated</th><th>Willing for Vaccine</th><th>Brand of Vaccine</th><th>Vaccine Status</th><th class="text-center">Action</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td><td><%= rs.getString(7)%></td><td><%= rs.getString(8)%></td>
                        <td><%= rs.getString(9)%></td><td><%= rs.getString(10)%></td><td><%= rs.getString(11)%></td><td><%= rs.getString(12)%></td>
                        <td><%= rs.getString(13)%></td><td><%= rs.getString(14)%></td><td><%= rs.getString(15)%></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Account/GetImage.jsp?id=<%= rs.getString(1)%>" target = "_blank">Valid ID of Resident</a>
                        </td>
                        <td><%= rs.getString(17)%></td><td><%= rs.getString(18)%></td><td><%= rs.getString(19)%></td><td><%= rs.getString(20)%></td>
                        <td><%= rs.getString(21)%></td><td><%= rs.getString(22)%></td><td><%= rs.getString(23)%></td><td><%= rs.getString(24)%></td>
                        <td><%= rs.getString(25)%></td><td><%= rs.getString(26)%></td><td><%= rs.getString(27)%></td><td><%= rs.getString(28)%></td>
                        <td><%= rs.getString(29)%></td><td><%= rs.getString(30)%></td><td><%= rs.getString(31)%></td><td><%= rs.getString(32)%></td>
                        <td><%= rs.getString(33)%></td><td><%= rs.getString(34)%></td><td><%= rs.getString(35)%></td><td><%= rs.getString(36)%></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Account/Edit.jsp?u=<%= rs.getString(1)%>" class="btn-warning">Edit</a>
                        </td></tr>

                    <%} while (rs.next());
                            }

                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                            e.getStackTrace();
                        }
                    %>
                </table>
            </div>

            <div id="Information" class="tabcontent">
                <%
                    try {
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT * FROM `skit-yims`.`basic-info` WHERE `basic-info`.name LIKE ?";
                        PreparedStatement stmt = con.prepareStatement(sql);
                        stmt.setString(1, session.getAttribute("residentName").toString());
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Resident Found.");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Agegroup</th><th>Birthday</th><th>Address</th><th>Gender</th><th>Valid ID</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td style="width:60%"><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Account/GetImage.jsp?id=<%= rs.getString(1)%>" target = "_blank">Valid ID of Resident</a>
                        </td>
                    </tr>

                    <%} while (rs.next());
                            }

                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                            e.getStackTrace();
                        }
                    %>
                </table>
            </div>

            <div id="Contact" class="tabcontent">
                <%
                    try {

//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `contact-info`.contactID, `basic-info`.name, `contact-info`.contactNo, `contact-info`.emailAddress, `contact-info`.fbNameURL FROM `contact-info` INNER JOIN `basic-info` ON `contact-info`.contactID = `basic-info`.basicID WHERE `basic-info`.name LIKE ?";
                        PreparedStatement stmt = con.prepareStatement(sql);
                        stmt.setString(1, session.getAttribute("residentName").toString());
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Resident Found.");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Contact No.</th><th>Email Address</th><th>FB Name URL</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td style="width:25%"><%= rs.getString(2)%></td><td style="width:20%"><%= rs.getString(3)%></td><td  style="width: 25%"><%= rs.getString(4)%></td><td  style="width: 30%"><%= rs.getString(5)%></td></tr>

                    <%} while (rs.next());
                            }

                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                            e.getStackTrace();
                        }
                    %>
                </table>
            </div>

            <div id="Family" class="tabcontent">
                <%
                    try {
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `fam-status`.familyID, `basic-info`.name, `fam-status`.motherName, `fam-status`.motherOccupation, `fam-status`.fatherName, `fam-status`.fatherOccupation, `fam-status`.vitalStatusMother, `fam-status`.vitalStatusFather, `fam-status`.noOfSiblings, `fam-status`.siblingEducation, `fam-status`.breadWinner  FROM `fam-status` INNER JOIN `basic-info` ON `fam-status`.familyID = `basic-info`.basicID WHERE `basic-info`.name LIKE ? ";
                        PreparedStatement stmt = con.prepareStatement(sql);
                        stmt.setString(1, session.getAttribute("residentName").toString());
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Resident Found.");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Mother Name</th><th>Mother Occupation</th><th>Father Name</th><th>Father Occupation</th><th>Vital Status Mother</th>
                        <th>Vital Status Father</th><th>No. of siblings</th><th>Sibling Education</th><th>Bread Winner</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td><td><%= rs.getString(7)%></td><td><%= rs.getString(8)%></td>
                        <td><%= rs.getString(9)%></td><td><%= rs.getString(10)%></td><td><%= rs.getString(11)%></tr>

                    <%} while (rs.next());
                            }

                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                            e.getStackTrace();
                        }
                    %>
                </table>
            </div>

            <div id="Organization" class="tabcontent">
                <%
                    try {
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `resident-org`.organizationID, `basic-info`.name, `resident-org`.residentVoter, `resident-org`.memberOfOrg, `resident-org`.nameOfOrg, `resident-org`.supportSK, `resident-org`.showSupport, `resident-org`.jobChance, `resident-org`.sayToSK FROM `resident-org` INNER JOIN `basic-info` ON `resident-org`.organizationID = `basic-info`.basicID WHERE `basic-info`.name LIKE ?";
                        PreparedStatement stmt = con.prepareStatement(sql);
                        stmt.setString(1, session.getAttribute("residentName").toString());
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Resident Found.");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Resident Voter</th><th>Member of Organization</th><th>Name of Organization</th><th>Support SK</th><th>Show Support</th>
                        <th>Job Chance</th><th>Say to SK</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td><td><%= rs.getString(7)%></td><td><%= rs.getString(8)%></td>
                        <td style="width:100%"><%= rs.getString(9)%></tr>

                    <%} while (rs.next());
                            }

                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                            e.getStackTrace();
                        }
                    %>
                </table>
            </div>

            <div id="Status" class="tabcontent">
                <%
                    try {
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `resident-status`.statusID, `basic-info`.name, `resident-status`.civilStatus, `resident-status`.workingStatus, `resident-status`.educationAttainment, `resident-status`.jobEmployed, `resident-status`.PWD, `resident-status`.typeOfDisability FROM `resident-status` INNER JOIN `basic-info` ON `resident-status`.statusID = `basic-info`.basicID WHERE `basic-info`.name LIKE ?";
                        PreparedStatement stmt = con.prepareStatement(sql);
                        stmt.setString(1, session.getAttribute("residentName").toString());
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Resident Found.");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Civil Status</th><th>Working Status</th><th>Education Attainment</th><th>Job Employed</th><th>PWD</th><th>Type of Disability</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td><td><%= rs.getString(7)%></td><td style="width:100%"><%= rs.getString(8)%></td></tr>

                    <%} while (rs.next());
                            }

                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                            e.getStackTrace();
                        }
                    %>
                </table>
            </div>

            <div id="Vaccine" class="tabcontent">
                <%
                    try {
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `vaccine-info`.vaccineID, `basic-info`.name, `vaccine-info`.vaccinated, `vaccine-info`.willingForVaccine, `vaccine-info`.brandOfVaccine, `vaccine-info`.vaccineStatus FROM `vaccine-info` INNER JOIN `basic-info` ON `vaccine-info`.vaccineID = `basic-info`.basicID WHERE `basic-info`.name LIKE ?";
                        PreparedStatement stmt = con.prepareStatement(sql);
                        stmt.setString(1, session.getAttribute("residentName").toString());
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Resident Found.");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Vaccinated</th><th>Willing for Vaccine</th><th>Brand of Vaccine</th><th>Vaccine Status</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td  style="width: 40%"><%= rs.getString(2)%></td><td style="width: 15%"><%= rs.getString(3)%></td><td style="width: 15%"><%= rs.getString(4)%></td>
                        <td style="width: 15%"><%= rs.getString(5)%></td><td style="width: 15%"><%= rs.getString(6)%></td></tr>


                    <%} while (rs.next());
                            }

                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                            e.getStackTrace();
                        }
                    %>
                </table>
            </div>
            <div>

            </div>
        </div>
    </body>
</html>

<script>
    var counter = 0;
    function showTab(evt, tabName) {
        var i, tabcontent, tablinks;
        var pdfname = document.getElementById('pdfdownload');
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
        pdfname.value = tabName;
//        alert(tabName);
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
    evt.currentTarget.className += " active";

</script>
