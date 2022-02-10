<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resident Information</title>
    </head>
    <body>
        <img src="img/SK_Logo.png" alt="SK Logo" width="100" height="100">
        <div style = "background-color: red;">
            <h1>SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>
        <div style = "background-color: lightblue">
            <form>

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
            </form>
            <div style="background-color: antiquewhite">
                <form action="/action_page.php">
                    <input type="file" id="myFile" name="filename">
                    <br>
                    <input type="submit" value="Proceed">
                </form>
            </div>
        </div>
    </body>
</html>
