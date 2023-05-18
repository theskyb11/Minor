<%-- 
    Document   : Who we are
    Created on : 15-Mar-2023, 8:03:08 pm
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Who we are</title>
                <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">


        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 10px;
                background: black;
            }

            .container {
                max-width: 500px;
                width: 100%;
                background-color: rgb(246, 230, 230);
                padding: 25px 30px;
                border-radius: 10px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
            }

            nav {
                width: 100%;
                position: absolute;
                top: 0;
                left: 0;
                padding: 20px 8%;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            nav .logo {
                width: 80px;
            }

            nav ul li {
                list-style: none;
                display: inline-block;
                margin-left: 40px;
                padding: 10px 15px;
                margin: 0px 10px;
                position: relative;
            }

            /* nav ul li a {
                text-decoration: none;
                color: #fff;
                font-size: 17px;
            } */

            nav ul li ::before,
            nav ul li ::after{
                position: absolute;
                content: '';
                width: 0;
                height: 2px;
                background-color: #fff;
                transition: 0.3s all ease-in-out;
            }
            nav ul li ::before{
                top: 0;
                left: 0;
            }
            nav ul li ::after{
                bottom: 0;
                right: 0;
            }

            nav ul li :hover::before{
                right: 0;
                left: auto;
                width: 100%;
                background-color: #f39c12;
            }
            nav ul li :hover::after{
                right: auto;
                left: 0;
                width: 100%;
                background-color: #f39c12;

            }
            nav ul li a{
                text-decoration: none;
                cursor: pointer;
                color:#fff;
                font-size: 20px;
            }

            .sub{
                display: none;
            }
            nav ul li:hover .sub{
                display: block;
                position:absolute;
                background-color: transparent;
                margin-top: 10px;
                margin-left: -15px;
            }

        </style>
    </head>

    <body>
        <div class="container">
            <div>
                <b>Name : </b> Akash Bachhav
                <br>
                <b>Contact :</b><a href="tel:+917507723470"> +91 7507723470</a>
                <br>
                <b>Email :</b><a href=" mailto:akash.bachhav@mitaoe.ac.in"> akash.bachhav@mitaoe.ac.in</a>
            </div>
            <br>
            <div>
                <b>Name : </b> Mrinal Gupta
                <br>
                <b>Contact :</b> <a href="tel:+918424943858">+91 8424943858</a>
                <br>
                <b>Email :</b> <a href=" mailto:mrinal.gupta@mitaoe.ac.in">mrinal.gupta@mitaoe.ac.in</a>
            </div>
            <br>
            <div>
                <b>Name : </b> Samarp Jain
                <br>
                <b>Contact :</b> <a href="tel:+91 9921153319">+91 9921153319</a>
                <br>
                <b>Email :</b> <a href=" mailto:samarp.jain@mitaoe.ac.in"> samarp.jain@mitaoe.ac.in</a>
            </div>
            <br>
            <div>
                <b>Name : </b> Aditya Joshi
                <br>
                <b>Contact :</b> <a href="tel:+91 7666800663">+91 7666800663</a>
                <br>
                <b>Email :</b> <a href=" mailto:aditya.joshi@mitaoe.ac.in"> aditya.joshi@mitaoe.ac.in</a>
            </div>
        </div>

    </body>

</html>