<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/Account/AccountCSS/ViewDatabase.css" rel="stylesheet" type="text/css">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/SK_Logo.png" /> 

        <title>Audit Log</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>

            /*             Style the tab 
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
            
            
            
                         Style the buttons inside the tab 
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
            
                         Change background color of buttons on hover 
                        .tab button:hover {
                            background-color: #E9DEDE;
                        }
            
                         Create an active/current tablink class 
                        .tab button.active {
                            background-color: #8B3535;
                            color: white;
                            font-size: 1.5em;
                        }
            
                         Style the tab content 
                        .tabcontent {
                            display: none;
                            padding: 6px 12px;
                            border-top: none;
            
                        }*/

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
            response.sendRedirect(request.getContextPath() + "/Extra/InvalidSession.jsp");
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
                <li class="Events"><a href="${pageContext.request.contextPath}/Account/AuditLog.jsp">Audit Log</a></li> 
                    <% }%>
                <li class="Events"><a href="${pageContext.request.contextPath}/Account/ViewDatabase.jsp">Database</a></li>

                <% if ((session.getAttribute("username").equals("skkagawad1db")) || (session.getAttribute("username").equals("skkagawad2db")) || (session.getAttribute("username").equals("skchairman"))) {%>
                <li class = "Events">
                    <form action="../ArchiveServlet" method="POST">
                        <!--                    <div class="archive-button-container">-->
                        <button type="submit" class = "archive-button-view">Archive</button>
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
        <div class="audit-container">
            <!--            <div class="database-title-container">
                            <div class="database-title">SK Ibayo-Tipas Youth Residents AuditLog</div>
                        </div>-->


            <!--            <div class="tab">
                            <button class="tablinks" onclick="showTab(event, 'AuditLog')"  id="defaultOpen">Audit Log</button>
                        </div>-->

            <div class="database-title-container">
                <div class="database-title">SKIT-YIMS Audit Log</div>
                <button class="open-button" onclick="openForm()" style="font-weight: bold;">  Sort & Filter</button>
            </div>

            <div class="form-popup" id="myForm1">
                <div id="close-button-container">
                    <button type="button" class="btn-cancel" onclick="closeForm()"><i class="material-icons">close</i></button>
                </div>
                <div class="audit-modal">
                    <div class="audit-modal-content">

                        <form action="../SortAuditServlet" method="POST">
                            <h1>Sort</h1>
                            <div class="sort-text">
                                <input type="radio" id="oldest-newest" name="sortBy" value="Oldest to Newest" checked>
                                <label for="oldest-newest">Oldest to Newest</label><br>
                                <input type="radio" id="newest-oldest" name="sortBy" value="Newest to Oldest" >
                                <label for="newest-oldest">Newest to Oldest</label><br>
                            </div>

                            <div style="height: 20px;"></div>

                            <h1>Filter</h1>
                            <ul  style="list-style: none">
                                <li><input id="changes-edit" name="filterAudit" value="edited" type="checkbox" /><label for="changes-edit">Edit Changes</label></li>
                                <li><input id="changes-delete" name="filterAudit" value="deleted" type="checkbox" /><label for="changes-delete">Delete Changes</label></li>
                                <li><input id="actions-login" name="filterAudit" value="logged in."  type="checkbox"  /><label for="actions-login">Login Actions</label></li>
                                <li><input id="actions-logout" name="filterAudit" value="logged out." type="checkbox" /><label for="actions-logout">Logout Actions</label></li>
                            </ul>

                            <button name="sortSubmit" type="submit" value="Apply" class="popup-button" id="popup-button1">Apply</button><br>
                            <button name="sortSubmit" type="submit" value="Clear" class="popup-button" id="popup-button2">Clear Changes</button>
                        </form>
                    </div>
                </div>
            </div>

            <div id="AuditLog" class="audit-table-content">
                <%
                    try {
                        String sortQuery = (String) session.getAttribute("sortAuditQuery");
                        if (sortQuery == null) {
                            sortQuery = " ";
                        }

                        String filterQuery = (String) session.getAttribute("filterAuditQuery");
                        if (filterQuery == null) {
                            filterQuery = " ";
                        }

                        Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                        String sql = "SELECT auditID, timestamp, username, name, changes  FROM `audit-log` " + filterQuery + sortQuery;
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next() == false) {
                            out.println("No Records in the table");
                        } else {%>

                <table >
                    <tr><th>Timestamp</th><th>Username</th><th>Name</th><th>Changes</th></tr>
                            <%
                                do {%>

                    <tr><td><%= rs.getString(2)%></td><td  style="width:20%"><%= rs.getString(3)%></td><td style="width:20%"><%= rs.getString(4)%></td><td style="width:60%"><%= rs.getString(5)%></td>
                    </tr>

                    <%} while (rs.next());
                            }

                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                            e.getStackTrace();
                        }
                    %>
                </table>
                <input type="hidden" value="${sortAuditQuery}" id="sortAudit">
                <input type="hidden" value="${filterAuditQuery}" id="filterAudit">
            </div>

        </div>
    </body>
</html>

<script>
    function openForm() {
        document.getElementById("myForm1").style.display = "block";
        checkSortFilter();
    }

    function closeForm() {
        document.getElementById("myForm1").style.display = "none";
    }
</script>


<script>
    function checkSortFilter() {

        var sortCheck = document.getElementById('sortAudit').value;
        var filterCheck = document.getElementById('filterAudit').value;

        const oton = document.getElementById("oldest-newest");
        const ntoo = document.getElementById("newest-oldest");
        const edit = document.getElementById("changes-edit");
        const del = document.getElementById("changes-delete");
        const login = document.getElementById("action-login");
        const logout = document.getElementById("action-logout");

        console.log(sortCheck);
        console.log(filterCheck);

        if (sortCheck.includes("ASC")) {
            oton.checked = true;
        } else if (sortCheck.includes("DESC")) {
            ntoo.checked = true;
        }
        if (filterCheck.includes("edited")) {
            edit.checked = true;
        } else {
            edit.checked = false;
        }
        if (filterCheck.includes("del")) {
            del.checked = true;
        } else {
            del.checked = false;
        }
        if (filterCheck.includes("login")) {
            login.checked = true;
        } else {
            login.checked = false;
        }
        if (filterCheck.includes("logout")) {
            logout.checked = true;
        } else {
            logout.checked = false;
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
