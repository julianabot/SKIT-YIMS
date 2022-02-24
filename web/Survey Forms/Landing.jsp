<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="skLogo" type="image/png" href="img/SK_Logo.png" />-->
        <link href="../Survey Forms/SurveyCSS/Landing.css" rel="stylesheet" type="text/css">
        <title>Landing Page</title>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
                <li class="Login"><a href="../Account/Login.jsp" id="Login">Log In</a></li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>
            
        <img src="../img/SK_Logo.png" alt="SK Logo" id="Logo">
        <div class="heading">
            <h1>Welcome to the SK Ibayo-Tipas Youth Resident Survey</h1>
        </div>
        <div class="subheading">
            <p>The responses from the Youth Residents of Ibayo-Tipas are collected and processed with the utmost confidentiality according to the Data Privacy Act of 2012. The data collected will be used to monitor youth resident categories in order to help the SK Council organize and plan events. The data from Youth Residents that exceed the 30-year-old mark will be archived and passed on to the respective Ibayo-Tipas' official database.</p>
        </div>
                    <center> 
                        <div class="g-recaptcha"
                             data-sitekey="6LcPvNsaAAAAAB_JssCHLi_bMPU1g9jVrBtaAtpi">
                        </div>

                        <!--
                        <input class="submitbtn" type="Submit" name="Login" value="Log In">
                        <p><% out.print(getServletContext().getInitParameter("footer"));%></p>
                        -->
                    </center>
        <div class="button-container">
            <button type="button" class="start-button">Start Survey</button>
        </div>
        <div class="terms">
            <p>Upon starting the survey, you agree to the terms and conditions stated above</p>
        </div>
    </body>
</html>
