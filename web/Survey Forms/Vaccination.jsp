<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vaccination</title>
    </head>
    <body>
        <img src="img/SK_Logo.png" alt="SK Logo" width="100" height="100">
        <div style = "background-color: red;">
            <h1>SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>
        <form>
            <div style="background-color:lightblue">
                <div style="background-color: antiquewhite">
                    <p>Have you been vaccinated for Covid-19? 
                        (Ikaw ba ay nabakuna na laban Covid-19?)
                    </p>
                      <input type="radio" id="yesvax" name="yesvax" value="yesvax">
                      <label for="yesvax">Yes (Oo)</label><br>
                      <input type="radio" id="novax" name="novax" value="novax">
                      <label for="novax">No (Hindi)</label><br>
                </div>
                <div style="background-color: antiquewhite">
                    <p>If not, are you willing to be vaccinated if given the chance?
                        (Kung hindi, may kagustuhan ka ba mabakuna kapag nagkaroon ng pagkakataon?)
                    </p>
                      <input type="radio" id="yeswilling" name="yeswilling" value="yeswilling">
                      <label for="yeswilling">Yes (Oo)</label><br>
                      <input type="radio" id="nowilling" name="nowilling" value="nowilling">
                      <label for="nowilling">No (Hindi)</label><br>
                </div>
                <br>
                <div style="background-color: antiquewhite">
                    <label for="brand">If yes, what brand of vaccine did you receive? Kung oo, ano ang brand ng iyong bakuna?</label>
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
                <div style="background-color: antiquewhite">
                    <label for="vstatus">What is your Vaccine Status? (tagalog version di ko alam) </label>
                    <select name="vstatus">
                        <option value="novaccine">Not Vaccinated</option>
                        <option value="firstdose">First Dose</option>
                        <option value="seconddose">Second Dose</option>
                        <option value="booster">Booster</option>
                    </select>
                </div>

                <button type="button">Back</button>
                <button type="button">Submit</button>
            </div>
        </form>
    </body>
</html>
