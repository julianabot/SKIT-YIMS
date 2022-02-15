<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Survey Forms/SurveyCSS/FamilyDetails.css" rel="stylesheet" type="text/css">
        <title>Family Details</title>
    </head>
    <body>
        <img src="../img/SK_Logo.png" alt="SK Logo" width="100" height="100">
        <div class="heading">
            <h1>SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>  

        <div class="content">
            <form>
                <div class="mother">
                    <label for="mother">Mother's Name <span>(Pangalan ng iyong Nanay)</span></label><br>
                    <input type="text" id="mother" name="mother">
                </div>
                <div class="mother-status">
                    <p>Mother's Status <span>(Estado ng iyong Nanay)</span></p>
                      <input type="radio" id="alivem" name="alivem" value="alivem">
                      <label for="alivem">Alive <span>(Buhay)</span></label><br>
                      <input type="radio" id="deceasedm" name="deceasedm" value="deceasedm">
                      <label for="deceasedm">Deceased <span>(Pumanaw)</span></label><br>
                </div>
                <br>
                <div class="mother-work">
                    <label for="motherwork">Mother's Occupation <span>(Trabaho ng iyong Nanay)</span></label><br>
                    <input type="text" id="motherwork" name="motherwork">
                </div>
                <br>
                <div class="father">
                    <label for="father">Father's Name <span>(Pangalan ng iyong Tatay)</span></label><br>
                    <input type="text" id="father" name="father">
                </div>
                <div class="father-status">
                    <p>Father's Status <span>(Estado ng iyong Tatay)</span></p>
                      <input type="radio" id="alivem" name="alivef" value="alivef">
                      <label for="alivef">Alive <span>(Buhay)</span></label><br>
                      <input type="radio" id="deceasedf" name="deceasedf" value="deceasedf">
                      <label for="deceasedf">Deceased <span>(Pumanaw)</span></label><br>
                </div>
                <br>
                <div class="father-work">
                    <label for="fatherwork">Father's Occupation <span>(Trabaho ng iyong Tatay)</span></label><br>
                    <input type="text" id="fatherwork" name="fatherwork">
                </div>
                <br>
                <div class="siblings">
                    <label for="nosibs">No. of Siblings <span>(Ilan kayong Magkakapatid)?</span></label><br>
                    <input type="number" id="nosibs" name="nosibs">
                </div>
                <br> 
                <!-- dapat may condition dito ilang no. of siblings? Pending pa here-->
                <div class="working-sib">
                    <label for="workingsib">Sibling Working Status <span>(Katayuan sa Trabaho):</span></label>               
                    <select name="workingsib">
                        <option value="degrees">Degree Holder</option>
                        <option value="workings">Working</option>
                        <option value="unemployeds">Unemployed</option>
                        <option value="students">Full-Time Student</option>
                        <option value="nas">Not Applicable</option>
                    </select>
                </div>
                <br>
                <div class="breadwinner">
                    <label for="breadwinner">Who is the breadwinner in your family? <span>(Sino ang kumikita para sa pamilya?)</span></span></label><br>
                    <input type="text" id="breadwinner" name="breadwinner">
                </div>
                <br>

            </form>

        </div> 
        <div class="buttons">
            <button type="button" class="button-back">Back</button>
            <div class="divider"></div>
            <button type="button" class="button-proceed">Proceed</button>
        </div>
    </body>
</html>
