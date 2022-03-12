<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="img/SK_Logo.png"/>
        <link href="../Account/AccountCSS/AccountInformation.css" rel="stylesheet" type="text/css">
        <link href="/SKIT-YIMS/Account/AccountCSS/AccountInformation.css" rel="stylesheet" type="text/css">
        <title>Account Profile</title>
    </head>
    <%
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("loggedIn") == null) {
            response.sendRedirect("/SKIT-YIMS/Extra/InvalidSession.jsp");
        }
    %>
    <body>
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="/SKIT-YIMS/img/SK_Logo.png" class="header-logo">

            <!--This section contains the "Eruditio Academy" text taken from the webxml-->
            <div class="logo">Sangguniang Kabataan Ibayo-Tipas</div>

            <ul class="links">
                <li class="About"><a href="/SKIT-YIMS/Welcome.jsp">Home</a></li>
                <li class="Events"><a href="/SKIT-YIMS/Account/ViewDatabase.jsp">Database</a></li>
                <!--Account Tab TBR-->
                <li class="Events"><a href="/SKIT-YIMS/Account/AccountInformation.jsp">Account</a></li>
                <li class="Login">
                    <form action = "../LogoutServlet" method = "GET">
                        <button class="logout-btn" type="submit">Logout</button>
                    </form>
                </li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>

        <div class="container">

            <div class="second-half">
                <h1 class="personal-info">Personal Information</h1>
                <h3 class="role-info">${role}</h3>

                <div class="underline">
                    <p class="displayed-info">Position:&emsp;${role}</p>
                </div>

                <div class="underline">
                    <p class="displayed-info">Username:&emsp;${username}</p>
                </div>


                <div class="underline">
                    <p class="displayed-info-name">Name:&emsp;${name}</p>
                    <input type="button" value="Edit" class="edit" onclick="changeName()">
                    <!--                        "window.location = '/SKIT-YIMS/Account/EditProfile.jsp'"-->
                </div>

                <div class="showEdit" id="changeName">
<!--                <p> ${update} ${errorEdit}</p>-->
                    <form action = "../EditNameServlet" method = "POST">
                        <div>
                            <p class="displayed-info-name">Change your name here:</p>
                            <input type="Submit" name="savechanges" value="Save" class="saveEdit">
                        </div>
                        <input type="hidden" name="username" value ="${username}" class="input">
                        <input type="text" name="editname" placeholder="Enter New Name" required class="input-change"><br>
                    </form>
                        <div>
                        <p class="displayed-message">${update}${errorEdit}</p>
                    </div>
                </div>    



                <div class="underline">
                    <p class="displayed-info-pass">Password:</p>
                    <input type="button" value="Edit" class="edit" minlength="8" onclick="changePassword()">
                </div>

                <div class="showEdit" id="changePassword">    
<!--                    <p> ${update}</p>-->
                    <form action = "../PasswordServlet" method = "POST">
                        <div>
                            <p class="displayed-info-pass">Change your password here:</p>                 
                            <input type="Submit" value="Save" name="savechanges" class="saveEdit" minlength="8">
                        </div>
                        <input type="hidden" name="username" value ="${username}" class="input">
                        <input type="password" name="currpass" placeholder="Enter Current Password"  minlength="8" required class="input-change"><br>
                        <input type="password" name="newpass" placeholder="Enter New Password"  minlength="8" required required class="input-change"><br>
                        <input type="password" name="confpass" placeholder="Enter Confirm New Password"  minlength="8" required required class="input-change"><br>
                    </form>
                    <div>
                        <p class="displayed-message">${update1}</p>
                    </div>

                    <!--                <div>
                                        <input type="button" value="Change Name or Password" class="edit" onclick="window.location = '/SKIT-YIMS/Account/EditProfile.jsp'">
                                    </div>-->
                </div>
            </div>

            <script>
                function changeName() {
                    var x = document.getElementById("changeName");
                    var y = document.getElementById("changePassword");
                    if (x.style.display === "none") {
                        x.style.display = "block";
                        y.style.display  = "none";
                        x.input.value = 'Cancel';
                    } else {
                        x.style.display = "none";
                    }
                    
                   
                }

                function changePassword() {
                    var x = document.getElementById("changePassword");
                    var y = document.getElementById("changeName");
                    if (x.style.display === "none") {
                        x.style.display = "block";
                        y.style.display  = "none";
                        x.input.value = 'Cancel';
                    } else {
                        x.style.display = "none";
                        x.value = 'Edit';
                    }
 
                }

            </script>
    </body>
</html>