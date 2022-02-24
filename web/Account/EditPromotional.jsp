<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="skLogo" type="image/png" href="../img/SK_Logo.png"/>
        <link href="../Account/AccountCSS/EditPromotional.css" rel="stylesheet" type="text/css">
        <title>Edit Promotional Page</title>
    </head>
    <body>
        <!--<nav>
            <input id="nav-toggle" type="checkbox">
            <img src="../img/SK_Logo.png" class="header-logo">

            <!--This section contains the "Eruditio Academy" text taken from the webxml--
            <div class="logo"><%out.print(getServletContext().getInitParameter("header"));%></div>

            <ul class="links">
                <li class="About"><a href="Welcome.jsp">Home</a></li>
                <li class="Events"><a href="ViewDatabase.jsp">Database</a></li>
                <!--Account Tab TBR--
                <li class="Events"><a href="AccountInformation.jsp">Account</a></li>
                <li class="Login"><a href="Login.jsp" id="Login">Log Out</a></li>
            </ul>
            <label for="nav-toggle" class="icon-burger">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </label>
        </nav>-->
        <div class="container">
            <form>
                <div class="container-main">
                    <div class="content-container">
                        <h1 class="section-title">Edit Hero Section</h1>
                        <div class="row">
                            <div class="label-half">
                                <label for="title" class="label-text">Edit Title:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="title" name="title" class="textbox">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="label-half">
                                <label for="body" class="label-text">Edit Body:</label>
                            </div>
                            <div class="input-half">
                                <textarea id="body" name="body" class="textbox-body"></textarea>
                            </div>
                        </div>
                        <br>
                        <div class="underline"></div>
                        <h1 class="section-title">Edit Events Section</h1>
                        <div class="row">
                            <div class="label-half">
                                <label for="event1" class="label-text">Edit Event Title:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="event1" name="event1" class="textbox">
                            </div>
                            <div class="label-half">
                                <label for="file1" class="label-text">Upload Image:</label>
                            </div>
                            <div class="input-half">
                                <div class="button-container">
                                    <script>
                                        const actualBtn = document.getElementById('myFile');

                                        const fileChosen = document.getElementById('file-chosen');

                                        actualBtn.addEventListener('change', function () {
                                            fileChosen.textContent = this.files[0].name
                                        })
                                    </script>
                                    <input type="file" id="myFile" name="filename" hidden/>
                                    <label for="myFile" id="fake-button">Choose File</label>
                                    <span id="file-chosen">&emsp;No file chosen</span>
                                </div>
                            </div>
                            <div class="label-half">
                                <label for="link1" class="label-text">Link:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="link1" name="link1" class="textbox"> 
                            </div>

                        </div>
                        <br>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="label-half">
                                <label for="event2" class="label-text">Edit Event Title:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="event1" name="event2" class="textbox"> <br>
                            </div>
                            <div class="label-half">
                                <label for="file2" class="label-text">Upload Image:</label>
                            </div>
                            <div class="input-half">
                                <div class="button-container">
                                    <script>
                                        const actualBtn = document.getElementById('myFile');

                                        const fileChosen = document.getElementById('file-chosen');

                                        actualBtn.addEventListener('change', function () {
                                            fileChosen.textContent = this.files[0].name
                                        })
                                    </script>
                                    <input type="file" id="myFile" name="filename" hidden/>
                                    <label for="myFile" id="fake-button">Choose File</label>
                                    <span id="file-chosen">&emsp;No file chosen</span>
                                </div>
                            </div>
                            <div class="label-half">
                                <label for="link2" class="label-text">Link:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="link1" name="link2" class="textbox"> 
                            </div>
                        </div>
                        <br>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="label-half">
                                <label for="event3" class="label-text">Edit Event Title:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="event1" name="event3" class="textbox"> <br>
                            </div>
                            <div class="label-half">
                                <label for="file3" class="label-text">Upload Image:</label>
                            </div>
                            <div class="input-half">
                                <div class="button-container">
                                    <script>
                                        const actualBtn = document.getElementById('myFile');

                                        const fileChosen = document.getElementById('file-chosen');

                                        actualBtn.addEventListener('change', function () {
                                            fileChosen.textContent = this.files[0].name
                                        })
                                    </script>
                                    <input type="file" id="myFile" name="filename" hidden/>
                                    <label for="myFile" id="fake-button">Choose File</label>
                                    <span id="file-chosen">&emsp;No file chosen</span>
                                </div>
                            </div>
                            <div class="label-half">
                                <label for="link3" class="label-text">Link:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="link1" name="link3" class="textbox"> 
                            </div>

                        </div>
                        <br>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="label-half">
                                <label for="event4" class="label-text">Edit Event Title:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="event1" name="event4" class="textbox"> <br>
                            </div>
                            <div class="label-half">
                                <label for="file4" class="label-text">Upload Image:</label>
                            </div>
                            <div class="input-half">
                                <div class="button-container">
                                    <script>
                                        const actualBtn = document.getElementById('myFile');

                                        const fileChosen = document.getElementById('file-chosen');

                                        actualBtn.addEventListener('change', function () {
                                            fileChosen.textContent = this.files[0].name
                                        })
                                    </script>
                                    <input type="file" id="myFile" name="filename" hidden/>
                                    <label for="myFile" id="fake-button">Choose File</label>
                                    <span id="file-chosen">&emsp;No file chosen</span>
                                </div>
                            </div>
                            <div class="label-half">
                                <label for="link4" class="label-text">Link:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="link1" name="link4" class="textbox"> 
                            </div>

                        </div>
                        <br>
                        <hr>
                        <br>
                        <div class="row">
                            <div class="label-half">
                                <label for="event5" class="label-text">Edit Event Title:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="event1" name="event5" class="textbox"> <br>
                            </div>
                            <div class="label-half">
                                <label for="file5" class="label-text">Upload Image:</label>
                            </div>
                            <div class="input-half">
                                <div class="button-container">
                                    <script>
                                        const actualBtn = document.getElementById('myFile');

                                        const fileChosen = document.getElementById('file-chosen');

                                        actualBtn.addEventListener('change', function () {
                                            fileChosen.textContent = this.files[0].name
                                        })
                                    </script>
                                    <input type="file" id="myFile" name="filename" hidden/>
                                    <label for="myFile" id="fake-button">Choose File</label>
                                    <span id="file-chosen">&emsp;No file chosen</span>
                                </div>
                            </div>
                            <div class="label-half">
                                <label for="link5" class="label-text">Link:</label>
                            </div>
                            <div class="input-half">
                                <input type="text" id="link1" name="link5" class="textbox"> 
                            </div>

                        </div>
                        <br>
                        <div class="underline"></div>

                        <h1 class="section-title">Edit Organizational Chart</h1>
                        <div class="row">
                            <div class="label-half">
                                <label for="orgchart">Upload Image:</label>
                            </div>
                            <div class="input-half">
                                <div class="button-container">
                                    <script>
                                        const actualBtn = document.getElementById('myFile');

                                        const fileChosen = document.getElementById('file-chosen');

                                        actualBtn.addEventListener('change', function () {
                                            fileChosen.textContent = this.files[0].name
                                        })
                                    </script>
                                    <input type="file" id="myFile" name="filename" hidden/>
                                    <label for="myFile" id="fake-button">Choose File</label>
                                    <span id="file-chosen">&emsp;No file chosen</span>
                                </div>
                            </div>
                        </div>
                        <br>

                        <div class="buttons">
                            <button type="button" class="cancel">Cancel</button>

                            <button type="button" class="save-changes">Save Changes</button>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </body>
</html>