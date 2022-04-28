<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/SK_Logo.png" />
        <link href="${pageContext.request.contextPath}/Survey Forms/SurveyCSS/Success.css?v={random number/string}" rel="stylesheet" type="text/css">
        <title>Success</title>
    </head>
    <body>
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

        <div class="container">
            <img src="${pageContext.request.contextPath}/img/SK_Logo.png" alt="SK Logo" id="Logo">
            <div class="heading">
                <h1>Your response is submitted.</h1>
                <p class="subheading">
                    Thank you for answering SK Ibayo-Tipas Youth Resident Survey. <br>
                    Thank you for trusting us, we assure you that the information you’ve submitted is safe with us.
                    <br><br>
                    Keep safe, Ka-barangay!
                </p>
                <h3 class="bottom-text">You may exit or close this tab or you may go to the <a href="${pageContext.request.contextPath}/Welcome.jsp" id="redirect-home">Home Page</a>.</h3> <!--Link to Welcome Page-->
            </div>
        </div>

    </body>
</html>
