<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=500, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="SK_Logo.png" />
        <link href="/SKIT-YIMS/Extra/ExtraCSS/InvalidSession.css" rel="stylesheet">
        <title>Invalid Session</title>
    </head>
    <%
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("loggedIn") != null) {
            response.sendRedirect("/SKIT-YIMS/Account/AccountInformation.jsp");
        }
    %>
    <body>
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="/SKIT-YIMS/img/SK_Logo.png" class="header-logo">

            <div class="logo"><a id="SK-Text-NavBar">Sangguniang Kabataan Ibayo-Tipas</a></div>

            <ul class="links">
                <li class="Home"><a href="/SKIT-YIMS/Welcome.jsp">Home</a></li>
                <li class="Login"><a href="/SKIT-YIMS/Account/Login.jsp" id="Login">Login</a></li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>

        <div class="err-main">
            <p class="err-class">Invalid Session <p>
            <p class="err-message">Session timed out. <br> Log in to your account again.</p>
            <p><a href="/SKIT-YIMS/Welcome.jsp" class="err-red">Go to Home Page</a></p>
        </div>

    </body>
</html>