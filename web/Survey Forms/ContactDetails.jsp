<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Details</title>
    </head>
    <body>
        <img src="img/SK_Logo.png" alt="SK Logo" width="100" height="100">
        <div style = "background-color: red;">
            <h1>SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>

        <div style="background-color: lightblue">
            <form>
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
                <br>
                <button type="button">Back</button>
                <button type="button">Proceed</button>
            </form>
        </div>
    </body>
</html>
