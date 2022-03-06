<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="skLogo" type="image/png" href="img/SK_Logo.png"/>
        <link href="Account/AccountCSS/AccountInformation.css" rel="stylesheet" type="text/css">
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


                <div class="underline">
                    <p class="displayed-info-name">Name:&emsp;${name}</p>
                    <input type="button" value="Edit" class="edit" onclick="window.location = 'Account/EditProfile.jsp'">
                </div>

                <div class="underline">
                    <p class="displayed-info-pass">Password:</p>
                    <input type="button" value="Edit" class="edit" minlength="8" onclick="window.location = 'Account/EditProfile.jsp'"></button>
                </div>

                <div class="underline">
                    <p class="displayed-info">${update}</p>
                </div>
            </div>
        </div>
    </body>
</html>