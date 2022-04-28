<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="/SKIT-YIMS/img/SK_Logo.png" />

        <link href="/SKIT-YIMS/Survey Forms/SurveyCSS/Survey.css" rel="stylesheet" type="text/css">
        <style>
            body {font-family: 'Montserrat';}

            /* Style the tab */
            .tab {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #E2E2E2;
                width: 90%;
                margin: auto;
                text-align: center;
                display: flex;
                justify-content: space-between;
                border-radius: 20px 20px 0 0;
            }



            /* Style the buttons inside the tab */
            .tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 1em;
                width: 100%;
                border-radius: 20px 20px 0 0;
                border: none;
                font-family: 'Montserrat';
                font-weight: bold;
            }

            /* Change background color of buttons on hover */
            .tab button:hover {
                background-color: grey;
            }

            /* Create an active/current tablink class */
            .tab button.active {
                background-color: white;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border-top: none;
            }

        </style>
        <title>Survey</title>
    </head>
    <%
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("captchaSurvey") == null) {
            response.sendRedirect("/SKIT-YIMS/Survey Forms/Landing.jsp");
            session.setAttribute("errorCaptcha", "Please accomplish CAPTCHA.");

        }
    %>
    <body>
        <div id="header-container">
            <img src="/SKIT-YIMS/img/SK_Logo.png" alt="SK Logo" id="Logo">
            <div>
                <h1 id="header-text">SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
            </div>
        </div>

        <div class="tab">
            <button class="tablinks" onclick="showTab(event, 'Info')" id="defaultOpen">Resident Information</button>
            <button class="tablinks" onclick="showTab(event, 'Details')">Resident Details</button>
            <button class="tablinks" onclick="showTab(event, 'Contact')">Contact Details</button>
            <button class="tablinks" onclick="showTab(event, 'Family')">Family Details</button>
            <button class="tablinks" onclick="showTab(event, 'Survey')">Survey</button>
            <button class="tablinks" onclick="showTab(event, 'Vaccination')">Vaccination</button>
        </div>

        <div overflow:auto class="container">
            <form action="../SurveyServlet" id = "SurveyForm" method="POST" name="Survey" enctype="multipart/form-data">
                <div id="Info" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div>
                                <label for="name" class="label-english">Full Name of Resident<em class="required"></em>&emsp;<span>Buong Pangalan ng Residente</span></label><br>
                                <input type="text" id="name" name="name" class="long-textbox" placeholder=" First Name Last Name" required maxlength="50">
                            </div>

                            <div class="content-divider"></div>
                            
                            
                            <div class="table">
                                <div class="input-group">
                                    <label for="birthday" class="label-english" id="birthday-text">Birthday<em class="required"></em>&emsp;<span>Kaarawan</span></label>
                                    <input type="date" name="birthday" id="birthday" class="birthday-select" required>
                                </div>
                                
                                <div class="divider-row"></div>

                                <!-- <div class="table">
                                     <div class="input-group">
                                         <label for="age" class="label-english">Age<em class="required"></em>&emsp;<span>To be removed from jsp and javascript</span></label>&emsp;
                                         <select name="age" id="age" class="age-select" required>
                                             <option value="14 years old and below">14 years old and below</option>
                                             <option value="15-20 years old">15-20 years old</option>
                                             <option value="21-30 years old">21-30 years old</option>
                                             <option value="31 years old and above">31 years old and above</option>
                                         </select>
                                     </div> 
                                     <div class="divider-row"></div>
                                     <div class="input-group">
                                         <label for="birthday" class="label-english" id="birthday-text">Birthday<em class="required"></em>&emsp;<span>Kaarawan</span></label>&emsp;
                                         <input type="date" name="birthday" id="birthday" class="birthday-select" required>
                                     </div>
                                 </div> -->

                                <div class="input-group">
                                    <div>
                                        <label for="gender" class="label-english">Gender<em class="required"></em>&emsp;<span>Kasarian</span></label>    
                                    </div>
                                    
                                    <select name="gender" id="gender" class="dropdown" required>
                                        <option id="female" value="Female">Female (Babae)</option>
                                        <option id="male" value="Male">Male (Lalaki)</option>
                                        <option id="prefer" value="Prefer not to say">Prefer not to say (Pinipiling hindi sabihin)</option>
                                    </select>
                                </div>

                            </div>

