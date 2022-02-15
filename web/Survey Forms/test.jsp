<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../Survey Forms/SurveyCSS/test.css" rel="stylesheet" type="text/css">
        <style>
            body {font-family: Arial;}

            /* Style the tab */
            .tab {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #f1f1f1;
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
                font-size: 17px;
            }

            /* Change background color of buttons on hover */
            .tab button:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            .tab button.active {
                background-color: #ccc;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border: 1px solid #ccc;
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
            <button style="display:none;" class="tablinks" onclick="showTab(event, 'Vaccination')">Vaccination</button>
        </div>

        <div overflow:auto>
            <form>
                <div id="Info" class="tabcontent">
                    <div class="container-main">
                        <div >
                            <label for="name" class="label-english">Full Name of Resident &emsp; <span>Buong Pangalan ng Residente</span></label><br>
                            <input type="text" id="name" name="name"><br>
                        </div>
                        <br>
                        <div >
                            <label for="age" class="label-english">Age &emsp; <span>Edad</span>:</label>
                            <select name="age">
                                <option value="fourteen">14 years old and below</option>
                                <option value="fifteen">15-20 years old</option>
                                <option value="twentyone">21-30 years old</option>
                                <option value="thirtyone">31 years old and above</option>
                            </select>
                        </div>
                        <div >
                            <label for="birthday" class="label-english">Birthday &emsp; <span>Kaarawan</span> : </label>
                            <input type="date" placeholder="mm-dd-yyyy" name="birthday">
                        </div>
                        <br>
                        <div >
                            <p class="label-english">Gender &emsp; <span>Kasarian</span></p>
                              <input type="radio" id="gender" name="gender" value="female">
                              <label for="gender" class="label-english">Female &emsp; <span>Babae</span></label><br>
                              <input type="radio" id="gender" name="gender" value="male">
                              <label for="gender" class="label-english">Male &emsp; <span>Lalaki</span></label><br>
                              <input type="radio" id="gender" name="gender" value="prefer">
                              <label for="gender" class="label-english">Prefer not to say &emsp; <span>Pinipiling hindi sabihin</span></label>
                        </div>
                        <br>
                        <div >
                            <label for="address" class="label-english">Full Address &emsp; <span>Buong Address ng Tirahan</span></label><br>
                            <input type="text" id="address" name="address"><br>
                        </div>
                        <br>
                        <div >
                            <p class="label-english">Upload ID Picture with Complete Address <br>
                                (Preferably any School ID for 15-17 years old, any Government Issued ID or preferably National ID for 18-30 years old) <br>
                                &emsp; <span>I-Upload ang litrato ng ID kung saan makikita ang kumpletong address ng tirahan <br>
                                    (Mas mabuti na ID mula sa paaralan para sa mga 15-17 taong gulang, at kahit anong ID mula sa gobyerno, mas mabuting National ID kung mayroon na, para sa mga 18-30 taong gulang)</span></p>
                        </div>
                        <div>
                            <input type="file" id="myFile" name="filename">
                        </div>
                    </div>
                </div>

                <div id="Details" class="tabcontent">
                    <div class="container-main">
                        <div>
                            <label for="civil" class="label-english">Civil Status &emsp; <span>Katayuang Sibil</span></label>               
                            <select name="civil">
                                <option value="single">Single</option>
                                <option value="married">Married</option>
                                <option value="widowed">Widowed</option>
                            </select>
                        </div>
                        <br>
                        <div>
                            <label for="working" class="label-english">Working Status &emsp; <span>Katayuan sa Trabaho</span></label>               
                            <select name="working">
                                <option value="fstudent">Full-Time Student</option>
                                <option value="wstudent">Working Student</option>
                                <option value="osy">Out of School Youth</option>
                                <option value="employed">Working/Employed</option>
                                <option value="unemployed">Unemployed</option>
                                <option value="looking">Currently Looking For a Job</option>
                                <!-- others with input type field-->
                            </select>
                        </div>
                        <br>
                        <div>
                            <label for="job" class="label-english">If employed, please specify your job. If none, type N/A. &emsp; <span>Kung nagtratrabaho, isulat ang uri ng trabaho. Kung wala, isulat N/A.</span></label><br>
                            <input type="text" id="job" name="job"><br>
                        </div>
                        <br>
                        <div>
                            <label for="education" class="label-english">Highest Educational Attainment &emsp; <span>Pinakamataaas na Edukasyon na Natamo</span></label>               
                            <select name="education">
                                <option value="elementary">Elementary Level</option>
                                <option value="elemgrad">Elementary Graduate</option>
                                <option value="jhs">Junior High School Level</option>
                                <option value="jhsgrad">Junior High School Graduate</option>
                                <option value="shs">Senior High School Level</option>
                                <option value="shsgrad">Senior High School Graduate</option>
                                <option value="college">College Level</option>
                                <option value="collegegrad">College Graduate</option>
                                <!-- others with input type field-->
                            </select>
                        </div>
                        <br>
                        <div>
                            <p class="label-english">Do you identify as a Person With Disability (PWD)?
                                <br> &emsp; <span> Ikaw ba ay nabibilang sa mga Persons With Disabilities (PWD)?</span></p>
                              <input type="radio" id="pwd" name="pwd" value="pwd">
                              <label for="pwd">Yes&emsp;<span>Oo</span></label><br>
                              <input type="radio" id="pwd" name="pwd" value="pwd">
                              <label for="pwd">No&emsp;<span>Hindi</span></label><br>
                        </div>
                        <br>
                        <div>
                            <label for="typePWD" class="label-english">
                                Type of disability (Type N/A if not applicable)<br>
                                &emsp; <span>Ano ang uri ng kapansanan? Isulat ang N/A kung wala.</span>
                            </label><br>
                            <input type="text" id="typePWD" name="typePWD"><br>
                        </div>
                        <br>
                    </div>
                </div>

                <div id="Contact" class="tabcontent">
                    <div class="container-main">
                        <div>
                            <!-- To be fixed formatting!!! para sa database-->
                            <label for="number" class="label-english">Contact Number &emsp; <span>Numerong Maaring Tawagan</span></label><br>
                            <input type="tel" id="phone" name="phone" pattern="[+]{1}[0-9]{11}">
                        </div>
                        <br>
                        <div>
                            <label for="email" class="label-english">Email Address &emsp; <span>Buong Email Address ng Residente</span></label>
                            <input type="email" id="email" name="email">
                        </div>
                        <br>
                        <div>
                            <label for="fbname" class="label-english">Facebook Name &emsp; <span>Pangalan ng Account sa Facebook</span></label>
                            <input type="fbname" id="fbname" name="fbname">
                        </div>
                        <br>
                        <div>
                            <label for="fburl" class="label-english">Facebook URL &emsp; <span>URL patungo sa Facebook Profile</span></label>
                            <input type="fburl" id="fburl" name="fburl">
                        </div>
                    </div>
                </div>

                <div id="Family" class="tabcontent">
                    <div class="container-main">
                        <div>
                            <label for="mother">Mother's Name &emsp; <span>Pangalan ng iyong Nanay</span></label><br>
                            <input type="text" id="mother" name="mother">
                        </div>
                        <div>
                            <p class="label-english">Mother's Status &emsp; <span>Estado ng iyong Nanay</span></p>
                              <input type="radio" id="motherstat" name="motherstat" value="alivem">
                              <label for="motherstat" class="label-english">Alive &emsp; <span>Buhay</span></label><br>
                              <input type="radio" id="motherstat" name="motherstat" value="deceasedm">
                              <label for="motherstat" class="label-english">Deceased &emsp; <span>Pumanaw</span></label><br>
                        </div>
                        <br>
                        <div>
                            <label for="motherwork" class="label-english">Mother's Occupation &emsp; <span>Trabaho ng iyong Nanay</span></label><br>
                            <input type="text" id="motherwork" name="motherwork">
                        </div>
                        <br>
                        <div>
                            <label for="father" class="label-english">Father's Name &emsp; <span>Pangalan ng iyong Tatay</span></label><br>
                            <input type="text" id="father" name="father">
                        </div>
                        <div>
                            <p class="label-english">Father's Status &emsp; <span>Estado ng iyong Tatay</span></p>
                              <input type="radio" id="fatherstat" name="fatherstat" value="alivef">
                              <label for="fatherstat" class="label-english">Alive &emsp; <span>Buhay</span></label><br>
                              <input type="radio" id="fatherstat" name="fatherstat" value="deceasedf">
                              <label for="fatherstat" class="label-english">Deceased &emsp; <span>Pumanaw</span></label><br>
                        </div>
                        <br>
                        <div>
                            <label for="fatherwork" class="label-english">Father's Occupation &emsp; <span>Trabaho ng iyong Tatay</span></label><br>
                            <input type="text" id="fatherwork" name="fatherwork">
                        </div>
                        <br>
                        <div>
                            <label for="nosibs" class="label-english">No. of Siblings &emsp; <span>Ilan kayong Magkakapatid?</span></label><br>
                            <input type="number" id="nosibs" name="nosibs">
                        </div>
                        <br> 
                        <!-- dapat may condition dito ilang no. of siblings? Pending pa here-->
                        <div>
                            <label for="workingsib" class="label-english">Sibling Working Status &emsp; <span>Katayuan sa Trabaho)</span>:</label>               
                            <select name="workingsib">
                                <option value="degrees">Degree Holder</option>
                                <option value="workings">Working</option>
                                <option value="unemployeds">Unemployed</option>
                                <option value="students">Full-Time Student</option>
                                <option value="nas">Not Applicable</option>
                            </select>
                        </div>
                        <br>
                        <div>
                            <label for="breadwinner" class="label-english">Who is the breadwinner in your family? &emsp; <span>Sino ang kumikita para sa pamilya?</span></label><br>
                            <input type="text" id="breadwinner" name="breadwinner">
                        </div>
                    </div> 
                </div>

                <div id="Survey" class="tabcontent">
                    <div class="container-main">
                        <div>
                            <p>Are you a registered SK voter? &emsp; <span>Nakapag-rehistro ka ba upang bumoto sa SK?</span></p>
                              <input type="radio" id="voter" name="voter" value="yesvoter">
                              <label for="voter">Yes &emsp; <span>Oo</span></label><br>
                              <input type="radio" id="voter" name="voter" value="novoter">
                              <label for="voter">No &emsp; <span>Hindi</span></label><br>
                        </div>
                        <div>
                            <p class="label-english">Are you a member of an organization? &emsp; <span>Parte ka ba ng isang organisasyon?</span></p>
                              <input type="radio" id="org" name="org" value="yesorg">
                              <label for="org">Yes &emsp; <span>Oo</span></label><br>
                              <input type="radio" id="org" name="org" value="noorg">
                              <label for="org">No &emsp; <span>Hindi</span></label><br>
                        </div>
                        <br>
                        <div>
                            <label for="org" class="label-english">If yes, please specify which organization. &emsp; <span>Kung oo, anong organisasyon?</span></label><br>
                            <input type="text" id="org" name="org">
                        </div>
                        <div>
                            <label for="proj" class="label-english">Are you willing to support the incoming projects of SK-Ibayo Tipas?
                                <br>&emsp; <span>Handa ka bang suportahan ang mga paparating na proyekto ng SK-Ibayo Tipas?</span></label><br>
                              <input type="radio" id="proj" name="proj" value="yesproj">
                              <label for="proj">Yes&emsp;<span>Oo</span></label><br>
                              <input type="radio" id="noproj" name="proj" value="noproj">
                              <label for="proj">No&emsp;<span>Hindi</span></label><br>
                              <input type="radio" id="proj" name="proj" value="maybeproj">
                              <label for="proj">Maybe&emsp;<span>Hindi Sigurado</span></label><br>
                        </div>
                        <div>
                            <label for="support" class="label-english">How will you show your support in the upcoming projects?
                                <br>&emsp; <span>Paano mo maipapakita ang iyong suporta sa mga proyekto ng SK Ibayo Tipas?</span></label><br>
                            <input type="text" id="support" name="support">
                        </div>
                        <div>
                            <label for="message" class="label-english">What would you like to say to the current SK-Council of Ibayo-Tipas?
                                <br>&emsp; <span>Ano ang iyong mensahe o mungkahi sa kasalukuyang konseho ng Sangguniang Kabataan-Ibayo Tipas?</span></label><br>
                            <input type="text" id="message" name="message">
                        </div>
                        <p>Click here to proceed to resident vaccination form. >></p>
                    </div>
                </div>
                <div id="Vaccination" class="tabcontent">
                    <div class="container-main">
                        <div>
                            <p class="label-english">Have you been vaccinated for Covid-19? 
                                &emsp; <span>Ikaw ba ay nabakuna na laban Covid-19?</span>
                            </p>
                              <input type="radio" id="yesvax" name="yesvax" value="yesvax">
                              <label for="yesvax" class="label-english">Yes &emsp; <span>Oo</span></label><br>
                              <input type="radio" id="novax" name="novax" value="novax">
                              <label for="novax" class="label-english">No &emsp; <span>Hindi</span></label><br>
                        </div>
                        <div>
                            <p class="label-english" class="label-english">If not, are you willing to be vaccinated if given the chance?
                                &emsp; <span>Kung hindi, may kagustuhan ka ba mabakuna kapag nagkaroon ng pagkakataon?</span>
                            </p>
                              <input type="radio" id="yeswilling" name="yeswilling" value="yeswilling">
                              <label for="yeswilling" class="label-english">Yes &emsp; <span>Oo</span></label><br>
                              <input type="radio" id="nowilling" name="nowilling" value="nowilling">
                              <label for="nowilling" class="label-english">No &emsp; <span>Hindi</span></label><br>
                        </div>
                        <br>
                        <div>
                            <label for="brand" class="label-english">If yes, what brand of vaccine did you receive? &emsp; <span>Kung oo, ano ang brand ng iyong bakuna?</span></label>
                            <select name="brand">
                                <option value="pfizer">Pfizer-BioNTech</option>
                                <option value="oxford">Oxford-AstraZeneca</option>
                                <option value="sinovac">CoronaVac (Sinovac)</option>
                                <option value="sputnik">Gamaleya Sputnik V</option>
                                <option value="jnj">Johnson and Johnson's Janssen</option>
                                <option value="bharat">Bharat BioTech</option>
                                <option value="moderna">Moderna</option>
                                <option value="sinopharma">Sinopharm</option>
                            </select>
                        </div>
                        <div>
                            <label for="vstatus" class="label-english">What is your Vaccine Status? &emsp; <span>Ano ang istatus ng iyong bakuna?</span> </label>
                            <select name="vstatus">
                                <option value="novaccine">Not Vaccinated</option>
                                <option value="firstdose">First Dose</option>
                                <option value="seconddose">Second Dose</option>
                                <option value="booster">Booster</option>
                            </select>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- remove back in first tab, replace proceed in the last tab with submit-->
        <button onclick="prev()" class="previous">Back</button>
        <button onclick="next()" class="next">Proceed</button>

        <script>
            var counter = 0;
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
            }

            function next() {
                counter = (counter + 1) % 5;

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
                document.getElementByClassName("tabcontent").style.display = "block";
            }

            function prev() {
                counter = (counter - 1) % 5;
                if (counter == -1)
                    counter = 2;

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
                document.getElementByClassName("tabcontent").style.display = "block";
            }

            // Get the element with id="defaultOpen" and click on it
            document.getElementById("defaultOpen").click();
            evt.currentTarget.className += " active";
        </script>
    </body>
</html> 
