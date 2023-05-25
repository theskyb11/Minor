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
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <title>Projekta</title>
        <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap');
            .ta-center {
                text-align: center !important;
            }
            .resp-flex-row {
                -webkit-flex-direction: column !important;
                -ms-flex-direction: column !important;
                flex-direction: column !important
            }
            .lh-normal {
                line-height: 140% !important
            }
            .justify-sb {
                -webkit-justify-content: space-between;
                -ms-flex-pack: justify;
                justify-content: space-between
            }
            .align-items-start,
            div.align-items-start[row],
            div.align-items-start[grid],
            .h-flex-row.align-items-start,
            .h-flex-grid.align-items-start {
                -webkit-align-items: flex-start;
                -ms-flex-align: start;
                align-items: flex-start
            }
            .bg-grey100 {
                background-color: #F7F9FA !important
            }
            .filter-blue {
                -webkit-filter: invert(46%) sepia(31%) saturate(2845%) hue-rotate(173deg) brightness(103%) contrast(106%) !important;
                filter: invert(46%) sepia(31%) saturate(2845%) hue-rotate(173deg) brightness(103%) contrast(106%) !important
            }
            .js-lazy-image {
                border: 0;
                position: relative;
                -webkit-transform: translateY(5px);
                transform: translateY(5px);
                opacity: 0
            }
            .fs-xl {
                font-size: 21px !important
            }
            .mb-30 {
                font-family: 'Josefin Sans', sans-serif;
                font-weight: bold;
                
            }
            .mb-0 {
                margin-bottom: 0 !important;
            }
            mb-10 {
                margin-bottom: 10 !important;
            }
            .mb-15 {
                margin-bottom: 15px !important
            }
            .mb-40 {
                margin-bottom: 40px !important
            }
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
                width:100%;
                position: relative;
                padding: 0 25px;
                justify-content:center;
                font-size: 17px
            }
            
            .cont {
                display: flex;
                justify-content: space-between;
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
                letter-spacing: normal;
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
            div[grid] {
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-flex-wrap: wrap;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                -webkit-align-items: center;
                -ms-flex-align: center;
                align-items: center;
            }
            .proof-box {
                background-color: rgba(0, 0, 0, 0.05);
                border-radius: 40px;
                padding: 30px 20px;
                -webkit-align-items: center;
                -ms-flex-align: center;
                align-items: center;
                min-width: 250px;
                margin: 0 10px 30px 10px;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            }
            .proof-box1 {
                background-color: rgba(0, 0, 0, 0.05);
                border-radius: 40px;
                padding: 30px 20px;
                -webkit-align-items: center;
                -ms-flex-align: center;
                align-items: center;
                width: 350px;
                height: 300px;
                margin: 0 10px 30px 10px;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            }
            .proof-box h4 {
                font-size: 21px;
                font-weight: 300;
                text-align: center;
                line-height: 110%;
            }

            .proof-box h4 span {
                font-size: 21px;
                font-weight: 700;
                display: block;
                line-height: 140%;
            }
            .mb-20 {
                margin-bottom: 20px !important
            }
            .justify-center,
            div.justify-center[column],
            .h-flex-column.justify-center {
                -webkit-justify-content: center;
                -ms-flex-pack: center;
                justify-content: center
            }
            .main-details-div {
                font-family: 'Poppins', sans-serif;
                width: 90%;
                margin-top: 10px;
            }
            .details-col {
                justify-content: center;
                background-color: white;
                width: 100%;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <%@ include file="headermp.jsp"%>
       
        <div align="center">
            <div class="content ta-center main-details-div" style="justify-items: center;">
                <div class="details-col">
                <div class="h1 mb-30" style="margin-bottom: 0px;">Simplify your Projects,<span style="color: rgba(61, 71, 77, 0.5);"> Amplify your results.</span></div>
                </div>
            </div>
        </div>
        
        <div align="center">
            <img src="https://www.linkpicture.com/q/pmt-1.png" alt="Projekta backgrnd" style="margin-left: 40px;margin-top: 20px;width: 70%; height: 60%;">
        </div>
            
        <section style="padding-top: 60px;">
            <div class="content ta-center">
                <div grid class="align-items-center justify-center">
                    <div column class="proof-box">
                        <img src="https://www.linkpicture.com/q/security_5.png" alt="Projekta backgrnd" style="width: 150px; height: 80px;">
                        <h4>
                            <span>Secured</span>and compliant
                        </h4>
                    </div>

                    <div column class="proof-box">
                        <img src="<c:url value="/resources/images/teammanagement.png" />" alt="Projekta backgrnd" style="width: 150px; height: 80px;"/>
<!--                        <img src="https://www.linkpicture.com/q/teammanagement.png" alt="Projekta backgrnd" style="width: 150px; height: 80px;">-->
<!--                        <span class="material-symbols-outlined">sentiment_very_satisfied</span>-->
                        <h4>
                            <span>Happy teams</span>worldwide
                        </h4>
                    </div>
                    
                    <div column class="proof-box">
<!--                        <img src="<c:url value="/resources/images/time-management.png" />" alt="Projekta backgrnd" style="width: 120px; height: 80px;"/>-->
                        <img src="https://www.linkpicture.com/q/time-management.png" alt="Projekta backgrnd" style="width: 120px; height: 80px;">
                        <h4>
                            <span>Time</span>Management
                        </h4>
                    </div>
                    
                    <div column class="proof-box">
                        <img src="https://www.linkpicture.com/q/file-sharing.png" alt="Projekta backgrnd" style="width: 120px; height: 80px;">
                        <h4>
                            <span>File Sharing</span>Collaboration
                        </h4>
                    </div>
                </div>
            </div>
        </section>
        
        <div align="center">
            <img src="https://www.linkpicture.com/q/pmt-2.png" alt="Projekta backgrnd" style="margin-left: 40px;margin-top: 20px;width: 70%; height: 60%;">
<!--            <img src="<c:url value="/resources/images/pmt-2.png" />" alt="Projekta backgrnd" style="margin-left: 40px;margin-top: 20px;width: 70%; height: 60%;"/>-->
        </div>
        
        <div class="cont" style="margin-top: 0px;">
            <div class="content" style="width: 560px;margin-top: 120px;">
                <p class="subheading" style="color: #8a9499; margin-bottom: 0; line-height: 1.29;">
                    Get to Know Task Management
                </p>
                <p class="h2" style="color: #3d474d; line-height: 1.17; letter-spacing: -1.5px; margin-bottom: 24px;">
                    Talk to a Productivity Expert.
                </p>
                <p class="intro" style="color: #8a9499; margin-bottom: 60px; width: 100%;">
                    Good work doesn’t need to be hard work. Task management removes the stress from organization, helping your team focus on what matters. Book a free consultation with a Meister productivity expert – you’ll soon get your team’s tasks in order.
                </p>
                <a href="https://www.meistertask.com/pages/book-consultation/?utm_source=mt_website&amp;utm_medium=lead_magnet_1_v2&amp;utm_campaign=mt_lead_magnet_1_v2&amp;utm_term=book_consultation&amp;utm_content=book_now" class="button blue with-icon" style="width: fit-content; min-width: 215px; height: 60px; border-radius: 40px; justify-content: center;">
                    <span style="font-size: 21px;">
                      Contact Us
                    </span>
                    <span class="icon arrow white ml-15"></span>
                </a>
            </div>
            <div align="right" style="margin-right: 40px;">
                <img src="<c:url value="/resources/images/manthinking.png" />" alt="Projekta backgrnd" style="width: 500px; height: 500px;"/>
<!--                <img src="https://www.linkpicture.com/q/manthinking.png" alt="Projekta backgrnd" style="width: 500px; height: 500px;">-->
            </div>
        </div>
        
        <div align="center">
            <img src="https://www.linkpicture.com/q/te_1.png" alt="Projekta backgrnd" style="margin-left: 40px;margin-top: 20px;width: 70%; height: 60%;">
        </div>
        
        <br><br>
        
        <section style="padding: 0 0 40px 0; margin-top: 60px;">
            <div column class="content align-items-center ta-center">
                <h2 class="subheading" style="font-size: 40px;">The Need for Task Management</h2>
                <div class="mb-30" style="font-size: 60px;"><b>It’s Time to Get Organized.</b></div>
                <p class="intro mb-0">
                    Task management is the link between planning to do something and getting it done. Your task management software should provide an overview of work in progress that enables tracking from conception to completion. Enter MeisterTask: join teams everywhere
                    who use our Kanban-style project boards to digitalize workflows and gain a clear overview of task progress. Let&#39;s get organized together!
                </p>
            </div>
        </section>
        
        <div align="center">
<!--            <img src="https://www.linkpicture.com/q/kanban-project-management.png123.png" alt="Projekta backgrnd" style="margin-left: 40px;margin-top: 20px;width: 70%; height: 60%;">-->
            <img src="<c:url value="/resources/images/kanban-project-management.png123.png" />" alt="Projekta backgrnd" style="margin-left: 40px;margin-top: 20px;width: 70%; height: 60%;"/>
        </div>
        
        <section style="margin-top: 40px">
            <div class="content">
                <h2 class="subheading">Your Questions, Answered.</h2>
                <div class="h2 mb-40">What is...</div>
                
                <div grid class="align-items-center justify-center">
                    
                    <div column class="proof-box1 ta-center">
                        <img src="<c:url value="/resources/images/checkbox.png" />" alt="Projekta backgrnd" style="width: 100px; height: 80px;"/>
<!--                        <img src="https://www.linkpicture.com/q/checkbox.png" alt="Projekta backgrnd" style="width: 100px; height: 80px;">-->
                        
                        <h2 class="fs-xl mb-10 lh-normal">
                            Task Management?
                        </h2>
                        <p>
                            Task management is the structured, digitalized processing of tasks using a dedicated software. MeisterTask is an excellent example, but many others do exist.
                        </p>
                    </div>
                    
                    <div column class="proof-box1 ta-center">
                        <img src="https://www.linkpicture.com/q/laptop-1_2.png" alt="Projekta backgrnd" style="width: 150px; height: 80px;">
                        <h2 class="fs-xl mb-10 lh-normal">
                            Task Management Software?
                        </h2>
                        <p>
                            Task management software can help you visualize what needs to be done, when. It shows you who is responsible for a task, when it is due, and much more.
                        </p>
                    </div>

                    <div column class="proof-box1 ta-center">
                        <img src="<c:url value="/resources/images/groth.png" />" alt="Projekta backgrnd" style="width: 120px; height: 80px;"/>
<!--                        <img src="https://www.linkpicture.com/q/groth.png" alt="Projekta backgrnd" style="width: 120px; height: 80px;">-->
                        <h2 class="fs-xl mb-10 lh-normal">
                            The Reason You Need Task Management Software?
                        </h2>
                        <p>
                            Online task management software helps you work efficiently and consistently. Long term, you and your team will be able to get more done and improve your standard of work.
                        </p>
                    </div>
                </div>
            </div>
        </section>
        
        <%@ include file="footermp.jsp"%>
    </body>
</html>