<!--                            <div class="gender-group">
                                <p class="label-english">Gender<em class="required"></em>&emsp;<span>Kasarian</span></p>

                                <div class="radial-row-three">
                                    <div>
                                        <input type="radio" id="female" name="gender" value="Female" required>
                                        <label for="female" class="label-english"><span class="radio-btn"></span>Female <span>(Babae)</span></label>
                                    </div>

                                    <div class="divider-choices-three"></div>

                                    <div class="no-padding">
                                          <input type="radio" id="male" name="gender" value="Male (Lalaki)" class="radio-btn">
                                          <label for="male" class="label-english"><span class="radio-btn"></span>Male <span>(Lalaki)</span></label>
                                    </div>

                                    <div class="divider-choices-three"></div>

                                    <div>
                                          <input type="radio" id="prefer" name="gender" value="Prefer not to say" class="radio-btn">
                                          <label for="prefer" class="label-english"><span class="radio-btn"></span>Prefer not to say <span>(Pinipiling hindi sabihin)</span></label>
                                    </div>

                                </div>
                            </div>-->

                            <div class="content-divider"></div>

                            <div>
                                <label for="address" class="label-english">Full Address<em class="required"></em>&emsp;<span>Buong Address ng Tirahan</span></label><br>
                                <input type="text" id="address" name="address" class="long-textbox" required maxlength="100"><br>
                            </div>
                            <div class="upload-group">
                                <p class="label-english" id="upload-main-text-english">Upload ID Picture with Complete Address <br>
                                    <a>(Preferably any School ID for 15-17 years old, any Government Issued ID or preferably National ID for 18-30 years old)</a> <br><br>
                                    <span id="upload-main-text-filipino">I-Upload ang litrato ng ID kung saan makikita ang kumpletong address ng tirahan <br>
                                        <a>(Mas mabuti na ID mula sa paaralan para sa mga 15-17 taong gulang, at kahit anong ID mula sa gobyerno, mas mabuting National ID kung mayroon na, para sa mga 18-30 taong gulang)</a></span></p>
                            </div>
                            <div class="button-container">


                                <input type="file" id="myFile" name="validID" accept="image/png, image/jpeg" hidden required/>
                                <label for="myFile" id="fake-button" >Choose File</label>
                                <span id="file-chosen">&nbsp;no file chosen</span>

                                <script>
                                    const actualBtn = document.getElementById('myFile');
                                    const fileChosen = document.getElementById('file-chosen');
                                    actualBtn.addEventListener('change', function () {
                                        if (this.files[0].size > 4194304) {
                                            fileChosen.textContent = '   no file chosen'
                                        } else {
                                            fileChosen.textContent = this.files[0].name
                                        }


                                    })
                                </script>

                                <script>

                                    var uploadField = document.getElementById("myFile");

                                    uploadField.onchange = function () {
                                        if (this.files[0].size > 4194304) {
                                            alert("File is too big! (Masyadong malaki ang iyong larawan)");
                                            this.value = "";
                                        }
                                        ;
                                    };
                                </script>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="Details" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div>
                                <label for="civil" class="label-english">Civil Status<em class="required"></em>&emsp;<span>Katayuang Sibil</span></label><br>               
                                <select name="civil" id="civil" class="dropdown" required>
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Widowed">Widowed</option>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="working" class="label-english">Working Status<em class="required"></em>&emsp;<span>Katayuan sa Trabaho</span></label><br>               
                                <select name="working" id="working" class="dropdown" required>
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Working Student">Working Student</option>
                                    <option value="Out of School Youth">Out of School Youth</option>
                                    <option value="Working/Employed">Working/Employed</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Currently Looking For a Job">Currently Looking For a Job</option>
                                    <!-- others with input type field-->
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="jobEmployed" class="label-english">If employed, please specify your job. (If none, type N/A)<em class="required"></em>&emsp;<span>Kung nagtratrabaho, isulat ang uri ng trabaho. (Kung wala, isulat N/A)</span></label><br>
                                <input type="text" id="job" name="jobEmployed" class="long-textbox" required maxlength="30"><br>
                            </div>
                            <br>
                            <div>
                                <label for="education" class="label-english">Highest Educational Attainment<em class="required"></em>&emsp;<span>Pinakamataaas na Edukasyon na Natamo</span></label><br>               
                                <select name="education" id="education" class="dropdown" required>
                                    <option value="Elementary Level">Elementary Level</option>
                                    <option value="Elementary Graduate">Elementary Graduate</option>
                                    <option value="Junior High School Level">Junior High School Level</option>
                                    <option value="Junior High School Graduate">Junior High School Graduate</option>
                                    <option value="Senior High School Level">Senior High School Level</option>
                                    <option value="Senior High School Graduate">Senior High School Graduate</option>
                                    <option value="College Level">College Level</option>
                                    <option value="College Graduate">College Graduate</option>
                                    <!-- others with input type field-->
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <p class="label-english">Do you identify as a Person With Disability (PWD)?<em class="required"></em>&emsp;<span>Ikaw ba ay nabibilang sa mga Persons With Disabilities (PWD)?</span></p>
                                <div class="radial-row">
                                      <input type="radio" id="yes" name="pwd" value="Yes" required>
                                      <label for="yes" class="label-english">Yes <span>(Oo)</span></label>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="no" name="pwd" value="No">
                                      <label for="no" class="label-english">No <span>(Hindi)</span></label>
                                </div>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="typePWD" class="label-english">
                                    Type of disability (Type N/A if not applicable)<em class="required"></em>&emsp;<span>Uri ng Kapansanan (Isulat ang N/A kung wala)</span>
                                </label><br>
                                <input type="text" id="typePWD" name="typePWD" class="long-textbox" required maxlength="40"><br>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>

                <div id="Contact" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div>
                                <!-- To be fixed formatting!!! para sa database-->
                                <label for="phone" class="label-english">Contact Number<em class="required"></em>&emsp;<span>Numerong Maaring Tawagan</span></label><br>
                                <input type="tel" id="phone" name="phone" pattern="^[0-9]{3,45}$" class="long-textbox" required maxlength="15">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="email" class="label-english">Email Address<em class="required"></em>&emsp;<span>Buong Email Address ng Residente</span></label>
                                <input type="email" id="email" name="email" class="long-textbox" required maxlength="45">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="fb" class="label-english">Facebook Name or URL<em class="required"></em>&emsp;<span>Pangalan o URL ng Account sa Facebook</span></label>
                                <input type="fb" id="fbname" name="fb" class="long-textbox" required maxlength="35">
                            </div>
                        </div>
                    </div>

                </div>

                <div id="Family" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div>
                                <label for="mother" class="label-english">Mother's Name<em class="required"></em>&emsp;<span>Pangalan ng iyong Nanay</span></label><br>
                                <input type="text" id="mother" name="mother" class="long-textbox" placeholder="First Name Last Name" required maxlength="50">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <p class="label-english">Mother's Status<em class="required"></em>&emsp;<span>Estado ng iyong Nanay</span></p>
                                <div class="radial-row">
                                      <input type="radio" id="livingm" name="motherstat" value="Living" required>
                                      <label for="livingm" class="label-english">Living <span>(Buhay)</span></label><br>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="deceasedm" name="motherstat" value="Deceased">
                                      <label for="deceasedm" class="label-english">Deceased <span>(Pumanaw)</span></label><br>
                                </div>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="motherwork" class="label-english">Mother's Occupation<em class="required"></em>&emsp;<span>Trabaho ng iyong Nanay</span></label><br>
                                <input type="text" id="motherwork" name="motherwork" class="long-textbox" required maxlength="30">
                            </div>
                            <div class="content-divider"></div>

                            <div>
                                <label for="father" class="label-english">Father's Name<em class="required"></em>&emsp;<span>Pangalan ng iyong Tatay</span></label><br>
                                <input type="text" id="father" name="father" class="long-textbox" placeholder="First Name Last Name" required maxlength="50">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <p class="label-english">Father's Status<em class="required"></em>&emsp;<span>Estado ng iyong Tatay</span></p>
                                <div class="radial-row">
                                      <input type="radio" id="livingf" name="fatherstat" value="Living" required>
                                      <label for="livingf" class="label-english">Living <span>(Buhay)</span></label><br>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="deceasedf" name="fatherstat" value="Deceased">
                                      <label for="deceasedf" class="label-english">Deceased <span>(Pumanaw)</span></label><br>
                                </div>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="fatherwork" class="label-english">Father's Occupation<em class="required"></em>&emsp;<span>Trabaho ng iyong Tatay</span></label><br>
                                <input type="text" id="fatherwork" name="fatherwork" class="long-textbox" required maxlength="30">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="nosibs" class="label-english">No. of Sibling/s<em class="required"></em>&emsp;<span>Ilan ang iyong mga kapatid?</span></label><br>
                                <!--                                <input type="number" min="0" value="0"  max="5"   oninput="siblingSelection(this.value)" id="nosibs" name="nosibs" class="dropdown" required>-->
                                <select name="nosibs" id="nosibs" oninput="siblingSelection(this.value)" id="selection" class="dropdown">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <!--                            <div class="content-divider"></div>-->

                            <!-- dapat may condition dito ilang no. of siblings? Pending pa here-->
                            <div id="sibSelection1" name="sibSelection1" class="original" style="display: none">
                                <label for="workingsib1" class="label-english">Sibling/s Working Status<em class="required"></em>&emsp;<span>Katayuan sa Trabaho</span></label>               
                                <select name="workingsib1" id="selection" class="dropdown">
                                    <option value="Degree Holder">Degree Holder</option>
                                    <option value="Working">Working</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Not Applicable">Not Applicable</option>
                                </select>
                            </div>
                            <div id="sibSelection2" name="sibSelection2" class="original" style="display: none">
                                <label for="workingsib2" class="label-english">Sibling/s Working Status<em class="required"></em>&emsp;<span>Katayuan sa Trabaho</span></label>               
                                <select name="workingsib2" id="selection" class="dropdown">
                                    <option value="Degree Holder">Degree Holder</option>
                                    <option value="Working">Working</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Not Applicable">Not Applicable</option>
                                </select>
                            </div>
                            <div id="sibSelection3" name="sibSelection3" class="original" style="display: none">
                                <label for="workingsib3" class="label-english">Sibling/s Working Status<em class="required"></em>&emsp;<span>Katayuan sa Trabaho</span></label>               
                                <select name="workingsib3" id="selection" class="dropdown">
                                    <option value="Degree Holder">Degree Holder</option>
                                    <option value="Working">Working</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Not Applicable">Not Applicable</option>
                                </select>
                            </div>
                            <div id="sibSelection4" name="sibSelection4" class="original" style="display: none">
                                <label for="workingsib4" class="label-english">Sibling/s Working Status<em class="required"></em>&emsp;<span>Katayuan sa Trabaho</span></label>               
                                <select name="workingsib4" id="selection" class="dropdown">
                                    <option value="Degree Holder">Degree Holder</option>
                                    <option value="Working">Working</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Not Applicable">Not Applicable</option>
                                </select>
                            </div>
                            <div id="sibSelection5" name="sibSelection5" class="original" style="display: none">
                                <label for="workingsib5" class="label-english">Sibling/s Working Status<em class="required"></em>&emsp;<span>Katayuan sa Trabaho</span></label>               
                                <select name="workingsib5" id="selection" class="dropdown">
                                    <option value="Degree Holder">Degree Holder</option>
                                    <option value="Working">Working</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Not Applicable">Not Applicable</option>
                                </select>
                            </div>
                            <!--                            <div id="clonecontainer"></div>-->

                            <div class="content-divider"></div>

                            <div>
                                <label for="breadwinner" class="label-english">Who is the breadwinner in your family?<em class="required"></em>&emsp;<span>Sino ang kumikita para sa pamilya?</span></label><br>
                                <input type="text" id="breadwinner" name="breadwinner" class="long-textbox" required maxlength="30">
                            </div>
                        </div>
                    </div> 
                </div>

                <div id="Survey" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <p class="label-english">Are you a registered SK voter?<em class="required"></em>&emsp;<span>Nakapag-rehistro ka ba upang bumoto sa SK?</span></p>
                            <div class="radial-row">  
                                <input type="radio" id="yesvoter" name="voter" value="Yes" required>
                                  <label for="yesvoter" class="label-english">Yes <span>(Oo)</span></label>
                                <div class="divider-choices"></div>
                                  <input type="radio" id="novoter" name="voter" value="No">
                                  <label for="novoter" class="label-english">No <span>(Hindi)</span></label>
                            </div>

                            <div class="content-divider"></div>


                            <p class="label-english">Are you a member of an organization?<em class="required"></em>&emsp;<span>Miyembro ka ba ng isang organisasyon?</span></p>
                              <div class="radial-row">
                                <input type="radio" id="yesorg" name="org" value="Yes" required>
                                  <label for="yesorg" class="label-english">Yes <span>(Oo)</span></label>
                                <div class="divider-choices"></div>
                                  <input type="radio" id="noorg" name="org" value="No">
                                  <label for="noorg" class="label-english">No <span>(Hindi)</span></label>
                            </div>


                            <div class="content-divider"></div>

                            <div>
                                <label for="orgname" class="label-english">If yes, please specify which organization.<em class="required"></em>&emsp;<span>Kung oo, anong organisasyon?</span></label><br>
                                <input type="text" id="org" name="orgname" class="long-textbox" required maxlength="50">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="proj" class="label-english">Are you willing to support the incoming projects of SK Ibayo-Tipas?<em class="required"></em>
                                    <br><span>Handa ka bang suportahan ang mga paparating na proyekto ng SK Ibayo-Tipas?</span></label><br>
                                <div class="radial-row-three">
                                    <div>
                                          <input type="radio" id="yesproj" name="proj" value="Yes" required>
                                          <label for="yesproj" class="label-english">Yes <span>(Oo)</span></label><br>
                                    </div>
                                    <div class="divider-choices"></div>

                                    <div>
                                          <input type="radio" id="noproj" name="proj" value="No">
                                          <label for="noproj" class="label-english">No <span>(Hindi)</span></label><br>
                                    </div>
                                    <div class="divider-choices"></div>

                                    <div>
                                          <input type="radio" id="maybeproj" name="proj" value="Maybe">
                                          <label for="maybeproj" class="label-english">Maybe <span>(Hindi Sigurado)</span></label><br>
                                    </div>
                                </div>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="support" class="label-english">How will you show your support in the upcoming projects of the SK Ibayo-Tipas?<em class="required"></em>
                                    <br><span>Paano mo maipapakita ang iyong suporta sa mga proyekto ng SK Ibayo-Tipas?</span></label><br>
                                <input type="text" id="support" name="support" class="long-textbox" required maxlength="120">
                            </div>

                            <div class="content-divider"></div>
                            <div>
                                <label for="jobchance" class="label-english">If you are given a chance to have a job, what makes you worthy among others?<em class="required"></em>
                                    <br><span>Kung ikaw ay bibigyan ng pagkakataong magkaroon ng  hanapbuhay, bakit ikaw ang karapat-dapat?</span></label><br>
                                <input type="text" id="jobChance" name="jobchance" class="long-textbox" required maxlength="120">
                            </div>
                            <div class="content-divider"></div>
                            <div>
                                <label for="message" class="label-english">What would you like to say to the current SK Council of Ibayo-Tipas?<em class="required"></em>
                                    <br><span>Ano ang iyong mensahe o mungkahi sa kasalukuyang konseho ng Sangguniang Kabataan Ibayo-Tipas?</span></label><br>
                                <input type="text" id="message" name="message" class="long-textbox" required maxlength="120">

                            </div>
                        </div>
                    </div>
                </div>
                <div id="Vaccination" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div>
                                <p class="label-english">Have you been vaccinated for Covid-19?<em class="required"></em>&emsp;<span>Ikaw ba ay nabakuna na laban Covid-19?</span>
                                </p>

                                <div class="radial-row">
                                      <input type="radio" id="yesvax" name="vax" value="Yes" required>
                                      <label for="yesvax" class="label-english">Yes <span>(Oo)</span></label><br>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="novax" name="vax" value="No">
                                      <label for="novax" class="label-english">No <span>(Hindi)</span></label><br>
                                </div>

                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <p class="label-english" class="label-english">If not, are you willing to be vaccinated if given the chance?<em class="required"></em>
                                    &emsp;<span>Kung hindi, may kagustuhan ka ba mabakuna kapag nagkaroon ng pagkakataon?</span>
                                </p>
                                <div class="radial-row">
                                      <input type="radio" id="yeswilling" name="willing" value="Yes" required>
                                      <label for="yeswilling" class="label-english">Yes <span>(Oo)</span></label><br>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="nowilling" name="willing" value="No">
                                      <label for="nowilling" class="label-english">No <span>(Hindi)</span></label><br>
                                </div>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="brand" class="label-english">If yes, what brand of vaccine did you receive?<em class="required"></em>&emsp;<span>Kung oo, ano ang brand ng iyong bakuna?</span></label>
                                <select name="brand" class="dropdown" id="brand" >
                                    <option value="Pfizer-BioNTech">Pfizer-BioNTech</option>
                                    <option value="Oxford-AstraZeneca">Oxford-AstraZeneca</option>
                                    <option value="CoronaVac (Sinovac)">CoronaVac (Sinovac)</option>
                                    <option value="Gamaleya Sputnik V">Gamaleya Sputnik V</option>
                                    <option value="Johnson and Johnson's Janssen">Johnson and Johnson's Janssen</option>
                                    <option value="Bharat BioTech">Bharat BioTech</option>
                                    <option value="Moderna">Moderna</option>
                                    <option value="Sinopharm">Sinopharm</option>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="vstatus" class="label-english">What is your Vaccine Status?<em class="required"></em>&emsp;<span>Ano ang istatus ng iyong bakuna?</span> </label>
                                <select name="vstatus" class="dropdown" id="vstatus" >
                                    <option value="Not Vaccinated">Not Vaccinated</option>
                                    <option value="First Dose">First Dose</option>
                                    <option value="Second Dose">Second Dose</option>
                                    <option value="Booster">Booster</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="buttons" >
                    <button id = "backButton" type = "button" onclick="prev()" class="previous">Back</button>
                    <div class="divider-content"></div>

                    <button id="nextButton" type="button" onclick="validateForm()" class="next">Proceed</button>
                    <button id="submitButton" type="submit" value="submit" onclick="validateForm()" class = "next">Submit</button>
                </div>
            </form>
        </div>

        <!-- remove back in first tab, replace proceed in the last tab with submit-->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script type="text/javascript">
                        function siblingSelection(times) {

                            if (times == 0) {
                                document.getElementById('sibSelection1').style.display = "none";
                                document.getElementById('sibSelection2').style.display = "none";
                                document.getElementById('sibSelection3').style.display = "none";
                                document.getElementById('sibSelection4').style.display = "none";
                                document.getElementById('sibSelection5').style.display = "none";
                            } else if (times == 1) {
                                document.getElementById('sibSelection1').style.display = "block";
                                document.getElementById('sibSelection2').style.display = "none";
                                document.getElementById('sibSelection3').style.display = "none";
                                document.getElementById('sibSelection4').style.display = "none";
                                document.getElementById('sibSelection5').style.display = "none";
                            } else if (times == 2) {
                                document.getElementById('sibSelection1').style.display = "block";
                                document.getElementById('sibSelection2').style.display = "block";
                                document.getElementById('sibSelection3').style.display = "none";
                                document.getElementById('sibSelection4').style.display = "none";
                                document.getElementById('sibSelection5').style.display = "none";
                            } else if (times == 3) {
                                document.getElementById('sibSelection1').style.display = "block";
                                document.getElementById('sibSelection2').style.display = "block";
                                document.getElementById('sibSelection3').style.display = "block";
                                document.getElementById('sibSelection4').style.display = "none";
                                document.getElementById('sibSelection5').style.display = "none";
                            } else if (times == 4) {
                                document.getElementById('sibSelection1').style.display = "block";
                                document.getElementById('sibSelection2').style.display = "block";
                                document.getElementById('sibSelection3').style.display = "block";
                                document.getElementById('sibSelection4').style.display = "block";
                                document.getElementById('sibSelection5').style.display = "none";

                            } else if (times == 5) {
                                document.getElementById('sibSelection1').style.display = "block";
                                document.getElementById('sibSelection2').style.display = "block";
                                document.getElementById('sibSelection3').style.display = "block";
                                document.getElementById('sibSelection4').style.display = "block";
                                document.getElementById('sibSelection5').style.display = "block";
                            }
                        }

        </script>

        <script>
            //resident info
            name = document.getElementById("name");
