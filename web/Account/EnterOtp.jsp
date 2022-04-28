<html>
    <head>

        <link
            href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
            rel="stylesheet" id="bootstrap-css">
        <script
        src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/SK_Logo.png" />
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link href="${pageContext.request.contextPath}/Account/AccountCSS/ForgotPassword.css" rel="stylesheet" type="text/css">



    </head>

    <body>
        <img src="${pageContext.request.contextPath}/img/SK_Logo.png" alt="SK Logo" id="Logo">
        <div class="main-container">
            <h4>
                <i class="fa fa-lock"></i>
            </h4>
            <h2 class="text-center">Enter OTP</h2>
            <%
                if (request.getAttribute("message") != null) {
                    out.print("<p class='text-danger ml-1'>" + request.getAttribute("message") + "</p>");
                }

            %>


                <form id="register-form" action="../ValidateOTP" role="form" autocomplete="off"
                      class="form" method="post">

                        <div class="input-group">
                            <input
                                id="opt" name="otp" placeholder="Enter OTP"
                                class="form-control" type="text" required="required">
                        </div>
                    <div class="form-group">
                        <input name="recover-submit"
                               class="btn"
                               value="Reset Password" type="submit">
                    </div>

                    <input type="hidden" class="hide" name="token" id="token"
                           value="">
                </form>

           
        </div>

    </body>
</html>