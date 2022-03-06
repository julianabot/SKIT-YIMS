<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="skLogo" type="image/png" href="../img/SK_Logo.png"/>
        <link href="../Account/AccountCSS/EditProfile.css" rel="stylesheet" type="text/css">
        <title>Profile Account</title>
    </head>
    <body>
        <nav>
            <input id="nav-toggle" type="checkbox">
            <img src="../img/SK_Logo.png" class="header-logo">

            <!--This section contains the "Eruditio Academy" text taken from the webxml-->
            <div class="logo"><%out.print(getServletContext().getInitParameter("header"));%></div>

            <ul class="links">
                <li class="About"><a href="Welcome.jsp">Home</a></li>
                <li class="Events"><a href="ViewDatabase.jsp">Database</a></li>
                <!--Account Tab TBR-->
                <li class="Events"><a href="AccountInformation.jsp">Account</a></li>
                <li class="Login"><a href="Login.jsp" id="Login">Log Out</a></li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>

        <div class="container">
            <!-- <div class="first-half">
                 <img src="../img/Picture-Placeholder.png" class="profile-picture">
                 
                 <p class="upload-ap">Upload Account Photo</p>
                 <div class="button-container">
                     <script>
                         const actualBtn = document.getElementById('myFile');
 
                         const fileChosen = document.getElementById('file-chosen');
 
                         actualBtn.addEventListener('change', function () {
                             fileChosen.textContent = this.files[0].name
                         })
                     </script>
                     <input type="file" id="myFile" name="filename" hidden/>
                     <label for="myFile" id="fake-button">Upload</label>
                     <br>
                     <span id="file-chosen">No file chosen</span>
                 </div>
             </div> -->

            <div class="second-half">
                <h1 class="personal-info">Personal Information</h1>
                <h3 class="role-info">${role}</h3>

                <div class="underline">
                    <p class="displayed-info">Position:&emsp;${role}</p>
                </div>

                <div class="underline">
                    <p class="displayed-info">Username:&emsp;${username}</p>
                </div>

                <p> ${update} ${errorEdit}</p>
                <form action = "../EditNameServlet" method = "POST">
                    <div class="underline">
                        <p class="displayed-info-name">Name:&emsp;${name}</p>
                        <input type="Submit" name="savechanges" value="Save" class="edit">
                    </div>
                    <input type="hidden" name="username" value ="${username}" class="input">
                    <input type="text" name="editname" placeholder="Enter New Name" required class="input-change"><br>
                </form>

                <p> ${update}</p>
                <form action = "../EditPasswordServlet" method = "POST">
                    <div class="underline">
                        <p class="displayed-info-pass">Password:</p>                 
                        <input type="Submit" value="Save" name="savechanges" class="edit" minlength="8">
                    </div>
                    <input type="hidden" name="username" value ="${uUsername}" class="input">
                    <input type="password" name="currpass" placeholder="Enter Current Password"  minlength="8" required class="input-change"><br>
                    <input type="password" name="newpass" placeholder="Enter New Password"  minlength="8" required required class="input-change"><br>
                    <input type="password" name="confpass" placeholder="Enter Confirm New Password"  minlength="8" required required class="input-change"><br>
                </form>

            </div>
        </div>
    </body>
</html>