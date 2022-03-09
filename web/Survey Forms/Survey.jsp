<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../Survey Forms/SurveyCSS/Survey.css" rel="stylesheet" type="text/css">
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
    </head>
    <body>
        <div id="header-container">
            <img src="../img/SK_Logo.png" alt="SK Logo" id="Logo">
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
            <form action="../SurveyServlet" id = "SurveyForm" method="POST">
                <div id="Info" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div>
                                <label for="name" class="label-english" >Full Name of Resident&emsp;<span>Buong Pangalan ng Residente</span></label><br>
                                <input type="text" id="name" name="name" class="long-textbox" placeholder=" First Name Last Name">
                            </div>

                            <div class="content-divider"></div>

                            <div class="table">
                                <div class="input-group">
                                    <label for="age" class="label-english" >Age&emsp;<span>Edad</span>&emsp;</label>
                                    <select name="age" class="age-select">
                                        <option value="14 years old and below">14 years old and below</option>
                                        <option value="15-20 years old">15-20 years old</option>
                                        <option value="21-30 years old">21-30 years old</option>
                                        <option value="31 years old and above">31 years old and above</option>
                                    </select>
                                </div>
                                <div class="divider-row"></div>
                                <div class="input-group">
                                    <label for="birthday" class="label-english" class="table-cell">Birthday&emsp;<span>Kaarawan</span>&emsp;</label>
                                    <input type="date" name="birthday" class="birthday-select">
                                </div>
                            </div>
                            
                            <div class="content-divider"></div>

                            <div class="gender-group">
                                <p class="label-english">Gender&emsp;<span>Kasarian</span></p>
                                <div class="radial-row">
                                      <input type="radio" id="female" name="gender" value="Female (Babae)">
                                    <label for="female" class="label-english"><span class="radio-btn"></span>Female <span>(Babae)</span></label>
                                    
                                    <div class="divider-choices"></div>
                                    
                                      <input type="radio" id="male" name="gender" value="Male (Lalaki)" class="radio-btn">
                                      <label for="male" class="label-english"><span class="radio-btn"></span>Male <span>(Lalaki)</span></label>
                                    
                                    <div class="divider-choices"></div>
                                    
                                      <input type="radio" id="prefer" name="gender" value="Prefer not to say" class="radio-btn">
                                      <label for="prefer" class="label-english"><span class="radio-btn"></span>Prefer not to say <span>(Pinipiling hindi sabihin)</span></label>
                                    
                                </div>
                            </div>
                            
                            <div class="content-divider"></div>

                            <div>
                                <label for="address" class="label-english">Full Address&emsp;<span>Buong Address ng Tirahan</span></label><br>
                                <input type="text" id="address" name="address" class="long-textbox"><br>
                            </div>
                            <div class="upload-group">
                                <p class="label-english" id="upload-main-text-english">Upload ID Picture with Complete Address <br>
                                    <a>(Preferably any School ID for 15-17 years old, any Government Issued ID or preferably National ID for 18-30 years old)</a> <br><br>
                                    <span id="upload-main-text-filipino">I-Upload ang litrato ng ID kung saan makikita ang kumpletong address ng tirahan <br>
                                        <a>(Mas mabuti na ID mula sa paaralan para sa mga 15-17 taong gulang, at kahit anong ID mula sa gobyerno, mas mabuting National ID kung mayroon na, para sa mga 18-30 taong gulang)</a></span></p>
                            </div>
                            <div class="button-container">

                                <script>
                                    const actualBtn = document.getElementById('myFile');
                                    const fileChosen = document.getElementById('file-chosen');
                                    actualBtn.addEventListener('change', function () {
                                        fileChosen.textContent = this.files[0].name
                                    })
                                </script>
                                <input type="file" id="myFile" name="validID" hidden/>
                                <label for="myFile" id="fake-button">Choose File</label>
                                <span id="file-chosen">&emsp;no file chosen</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="Details" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div>
                                <label for="civil" class="label-english">Civil Status&emsp;<span>Katayuang Sibil</span></label><br>               
                                <select name="civil" class="dropdown">
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Widowed">Widowed</option>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="working" class="label-english">Working Status&emsp;<span>Katayuan sa Trabaho</span></label><br>               
                                <select name="working" class="dropdown">
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
                                <label for="jobEmployed" class="label-english">If employed, please specify your job. If none, type N/A.&emsp;<span>Kung nagtratrabaho, isulat ang uri ng trabaho. Kung wala, isulat N/A.</span></label><br>
                                <input type="text" id="job" name="jobEmployed" class="long-textbox"><br>
                            </div>
                            <br>
                            <div>
                                <label for="education" class="label-english">Highest Educational Attainment&emsp;<span>Pinakamataaas na Edukasyon na Natamo</span></label><br>               
                                <select name="education" class="dropdown">
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
                                <p class="label-english">Do you identify as a Person With Disability (PWD)?&emsp;<span>Ikaw ba ay nabibilang sa mga Persons With Disabilities (PWD)?</span></p>
                                <div class="radial-row">
                                      <input type="radio" id="yes" name="pwd" value="Yes">
                                      <label for="yes" class="label-english">Yes <span>(Oo)</span></label>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="no" name="pwd" value="No">
                                      <label for="no" class="label-english">No <span>(Hindi)</span></label>
                                </div>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="typePWD" class="label-english">
                                    Type of disability (Type N/A if not applicable)&emsp;<span>Ano ang uri ng kapansanan? Isulat ang N/A kung wala.</span>
                                </label><br>
                                <input type="text" id="typePWD" name="typePWD" class="long-textbox"><br>
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
                                <label for="phone" class="label-english">Contact Number&emsp;<span>Numerong Maaring Tawagan</span></label><br>
                                <input type="tel" id="phone" name="phone" class="long-textbox">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="email" class="label-english">Email Address&emsp;<span>Buong Email Address ng Residente</span></label>
                                <input type="email" id="email" name="email" class="long-textbox">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="fb" class="label-english">Facebook Name or URL&emsp;<span>Pangalan o URLKng Account sa Facebook</span></label>
                                <input type="fb" id="fbname" name="fb" class="long-textbox">
                            </div>
                        </div>
                    </div>

                </div>

                <div id="Family" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div>
                                <label for="mother" class="label-english">Mother's Name&emsp;<span>Pangalan ng iyong Nanay</span></label><br>
                                <input type="text" id="mother" name="mother" class="long-textbox">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <p class="label-english">Mother's Status&emsp;<span>Estado ng iyong Nanay</span></p>
                                <div class="radial-row">
                                      <input type="radio" id="livingm" name="motherstat" value="Living">
                                      <label for="livingm" class="label-english">Living <span>(Buhay)</span></label><br>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="deceasedm" name="motherstat" value="Deceased">
                                      <label for="deceasedm" class="label-english">Deceased <span>(Pumanaw)</span></label><br>
                                </div>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="motherwork" class="label-english">Mother's Occupation&emsp;<span>Trabaho ng iyong Nanay</span></label><br>
                                <input type="text" id="motherwork" name="motherwork" class="long-textbox">
                            </div>
                            <div class="content-divider"></div>

                            <div>
                                <label for="father" class="label-english">Father's Name&emsp;<span>Pangalan ng iyong Tatay</span></label><br>
                                <input type="text" id="father" name="father" class="long-textbox">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <p class="label-english">Father's Status&emsp;<span>Estado ng iyong Tatay</span></p>
                                <div class="radial-row">
                                      <input type="radio" id="livingf" name="fatherstat" value="Living">
                                      <label for="livingf" class="label-english">Living <span>(Buhay)</span></label><br>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="deceasedf" name="fatherstat" value="Deceased">
                                      <label for="deceasedf" class="label-english">Deceased <span>(Pumanaw)</span></label><br>
                                </div>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="fatherwork" class="label-english">Father's Occupation&emsp;<span>Trabaho ng iyong Tatay</span></label><br>
                                <input type="text" id="fatherwork" name="fatherwork" class="long-textbox">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="nosibs" class="label-english">No. of Siblings&emsp;<span>Ilan kayong Magkakapatid?</span></label><br>
                                <input type="number" min="0" value="1" oninput="siblingSelection(this.value)"  id="nosibs" name="nosibs" class="dropdown">
                            </div>

                            <div class="content-divider"></div>

                            <!-- dapat may condition dito ilang no. of siblings? Pending pa here-->
                            <div id="sibSelection" class="original">
                                <label for="workingsib" class="label-english">Sibling Working Status&emsp;<span>Katayuan sa Trabaho</span></label>               
                                <select name="workingsib" id="selection" class="dropdown">
                                    <option value="Degree Holder">Degree Holder</option>
                                    <option value="Working">Working</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Not Applicable">Not Applicable</option>
                                </select>
                            </div>

                            <div id="clonecontainer"></div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="breadwinner" class="label-english">Who is the breadwinner in your family?&emsp;<span>Sino ang kumikita para sa pamilya?</span></label><br>
                                <input type="text" id="breadwinner" name="breadwinner" class="long-textbox">
                            </div>
                        </div>
                    </div> 
                </div>

                <div id="Survey" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <p class="label-english">Are you a registered SK voter?&emsp;<span>Nakapag-rehistro ka ba upang bumoto sa SK?</span></p>
                            <div class="radial-row">  
                                <input type="radio" id="yesvoter" name="voter" value="Yes">
                                  <label for="yesvoter" class="label-english">Yes <span>(Oo)</span></label>
                                <div class="divider-choices"></div>
                                  <input type="radio" id="novoter" name="voter" value="No">
                                  <label for="novoter" class="label-english">No <span>(Hindi)</span></label>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <p class="label-english">Are you a member of an organization?&emsp;<span>Parte ka ba ng isang organisasyon?</span></p>
                                  <div class="radial-row">
                                    <input type="radio" id="yesorg" name="org" value="Yes">
                                      <label for="yesorg" class="label-english">Yes <span>(Oo)</span></label>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="noorg" name="org" value="No">
                                      <label for="noorg" class="label-english">No <span>(Hindi)</span></label>
                                </div>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="orgname" class="label-english">If yes, please specify which organization.&emsp;<span>Kung oo, anong organisasyon?</span></label><br>
                                <input type="text" id="org" name="orgname" class="long-textbox">
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="proj" class="label-english">Are you willing to support the incoming projects of SK-Ibayo Tipas?
                                    <br><span>Handa ka bang suportahan ang mga paparating na proyekto ng SK-Ibayo Tipas?</span></label><br>
                                <div class="radial-row">
                                      <input type="radio" id="yesproj" name="proj" value="Yes">
                                      <label for="yesproj" class="label-english">Yes <span>(Oo)</span></label><br>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="noproj" name="proj" value="No">
                                      <label for="noproj" class="label-english">No <span>(Hindi)</span></label><br>
                                    <div class="divider-choices"></div>
                                      <input type="radio" id="maybeproj" name="proj" value="Maybe">
                                      <label for="maybeproj" class="label-english">Maybe <span>(Hindi Sigurado)</span></label><br>
                                </div>
                            </div>

                            <div class="content-divider"></div>

                            <div>
                                <label for="support" class="label-english">How will you show your support in the upcoming projects?
                                    <br><span>Paano mo maipapakita ang iyong suporta sa mga proyekto ng SK Ibayo Tipas?</span></label><br>
                                <input type="text" id="support" name="support" class="long-textbox">
                            </div>

                            <div class="content-divider"></div>
                            <div>
                                <label for="jobchance" class="label-english">If you are given a chance to have a job, what makes you worthy among others?
                                    <br><span>Kung ikaw ay bibigyan ng pagkakataong magkaroon ng  hanapbuhay, bakit ikaw ang karapat-dapat?</span></label><br>
                                <input type="text" id="message" name="jobchance" class="long-textbox">
                            </div>
                            <div class="content-divider"></div>
                            <div>
                                <label for="message" class="label-english">What would you like to say to the current SK-Council of Ibayo-Tipas?
                                    <br><span>Ano ang iyong mensahe o mungkahi sa kasalukuyang konseho ng Sangguniang Kabataan-Ibayo Tipas?</span></label><br>
                                <input type="text" id="message" name="message" class="long-textbox">

                            </div>
                        </div>
                    </div>
                </div>
                <div id="Vaccination" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div>
                                <p class="label-english">Have you been vaccinated for Covid-19?&emsp;<span>Ikaw ba ay nabakuna na laban Covid-19?</span>
                                </p>

                                  <input type="radio" id="yesvax" name="vax" value="Yes">
                                  <label for="yesvax" class="label-english">Yes <span>(Oo)</span></label><br>
                                <div class="divider-choices"></div>
                                  <input type="radio" id="novax" name="vax" value="No">
                                  <label for="novax" class="label-english">No <span>(Hindi)</span></label><br>
                            </div>
                            <div>
                                <p class="label-english" class="label-english">If not, are you willing to be vaccinated if given the chance?
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
                            <br>
                            <div>
                                <label for="brand" class="label-english">If yes, what brand of vaccine did you receive?&emsp;<span>Kung oo, ano ang brand ng iyong bakuna?</span></label>
                                <select name="brand" class="dropdown">
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
                            <div>
                                <label for="vstatus" class="label-english">What is your Vaccine Status?&emsp;<span>Ano ang istatus ng iyong bakuna?</span> </label>
                                <select name="vstatus" class="dropdown" required >
                                    <option value="Not Vaccinated">Not Vaccinated</option>
                                    <option value="First Dose">First Dose</option>
                                    <option value="Second Dose">Second Dose</option>
                                    <option value="Booster">Booster</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="buttons">
                    <button id = "backButton" type = "button" onclick="prev()" class="previous">Back</button>
                    <div class="divider-content"></div>
                    <button id="nextButton" type="button" onclick="next()" class="next">Proceed</button>
                    <button id="submitButton" type="submit" value="submit" class = "next">Submit</button>
                </div>
            </form>
        </div>

        <!-- remove back in first tab, replace proceed in the last tab with submit-->


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script type="text/javascript">
                        function siblingSelection(times) {
                            $("#clonecontainer").html('');
                            for (var i = 1; i < times; i++) {
                                var clons = $(".original").first().clone();
                                $("#clonecontainer").append(clons);
                            }
                        }

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
                    document.getElementById('nextButton').style.visibility = 'hidden';
                    document.getElementById("submitButton").style.visibility = 'visible';
                    document.getElementById('backButton').style.visibility = 'visible';
                } else if (counter != 5) {
                    if (counter == 0) {
                        document.getElementById('backButton').style.visibility = 'hidden';
                    } else {
                        document.getElementById('backButton').style.visibility = 'visible';
                    }
                    document.getElementById("nextButton").style.visibility = 'visible';
                    document.getElementById("submitButton").style.visibility = 'hidden';
                }
                console.log(tabName);
                console.log(counter);
            }

            function next() {
                counter = (counter + 1) % 6;
                if (counter == 5) {
                    document.getElementById("submitButton").style.visibility = 'visible';
                    document.getElementById("nextButton").style.visibility = 'hidden';
                    document.getElementById('backButton').style.visibility = 'visible';
                }
                document.getElementById('backButton').style.visibility = 'visible';
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

            function prev() {
                counter = (counter - 1) % 6;
                if (counter == 0) {
                    document.getElementById('backButton').style.visibility = 'hidden';
                    document.getElementById("submitButton").style.visibility = 'hidden';
                } else {
                    document.getElementById('backButton').style.visibility = 'visible';
                }
                document.getElementById("submitButton").style.visibility = 'hidden';

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
    </body>
</html> 
