<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=500, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="/SKIT-YIMS/img/SK_Logo.png" />
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

        <section class="Footer-Container">
            <div class="Flex-Footer-Content" id="Contact-Us">
                <p class="label">CONTACT US</p>
                <p class="f-content">Phone: (02) 8642 2462 | (02) 8880 2766</p>
                <p class="f-content">Mobile: 0939 773 3342 | 0976 050 2672</p>
                <p class="f-content"><br> <br>700 Dr. A. Natividad st., Ibayo-Tipas, Taguig City, M.M.</p>
            </div>
            <div class="Flex-Footer-Content" id="Links">
                <p class="label" id="links-label">LINKS</p>
                <a href="#About-Section"class="f-content">About</a>
                <a href="#Hero-Section"class="f-content">Home</a>
                <a href="https://www.facebook.com/skibayotipas" target="_blank" class="f-content">Facebook </a>  
                <a href="/SKIT-YIMS/Survey Forms/Landing.jsp" class="f-content">Survey</a>
            </div>
            <div class="Flex-Footer-Content" id="Email-Us">
                <p class="label">EMAIL US</p>
                <p class="f-content">For feedback and suggestions, feel free to reach out to us using the e-mail below.</p>
                <a class="f-content" id="mock-email-button" href="mailto:ibayotipas.skcouncil@gmail.com">Send Email</a>
            </div>
        </section>

        <!--Footer text from webxml-->
        <footer class="Footer-Actual"><a id="SK-Text-NavBar">&copy; Sangguniang Kabataan Ibayo-Tipas </a></footer>
    </body>
</html>