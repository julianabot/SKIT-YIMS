<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Change Password</title>
        <link href="${pageContext.request.contextPath}/Account/AccountCSS/ForgotPassword.css" rel="stylesheet" type="text/css">
        <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
/*            .placeicon {
                font-family: fontawesome
            }

            .custom-control-label::before {
                background-color: #dee2e6;
                border: #dee2e6
            }*/
        </style>
    </head>
    <body oncontextmenu='return false' class='snippet-body bg-info'>
        <div>
            <!-- Container containing all contents -->
            <div class="main-container">
                <div class="forgot">
                    <h2>
                        <strong>Reset Password</strong>
                    </h2>
                </div>
                <div class="password-input">
                    <form class="form-horizontal" action="../ResetPassword" method="POST">
                        <!-- User Name Input -->
                        <div >
                            <div class="new-password-input">
                                <input type="text" name="password" placeholder="New Password" class="form-control"> <i class="fa fa-eye" id="togglePassword"></i>
                            </div>
                        </div>
                        <!-- Password Input -->
                        <div >
                            <div class="new-password-input">
                                <input type="password" name="confPassword"
                                       placeholder="Confirm New Password" class="form-control"> <i class="fa fa-eye" id="togglePassword"></i>
                            </div>
                        </div>

                        <!-- Log in Button -->
                        <div >
                            <div >
                                <input type="submit" value="Reset" class="btn" style="margin-top: 10px;"> 
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Alternative Login -->
                <div class="mx-0 px-0 bg-light">

                    <!-- Horizontal Line -->
                    <div class="px-4 pt-5">
                        
                    </div>

                </div>



            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

    </body>
</html>