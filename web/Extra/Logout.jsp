<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=500, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="SK_Logo.png" />
        <link href="Extra/ExtraCSS/Logout.css" rel="stylesheet">
        <title>Invalid Session</title>
    </head>

    <body>
       <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="img/SK_Logo.png" class="header-logo">
            
            <!--This section contains the "Eruditio Academy" text taken from the webxml-->
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

        <div class="err-main">
            <p class="err-message">Log out Successful!</p> 
            <p class="err-red">Redirect to <a class="home-red" href="Welcome.jsp">Home</a></p>
        </div>
        
    </body>
</html>