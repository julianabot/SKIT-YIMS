<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/SK_Logo.png" />
        <link href="${pageContext.request.contextPath}/Survey Forms/SurveyCSS/Landing.css" rel="stylesheet" type="text/css">
        <title>Landing Page</title>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>
        .captcha label {
            display:block;
            font-size:1.1em;
/*            color:#111;*/
            margin-bottom:5px;
        }
        .captcha {
            margin:15px 0px;
            align-content: center;
        }
        .captcha .preview {
            color:#555;
            width:460px;
            text-align:center;
            height:40px;
            line-height:40px;
            letter-spacing:8px;
            border:1px dashed #888;
            font-family:"monospace";
        }
        .captcha .preview span {
            display:inline-block;
            /*user-select:none;*/
            font-size:1.1em;
        }
        .captcha .captcha-form {
            display:flex;
            width: 100%;
            align-content: center;
            font-size:1.1em;

        }
        .captcha .captcha-form input {
            width:400px;
            padding:8px;
            border:1px solid #888;
            font-size:1.1em;
            
        }
        .input-captcha-container{
            margin-right: auto;
            margin-left: auto;
        }
        .captcha .captcha-form .captcha-refresh {
            width:40px;
            height: 35px;
            border:none;
            outline:none;
            background:#8B3535;
            color:#eee;
            cursor:pointer;
        }
    </style>

    <body>
        <!--Header-->
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="${pageContext.request.contextPath}/img/SK_Logo.png" class="header-logo">

            <!--This section contains the "Eruditio Academy" text taken from the webxml-->
            <div class="logo"><a id="SK-Text-NavBar">Sangguniang Kabataan Ibayo-Tipas</a></div>

            <ul class="links">
                <li class="Home"><a href="${pageContext.request.contextPath}/Welcome.jsp">Home</a></li>
                <li class="Login"><a href="${pageContext.request.contextPath}/Account/Login.jsp" id="Login">Login</a></li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>

        <img src="${pageContext.request.contextPath}/img/SK_Logo.png" alt="SK Logo" id="Logo">
        <div class="heading">
            <h1>Welcome to the SK Ibayo-Tipas Youth Resident Survey</h1>
        </div>
        <div class="subheading">
            <p>The responses from the Youth Residents of Ibayo-Tipas are collected and processed with the utmost confidentiality according to the Data Privacy Act of 2012. The data collected will be used to monitor youth resident categories in order to help the SK Council organize and plan events. The data from Youth Residents that exceed the 30-year-old mark will be archived and passed on to the respective Ibayo-Tipas' official database.</p>
        </div>
        <form action="../LandingServlet" method="POST">
            <center> 
                <div class="captcha">
                    <label for="captcha-input">Enter Captcha</label>
                    <div class="preview" name="preview"></div>
                    <input type="hidden" name="captcha-generated" id="captcha-generated"/>
                    <div class="captcha-form">
                        <div class="input-captcha-container">
                        <input type="text" id="captcha-form" name="captcha-input" placeholder="Enter captcha text">
                        <button class="captcha-refresh">
                            <i class="fa fa-refresh"></i>
                        </button>
                        </div>
                    </div>
                    <script src="../js/CaptchaGenerator.js"></script>
                </div>
                <center> <p class ="Error" style="color: #712929 ">${errorCaptcha}</p></center>
                <!--
                <input class="submitbtn" type="Submit" name="Login" value="Log In">
                <p><% out.print(getServletContext().getInitParameter("footer"));%></p>
                -->
            </center>
            <div class="button-container">
                <button type="submit" class="submitbtn">Start Survey</button>
            </div>
        </form>
        <div class="terms">
            <p>Upon starting the survey, you agree to the terms and conditions stated above</p>
        </div>
    </body>
</html>