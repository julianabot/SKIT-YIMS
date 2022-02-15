<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Survey Forms/SurveyCSS/ResidentInformation.css" rel="stylesheet" type="text/css">
        <title>Resident Information</title>
    </head>
    <body id="body-color">
        <img src="img/SK_Logo.png" id="Logo">
        <div>
            <h1 class="heading">SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>
        <div id="container">
            <form class="form">

                <div>
                    <label for="name" class="label-english">Full Name of Resident <a class="label-filipino">(Buong Pangalan ng Residente)</a></label><br>
                    <input type="text" id="name" name="name" class="long-textbox"><br>
                </div>

                
                
                <div id="row">
                <div id="row-left">
                    <label for="age" class="label-english">Age <a class="label-filipino">(Edad)</a>:</label>
                    <select name="age" class="textbox" id="dropdown">
                        <option value="fourteen">14 years old and below</option>
                        <option value="fifteen">15-20 years old</option>
                        <option value="twentyone">21-30 years old</option>
                        <option value="thirtyone">31 years old and above</option>
                    </select>
                </div>
                <div id="row-right">
                    <label for="birthday" class="label-english">Birthday <a class="label-filipino">(Kaarawan)</a>:</label>
                    <input type="date" placeholder="mm-dd-yyyy" name="birthday" class="textbox" id="birthday">

                </div>
                </div>

                <br>
                <div >
                    <p class="label-english">Gender <a class="label-filipino">(Kasarian)</a></p>
                    <div class="sex-container">
                    <div  class="sex-categories">
                      <input type="radio" id="female" name="female" value="female">
                      <label for="female" class="label-english">Female <a class="label-filipino">(Babae)</a></label><br>
                    </div>
                    <div  class="sex-categories">
                      <input type="radio" id="male" name="male" value="male">
                      <label for="male" class="label-english">Male <a class="label-filipino">(Lalaki)</a></label><br>
                    </div>
                    <div  class="sex-categories">
                      <input type="radio" id="prefer" name="prefer" value="prefer">
                      <label for="prefer" class="label-english">Prefer not to say <a class="label-filipino">(Pinipiling hindi sabihin)</a></label>
                    </div>
                </div>
                </div>
                <br>
                <div>
                    <label for="address" class="label-english">Full Address <a class="label-filipino">(Buong Address ng Tirahan)</a></label><br>
                    <input type="text" id="address" name="address" class="long-textbox"><br>

                </div>
                <br>
                <div class="upload-text">
                    <p class="label-english">Upload ID Picture with Complete Address <br>
                        (Preferably any School ID for 15-17 years old, any Government Issued ID or preferably National ID for 18-30 years old) <br>
                        <a class="label-filipino">I-Upload ang litrato ng ID kung saan makikita ang kumpletong address ng tirahan <br>
                            (Mas mabuti na ID mula sa paaralan para sa mga 15-17 taong gulang, at kahit anong ID mula sa gobyerno, mas mabuting National ID kung mayroon na, para sa mga 18-30 taong gulang)</a></p>
                </div>
            </form>
            <div>
                <form action="/action_page.php">
                    <input type="file" id="myFile" name="filename" id="upload-button">
                    <br>
                    <input type="submit" value="Proceed" id="proceed-button">
                </form>
            </div>
        </div>
    </body>
</html>
