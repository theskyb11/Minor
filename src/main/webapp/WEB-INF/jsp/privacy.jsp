<%-- 
    Document   : privacy
    Created on : 15-Mar-2023, 11:17:11 pm
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Privacy</title>
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
            <h1 style="font-family: Poppins, sans-serif; text-align: center;">Privacy</h1>
            <br><h3>1) Information We Collect:</h3><br>
            <p>We collect the following types of information when you use Projekta:<br>
            a) Personal Information: When you create an account with Projekta, we collect your name and email address. You may also choose to provide additional information, such as your company name, phone number, or other contact information.<br>

                b) Usage Information: We collect information about how you use Projekta, including the pages you visit, the features you use, and the actions you take. This includes information about the devices and software you use to access Projekta, such as your IP address, browser type, and operating system.<br>

                c) Project Information: When you use Projekta to manage a project, we collect information about the project, such as its name, description, deadlines, and team members.</p><br>
            <h3>2) How We Use Information:</h3><br>
            <p>We do not share your personal information with third parties except in the following circumstances:<br>
            a) Provide and improve Projekta: We use your information to provide and improve the functionality and features of Projekta.<br>

            b) Communicate with you: We use your email address to communicate with you about your account and to send you notifications about projects and tasks.<br>

            c) Analyze usage: We use usage information to understand how people use Projekta and to improve its performance and usability.<br>

            d) Provide customer support: We use your information to provide customer support and to respond to your inquiries.</p><br>
            <h3>3) How We Share Information:</h3><br>
            <p>We do not share your personal information with third parties except in the following circumstances:<br>
            a) With your consent: We may share your information with third parties if you give us your consent to do so.<br>

            b) With service providers: We may share your information with service providers who perform services on our behalf, such as hosting and payment processing.</p><br>
            <h5 style="font-style: italic; margin-left: 20px; margin-right: 20px;">**Projekta is committed to protecting the privacy of its users. This Privacy Policy explains how we collect, use, and disclose information that we receive through our project management tool, Projekta.</h5>
        </div></div></div>
        </div></div>
        <%@ include file="footermp.jsp"%>
    </body>
</html>