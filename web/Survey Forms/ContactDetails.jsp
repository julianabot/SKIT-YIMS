<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Survey Forms/SurveyCSS/ContactDetails.css" rel="stylesheet" type="text/css">
        <title>Contact Details</title>
    </head>
    <body>
        <img src="../img/SK_Logo.png" alt="SK Logo" width="100" height="100">
        <div class="heading">
            <h1>SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>

        <div>
            <div class="content">
                <form>
                    <div class="contact-number">
                        <!-- To be fixed formatting!!! para sa database-->
                        <label for="number">Contact Number <span>(Numerong Maaring Tawagan)</span></label><br>
                        <input type="tel" id="phone" name="phone" pattern="[+]{1}[0-9]{11}">
                    </div>
                    <br>
                    <div class="email-add">
                        <label for="email">Email Address <span>(Buong Email Address ng Residente)</span></label>
                        <input type="email" id="email" name="email">
                    </div>
                    <br>
                    <div class="fb-name">
                        <label for="fbname">Facebook Name <span>(Pangalan ng Account sa Facebook)</span></label>
                        <input type="fbname" id="fbname" name="fbname">
                    </div>
                    <br>
                    <div class="fb-url">
                        <label for="fburl">Facebook URL <span>(URL patungo sa Facebook Profile)</span></label>
                        <input type="fburl" id="fburl" name="fburl">
                    </div>
                </form>
            </div>
            <br>

            <div class="buttons">
                <button type="button" class="button-back">Back</button>
                <div class="divider"></div>
                <button type="button" class="button-proceed">Proceed</button>
            </div>

        </div>
    </body>
</html>
