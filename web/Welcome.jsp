<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="skLogo" type="image/png" href="img/SK_Logo.png" />
        <link href="css/Welcome.css" rel="stylesheet" type="text/css">
        <!--INSERT SESSION MANAGEMENT LINE-->
        <title>SKIT-YIMS</title>
    </head>

    <body>
        <!--Header-->
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="img/SK_Logo.png" class="header-logo">

            <!--This section contains the "Eruditio Academy" text taken from the webxml-->
            <div class="logo"><%out.print(getServletContext().getInitParameter("header"));%></div>

            <ul class="links">
                <li class="About"><a href="#about-us">About</a></li>
                <li class="Events"><a href="#events">Events</a></li>
                <li class="Login"><a href="Login.jsp" id="Login">Login</a></li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>

        <!--Hero Section-->
        <section id="Hero-Section" class="Hero-Section">
            <p class="heading">Title</p>
            <p class ="subheading">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <!-- redirect to About tab -->
            <p class="button"><a href="Landing.jsp" target="_blank">Fill out Forms</a></p>
        </section>

        <!--Events Section-->
        <!-- Container for the image gallery -->
        <div class="container">
            <!-- Full-width images with number text -->
            <div class="mySlides">
                <img src="https://i.imgur.com/W17sxjX.jpg" style="width:30%" id="imgEvent">
            </div>

            <div class="mySlides">
                <img src="https://i.imgur.com/FbHGGSg.jpgg" style="width:30%" id="imgEvent">
            </div>

            <div class="mySlides">
                <img src="https://i.imgur.com/4Bq9xP0.png" style="width:30%" id="imgEvent">
            </div>

            <div class="mySlides">
                <img src="https://i.imgur.com/GMcEULG.png" style="width:30%" id="imgEvent">
            </div>

            <div class="mySlides">
                <img src="https://i.imgur.com/jfEkrEP.jpg" style="width:30%" id="imgEvent">
            </div>

            <div class="mySlides">
                <img src="https://i.imgur.com/QoWp0qP.png" style="width:30%" id="imgEvent">
            </div>

            <!-- Next and previous buttons -->
            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>


            <!-- Image text -->
            <!--<div class="caption-container">
                <p id="caption"></p>
            </div>-->

            <!-- Thumbnail images -->
            <div class="row">
                <div class="column">
                    <img class="demo cursor" src="https://i.imgur.com/W17sxjX.jpg" style="width:100%" onclick="currentSlide(1)">
                </div>
                <div class="column">
                    <img class="demo cursor" src="https://i.imgur.com/FbHGGSg.jpg" style="width:100%" onclick="currentSlide(2)">
                </div>
                <div class="column">
                    <img class="demo cursor" src="https://i.imgur.com/4Bq9xP0.png" style="width:100%" onclick="currentSlide(3)">
                </div>
                <div class="column">
                    <img class="demo cursor" src="https://i.imgur.com/GMcEULG.png" style="width:100%" onclick="currentSlide(4)">
                </div>
                <div class="column">
                    <img class="demo cursor" src="https://i.imgur.com/jfEkrEP.jpg" style="width:100%" onclick="currentSlide(5)">
                </div>
                <div class="column">
                    <img class="demo cursor" src="https://i.imgur.com/QoWp0qP.png" style="width:100%" onclick="currentSlide(6)">
                </div>
            </div>
            <script>
                var slideIndex = 1;
                showSlides(slideIndex);

                function plusSlides(n) {
                    showSlides(slideIndex += n);
                }

                function currentSlide(n) {
                    showSlides(slideIndex = n);
                }

                function showSlides(n) {
                    var i;
                    var slides = document.getElementsByClassName("mySlides");
                    var dots = document.getElementsByClassName("demo");

                    if (n > slides.length) {
                        slideIndex = 1;
                    }
                    if (n < 1) {
                        slideIndex = slides.length;
                    }
                    for (i = 0; i < slides.length; i++) {
                        slides[i].style.display = "none";
                    }
                    for (i = 0; i < dots.length; i++) {
                        dots[i].className = dots[i].className.replace(" active", "");
                    }
                    slides[slideIndex - 1].style.display = "block";
                    dots[slideIndex - 1].className += " active";

                }
            </script>
        </div>

        <!--About US-->
        <div class="about-row">
            <div class="about-column-left">
                <h1 class="heading">About Us</h1>

                <p class="sub-heading">
                    “We develop the four human dimensions in children and youth: body, mind, heart and spirit.”
                </p> 
            </div>
            <br>
            <div class ="about-column-right">
                <p class="sub-info"> Eruditio Academy is an education service
                    institution that offers online and offline
                    learning and development programs for
                    preschool to high school. 
                </p>
                <br>
                <p class="sub-info">
                    Eruditio subscribes to the whole child
                    deveopment approach. We develop the four human dimensions in children and
                    youth: body, mind, heart and spirit.
                </p>
                <br>
                <p class="sub-info">
                    Moreover, we give equal emphasis to parent education and empowerment
                    thru parenting seminars, workshops and
                    access to learning and development
                    materials.
                </p>
            </div>

        </div>
        <div class="lower-row">
            <div class="lower-column-left">
                <p class="heading">Our Experience</p>
                <p class = "sub-heading">1. We have over 12 years cumulative experience in education services.</p>
                <p class = "sub-heading">2. We have successfully delivered online learning programs to over 200 students.</p>
                <p class = "sub-heading">3. We have been supporting several homeschooling families during this pandemic.</p>
            </div>
            <div class="lower-column-right">
                <p class="heading">Our Approach</p>
                <p class = "sub-heading">Eruditio subscribes to the Whole Child 
                    Development approach. We believe in the development of the 
                    four human dimensions in children: </p>
            </div>
        </div>

        <!--Organizational Chart-->
        <div class="Organizational-Chart">
            <p class="Organizational-Chart-Header">Know our SK-Ibayo Tipas Council Members</p>
            <p class="Organizational-Chart-Subheading">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt</p>
            <img src="img/SK_Organizational_Chart.png" class="Organizational-Chart-Image">
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
