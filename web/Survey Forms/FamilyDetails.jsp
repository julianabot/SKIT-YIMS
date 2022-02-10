<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Family Details</title>
    </head>
    <body>
        <img src="img/SK_Logo.png" alt="SK Logo" width="100" height="100">
        <div style = "background-color: red;">
            <h1>SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>  

        <div style="background-color:lightblue">
            <form>
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
                <br>
                <button type="button">Back</button>
                <button type="button">Proceed</button>
            </form>
        </div> 

    </body>
</html>
