<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="/SKIT-YIMS/img/SK_Logo.png"/>
        <link href="../Account/AccountCSS/AccountInformation.css?v={random number/string}" rel="stylesheet" type="text/css">
        <link href="/SKIT-YIMS/Account/AccountCSS/AccountInformation.css" rel="stylesheet" type="text/css">
        <title>Account Profile</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
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
            <div class="logo"><a id="SK-Text-NavBar">Sangguniang Kabataan Ibayo-Tipas</a></div>

            <ul class="links" style="width: 30%;">
                <li class="Events"><a href="/SKIT-YIMS/Account/ViewDatabase.jsp">Database</a></li>
                <!--Account Tab TBR-->
                <li class="Events"><a href="/SKIT-YIMS/Account/AccountInformation.jsp">Account</a></li>
                <li class="Login">
                    <form action = "../LogoutServlet" method = "GET">
                        <input type="hidden" name="SKusername" value="${username}"/>
                        <input type="hidden" name="SKname" value="${name}"/>
                        <button class="logout-btn" type="submit">Log Out</button>
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
                    <input type="button" value="Edit" class="edit" id ="editName" onclick="changeName()">
                    <!--                        "window.location = '/SKIT-YIMS/Account/EditProfile.jsp'"-->
                </div>

                <div class="showEdit" id="changeName" style="display: none;">
<!--                <p>${update} ${errorEdit}</p>-->
                    <form action = "../EditNameServlet" method = "POST">
                        <div>
                            <p class="displayed-info-name">Change your name here:</p>
                            <input type="Submit" name="savechanges" value="Save" class="saveEdit">
                        </div>
                        <input type="hidden" name="username" value ="${username}" class="input">
                        <input type="text" name="editname" placeholder="Enter New Name" required class="input-change"><br>

                        <input type="hidden" name="SKname" value="${name}"/>

                    </form>
                </div>    



                <div class="underline">
                    <p class="displayed-info-pass">Password:</p>
                    <input type="button" value="Edit" class="edit" id ="editPass" minlength="8" onclick="changePassword()">
                </div>

                <div class="showEdit" id="changePassword" style="display: none;">    
<!--                    <p> ${update}</p>-->
                    <form action = "../PasswordServlet" method = "POST">
                        <div>
                            <p class="displayed-info-pass">Change your password here:</p>                 
                            <input type="Submit" value="Save" name="savechanges" class="saveEdit" minlength="8" onload="showAlert()">
                        </div>
                        <input type="hidden" name="username" value ="${username}" class="input">

                        <div>
                            <input type="password" id="loginPassword" name="currpass" placeholder="Enter Current Password"  minlength="8" required class="input-change"><i class="fa fa-eye" id="togglePassword"></i><br>
                        </div>

                        <div>
                            <input type="password" id="password-2" name="newpass" placeholder="Enter New Password"  minlength="8" required required class="input-change"><i class="fa fa-eye" id="togglePassword-2"></i><br>
                        </div>

                        <div>
                            <input type="password" id="password-3" name="confpass" placeholder="Enter Confirm New Password"  minlength="8" required required class="input-change"><i class="fa fa-eye" id="togglePassword-3"></i><br>
                        </div>

                        <input type="hidden" name="SKname" value="${name}"/>

                        <script src="../js/toggle.js"></script>
                        <script src="../js/toggleNewPass.js"></script>
                        <script src="../js/toggleConfirmPwd.js"></script>
                    </form>
                    <div>

                    </div>

                    <!--                <div>
                                        <input type="button" value="Change Name or Password" class="edit" onclick="window.location = '/SKIT-YIMS/Account/EditProfile.jsp'">
                                    </div>-->
                </div>

                <p id="alertmsg" class="displayed-message" style="display: block;
                   color: red;
                   font-weight: 900;
                   ">
                    ${update}
                </p>



                <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

                <script>
                                function changeName() {
                                    var x = document.getElementById("changeName");
                                    var y = document.getElementById("changePassword");
                                    if (x.style.display === "none") {
                                        x.style.display = "block";
                                        y.style.display = "none";
                                        document.getElementById("editName").value = "Cancel";
                                        document.getElementById("editPass").value = "Edit";
                                    } else {
                                        x.style.display = "none";
                                        document.getElementById("editName").value = "Edit";
                                    }

                                }

                                function changePassword() {
                                    var x = document.getElementById("changePassword");
                                    var y = document.getElementById("changeName");
                                    var z = document.getElementById("alertmsg");
                                    if (x.style.display === "none") {
                                        x.style.display = "block";
                                        y.style.display = "none";
                                        document.getElementById("editPass").value = "Cancel";
                                        document.getElementById("editName").value = "Edit";
                                        z.style.display = "none";

                                    } else {
                                        x.style.display = "none";
                                        document.getElementById("editPass").value = "Edit";
                                    }
                                    if (x.value === "Edit")
                                        x.value = "Cancel";
                                    else
                                        elem.value = "Edit";
                                }

                </script>
                </body>
                </html>