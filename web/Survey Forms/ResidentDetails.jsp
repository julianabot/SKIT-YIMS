<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resident Details</title>
    </head>
    <body>
        <img src="img/SK_Logo.png" alt="SK Logo" width="100" height="100">
        <div style = "background-color: red;">
            <h1>SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>
        <div style="background-color: lightblue">
            <form>
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
                <button type="button">Back</button>
                <button type="button">Proceed</button>

            </form>
        </div>
    </body>
</html>
