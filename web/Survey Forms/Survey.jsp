<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Survey Forms/SurveyCSS/Survey.css" rel="stylesheet" type="text/css">
        <title>Survey</title>
    </head>
    <body>
        <img src="../img/SK_Logo.png" alt="SK Logo" width="100" height="100">
        <div class="heading">
            <h1>SK Ibayo-Tipas:<br>Youth Resident Survey</h1>
        </div>  

        <!--DIV CLASS CONTAINER MAY OR MAY NOT BE REMOVED-->
        <div class="content">
            <form>
                <div class="container">
                    <div class="registered-voter">
                        <p>Are you a registered SK voter? <span>Nakapag-rehistro ka ba upang bumoto sa SK?</span></p>
                          <input type="radio" id="yesvoter" name="yesvoter" value="yesvoter">
                          <label for="yesvoter">Yes <span>(Oo)</span></label><br>
                          <input type="radio" id="novoter" name="novoter" value="novoter">
                          <label for="novoter">No <span>(Hindi)</span></label><br>
                    </div>
                    <div class="member-org">
                        <p>Are you a member of an organization? <span>Parte ka ba ng isang organisasyon?</span></p>
                          <input type="radio" id="yesorg" name="yesorg" value="yesorg">
                          <label for="yesvoter">Yes <span>(Oo)</span></label><br>
                          <input type="radio" id="noorg" name="noorg" value="noorg">
                          <label for="noorg">No <span>(Hindi)</span></label><br>
                    </div>
                    <br>
                    <div class="specify-org">
                        <label for="org">If yes, please specify which organization. <span>(Kung oo, anong organisasyon?)</span></label><br>
                        <input type="text" id="org" name="org">
                    </div>
                    <br>
                    <div class="sk-proj">
                        <label for="proj">Are you willing to support the incoming projects of SK-Ibayo Tipas?
                            <br><span>(Handa ka bang suportahan ang mga paparating na proyekto ng SK-Ibayo Tipas?)</span></label><br>
                          <input type="radio" id="yesproj" name="yesproj" value="yesproj">
                          <label for="yesproj">Yes</label><br>
                          <input type="radio" id="noproj" name="noproj" value="noproj">
                          <label for="noproj">No</label><br>
                          <input type="radio" id="maybeproj" name="noproj" value="noproj">
                          <label for="noproj">Maybe</label><br>
                    </div>
                    <br>
                    <div class="support">
                        <label for="support">How will you show your support in the upcoming projects?
                            <br><span>(Paano mo maipapakita ang iyong suporta sa mga proyekto ng SK Ibayo Tipas?)</span></label><br>
                        <input type="text" id="support" name="support">
                    </div>
                    <br>
                    <div class="message">
                        <label for="message">What would you like to say to the current SK-Council of Ibayo-Tipas?
                            <br><span>(Ano ang iyong mensahe o mungkahi sa kasalukuyang konseho ng Sangguniang Kabataan-Ibayo Tipas?)</span></label><br>
                        <input type="text" id="message" name="message">
                    </div>
                    
                        <p class="link-proceed">Click here to proceed to resident vaccination form. >></p>
                    
                    
                </div>
                <br>
                <div class="button">
                    <button type="button" class="button-back">Back</button>
                </div>
            </form>


        </div>
    </body>
</html>