//            age = document.getElementById("age");
            birthday = document.getElementById("birthday");
            gender = document.getElementsByName("gender");
            address = document.getElementById("address");

            //resident details
            civil = document.getElementById("civil");
            working = document.getElementById("working");
            job = document.getElementById("job");
            education = document.getElementById("education");
            pwd = document.getElementsByName("pwd");
            typePWD = document.getElementsByName("typePWD");

            //contact details 
            phone = document.getElementById("phone");
            email = document.getElementById("email");
            fbname = document.getElementById("fbname");

            //family details
            mother = document.getElementById("mother");
            motherstat = document.getElementsByName("motherstat");
            motherwork = document.getElementById("motherwork");
            father = document.getElementById("father");
            fatherstat = document.getElementsByName("fatherstat");
            fatherwork = document.getElementById("fatherwork");
            nosibs = document.getElementById("nosibs");
            breadwinner = document.getElementById("breadwinner");

            //survey
            voter = document.getElementsByName("voter");
            memberOrg = document.getElementsByName("org");
            nameOrg = document.getElementById("nameOrg");
            proj = document.getElementsByName("proj");
            support = document.getElementById("support");
            jobChance = document.getElementById("jobChance");
            message = document.getElementById("message");

            //vaccine
            vax = document.getElementsByName("vax");
            willing = document.getElementsByName("willing");
            brand = document.getElementById("brand");
            vstatus = document.getElementById("vstatus");


        </script>
        <script>
            var counter = 0;
            var tabs = ["Info", "Details", "Contact", "Family", "Survey", "Vaccination"];
            function showTab(evt, tabName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");

                }
                document.getElementById(tabName).style.display = "block";
                evt.currentTarget.className += " active";
                counter = tabs.indexOf(tabName);

                if (counter == 5) {
                    document.getElementById('nextButton').style.display = "none";
                    document.getElementById("submitButton").style.display = "block";
                    document.getElementById('backButton').style.display = "block";
                } else if (counter != 5) {
                    if (counter == 0) {
                        document.getElementById('backButton').style.display = "none";
                    } else {
                        document.getElementById('backButton').style.display = "block";
                    }
                    document.getElementById("nextButton").style.display = "block";
                    document.getElementById("submitButton").style.display = "none";
                }
                console.log(tabName);
                console.log(counter);
            }

            function next() {
                counter = (counter + 1) % 6;
                if (counter == 5) {
                    document.getElementById("submitButton").style.display = "block";
                    document.getElementById("nextButton").style.display = "none";
                    document.getElementById('backButton').style.display = "block";

//                    if (!residentInfo()) {
//                        counter = 0;
//                        var i, tabcontent, tablinks;
//
//                        tabcontent = document.getElementsByClassName("tabcontent");
//                        for (i = 0; i < tabcontent.length; i++) {
//                            if (i != counter) {
//                                tabcontent[i].style.display = "none";
//                            } else {
//                                tabcontent[i].style.display = "block";
//                            }
//                        }
//                        tablinks = document.getElementsByClassName("tablinks");
//                        for (i = 0; i < tablinks.length; i++) {
//                            tablinks[i].className = tablinks[i].className.replace(" active", "");
//                        }
//                        tablinks[counter].className += " active";
//                    }
                }
                document.getElementById('backButton').style.display = "block";
                var i, tabcontent, tablinks;

                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    if (i != counter) {
                        tabcontent[i].style.display = "none";
                    } else {
                        tabcontent[i].style.display = "block";
                    }
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                tablinks[counter].className += " active";

                console.log(tabName);
                console.log(counter);
                document.getElementByClassName("tabcontent").style.display = "block";

            }

            function residentInfo() {
                if (name != null && birthday != null & gender != null && address != null) {
                    return true;
                } else
                    return false;
            }

            function residentDetails() {
                if (civil != null && working != null && job != null && education != null && pwd != null && typePWD != null) {
                    return true;
                } else
                    return false;
            }

            function contactDetails() {
                if (phone != null && email != null && fbname != null) {
                    return true;
                } else
                    return false;
            }

            function familyDetails() {
                if (mother != null && motherstat != null && motherwork != null && father != null && fatherstat != null && fatherwork != null &&
                        nosibs != null && breadwinner != null) {
                    return true;
                } else
                    return false;
            }

            function survey() {
                if (voter != null && memberOrg != null && nameOrg != null && proj != null && support != null && jobChance != null && message != null) {
                    return true;
                } else
                    return false;
            }

            function vaccine() {
                if (vax != null && willing != null && brand != null && vstatus != null) {
                    return true;
                } else
                    return false;
            }

            function prev() {
                counter = (counter - 1) % 6;
                if (counter == 0) {
                    document.getElementById('backButton').style.display = "none";
                    document.getElementById("submitButton").style.display = "none";
                } else {
                    document.getElementById('backButton').style.display = "block";
                    if (counter == 5)
                        document.getElementById('nextButton').style.display = "none";
                    else
                        document.getElementById('nextButton').style.display = "block";
                }
                document.getElementById("submitButton").style.display = "none";
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    if (i != counter) {
                        tabcontent[i].style.display = "none";
                    } else {
                        tabcontent[i].style.display = "block";
                    }
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                tablinks[counter].className += " active";
                console.log(tabName);
                console.log(counter);
                document.getElementByClassName("tabcontent").style.display = "block";
            }

            // Get the element with id="defaultOpen" and click on it
            document.getElementById("defaultOpen").click();
            evt.currentTarget.className += " active";

        </script>
        <script>
            function validateForm() {
                var residentInfo = ["name", "birthday", "gender", "address", "validID"];
                var residentDetails = ["civil", "working", "jobEmployed", "education", "pwd", "typePWD"];
                var contactDetails = ["phone", "email", "fbname"];
                var familyDetails = ["mother", "motherstat", "motherwork", "father", "fatherstat", "fatherwork", "nosibs", "breadwinner"];
                var survey = ["voter", "org", "orgname", "proj", "support", "jobChance", "message"];
                var vaccine = ["vax", "willing", "brand", "vstatus"];

                var regex = /^[a-zA-Z]+$/;
                var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

                var i, j, k, l, m, n;

                var fieldname;

                if (counter == 0) {
                    for (i = 0; i < residentInfo.length; i++) {
                        fieldname = residentInfo[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Resident Information Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        }
                    }
                    nextButton.onclick(next());
                }
                if (counter == 1) {
                    for (i = 0; i < residentDetails.length; i++) {
                        fieldname = residentDetails[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Resident Details Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        }
                    }
                    nextButton.onclick(next());
                }
                if (counter == 2) {
                    for (i = 0; i < contactDetails.length; i++) {
                        fieldname = contactDetails[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Contact Details Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        }
                        if (document.forms["SurveyForm"]["phone"].value.match(regex)) {
                            alert("Please input numbers only for the contact number in Contact Details Tab.");
                            document.forms["SurveyForm"]["phone"].focus();
                            return false;
                        }
                        if (document.forms["SurveyForm"]["email"].value == "") {
                            alert("Please fill out all fields in Contact Details Tab.");
                            document.forms["SurveyForm"]["email"].focus();
                            return false;
                        }
                        if (!document.forms["SurveyForm"]["email"].value.match(mailFormat)) {
                            alert("Please enter a valid email in Contact Details Tab.");
                            document.forms["SurveyForm"]["email"].focus();
                            return false;
                        }
                    }
                    nextButton.onclick(next());
                }
                if (counter == 3) {
                    for (i = 0; i < familyDetails.length; i++) {
                        fieldname = familyDetails[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Family Details Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        }
                    }
                    nextButton.onclick(next());
                }
                if (counter == 4) {
                    for (i = 0; i < survey.length; i++) {
                        fieldname = survey[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Survey Details Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        }
                    }
                    nextButton.onclick(next());
                }
                if (counter == 5) {
                    for (i = 0; i < residentInfo.length; i++) {
                        fieldname = residentInfo[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Resident Information Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        }
                    }
                    for (i = 0; i < residentDetails.length; i++) {
                        fieldname = residentDetails[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Resident Details Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        }
                    }
                    for (i = 0; i < contactDetails.length; i++) {
                        fieldname = contactDetails[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Contact Details Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        }
                        if (document.forms["SurveyForm"]["phone"].value.match(regex)) {
                            alert("Please input numbers only for the contact number in Contact Details Tab.");
                            document.forms["SurveyForm"]["phone"].focus();
                            return false;
                        }
                        if (document.forms["SurveyForm"]["email"].value == "") {
                            alert("Please fill out all fields in Contact Details Tab.");
                            document.forms["SurveyForm"]["email"].focus();
                            return false;
                        }
                        if (!document.forms["SurveyForm"]["email"].value.match(mailFormat)) {
                            alert("Please enter a valid email in Contact Details Tab.");
                            document.forms["SurveyForm"]["email"].focus();
                            return false;
                        }
                    }
                    for (i = 0; i < familyDetails.length; i++) {
                        fieldname = familyDetails[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Family Details Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        }
                    }
                    for (i = 0; i < survey.length; i++) {
                        fieldname = survey[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Survey Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        }
                    }
                    for (i = 0; i < vaccine.length; i++) {
                        fieldname = vaccine[i];
                        if (document.forms["SurveyForm"][fieldname].value == "") {
                            alert("Please fill out all fields in Vaccination Tab.");
                            document.forms["SurveyForm"][fieldname].focus();
                            return false;
                        } else {
                            document.getElementById("SurveyForm").submit();
                        }
                    }

                }
                return true;
            }
        </script>
    </body>
</html> 
