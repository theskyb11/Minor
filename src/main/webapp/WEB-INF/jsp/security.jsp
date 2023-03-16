<%-- 
    Document   : security
    Created on : 16-Mar-2023, 5:47:59 pm
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Security</title>
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            body{

            }
            .main-details-div {
                font-family: 'Poppins', sans-serif;
                width: 90%;
            }
            .details-col {
                background-color: white;
                width: 100%;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                border-radius: 10px;
            }
            p{
                color: #666666;
                margin-left: 40px;
                margin-right: 40px;
                font-size: 0.9em
            }
            h3{
                /*                font-weight: bold;*/
                font-family: Poppins, sans-serif;
                margin-left: 10px;
                margin-right: 10px;
            }
            body{
                background-color: lightgray;
            }
            /*            .container {
                            max-width: 1500px;
                            width: 100%;
                            background-color: #f0f0f0;
                            padding: 25px 30px;
                            border-radius: 75px;
                            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
                        }*/

            h1{
                font-weight: bold;
                text-align: center;
                font-family: Poppins, sans-serif;
            }
        </style>
    </head>
    <body>
        <%@ include file="headermp.jsp"%>
        <br>
        <div class="container">
            <div class="row">
                <div class="col" style="display: flex; justify-content: center; align-content: center">
                    <div class="main-details-div">
                        <div class="details-col">
                            <h1 style="font-family: Poppins, sans-serif; text-align: center;">Security</h1>
                            <br><h3>1) Authentication and Access Control:</h3><br>
                            <p>
                                Projekta should require all users to authenticate themselves using strong passwords and enforce password policies to ensure that users create strong passwords. Additionally, access to sensitive information and functionality should be restricted based on user roles and permissions.<p><br>
                            <h3>2) Encryption:</h3><br>
                            <p>All sensitive data should be encrypted both in transit and at rest to prevent unauthorized access or interception.</p><br>
                            <h3>3) Regular Updates:</h3><br>
                            <p>Projekta should be updated regularly to ensure that it is protected against any known vulnerabilities or security threats.
                            </p><br>
                            <h3>4) Backup and Recovery:</h3><br>
                            <p>Regular backups should be taken to ensure that in case of any data loss, the system can be recovered quickly.
                            </p><br>
                            <h3>5) Secure Coding:</h3><br>
                            <p>The developers of Projekta should adhere to secure coding practices, including input validation and parameterization, to prevent security vulnerabilities like SQL injection and cross-site scripting (XSS).
                            </p><br>
                            <!--                            <h5 style="font-style: italic; margin-left: 20px; margin-right: 20px;">**Projekta is committed to protecting the privacy of its users. This Privacy Policy explains how we collect, use, and disclose information that we receive through our project management tool, Projekta.</h5>-->
                        </div></div></div>
            </div></div>
            <%@ include file="footermp.jsp"%>
    </body>
</html>