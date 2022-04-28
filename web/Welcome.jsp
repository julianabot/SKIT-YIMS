<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="/SKIT-YIMS/img/SK_Logo.png" />
        <link href="/SKIT-YIMS/css/Welcome.css" rel="stylesheet" type="text/css">
        <!--INSERT SESSION MANAGEMENT LINE-->
        <title>SKIT-YIMS</title>
    </head>

    <body>
        <!--Header-->
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="img/SK_Logo.png" class="header-logo">

            <!--This section contains the "Eruditio Academy" text taken from the webxml-->
            <div class="logo"><a id="SK-Text-NavBar">Sangguniang Kabataan Ibayo-Tipas</a></div>

            <ul class="links">
                <li class="Events"><a href="Survey Forms/Landing.jsp">Survey</a></li>
                <li class="Events"><a href="#Events-Section-Header">Events</a></li>
                <li class="About"><a href="#About-Section">About</a></li>
                <li class="Login"><a href="Account/Login.jsp" id="Login">Login</a></li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>

        <!--Hero Section-->
        <section id="Hero-Section" class="Hero-Section">
            <p class="heading">SK Ibayo Tipas Youth Information Management System</p>
            <p class ="subheading">We, the SK council, greatly appreciates your commitment in supporting the previous and upcoming projects of Sangguniang Kabataan Ibayo-Tipas amidst this covid-19 pandemic.
                <br><br>
                &emsp;&emsp;With that being said, we encourage you to answer a 10-minute survey questions with regards to your thoughts, ideas and suggestions to our upcoming events that will help us address the problems of the youths in our community.
                <br><br>
                &emsp;&emsp;You may access the survey form through the button below and please take note that you need to upload your ID Card that indicates your complete address.</p>
            <!-- redirect to About tab -->
            <p class="button"><a href="Survey Forms/Landing.jsp" target="_blank">Fill out Forms</a></p>
        </section>

        <div class="space-divider"></div>
        <!--Events Section-->
        <!-- Container for the image gallery -->

        <!-- Container for the image gallery -->

        <div class="Events-Section">
            <p class="Events-Section-Header" id="Events-Section-Header">SK Ibayo Tipas' Events</p>
            <p class="Events-Section-Subheading">The SK Ibayo Tipas holds a variety of events as displayed below.</p>
            <!-- Container for the image gallery -->
            <div class="events-container">
                <!-- Full-width images with number text -->
                <div class="mySlides">
                    <img src="https://imgur.com/kOpDPHK.png" style="width:50%" id="imgEvent">
                </div>

                <div class="mySlides">
                    <img src="https://imgur.com/IDOegx9.png" style="width:50%" id="imgEvent">
                </div>

                <div class="mySlides">
                    <img src="https://i.imgur.com/DWHZ9Ur.png" style="width:50%" id="imgEvent">
                </div>

                <div class="mySlides">
                    <img src="https://i.imgur.com/Bv5Qfiz.png" style="width:50%" id="imgEvent">
                </div>

                <div class="mySlides">
                    <img src="https://imgur.com/PQMYTJh.png" style="width:50%" id="imgEvent">
                </div>

                <div class="mySlides">
                    <img src="https://imgur.com/CaXD4fb.png" style="width:50%" id="imgEvent">
                </div>

                <!-- Next and previous buttons -->


                <!-- Image text -->
                <div class="caption-container">
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <p id="caption"></p>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                </div>

                <!-- Thumbnail images -->
                <div class="row">
                    <div class="column">
                        <img class="demo cursor" src="https://imgur.com/kOpDPHK.png" style="width:100%" onclick="currentSlide(1)" alt="YOUTH ACTING WORSHOP AND PERSONALITY DEVELOPMENT (YOUTH EMPOWERMENT SOURCES TEATRO IBAYO)">
                    </div>
                    <div class="column">
                        <img class="demo cursor" src="https://imgur.com/IDOegx9.png" style="width:100%" onclick="currentSlide(2)" alt="KARATEDO-IBAYO-TIPAS">
                    </div>
                    <div class="column">
                        <img class="demo cursor" src="https://i.imgur.com/DWHZ9Ur.png" style="width:100%" onclick="currentSlide(3)" alt="SK IBAYO TIPAS LOCAL BRAND HOLIDAYS BAZAAR">
                    </div>
                    <div class="column">
                        <img class="demo cursor" src="https://i.imgur.com/Bv5Qfiz.png" style="width:100%" onclick="currentSlide(4)" alt="SK IBAYO-TIPAS MOBILE LEGEND TOURNAMENT">
                    </div>
                    <div class="column">
                        <img class="demo cursor" src="https://imgur.com/PQMYTJh.png" style="width:100%" onclick="currentSlide(5)" alt="BOTE MO, PALIT PAGKAIN PROJECT">
                    </div>
                    <div class="column">
                        <img class="demo cursor" src="https://imgur.com/CaXD4fb.png" style="width:100%" onclick="currentSlide(6)" alt="SK IBAYO TIPAS BASKETBALL LIGA">
                    </div>
                </div>
                <script>
                    var slideIndex = 1;
                    showSlides(slideIndex);

