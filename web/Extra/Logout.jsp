<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=500, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="SK_Logo.png" />
        <link href="Extra/ExtraCSS/Logout.css" rel="stylesheet">
        <title>Log out Successful</title>
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
            <p class="err-class">Log-out Successful <p>
            <p><a href="Survey Forms/Welcome.jsp" class="err-red">Go to Home Page</a></p>
        </div>
            
        <!--Footer-->
        <section class="Footer-Container">
            <div class="Flex-Footer-Content" id="Contact-Us">
                <p class="label">CONTACT US</p>
                <p class="f-content">Phone: (02) 7213 7246 | (02) 8478 5165 </p>
                <p class="f-content">Mobile: 0906 058 5888 | 0921 766 8148 |0917 322 0507</p>
                <p class="f-content"><br> <br>47 Kalayaan Avenue, Diliman, Quezon City 1101 Philippines</p>
            </div>
            <div class="Flex-Footer-Content" id="Links">
                <p class="label">LINKS</p>
                <a href="HomeForNonUsers.jsp" class="f-content">Home <br> </a>
                <a href="#About-Us" class="f-content">About <br> </a>
                <a href="UserTerms.jsp" class="f-content">Events</a>
            </div>
            <div class="Flex-Footer-Content" id="Email-Us">
                <p class="label">EMAIL US</p>
                <p class="f-content">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt</p>
                <p class="f-content" id="mock-email-button">Send Email</p>
            </div>
        </section>

        <!--Footer text from webxml-->
        <footer class="Footer-Actual"><%out.print(getServletContext().getInitParameter("footer"));%></footer>
        
    </body>
</html>