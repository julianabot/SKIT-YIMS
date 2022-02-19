<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=500, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="SK_Logo.png" /> 
        <link href="../Account/AccountCSS/Login.css" rel="stylesheet">
        <title>Login</title>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <%
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("uRole") != null) {
            response.sendRedirect("Success.jsp");
        }
    %>
    <body>
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="../img/SK_Logo.png" class="header-logo">

            <div class="logo"><%out.print(getServletContext().getInitParameter("header"));%></div>

            <ul class="links">
                <li class="Home"><a href="Welcome.jsp">Home</a></li>
                <li class="Login"><a href="Login.jsp" id="Login">Login</a></li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>

        <div class="half-white">
            <div class="goback"> <a class="purp-btn" href="HomeForNonUsers.jsp">Go back</a> </div>

            <div class="signup-form">
                <h1 class="Sign"> Log in </h1>
                <center> <p class ="Error" style="color: #B6922E">${errorLogin}</p></center>
                <form action="../LoginServlet" method="POST">

                    <input class="unp" type="text" name="uname" placeholder="Username" maxlength="16" required><br>
                    <input class="unp" type="password" name="password" placeholder="Password"  minlength="8" required ><br>
                    <br>
                    <center> 
                        <div class="g-recaptcha"
                            data-sitekey="6LcPvNsaAAAAAB_JssCHLi_bMPU1g9jVrBtaAtpi">
                        </div>
                        <input class="submitbtn" type="Submit" name="Login" value="Log In">
                        <p class="footer-name"><% out.print(getServletContext().getInitParameter("footer"));%></p>
                    </center>
                </form>
            </div>
        </div>
        <div class="half-blue">
            <center><img src="../img/SK_Logo.png" class="img-logo"></center>
        </div>        
    </body>
</html>