<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="img/SK_Logo.png"/>
        <link href="../Account/AccountCSS/AccountInformation.css" rel="stylesheet" type="text/css">
        <link href="Account/AccountCSS/AccountInformation.css" rel="stylesheet" type="text/css">
        <title>Profile Account</title>
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
            <div class="logo"><%out.print(getServletContext().getInitParameter("header"));%></div>

            <ul class="links">
                <li class="About"><a href="/SKIT-YIMS/Welcome.jsp">Home</a></li>
                <li class="Events"><a href="/SKIT-YIMS/Account/ViewDatabase.jsp">Database</a></li>
                <!--Account Tab TBR-->
                <li class="Events"><a href="/SKIT-YIMS/Account/AccountInformation.jsp">Account</a></li>
                <li class="Login">
                    <form action = "../LogoutServlet" method = "GET">
                        <button type="submit">Logout</button>
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
                    <input type="button" value="Edit" class="edit" onclick="window.location = '/SKIT-YIMS/Account/EditProfile.jsp'">
                </div>

                <div class="underline">
                    <p class="displayed-info-pass">Password:</p>
                    <input type="button" value="Edit" class="edit" minlength="8" onclick="window.location = '/SKIT-YIMS/Account/EditProfile.jsp'"></button>
                </div>

                <div class="underline">
                    <p class="displayed-info">${update}</p>
                </div>
            </div>
        </div>
    </body>
</html>