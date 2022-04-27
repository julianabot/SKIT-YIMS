<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="AccountCSS/ViewDatabase.css?v={random number/string}" rel="stylesheet" type="text/css">
        <link rel="icon" type="image/png" href="/SKIT-YIMS/img/SK_Logo.png" /> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>View Database</title>
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
                padding: 10px 16px;
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

            .form-popup {
                display: none;

            }
            .form-container {
                /*                max-width: 300px;*/
                padding: 10px;
                background-color: white;
            }


        </style>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!--        <script src="../js/showTab.js"></script>-->
    </head>
    <%
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("loggedIn") == null) {
            response.sendRedirect("/SKIT-YIMS/Extra/InvalidSession.jsp");
        }
    %>
    <body>
        <!--HEADER-->
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="../img/SK_Logo.png" class="header-logo">

            <div class="logo"><a id="SK-Text-NavBar">Sangguniang Kabataan Ibayo-Tipas</a></div>

            <ul class="links">
                <!-- <li class="About"><a href="../Welcome.jsp">Home</a></li> -->
                <li class="Events"><a href="ViewDatabase.jsp">Database</a></li>
                <li class="Events"><a href="AccountInformation.jsp">Account</a></li>

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
            <div class="search-archive">
                <div class="wrapper">
                    <form action="../SearchServlet" method="POST">
                        <input name="searchResident" type="text" placeholder="Search for a resident" id="searchResident">
                        <button type="submit" class="search-button"><i class="fas fa-search"></i>&nbsp; Search</button>
                    </form>
                </div>
                <div class="horizontal-spacer"></div>
                <% if ((session.getAttribute("username").equals("skkagawad1db")) || (session.getAttribute("username").equals("skkagawad2db")) || (session.getAttribute("username").equals("skchairman"))) {%>
                <form action="../ArchiveServlet" method="POST">
                    <div class="archive-button-container">
                        <button type="submit" class="archive-button">Archive Database</button>
                    </div>
                </form>
                <% }%>

            </div>

            <div class="database-title-container">
                <div class="database-title">SK Ibayo-Tipas Youth Residents Database</div>
                <button class="open-button" onclick="openForm()" style="font-weight: bold;">  Sort & Filter</button>
            </div>

            <div class="form-popup" id="myForm">
                <form action="../SortServlet" method="POST" class="form-container">
                    <div id="close-button-container">
                        <button type="button" class="btn-cancel" onclick="closeForm()"><i class="material-icons">close</i></button>
                    </div>
                    <div>
                        <h1>Sort</h1>
                        <!--<p>by Name</p>-->
                        <input type="radio" id="atoz" name="sortBy" value="A to Z">
                        <label for="atoz">A to Z</label><br>
                        <input type="radio" id="ztoa" name="sortBy" value="Z to A">
                        <label for="ztoa">Z to A</label><br>

                        <!--<p>by Age</p>-->
                        <input type="radio" id="ytoo" name="sortBy" value="Youngest to Oldest">
                        <label for="ytoo">Youngest to Oldest</label><br>
                        <input type="radio" id="otoy" name="sortBy" value="Oldest to Youngest">
                        <label for="otoy">Oldest to Youngest</label><br>

                        <input type="radio" id="ascid" name="sortBy" value="Ascending ID">
                        <label for="ascid">Lowest to Highest ID</label><br>
                        <input type="radio" id="descid" name="sortBy" value="Descending ID">
                        <label for="descid">Highest to Lowest ID</label><br>

                    </div>

                    <div>

                        <h1>Filter</h1>
                        <h3>By Age</h3>
                        <ul class="filter" style="list-style: none">
                            <li><input id="fourteenBelow" type="checkbox" name="filterage" value="14 years old and below"/><label for="fourteenBelow">14 years old and below</label></li>
                            <li><input id="fifteenTwenty" type="checkbox" name="filterage" value="15-20 years old"/><label for="fifteenTwenty">15-20 years old</label></li>
                            <li><input id="twentyoneThirty" type="checkbox" name="filterage" value="21-30 years old"/><label for="twentyoneThirty">21-30 years old</label></li>
                            <li><input id="thirtyoneAbove" type="checkbox" name="filterage" value="31 years old and above"/><label for="thirtyoneAbove">31 years old and above</label></li>
                        </ul>

                        <h3>By Gender</h3>
                        <ul class="filter" style="list-style: none">
                            <li><input id="femaleCheck" type="checkbox" name="filtergender" value="Female"/><label for="femaleCheck">Female</label></li>
                            <li><input id="maleCheck" type="checkbox" name="filtergender" value="Male"/><label for="maleCheck">Male</label></li>
                            <li><input id="prefernottosayCheck" type="checkbox" name="filtergender" value="Prefer not to say"/><label for="prefernottosayCheck">Prefer not to say</label></li>
                        </ul>

                        <h3>By Civil Status</h3>
                        <ul class="filter" style="list-style: none">
                            <li><input id="singleCheck" type="checkbox" name="filterCivilStatus" value="Single"/><label for="singleCheck">Single</label></li>
                            <li><input id="marriedCheck" type="checkbox" name="filterCivilStatus" value="Married"/><label for="marriedCheck">Married</label></li>
                            <li><input id="widowedCheck" type="checkbox" name="filterCivilStatus" value="Widowed"/><label for="widowedCheck">Widowed</label></li>
                        </ul>

                    </div>

                    <div id="last-group">

                        <h3>By Working Status</h3>
                        <ul class="filter" style="list-style: none">
                            <li><input id="fulltimestudent" type="checkbox" name="filterWorkStatus" value="Full-Time Student"/><label for="fulltimestudent">Full-Time Student</label></li>
                            <li><input id="workingstudent" type="checkbox" name="filterWorkStatus" value="Working Student"/><label for="workingstudent">Working Student</label></li>
                            <li><input id="outofschool" type="checkbox" name="filterWorkStatus" value="Out of School Youth"/><label for="outofschool">Out of School Youth</label></li>
                            <li><input id="employed" type="checkbox" name="filterWorkStatus" value="Working/Employed"/><label for="employed">Working/Employed</label></li>
                            <li><input id="unemployed" type="checkbox" name="filterWorkStatus" value="Unemployed"/><label for="unemployed">Unemployed</label></li>
                        </ul>

                        <h3>Other</h3>
                        <ul class="filter" style="list-style: none">
                            <li><input id="pwdcheck" type="checkbox" name="filterother" value="PWD"/><label for="pwdcheck">PWDs</label></li>
                            <li><input type="checkbox" name="filterother" onclick ="vaccineCheck()" id="yesVax" value="Vaccinated"/><label for="yesVax">Vaccinated</label></li>
                            <li><input type="checkbox" name="filterother" onclick ="vaccineCheck()" id="noVax" value="Not Vaccinated"/><label for="noVax">Not Vaccinated</label></li>
                        </ul>

                        <button name="sortSubmit" type="submit" value="Apply" class="popup-button" id="popup-button1">Apply</button><br>
                        <button name="sortSubmit" type="submit" value="Clear" class="popup-button" id="popup-button2">Clear Changes</button>

                    </div>
                </form>

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
                <%
                    try {
                        String sortQuery = (String) session.getAttribute("sortQuery");
                        if (sortQuery == null) {
                            sortQuery = " ";
                        }
                        String filterQuery = (String) session.getAttribute("filterQuery");
                        if (filterQuery == null) {
                            filterQuery = " ";
                        }
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `resident-info`.timestamp, `resident-info`.residentID, `contact-info`.emailAddress, `basic-info`.name, `basic-info`.agegroup, `basic-info`.birthday, `basic-info`.address, `basic-info`.gender, `contact-info`.contactNo, `resident-status`.civilStatus, `resident-status`.workingStatus, `resident-status`.jobEmployed, `resident-status`.educationAttainment, `resident-status`.PWD, `resident-status`.typeOfDisability, `contact-info`.fbNameURL, `basic-info`.validID, `fam-status`.motherName, `fam-status`.motherOccupation, `fam-status`.fatherName, `fam-status`.fatherOccupation, `fam-status`.vitalStatusMother, `fam-status`.vitalStatusFather, `fam-status`.noOfSiblings, `fam-status`.siblingEducation, `fam-status`.breadWinner, `resident-org`.residentVoter, `resident-org`.memberOfOrg, `resident-org`.nameOfOrg, `resident-org`.supportSK, `resident-org`.showSupport, `resident-org`.jobChance, `resident-org`.sayToSK, `vaccine-info`.vaccinated, `vaccine-info`.willingForVaccine, `vaccine-info`.brandOfVaccine, `vaccine-info`.vaccineStatus FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID " + filterQuery + sortQuery;
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Records in the table");
                        } else {%>

                <table>
                    <tr>
                        <% if ((session.getAttribute("username").equals("skkagawad1db")) || (session.getAttribute("username").equals("skkagawad2db")) || (session.getAttribute("username").equals("skchairman"))) {%>
                        <th class="text-center"></th><th class="text-center"></th>
                            <% }%>
                        <th>Timestamp</th><th>ID</th><th>E-mail</th><th>Name</th><th>Age</th><th>Birthday</th><th>Complete Address</th><th>Gender</th>
                        <th>Contact No.</th><th>Civil Status</th><th>Working Status</th><th>Job Employed</th><th>Education Attainment</th><th>PWD</th><th>Type of Disability</th>
                        <th>Facebook Name or URL</th><th>Valid ID</th><th>Mother's Name</th><th>Mother's Occupation</th><th>Father's Name</th><th>Father's Occupation</th>
                        <th>Vital Status Mother</th><th>Vital Status Father</th><th>No. of Siblings</th><th>Sibling Education</th><th>BreadWinner</th><th>Resident Voter</th>
                        <th>Member of Organization</th><th>Name of Organization</th><th>Support SK</th><th>Show Support</th><th>Job Chance</th><th>Say to SK</th>
                        <th>Vaccinated</th><th>Willing for Vaccine</th><th>Brand of Vaccine</th><th>Vaccine Status</th></tr>
                            <%
                                do {%>

                    <tr>
                        <% if ((session.getAttribute("username").equals("skkagawad1db")) || (session.getAttribute("username").equals("skkagawad2db")) || (session.getAttribute("username").equals("skchairman"))) {%>
                        <td>
                            <a href="Edit.jsp?u=<%= rs.getString(2)%>" class="btn-warning"><i class="fa fa-pencil-square"></i></a>
                        </td>

                        <td>
                            <a href="Delete.jsp?d=<%= rs.getString(2)%>"  onclick="return confirm('Are you sure you want to delete this resident?')" class="btn-danger"><i class="fa fa-trash" style="color: #8B3535;"></i></a>
                        </td>
                        <% }%>
                        <td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td><td><%= rs.getString(7)%></td><td><%= rs.getString(8)%></td>
                        <td><%= rs.getString(9)%></td><td><%= rs.getString(10)%></td><td><%= rs.getString(11)%></td><td><%= rs.getString(12)%></td>
                        <td><%= rs.getString(13)%></td><td><%= rs.getString(14)%></td><td><%= rs.getString(15)%></td><td><%= rs.getString(16)%></td>
                        <td>
                            <a href="GetImage.jsp?id=<%= rs.getString(1)%>" target = "_blank">Valid ID of Resident</a>
                        </td>
                        <td><%= rs.getString(18)%></td><td><%= rs.getString(19)%></td><td><%= rs.getString(20)%></td>
                        <td><%= rs.getString(21)%></td><td><%= rs.getString(22)%></td><td><%= rs.getString(23)%></td><td><%= rs.getString(24)%></td>
                        <td><%= rs.getString(25)%></td><td><%= rs.getString(26)%></td><td><%= rs.getString(27)%></td><td><%= rs.getString(28)%></td>
                        <td><%= rs.getString(29)%></td><td><%= rs.getString(30)%></td><td><%= rs.getString(31)%></td><td><%= rs.getString(32)%></td>
                        <td><%= rs.getString(33)%></td><td><%= rs.getString(34)%></td><td><%= rs.getString(35)%></td><td><%= rs.getString(36)%></td>
                        <td><%= rs.getString(37)%></td>
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

            <div id="Information" class="tabcontent">
                <%
                    try {
                        String sortQuery = (String) session.getAttribute("sortQuery");
                        if (sortQuery == null) {
                            sortQuery = " ";
                        }

                        String filterQuery = (String) session.getAttribute("filterQuery");
                        if (filterQuery == null) {
                            filterQuery = " ";
                        }
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `resident-info`.residentID, `basic-info`.name, `basic-info`.agegroup, `basic-info`.birthday, `basic-info`.address, `basic-info`.gender,`basic-info`.validID FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID " + filterQuery + sortQuery;
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Records in the table");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Age Group</th><th>Birthday</th><th>Address</th><th>Gender</th><th>Valid ID</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td>   
                        <td>
                            <a href="GetImage.jsp?id=<%= rs.getString(1)%>" target = "_blank">Valid ID of Resident</a>
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
                        String sortQuery = (String) session.getAttribute("sortQuery");
                        if (sortQuery == null) {
                            sortQuery = " ";
                        }
                        String filterQuery = (String) session.getAttribute("filterQuery");
                        if (filterQuery == null) {
                            filterQuery = " ";
                        }
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `resident-info`.residentID, `basic-info`.name, `contact-info`.contactNo, `contact-info`.emailAddress, `contact-info`.fbNameURL FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID " + filterQuery + sortQuery;
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Records in the table");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Contact No.</th><th>Email Address</th><th>FB Name and/or URL</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td><td><%= rs.getString(5)%></td></tr>

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
                        String sortQuery = (String) session.getAttribute("sortQuery");
                        if (sortQuery == null) {
                            sortQuery = " ";
                        }
                        String filterQuery = (String) session.getAttribute("filterQuery");
                        if (filterQuery == null) {
                            filterQuery = " ";
                        }
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `resident-info`.residentID, `basic-info`.name, `fam-status`.motherName, `fam-status`.motherOccupation, `fam-status`.fatherName, `fam-status`.fatherOccupation, `fam-status`.vitalStatusMother, `fam-status`.vitalStatusFather, `fam-status`.noOfSiblings, `fam-status`.siblingEducation, `fam-status`.breadwinner FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID " + filterQuery + sortQuery;
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Records in the table");
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
                        String sortQuery = (String) session.getAttribute("sortQuery");
                        if (sortQuery == null) {
                            sortQuery = " ";
                        }
                        String filterQuery = (String) session.getAttribute("filterQuery");
                        if (filterQuery == null) {
                            filterQuery = " ";
                        }
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `resident-info`.residentID, `basic-info`.name, `resident-org`.residentVoter, `resident-org`.memberOfOrg, `resident-org`.nameOfOrg, `resident-org`.supportSK, `resident-org`.showSupport, `resident-org`.jobChance, `resident-org`.sayToSK FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID " + filterQuery + sortQuery;
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Records in the table");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Resident Voter</th><th>Member of Organization</th><th>Name of Organization</th><th>Support SK</th><th>Show Support</th>
                        <th>Job Chance</th><th>Say to SK</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td><td><%= rs.getString(7)%></td><td><%= rs.getString(8)%></td><td><%= rs.getString(9)%></tr>

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
                        String sortQuery = (String) session.getAttribute("sortQuery");
                        if (sortQuery == null) {
                            sortQuery = " ";
                        }
                        String filterQuery = (String) session.getAttribute("filterQuery");
                        if (filterQuery == null) {
                            filterQuery = " ";
                        }
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `resident-info`.residentID, `basic-info`.name, `resident-status`.civilStatus, `resident-status`.workingStatus, `resident-status`.educationAttainment, `resident-status`.jobEmployed, `resident-status`.PWD, `resident-status`.typeOfDisability FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID " + filterQuery + sortQuery;
                        //String sql = "SELECT `resident-info`.residentID, `basic-info`.name, `vaccine-info`.vaccinated, `vaccine-info`.willingForVaccine, `vaccine-info`.brandOfVaccine, `vaccine-info`.vaccineStatus FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID " + filterQuery + sortQuery;
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Records in the table");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Civil Status</th><th>Working Status</th><th>Education Attainment</th><th>Job Employed</th><th>PWD</th><th>Type of Disability</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td><td><%= rs.getString(7)%></td><td><%= rs.getString(8)%></td></tr>

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
                        String sortQuery = (String) session.getAttribute("sortQuery");
                        if (sortQuery == null) {
                            sortQuery = " ";
                        }
                        String filterQuery = (String) session.getAttribute("filterQuery");
                        if (filterQuery == null) {
                            filterQuery = " ";
                        }
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "dataware");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT `resident-info`.residentID, `basic-info`.name, `vaccine-info`.vaccinated, `vaccine-info`.willingForVaccine, `vaccine-info`.brandOfVaccine, `vaccine-info`.vaccineStatus FROM `resident-info` INNER JOIN `contact-info` ON `resident-info`.residentID = `contact-info`.contactID INNER JOIN `basic-info` ON `resident-info`.residentID = `basic-info`.basicID INNER JOIN `resident-status` ON `resident-info`.residentID = `resident-status`.statusID INNER JOIN `fam-status` ON `resident-info`.residentID = `fam-status`.familyID INNER JOIN `resident-org` ON `resident-info`.residentID = `resident-org`.organizationID INNER JOIN `vaccine-info` ON `resident-info`.residentID = `vaccine-info`.vaccineID " + filterQuery + sortQuery;
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Records in the table");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Name</th><th>Vaccinated</th><th>Willing for Vaccine</th><th>Brand of Vaccine</th><th>Vaccine Status</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td></tr>

                    <%} while (rs.next());
                            }

                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                            e.getStackTrace();
                        }
                    %>
                </table>

                <input type="hidden" value="${sortQuery}" id="sort">
                <input type="hidden" value="${filterQuery}" id="filter">

            </div>
            <form action="../PDFServlet" method="POST">
                <input id="pdfdownload" class="pdfdownload" name="pdfdownload" style="display: none">
                <input type="hidden" name="SKusername" value="${username}"/>
                <input type="hidden" name="SKname" value="${name}"/>
                <button type="submit" class="generate-button" onclick="alert('File has been downloaded to your Desktop');">Generate Report</button>

            </form>
            <div>

            </div>
        </div>
    </body>
