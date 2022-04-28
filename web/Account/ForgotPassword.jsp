<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/SK_Logo.png" />
        <title>Forgot Password</title>
<!--        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>-->
        <link href='' rel='stylesheet'>
        <link href="${pageContext.request.contextPath}/Account/AccountCSS/ForgotPassword.css" rel="stylesheet" type="text/css">
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
/*            body {
                background-position: center;
                background-color: #eee;
                background-repeat: no-repeat;
                background-size: cover;
                color: #505050;
                font-family: "Rubik", Helvetica, Arial, sans-serif;
                font-size: 14px;
                font-weight: normal;
                line-height: 1.5;
                text-transform: none
            }

            .forgot {
                background-color: #fff;
                padding: 12px;
                border: 1px solid #dfdfdf
            }

            .padding-bottom-3x {
                padding-bottom: 72px !important
            }

            .card-footer {
                background-color: #fff
            }

            .btn {
                font-size: 13px
            }*/

/*            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #76b7e9;
                outline: 0;
                box-shadow: 0 0 0 0px #28a745
            }*/
        </style>
    </head>
    
    
    <body oncontextmenu='return false' class='snippet-body'>
        <div class="goback"> <a class="purp-btn" href="${pageContext.request.contextPath}/Account/Login.jsp">Go back</a> </div>
        <img src="${pageContext.request.contextPath}/img/SK_Logo.png" alt="SK Logo" id="Logo">
        <div class="container">
            
        <div class="main-container">
            <div class="forgot">
                <h2>Forgot your password?</h2>
                <p>Change your password by following the steps below:</p>
                <ol class="list-unstyled">
                    <li><span></span>Enter
                        your email address below.</li>
                    <li><span></span>Our
                        system will send you an OTP to your email.</li>
                    <li><span></span>Enter the OTP on the 
                        next page.</li>
                </ol>
            </div>
            <form class="card" action="../ForgotPasswordServlet" method="POST">
                <div class="card-body">
                    <div class="form-group">
                        <div class="email-row">
                            <label for="email-for-pass">Enter your email address: </label> <br>
                        <input
                            class="form-control" type="text" name="email" id="email-for-pass" required="">
                    </div>
                        <p>Enter your account's registered email address and the OTP for account recovery will be sent there.</p>
                    </div>
                </div>
                <div class="card-footer">
                    <button class="btn" type="submit">Get New
                        Password</button>
                </div>
            </form>


        </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src=''></script>
        <script type='text/javascript' src=''></script>
        <script type='text/Javascript'></script>
    </body>
</html>