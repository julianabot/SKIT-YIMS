<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <img src="img/SK_Logo.png" alt="SK Logo" width="100" height="100">
        <div style = "background-color: red;">
            <h1>SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>

        <div class="tab">
            <button class="tablinks" onclick="showTab(event, 'Info')" id="defaultOpen">Resident Information</button>
            <button class="tablinks" onclick="showTab(event, 'Details')">Resident Details</button>
            <button class="tablinks" onclick="showTab(event, 'Contact')">Contact Details</button>
            <button class="tablinks" onclick="showTab(event, 'Family')">Family Details</button>
            <button class="tablinks" onclick="showTab(event, 'Survey')">Survey</button>
        </div>

        <div style="background-color: aqua" overflow:auto>
            <form>
                <div id="Info" class="tabcontent">
                    <div style = "background-color: lightblue">
                        <div style="background-color: antiquewhite">
                            <label for="name">Full Name of Resident (Buong Pangalan ng Residente)</label><br>
                            <input type="text" id="name" name="name"><br>
                        </div>

                        <br>

                        <div style="background-color: antiquewhite">
                            <label for="age">Age (Edad):</label>
                            <select name="age">
                                <option value="fourteen">14 years old and below</option>
                                <option value="fifteen">15-20 years old</option>
                                <option value="twentyone">21-30 years old</option>
                                <option value="thirtyone">31 years old and above</option>
                            </select>
                        </div>
                        <div style="background-color: antiquewhite">
                            <label for="birthday">Birthday (Kaarawan):</label>
                            <input type="date" placeholder="mm-dd-yyyy" name="birthday">

                        </div>

                        <br>
                        <div style="background-color: antiquewhite">
                            <p>Gender (Kasarian)</p>
                              <input type="radio" id="female" name="female" value="female">
                              <label for="female">Female (Babae)</label><br>
                              <input type="radio" id="male" name="male" value="male">
                              <label for="male">Male (Lalaki)</label><br>
                              <input type="radio" id="prefer" name="prefer" value="prefer">
                              <label for="prefer">Prefer not to say</label>

                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="address">Full Address (Buong Address ng Tirahan)</label><br>
                            <input type="text" id="address" name="address"><br>

                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <p>Upload ID Picture with Complete Address <br>
                                (Preferably any School ID for 15-17 years old, any Government Issued ID or preferably National ID for 18-30 years old) <br>
                                I-Upload ang litrato ng ID kung saan makikita ang kumpletong address ng tirahan <br>
                                (Mas mabuti na ID mula sa paaralan para sa mga 15-17 taong gulang, at kahit anong ID mula sa gobyerno, mas mabuting National ID kung mayroon na, para sa mga 18-30 taong gulang)</p>
                        </div>
                        <div style="background-color: antiquewhite">
                            <input type="file" id="myFile" name="filename">

                        </div>
                    </div>
                </div>

                <div id="Details" class="tabcontent">
                    <div style="background-color: lightblue">

                        <div style="background-color: antiquewhite">
                            <label for="civil">Civil Status (Katayuang Sibil):</label>               
                            <select name="civil">
                                <option value="single">Single</option>
                                <option value="married">Married</option>
                                <option value="widowed">Widowed</option>
                            </select>
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="working">Working Status (Katayuan sa Trabaho):</label>               
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
                        <div style="background-color: antiquewhite">
                            <label for="job">If employed, please specify your job. If none, type N/A. (Kung nagtratrabaho, isulat ang uri ng trabaho. Kung wala, isulat N/A).</label><br>
                            <input type="text" id="job" name="job"><br>
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="education">Highest Educational Attainment (Pinakamataaas na Edukasyon na Natamo):</label>               
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
                        <div style="background-color: antiquewhite">
                            <p>Do you identify as a Person With Disability (PWD)?
                                <br> Ikaw ba ay nabibilang sa mga Persons With Disabilities (PWD)?</p>
                              <input type="radio" id="yespwd" name="yespwd" value="yespwd">
                              <label for="yespwd">Yes</label><br>
                              <input type="radio" id="nopwd" name="nopwd" value="nopwd">
                              <label for="nopwd">No</label><br>
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="typePWD">
                                Type of disability (Type N/A if not applicable)<br>
                                Ano ang uri ng kapansanan? Isulat ang N/A kung wala.
                            </label><br>
                            <input type="text" id="typePWD" name="typePWD"><br>
                        </div>
                        <br>
                    </div>
                </div>

                <div id="Contact" class="tabcontent">
                    <div style="background-color: lightblue">
                        <div style="background-color: antiquewhite">
                            <!-- To be fixed formatting!!! para sa database-->
                            <label for="number">Contact Number (Numerong Maaring Tawagan)</label><br>
                            <input type="tel" id="phone" name="phone" pattern="[+]{1}[0-9]{11}">
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="email">Email Address (Buong Email Address ng Residente)</label>
                            <input type="email" id="email" name="email">
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="fbname">Facebook Name (Pangalan ng Account sa Facebook)</label>
                            <input type="fbname" id="fbname" name="fbname">
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="fburl">Facebook URL (URL patungo sa Facebook Profile)</label>
                            <input type="fburl" id="fburl" name="fburl">
                        </div>
                    </div>
                </div>

                <div id="Family" class="tabcontent">
                    <div style="background-color:lightblue">
                        <div style="background-color: antiquewhite">
                            <label for="mother">Mother's Name (Pangalan ng iyong Nanay)</label><br>
                            <input type="text" id="mother" name="mother">
                        </div>
                        <div style="background-color: antiquewhite">
                            <p>Mother's Status (Estado ng iyong Nanay)</p>
                              <input type="radio" id="alivem" name="alivem" value="alivem">
                              <label for="alivem">Alive (Buhay)</label><br>
                              <input type="radio" id="deceasedm" name="deceasedm" value="deceasedm">
                              <label for="deceasedm">Deceased (Pumanaw)</label><br>
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="motherwork">Mother's Occupation (Trabaho ng iyong Nanay)</label><br>
                            <input type="text" id="motherwork" name="motherwork">
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="father">Father's Name (Pangalan ng iyong Tatay)</label><br>
                            <input type="text" id="father" name="father">
                        </div>
                        <div style="background-color: antiquewhite">
                            <p>Father's Status (Estado ng iyong Tatay)</p>
                              <input type="radio" id="alivem" name="alivef" value="alivef">
                              <label for="alivef">Alive (Buhay)</label><br>
                              <input type="radio" id="deceasedf" name="deceasedf" value="deceasedf">
                              <label for="deceasedf">Deceased (Pumanaw)</label><br>
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="fatherwork">Father's Occupation (Trabaho ng iyong Tatay)</label><br>
                            <input type="text" id="fatherwork" name="fatherwork">
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="nosibs">No. of Siblings (Ilan kayong Magkakapatid)?</label><br>
                            <input type="number" id="nosibs" name="nosibs">
                        </div>
                        <br> 
                        <!-- dapat may condition dito ilang no. of siblings? Pending pa here-->
                        <div style="background-color: antiquewhite">
                            <label for="workingsib">Sibling Working Status (Katayuan sa Trabaho):</label>               
                            <select name="workingsib">
                                <option value="degrees">Degree Holder</option>
                                <option value="workings">Working</option>
                                <option value="unemployeds">Unemployed</option>
                                <option value="students">Full-Time Student</option>
                                <option value="nas">Not Applicable</option>
                            </select>
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="breadwinner">Who is the breadwinner in your family? Sino ang kumikita para sa pamilya?</label><br>
                            <input type="text" id="breadwinner" name="breadwinner">
                        </div>
                    </div> 
                </div>

                <div id="Survey" class="tabcontent">
                    <div style="background-color:lightblue">
                        <div style="background-color: antiquewhite">
                            <p>Are you a registered SK voter? Nakapag-rehistro ka ba upang bumoto sa SK?</p>
                              <input type="radio" id="yesvoter" name="yesvoter" value="yesvoter">
                              <label for="yesvoter">Yes (Oo)</label><br>
                              <input type="radio" id="novoter" name="novoter" value="novoter">
                              <label for="novoter">No (Hindi)</label><br>
                        </div>
                        <div style="background-color: antiquewhite">
                            <p>Are you a member of an organization? Parte ka ba ng isang organisasyon?</p>
                              <input type="radio" id="yesorg" name="yesorg" value="yesorg">
                              <label for="yesvoter">Yes (Oo)</label><br>
                              <input type="radio" id="noorg" name="noorg" value="noorg">
                              <label for="noorg">No (Hindi)</label><br>
                        </div>
                        <br>
                        <div style="background-color: antiquewhite">
                            <label for="org">If yes, please specify which organization. (Kung oo, anong organisasyon?)</label><br>
                            <input type="text" id="org" name="org">
                        </div>
                        <div style="background-color: antiquewhite">
                            <label for="proj">Are you willing to support the incoming projects of SK-Ibayo Tipas?
                                <br>(Handa ka bang suportahan ang mga paparating na proyekto ng SK-Ibayo Tipas?)</label><br>
                              <input type="radio" id="yesproj" name="yesproj" value="yesproj">
                              <label for="yesproj">Yes</label><br>
                              <input type="radio" id="noproj" name="noproj" value="noproj">
                              <label for="noproj">No</label><br>
                              <input type="radio" id="maybeproj" name="noproj" value="noproj">
                              <label for="noproj">Maybe</label><br>
                        </div>
                        <div style="background-color: antiquewhite">
                            <label for="support">How will you show your support in the upcoming projects?
                                <br>(Paano mo maipapakita ang iyong suporta sa mga proyekto ng SK Ibayo Tipas?)</label><br>
                            <input type="text" id="support" name="support">
                        </div>
                        <div style="background-color: antiquewhite">
                            <label for="message">What would you like to say to the current SK-Council of Ibayo-Tipas?
                                <br>(Ano ang iyong mensahe o mungkahi sa kasalukuyang konseho ng Sangguniang Kabataan-Ibayo Tipas?)</label><br>
                            <input type="text" id="message" name="message">
                        </div>
                        <p>Click here to proceed to resident vaccination form. >></p>
                    </div>
                </div>
            </form>
        </div>


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