</html>

<script>
    function openForm() {
        document.getElementById("myForm").style.display = "block";
        checkSortFilter();
    }

    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }
</script>
<script>
    function vaccineCheck() {
        if (document.getElementById("yesVax").checked == true) {
            document.getElementById("noVax").disabled = true;
            document.getElementById("noVax").checked = false;
        }
        if (document.getElementById("yesVax").checked == false) {
            document.getElementById("noVax").disabled = false;
        }
        if (document.getElementById("noVax").checked == true) {
            document.getElementById("yesVax").disabled = true;
            document.getElementById("yesVax").checked = false;
        }
        if (document.getElementById("noVax").checked == false) {
            document.getElementById("yesVax").disabled = false;
        }
    }

</script>
<script>

    function checkSortFilter() {

        var sortCheck = document.getElementById('sort').value;
        var filterCheck = document.getElementById('filter').value;

        const atoz = document.getElementById('atoz');
        const ztoa = document.getElementById('ztoa');
        const ytoo = document.getElementById('ytoo');
        const otoy = document.getElementById('otoy');
        const ascid = document.getElementById('ascid');
        const descid = document.getElementById('descid');

        if (sortCheck.includes("name ASC")) {
            atoz.checked = true;
        } else if (sortCheck.includes("name DESC")) {
            ztoa.checked = true;
        } else if (sortCheck.includes("birthday DESC")) {
            otoy.checked = true;
        } else if (sortCheck.includes("birthday ASC")) {
            ytoo.checked = true;
        } else if (sortCheck.includes("residentID ASC")) {
            ascid.checked = true;
        } else if (sortCheck.includes("residentID DESC")) {
            descid.checked = true;
        }

        const fourteenBelow = document.getElementById('fourteenBelow');
        const fifteenTwenty = document.getElementById('fifteenTwenty');
        const twentyoneThirty = document.getElementById('twentyoneThirty');
        const thirtyoneAbove = document.getElementById('thirtyoneAbove');

        const femaleCheck = document.getElementById('femaleCheck');
        const maleCheck = document.getElementById('maleCheck');
        const prefernottosayCheck = document.getElementById('prefernottosayCheck');

        const singleCheck = document.getElementById('singleCheck');
        const marriedCheck = document.getElementById('marriedCheck');
        const widowedCheck = document.getElementById('widowedCheck');

        const fulltimestudent = document.getElementById('fulltimestudent');
        const workingstudent = document.getElementById('workingstudent');
        const outofschool = document.getElementById('outofschool');
        const employed = document.getElementById('employed');
        const unemployed = document.getElementById('unemployed');

        const pwdcheck = document.getElementById('pwdcheck');
        const yesVax = document.getElementById('yesVax');
        const noVax = document.getElementById('noVax');

        if (filterCheck.includes("14")) {
            fourteenBelow.checked = true;
        } else {
            fourteenBelow.checked = false;
        }
        if (filterCheck.includes("15")) {
            fifteenTwenty.checked = true;
        } else {
            fifteenTwenty.checked = false;
        }
        if (filterCheck.includes("21")) {
            twentyoneThirty.checked = true;
        } else {
            twentyoneThirty.checked = false;
        }
        if (filterCheck.includes("31")) {
            thirtyoneAbove.checked = true;
        } else {
            thirtyoneAbove.checked = false;
        }

        if (filterCheck.includes("Female")) {
            femaleCheck.checked = true;
        } else {
            femaleCheck.checked = false;
        }
        if (filterCheck.includes("Male")) {
            maleCheck.checked = true;
        } else {
            maleCheck.checked = false;
        }
        if (filterCheck.includes("Prefer")) {
            prefernottosayCheck.checked = true;
        } else {
            prefernottosayCheck.checked = false;
        }

        if (filterCheck.includes("Single")) {
            singleCheck.checked = true;
        } else {
            singleCheck.checked = false;
        }
        if (filterCheck.includes("Married")) {
            marriedCheck.checked = true;
        } else {
            marriedCheck.checked = false;
        }
        if (filterCheck.includes("Widowed")) {
            widowedCheck.checked = true;
        } else {
            widowedCheck.checked = false;
        }

        if (filterCheck.includes("Full-Time Student")) {
            fulltimestudent.checked = true;
        } else {
            fulltimestudent.checked = false;
        }
        if (filterCheck.includes("Working Student")) {
            workingstudent.checked = true;
        } else {
            workingstudent.checked = false;
        }
        if (filterCheck.includes("Out of School")) {
            outofschool.checked = true;
        } else {
            outofschool.checked = false;
        }
        if (filterCheck.includes("Employed")) {
            employed.checked = true;
        } else {
            employed.checked = false;
        }
        if (filterCheck.includes("Unemployed")) {
            unemployed.checked = true;
        } else {
            unemployed.checked = false;
        }

        if (filterCheck.includes("PWD = 'Yes'")) {
            pwdcheck.checked = true;
        } else {
            pwdcheck.checked = false;
        }
        if (filterCheck.includes("vaccinated = 'Yes'")) {
            yesVax.checked = true;
        } else {
            yesVax.checked = false;
        }
        if (filterCheck.includes("vaccinated = 'No'")) {
            noVax.checked = true;
        } else {
            noVax.checked = false;
        }

        console.log(sortCheck);
        console.log(filterCheck);

    }

</script>
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
