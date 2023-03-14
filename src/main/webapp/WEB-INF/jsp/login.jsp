<%-- 
    Document   : login
    Created on : Mar 14, 2023, 7:17:42 PM
    Author     : mrina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        .carousel-div{
                background-repeat: no-repeat;
                background-size: cover;
                height: 100vh;
                z-index: 1;
            }
        .login-div{
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
        }

        .login-form{
            width: 65%!important;
            font-size: 0.8em;
            background-color: white;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            z-index: 2;
            border-radius: 5px;
            height: 95vh;
            margin-top: 20px;
        }

        .input-login{
            margin-bottom: 20px;
            width: 80%;
            border: none;
            border-bottom: 1px solid #bbbbbb;
            outline: none;
            padding-bottom: 5px;
            margin-left: 40px;
            transition: 0.1s all;
            position: relative;
            display: block;
        }

        .input-login:focus{
            border-bottom: 2px solid #1e53ff;
            transition: 0.1s all;
        }

        .form-heading{
            margin-top: 50px;
            font-weight: 1000;
            margin-left: 40px;
            font-size: 2.5em;
        }

        .form-subhead{
            font-weight: 600;
            margin-left: 40px;
            margin-bottom: 20px;
            font-size: 1.1em;
        }

        .login-submit{
            width: 80%;
            padding: 10px;
            border-radius: 40px;
            background-color: #1e53ff;
            margin-left: 40px;
            margin-top: 20px;
            outline: none;
            color: white;
            border: none;
        }

        .link{
            text-decoration: none;
            text-underline: none;
            color: #1e53ff;
        }
    </style>
    </head>
    <body>
        <div class="container-fluid carousel-div">
            <div class="row">
                <div class="col login-div">
                    <form action="loginform" method="post" class="login-form" id="form">
                        <h3 class="form-heading">Login</h3><br>
                        <p class="form-subhead">New to ASMA-PM<a href="register" class="link"><br>Create an Account</a></p><br>
                        <input type="text" name = "a" placeholder="Username" class="input-login" id="username"/><br>
                        <input type="password" name = "b" placeholder="Password" class="input-login" id="password" /><br>
                        <a href="forgot" class="link forgot-pass">Forgot Password?</a><br>
                        <input type="submit" value="Login" class="login-submit" />
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
