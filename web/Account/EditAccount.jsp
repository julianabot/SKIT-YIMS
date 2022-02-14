<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account</title>
    </head>
    <body>
        <div style="background-color: cornsilk">
            <div class="first-half" style="background-color: activecaption">
                <h1>picture nung may tao</h1>
                <p>Upload Account Photo</p>
                <input type="file" id="myFile" name="filename">
            </div>

            <div class="second-half" style="background-color: activecaption">
                <h1>Personal Information</h1>
                <h3>Database Manager</h3>

                <p>Position: SK Chairman</p>
                <p>Username: dbmanager1</p>
                <label for="accname">Name:</label>
                <input type="text" id="accname" name="accname"><br>
                <label for="accpwd">Password</label>
                <input type="submit" id = "accpwd" value="Close"> <br>
                <label for="curpwd">Current Password:</label><br>
                <input type="text" id="curpwd" name="curpwd"><br>
                <label for="newpwd">New Password:</label>
                <label for="curnewpwd">Confirm New Password:</label><br>
                <input type="text" id="newpwd" name="newpwd">
                <input type="text" id="curnewpwd" name="curnewpwd"><br>

            </div>
        </div>
    </body>
</html>