// Next/previous controls
                    function plusSlides(n) {
                        showSlides(slideIndex += n);
                    }

// Thumbnail image controls
                    function currentSlide(n) {
                        showSlides(slideIndex = n);
                    }

                    function showSlides(n) {
                        var i;
                        var slides = document.getElementsByClassName("mySlides");
                        var dots = document.getElementsByClassName("demo");
                        var captionText = document.getElementById("caption");
                        if (n > slides.length) {
                            slideIndex = 1
                        }
                        if (n < 1) {
                            slideIndex = slides.length
                        }
                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";
                        }
                        for (i = 0; i < dots.length; i++) {
                            dots[i].className = dots[i].className.replace(" active", "");
                        }
                        slides[slideIndex - 1].style.display = "block";
                        dots[slideIndex - 1].className += " active";
                        captionText.innerHTML = dots[slideIndex - 1].alt;
                    }
                </script>
            </div>
        </div>

        <!--About US-->
        <div class="About-Section" id="About-Section">
            <div class="about-row">
                <div class="about-column-left">
                    <h1 class="heading">About Us</h1>

                    <p class="sub-heading">
                        &emsp;&emsp;The Sangguniang Kabataan or youth council is the governing body of the youth assembly or Katipunan ng Kabataan of every barangay. They are elected by the members of, the Katipunan ng Kabataan in elections conducted by the Commission on Elections (COMELEC).
                    </p> 
                </div>
                <br>
                <div class ="about-column-right">
                    <p class="sub-info">&emsp;&emsp; The SK Chairman leads the Sangguniang Kabataan. A Local Youth Development Council (LYDC) composed of representatives of different local youth groups supports the SK and its programs. 
                    </p>
                    <br>
                    <p class="sub-info">
                        &emsp;&emsp;The Sangguniang Kabataan is the successor of the Kabataang Barangay (KB; lit. 'Village Youth') which was abolished by the Local Government Code of 1991. The author, Senator Aquilino Pimentel Jr. abolished KB because of allegations that this organization faced.
                    </p>
                </div>

            </div>
            <div class="lower-row">
                <div class="lower-column-left">
                    <p class="heading">Mission</p>
                    <p class = "sub-heading">&emsp;&emsp;Magtatag ng isang makatao, makadiyos, maka-kalikasan maunlad at mapayapang pamayanan na pinamumunuan ng tapat, may malasakit, may kasanayan at epektibong liderato na magtaguyod ng mga programa at proyektong angkop sa pangunahing pangangailangan ng bawat mamamayan ng Barangay.</p>
                </div>
                <div class="lower-column-right">
                    <p class="heading">Vision</p>
                    <p class = "sub-heading">&emsp;&emsp;Isang pamayanang may tinig at lakas, malinis at luntian, malusog at mapayapa kung saan ang ahat ng tao ay may pagkilala sa Diyos at nagkakaisang isinusulong ang kapakanan ng higit na nakararami.</p>
                </div>
            </div>
        </div>


        <!--Organizational Chart-->
        <div class="Organizational-Chart">
            <p class="Organizational-Chart-Header">Know our SK-Ibayo Tipas Council Members</p>
            <p class="Organizational-Chart-Subheading">The SK Chairman leads the Sangguniang Kabataan. A Local Youth Development Council (LYDC) composed of representatives of different local youth groups supports the SK and its programs. </p>
            <img src="img/SK_Organizational_Chart.png" class="Organizational-Chart-Image">
        </div>
        
        <div class="Organizational-Chart">
            <p class="Organizational-Chart-Header">Meet the SK-Ibayo Tipas Members</p>
            <p class="Organizational-Chart-Subheading">Take a further look at the members of the SK-Ibayo Tipas Council Members.</p>
            <!-- Container for the image gallery -->
            <div class="events-container">
                <!-- Full-width images with number text -->
                <div class="mySlides1">
                    <img src="https://imgur.com/DlW9bUB.png" style="width:50%" id="imgEvent1">
                </div>

                <div class="mySlides1">
                    <img src="https://imgur.com/mA29OkG.png" style="width:50%" id="imgEvent1">
                </div>

                <div class="mySlides1">
                    <img src="https://imgur.com/h803Ktf.png" style="width:50%" id="imgEvent1">
                </div>

                <div class="mySlides1">
                    <img src="https://imgur.com/7kzNjhZ.png" style="width:50%" id="imgEvent1">
                </div>

                <div class="mySlides1">
                    <img src="https://imgur.com/y9WS2WA.png" style="width:50%" id="imgEvent1">
                </div>

                <div class="mySlides1">
                    <img src="https://imgur.com/JXbeNdo.png" style="width:50%" id="imgEvent1">
                </div>
                
                <div class="mySlides1">
                    <img src="https://imgur.com/wzgYYHT.png" style="width:50%" id="imgEvent1">
                </div>
                
                <div class="mySlides1">
                    <img src="https://imgur.com/ZEpK3AE.png" style="width:50%" id="imgEvent1">
                </div>
                
                <div class="mySlides1">
                    <img src="https://imgur.com/KZt6g3e.png" style="width:50%" id="imgEvent1">
                </div>

                <!-- Next and previous buttons -->


                <!-- Image text -->
                <div class="caption-container1">
                    <a class="prev1" onclick="plusSlides1(-1)">&#10094;</a>
                    <p id="caption1"></p>
                    <a class="next1" onclick="plusSlides1(1)">&#10095;</a>
                </div>

                <!-- Thumbnail images -->
                <div class="row1">
                    <div class="column1">
                        <img class="demo1 cursor1" src="https://imgur.com/DlW9bUB.png" style="width:100%" onclick="currentSlide1(1)" alt="SK CHAIRMAN ROCKY G. REYES">
                    </div>
                    <div class="column1">
                        <img class="demo1 cursor1" src="https://imgur.com/mA29OkG.png" style="width:100%" onclick="currentSlide1(2)" alt="SK KAGAWAD KRISHA CATHERINE LONTOC">
                    </div>
                    <div class="column1">
                        <img class="demo1 cursor1" src="https://imgur.com/h803Ktf.png" style="width:100%" onclick="currentSlide1(3)" alt="SK KAGAWAD CLARIZ CAPISTRANO">
                    </div>
                    <div class="column1">
                        <img class="demo1 cursor1" src="https://imgur.com/7kzNjhZ.png" style="width:100%" onclick="currentSlide1(4)" alt="SK KAGAWAD MICHELLE KAREN CRUZ">
                    </div>
                    <div class="column1">
                        <img class="demo1 cursor1" src="https://imgur.com/y9WS2WA.png" style="width:100%" onclick="currentSlide1(5)" alt="SK KAGAWAD JANE PAULINE CLORES">
                    </div>
                    <div class="column1">
                        <img class="demo1 cursor1" src="https://imgur.com/JXbeNdo.png" style="width:100%" onclick="currentSlide1(6)" alt="SK KAGAWAD ROHANDREW RYE BOBOTIOK">
                    </div>
                    <div class="column1">
                        <img class="demo1 cursor1" src="https://imgur.com/wzgYYHT.png" style="width:100%" onclick="currentSlide1(7)" alt="SK KAGAWAD EUGENE G. GARAN">
                    </div>
                    <div class="column1">
                        <img class="demo1 cursor1" src="https://imgur.com/ZEpK3AE.png" style="width:100%" onclick="currentSlide1(8)" alt="SK TREASURER LALAINE O. RAFAEL ">
                    </div>
                    <div class="column1">
                        <img class="demo1 cursor1" src="https://imgur.com/KZt6g3e.png" style="width:100%" onclick="currentSlide1(9)" alt="SK SECRETARY MICHELLE VICTORIANO">
                    </div>
                </div>
                <script>
                    var slideIndex1 = 1;
                    showSlides1(slideIndex1);

// Next/previous controls
                    function plusSlides1(n) {
                        showSlides1(slideIndex1 += n);
                    }

// Thumbnail image controls
                    function currentSlide1(n) {
                        showSlides1(slideIndex1 = n);
                    }

                    function showSlides1(n) {
                        var i;
                        var slides = document.getElementsByClassName("mySlides1");
                        var dots = document.getElementsByClassName("demo1");
                        var captionText = document.getElementById("caption1");
                        if (n > slides.length) {
                            slideIndex1 = 1
                        }
                        if (n < 1) {
                            slideIndex1 = slides.length
                        }
                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";
                        }
                        for (i = 0; i < dots.length; i++) {
                            dots[i].className = dots[i].className.replace(" active", "");
                        }
                        slides[slideIndex1 - 1].style.display = "block";
                        dots[slideIndex1 - 1].className += " active";
                        captionText.innerHTML = dots[slideIndex1 - 1].alt;
                    }
                </script>
            </div>
        </div>
        
        

        <!--Footer-->
        <section class="Footer-Container">
            <div class="Flex-Footer-Content" id="Contact-Us">
                <p class="label">CONTACT US</p>
                <p class="f-content">Mobile: SK Chairman Rocky: 0961 173 4321</p>
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