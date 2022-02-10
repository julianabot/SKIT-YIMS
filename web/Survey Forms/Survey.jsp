<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Survey</title>
    </head>
    <body>
        <img src="img/SK_Logo.png" alt="SK Logo" width="100" height="100">
        <div style = "background-color: red;">
            <h1>SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>  

        <div style="background-color:lightblue">
            <form>
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
                <br>
                <button type="button">Back</button>
            </form>
        </div>
    </body>
</html>
