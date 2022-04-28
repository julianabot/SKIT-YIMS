<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=500, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/SK_Logo.png" /> 
        <link href="${pageContext.request.contextPath}/Account/AccountCSS/Login.css?v={random number/string}" rel="stylesheet">
        <title>Login</title>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <%
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("loggedIn") != null) {
            response.sendRedirect(request.getContextPath() + "/Account/AccountInformation.jsp");
        }
    %>
    <body>
        <div class="half-white">
            <center><img src="${pageContext.request.contextPath}/img/SK_Logo.png" class="img-logo-half"></center>
            <div class="goback"> <a class="purp-btn" href="${pageContext.request.contextPath}/Welcome.jsp">Go back</a> </div>
            <div class="signup-form">
                <h1 class="Sign"> Log in </h1>
                <center> <p class ="Error" style="color: red ">${errorLogin}</p></center>
                <form action="../LoginServlet" method="POST">

                    <input class="unp" type="text" name="uname" placeholder="Username" maxlength="16" required><br>

                    <div class="password-container">
                        <input class="unp" id="loginPassword" type="password" name="password" placeholder="Password"  minlength="8" required ><i class="fa fa-eye" id="togglePassword"></i><br>
                        <script src="../js/toggle.js"></script>
                        <a href="ForgotPassword.jsp" class="forgot-pw">Forgot Password?</a>
                    </div>
                    <br>
                    <center> 
                        <div class="g-recaptcha"
                             data-sitekey="6LcPvNsaAAAAAB_JssCHLi_bMPU1g9jVrBtaAtpi">
                        </div>
                        <input class="submitbtn" type="Submit" name="Login" value="Log In">
                        <p class="footer-name">© Sangguniang Kabataan Ibayo-Tipas 2022. <br> All rights reserved.</p>
                    </center>

                </form>
            </div>
        </div>
        <div class="half-blue">
            <center><img src="${pageContext.request.contextPath}/img/SK_Logo.png" class="img-logo"></center>
        </div>        
    </body>
</html>