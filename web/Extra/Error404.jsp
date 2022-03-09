<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=500, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="SK_Logo.png" />
        <link href="ExtraCSS/Error404.css" rel="stylesheet">
        <title>Error 404</title>
    </head>

    <body>
       <!--Header-->
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="../img/SK_Logo.png" class="header-logo">

            <!--This section contains the "Eruditio Academy" text taken from the webxml-->
            <div class="logo"><a id="SK-Text-NavBar">Sangguniang Kabataan Ibayo-Tipas</a></div>

            <ul class="links">
                <li class="Home"><a href="../Welcome.jsp">Home</a></li>
                <li class="Login"><a href="Account/Login.jsp" id="Login">Login</a></li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>

        <div class="err-main">
            <p class="err-class">Error 404 <p>
            <p class="err-message">This page does not exist.</p> 
            <p><a href="Survey Forms/Welcome.jsp" class="err-red">Go to Home Page</a></p>
        </div>
            
        
        
    </body>
</html>