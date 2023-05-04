<%-- 
    Document   : dashboard
    Created on : 17-Mar-2023, 1:19:58 pm
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Projekta - Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">

        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");
            @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap');
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            .container{
                width: 100%;
                margin-top: 30px;
                margin-right: 20px;
                margin-left: 20px;
                position: static;
/*                justify-content: center!important;
                align-content: center!important;
                display: flex!important;*/
            }
            
            body {
                min-height: 100vh;
                background: #fff;
            }

            .btn {
                background-color: #1e53ff;
                border-radius: 30px;
                padding: 10px;
            }
            .form-input {
                width: 70%!important;
                border: none;
                border-bottom: 1px solid #949494;
                border-radius: 0;
                display: block;
                margin: 0 auto;
                outline: none;
                transition: 0.2s all;
            }

            .form-input:focus {
                border-bottom: 2px solid #1e53ff;
                transition: 0.2s all;
            }
            r{
                font-size: 40px;
                text-align: center;
/*                text-align: left;
                position:absolute;*/
                justify-content: space-between;
                font-family: 'Poppins', sans-serif;
            }
            .box{
                justify-content: center!important;
                align-content: center!important;
                width: 70%;
                align-self: center;
            }
        </style>
    </head>

    <body>
        <%@ include file="headermp.jsp"%>
        <div align="center" class="container">
            <div align="center">
                <r>Forgot your password?</r>
            </div><br>
            <div align="center" class="box">
<!--                        <hr style="color: black; width: 80%; position: absolute; top: 85px; left: 120px;">-->
                <p style="color: #6b6b6b; text-align: center;">We understand that forgetting your password can be
                    frustrating. To reset your password, please fill your details. You will receive a link on your email if your account exists.</p><br><br>
                <form action="forgot" method="post" class="forgot-pass-form" id="form">
                    <input type="email" name="a" class="form-input" placeholder="Email" id="email" required><br>
                    <input type="text" name="b" class="form-input" placeholder="Username" id="username" required><br><br>
<!--                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                    <input type="submit" value="   Submit   " class="btn-primary btn"><br><br><br>
                </form>
            </div>
        </div>

        <script>
        const form = document.getElementById("form");
        form.addEventListener("submit", function(event) {
            const a = document.getElementById("email");
            const b = document.getElementById("username");

            if (!a.value || !b.value) {
                alert("All fields are required.");
                event.preventDefault();
            }
        });
    </script>
    <%@ include file="footermp.jsp"%>
    </body>

</html>