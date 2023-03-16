<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.web.bind.annotation.GetMapping" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Projekta</title>
        <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap');
            .ta-center {
                text-align: center !important
            }
/*            .mb-30 {
                margin-bottom: 30px !important
            }*/
            h1,
            h2,
            h3,
            h4,
            h5,
            p,
            span,
            a {
                line-height: 140%;
                max-width: 100%
            }
            .content {
                max-width: 1170px;
                position: relative;
                width: 100%;
                padding: 0 25px;
                font-size: 17px
            }

            .content a {
                text-decoration: none
            }

            .content .intro {
                font-size: 21px;
                color: rgba(61, 71, 77, 0.5);
                margin-bottom: 40px
            }
            .subheading {
                font-size: 32px;
                font-weight: 500;
                line-height: 120%;
                color: rgba(61, 71, 77, 0.5);
                letter-spacing: normal
            }
            body {
                background-color: white;
                color: black;
            }
            .container {
                background-color: rgba(255, 255, 255, 0.8);
                padding: 50px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                text-align: center;
                border-radius: 20px;
            }
            .container h1 {
                font-family: 'Fredoka One', cursive;
                font-size: 48px;
                font-weight: bold;
                margin: 0;
                margin-bottom: 20px;
                text-transform: uppercase;
                letter-spacing: 2px;
            }
            .container h2 {
                font-size: 24px;
                font-family: sans-serif;
                margin: 0;
                font-style: italic;
            }
            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-family: sans-serif;
                padding: 20px;
            }
            .navbar-brand {
                display: flex;
                align-items: center;
                font-size: 28px;
                font-weight: bold;
                text-transform: uppercase;
                letter-spacing: 2px;
                color: #fff;
                text-decoration: none;
            }
            .navbar-brand img {
                height: 40px;
                margin-right: 10px;
            }
            .navbar-links {
                display: flex;
                align-items: center;
            }
            .navbar-link {
                margin-left: 20px;
                font-size: 20px;
                font-weight: bold;
                text-transform: uppercase;
                letter-spacing: 1px;
                color: #fff;
                text-decoration: none;
                position: relative;
                transition: all 0.3s ease-in-out;
            }
            .navbar-link:hover {
                color: #ffcc00;
            }
            .navbar-link:hover::before {
                content: "";
                display: block;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 10px;
                height: 10px;
                background-color: #ffcc00;
                border-radius: 50%;
                box-shadow: 0 0 20px #ffcc00;
                animation: glow 1s ease-in-out infinite;
            }
            @keyframes glow {
                0% {
                    opacity: 0;
                }
                50% {
                    opacity: 1;
                }
                100% {
                    opacity: 0;
                }
            }
        </style>
    </head>
    <body>
        <%@ include file="headermp.jsp"%>
       
        <div class="content ta-center">
            <div class="h1 mb-30" style="margin-bottom: 0px;">Simplify your Projects,<span style="color: rgba(61, 71, 77, 0.5);"> Amplify your results.</span></div>
            <h1 class="subheading">Secure Project Management Tool for Teams</h1>
        </div>
            
        
        <%@ include file="footermp.jsp"%>
    </body>
</html>
