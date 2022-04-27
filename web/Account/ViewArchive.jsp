<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="AccountCSS/ViewDatabase.css" rel="stylesheet" type="text/css">
        <link rel="icon" type="image/png" href="/SKIT-YIMS/img/SK_Logo.png" /> 

        <title>View Archive</title>
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

            .form-popup {
                display: none;

            }
            .form-container {
                /*                max-width: 300px;*/
                padding: 10px;
                background-color: white;
            }
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            /* The Close Button */
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
                <% if ((session.getAttribute("username").equals("skkagawad1db")) || (session.getAttribute("username").equals("skkagawad2db")) || (session.getAttribute("username").equals("skchairman"))) {%>
                <li class="Events"><a href="AuditLog.jsp">Audit Log</a></li> 
                <% }%>
                <li class="Events"><a href="ViewDatabase.jsp">Database</a></li>
                
                <% if ((session.getAttribute("username").equals("skkagawad1db")) || (session.getAttribute("username").equals("skkagawad2db")) || (session.getAttribute("username").equals("skchairman"))) {%>
                <li class = "Events">
                <form action="../ArchiveServlet" method="POST">
<!--                    <div class="archive-button-container">-->
                        <button type="submit" class="archive-button">Archive</button>
<!--                    </div>-->
                </form>
                <% }%>
                </li>
                
                <li class="Events"><a href="AccountInformation.jsp">Account</a></li>

                <li class="Login">
                    <form action = "../LogoutServlet" method = "GET">
                        <input type="hidden" name="SKusername" value="${username}"/>
                        <input type="hidden" name="SKname" value="${name}"/>
                        <button id="Login" class="logout-btn" type="submit">Log Out</button>
                    </form>
                </li>
            </ul>            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>
        <div class="navbar-spacer"></div> 
        <div>
            <div class="database-title-container">
                <div class="database-title">SK Ibayo-Tipas Youth Residents Archive</div>
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
                        String sortQuery = (String) session.getAttribute("sortQuery");
                        if (sortQuery == null) {
                            sortQuery = " ";
                        }
                        String filterQuery = (String) session.getAttribute("filterQuery");
                        if (filterQuery == null) {
                            filterQuery = " ";
                        }
//                        Class.forName("com.mysql.jdbc.Driver").newInstance();
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "CSELECC1_DW");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT * FROM `archive-info`";
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Records in the table");
                        } else {%>

                <table >
                    <tr><th>ID</th><th>Timestamp</th><th>E-mail</th><th>Name</th><th>Age</th><th>Birthday</th><th>Complete Address</th><th>Gender</th>
                        <th>Contact No.</th><th>Civil Status</th><th>Working Status</th><th>Job Employed</th><th>Education Attainment</th><th>PWD</th><th>Type of Disability</th>
                        <th>Facebook Name or URL</th><th>Valid ID</th><th>Mother's Name</th><th>Mother's Occupation</th><th>Father's Name</th><th>Father's Occupation</th>
                        <th>Vital Status Mother</th><th>Vital Status Father</th><th>No. of Siblings</th><th>Sibling Education</th><th>BreadWinner</th><th>Resident Voter</th>
                        <th>Member of Organization</th><th>Name of Organization</th><th>Support SK</th><th>Show Support</th><th>Job Chance</th><th>Say to SK</th>
                        <th>Vaccinated</th><th>Willing for Vaccine</th><th>Brand of Vaccine</th><th>Vaccine Status</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(37)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td><td><%= rs.getString(7)%></td><td><%= rs.getString(8)%></td>
                        <td><%= rs.getString(9)%></td><td><%= rs.getString(10)%></td><td><%= rs.getString(11)%></td><td><%= rs.getString(12)%></td>
                        <td><%= rs.getString(13)%></td><td><%= rs.getString(14)%></td><td><%= rs.getString(15)%></td>
                        <td>
                            <a href="GetImageArchive.jsp?id=<%= rs.getString(1)%>" target = "_blank">Valid ID of Resident</a>
                        </td>
                        <td><%= rs.getString(17)%></td><td><%= rs.getString(18)%></td><td><%= rs.getString(19)%></td><td><%= rs.getString(20)%></td>
                        <td><%= rs.getString(21)%></td><td><%= rs.getString(22)%></td><td><%= rs.getString(23)%></td><td><%= rs.getString(24)%></td>
                        <td><%= rs.getString(25)%></td><td><%= rs.getString(26)%></td><td><%= rs.getString(27)%></td><td><%= rs.getString(28)%></td>
                        <td><%= rs.getString(29)%></td><td><%= rs.getString(30)%></td><td><%= rs.getString(31)%></td><td><%= rs.getString(32)%></td>
                        <td><%= rs.getString(33)%></td><td><%= rs.getString(34)%></td><td><%= rs.getString(35)%></td><td><%= rs.getString(36)%></td>
                        <!--                        <td>
                                                    <a href="Edit.jsp?u=<%= rs.getString(1)%>" class="btn-warning">Edit</a>
                                                </td>-->

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
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "CSELECC1_DW");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT residentID, name, agegroup, birthday, address, gender, validID FROM `archive-info`";
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
                            <a href="GetImageArchive.jsp?id=<%= rs.getString(1)%>" target = "_blank">Valid ID of Resident</a>
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
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "CSELECC1_DW");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT residentID, name, contactNo, emailAddress, fbNameURL FROM `archive-info`";
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
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "CSELECC1_DW");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT residentID, name, motherName, motherOccupation, fatherName, fatherOccupation, vitalStatusMother, vitalStatusFather, noOfSiblings, siblingEducation, breadWinner FROM `archive-info`";
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
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "CSELECC1_DW");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT residentID, name, memberOfOrg, residentVoter, nameOfOrg, supportSK, showSupport, jobChance, sayToSK FROM `archive-info`";
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
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "CSELECC1_DW");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT residentID, name, civilStatus, workingStatus, educationAttainment, jobEmployed, PWD, typeOfDisability FROM `archive-info`";
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
//                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "CSELECC1_DW");
                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT residentID, name, vaccinated, willingForVaccine, brandOfVaccine, vaccineStatus FROM `archive-info`";
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Records in the table");
                        } else {%>

                <table>
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
            </div>
            <!--         //    <form action="../ArchiveServlet" method="GET">
                            <button type="submit" class="generate-button">Delete Archive</button>
                        </form>-->
            <button id="myBtn" class="generate-button">Delete Archive</button>

            <!-- The Modal -->
            <div id="myModal" class="modal">  
                <div class="modal-content">
                    <form action="../ArchiveServlet" method="GET"> <span class="close">&times;</span>
                        <h1>Are you sure you want to delete archive?</h1>
                        <input type="hidden" name="SKusername" value="${username}"/>
                        <input type="hidden" name="SKname" value="${name}"/>
                        <button id="cancel" type="button" class="generate-button">Cancel</button>
                        <button type="submit" class="generate-button">Delete</button>
                    </form>
                </div>
            </div>

        </div>
    </body>
</html>

<script>
    function openForm() {
        document.getElementById("myForm").style.display = "block";
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

<script>
// Get the modal
    var modal = document.getElementById("myModal");

// Get the button that opens the modal
    var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
    btn.onclick = function () {
        modal.style.display = "block";
    }

// When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }
    cancel.onclick = function () {
        modal.style.display = "none";
    }
// When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
