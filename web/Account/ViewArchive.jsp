<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="AccountCSS/ViewArchive.css" rel="stylesheet" type="text/css">
        <title>View Database</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {font-family: Arial;}

            /* Style the tab */
            .tab {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #f1f1f1;
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
                font-size: 17px;
            }

            /* Change background color of buttons on hover */
            .tab button:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            .tab button.active {
                background-color: #ccc;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border: 1px solid #ccc;
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
    <body>
        <!--HEADER-->
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="../img/SK_Logo.png" class="header-logo">

            <!--This section contains the "Eruditio Academy" text taken from the webxml-->
            <div class="logo"><a id="SK-Text-NavBar">Sangguniang Kabataan Ibayo-Tipas</a></div>

            <ul class="links">
                <li class="About"><a href="../Welcome.jsp">Home</a></li>
                <li class="Events"><a href="#events">Database</a></li>
                <li class="Events"><a href="#events">Account</a></li>
                <li class="Login"><a href="Login.jsp" id="Login">Log Out</a></li>
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
                    <input type="text" placeholder="Search for a resident">
                    <button class="search-button"><i class="fas fa-search"></i>&nbsp; Search</button>
                </div>
                <div class="horizontal-spacer"></div>
            </div>

            <div class="database-title-container">
                <div class="database-title">Archive of SK Ibayo-Tipas Youth Residents Database</div>
                <div class="sort-filter">
                    <button type="button"><i class='fas fa-sort'></i>&nbsp;&nbsp;Sort</button> 
                    <button type="button"><i class='fas fa-filter'></i>&nbsp;&nbsp;Filter</button> 
                </div>
            </div>

            <div class="tab">
                <button class="tablinks" onclick="showTab(event, 'All')" id="defaultOpen">All</button>
                <button class="tablinks" onclick="showTab(event, 'Information')">Basic Information</button>
                <button class="tablinks" onclick="showTab(event, 'Details')">Details</button>
                <button class="tablinks" onclick="showTab(event, 'Contact')">Contact</button>
                <button class="tablinks" onclick="showTab(event, 'Family')">Family</button>
                <button class="tablinks" onclick="showTab(event, 'Survey')">Survey</button>
                <button class="tablinks" onclick="showTab(event, 'Vaccination')">Vaccination Details</button>
                <button style="display:none;" class="tablinks" onclick="showTab(event, 'Vaccination')">Vaccination</button>
            </div>
            <div >
                <button type="button" class="generate-button">Generate Report</button> 
            </div>
        </div>
    </body>
</html>