<%-- 
    Document   : projectview
    Created on : May 3, 2023, 12:12:09 PM
    Author     : mrina
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.springframework.core.io.ByteArrayResource"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<%String v = request.getParameter("value");
Date ennd_date=null;int percentage = 0;
%>
<html>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/codemirror.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/codemirror.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/mode/javascript/javascript.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/mode/clike/clike.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/mode/python/python.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/mode/kotlin/kotlin.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/mode/octave/octave.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/mode/php/php.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/mode/ruby/ruby.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/mode/go/go.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.63.0/mode/rust/rust.min.js"></script>
        <!-- Include other mode files as needed for different programming languages -->

        <!-- Include Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,300,0,0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Projekta | Projects</title>
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");
            body {
                scroll-behavior: smooth;
                font-family: 'Poppins', sans-serif;
            }
            form {
                padding: 0 1.5rem;
            }
            input[type="date"] {
                padding: 5px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }
            .add-button {
                position: fixed;
                right: 20px;
                bottom: 20px;
                margin: 10px;
                background-color: green;
                color: #fff;
                padding: 10px 20px;
                border-radius: 10px;
                text-decoration: none;
                border-color: white;
            }
            .add-button1 {
/*                position: fixed;*/
/*                right: 220px;
                bottom: 20px;*/
                margin: 20px;
                background-color: green;
                color: #fff;
                padding: 10px 20px;
                border-radius: 10px;
                text-decoration: none;
                border-color: white;
            }
            .centre-button5 {
                position: fixed;
                border-width: 0px;
                /*                position: relative;*/
                display: inline-block;
                font-size: 10px;
                left: 0px;
                top: 20px;
                margin: 10px;
                background-color: green;
                color: #fff;
                padding: 10px 10px;
                border-radius: 10px;
                text-decoration: none;
                border-color: white;
            }
            .hover-text, .hover-textann {
                position: absolute;
                top: 100%;
                left: 120%;
                transform: translateX(-50%);
                padding: 5px;
                background-color: #fff;
                color: #000;
                font-size: 14px;
                visibility: hidden;
                border-radius: 50px;
                opacity: 0;
                transition: opacity 0.3s ease-in-out;
            }

            .centre-button5:hover .hover-text {
                visibility: visible;
                opacity: 1;
            }

            .announcement-count {
                position: relative;
                top: -20px;
                background-color: red;
                color: white;
                left:-10px;
                padding: 4px 8px;
                border-radius: 50%;
                font-size: 12px;
            }

            .centre-button4{
                position: fixed;
                border-width: 0px;
                /*                position: relative;*/
                display: inline-block;
                font-size: 10px;
                left: 0px;
                top: 164px;
                margin: 10px;
                background-color: green;
                color: #fff;
                padding: 10px 10px;
                border-radius: 10px;
                text-decoration: none;
                border-color: white;
            }

            .hover-text3 {
                position: absolute;
                top: 100%;
                left: 120%;
                transform: translateX(-50%);
                padding: 5px;
                background-color: #fff;
                color: #000;
                font-size: 14px;
                visibility: hidden;
                border-radius: 50px;
                opacity: 0;
                transition: opacity 0.3s ease-in-out;
            }

            .centre-button4:hover .hover-text3 {
                visibility: visible;
                opacity: 1;
            }
            
            .centre-button11{
                float: left; 
                border: none; 
                background: transparent;
            }
            
            .hover-text10 {
                position: absolute;
/*                top: 100%;
                left: 120%;*/
                margin-top: 20px;
                transform: translateX(-50%);
                padding: 5px;
                background-color: #fff;
                color: #000;
                font-size: 14px;
                visibility: hidden;
                border-radius: 50px;
                opacity: 0;
                transition: opacity 0.3s ease-in-out;
            }

            .centre-button11:hover .hover-text10 {
                visibility: visible;
                opacity: 1;
            }
            
            .file-label{
                width: 100%;
            }
            
            .hover-textexcel {
                position: absolute;
/*                top: 100%;
                left: 120%;*/
                margin-top: 20px;
                transform: translateX(-50%);
                padding: 5px;
                background-color: #fff;
                color: #000;
                font-size: 14px;
                visibility: hidden;
                border-radius: 50px;
                opacity: 0;
                
                transition: opacity 0.3s ease-in-out;
            }

            .file-label:hover .hover-textexcel {
                visibility: visible;
                background-color: #cccccc;
                opacity: 1;
            }
            
            .btnn{
                width: 100%;
            }
            
            .hover-textnn {
                position: absolute;
/*                top: 100%;
                left: 120%;*/
                margin-top: 10px;
                width: 130px;
                transform: translateX(-50%);
                padding: 5px;
                background-color: white;
                color: #000;
                font-size: 14px;
                visibility: hidden;
                border-radius: 50px;
                opacity: 0;
                
                transition: opacity 0.3s ease-in-out;
            }

            .btnn:hover .hover-textnn {
                visibility: visible;
                background-color: white;
                opacity: 1;
            }
            
            .btnun{
                width: 100%;
            }
            
            .hover-textun {
                position: absolute;
/*                top: 100%;
                left: 120%;*/
                margin-top: 10px;
                width: 130px;
                transform: translateX(-50%);
                padding: 5px;
                background-color: white;
                color: #000;
                font-size: 14px;
                visibility: hidden;
                border-radius: 50px;
                opacity: 0;
                
                transition: opacity 0.3s ease-in-out;
            }

            .btnun:hover .hover-textun {
                visibility: visible;
                background-color: white;
                opacity: 1;
            }

            .canvas-button{
                position: fixed;
                border-width: 0px;
                /*                position: relative;*/
                display: inline-block;
                font-size: 10px;
                left: 0px;
                top: 92px;
                margin: 10px;
                background-color: green;
                color: #fff;
                padding: 10px 10px;
                border-radius: 10px;
                text-decoration: none;
                border-color: white;
            }
            .hover-text4 {
                position: absolute;
                top: 100%;
                left: 120%;
                transform: translateX(-50%);
                padding: 5px;
                background-color: #fff;
                color: #000;
                font-size: 14px;
                visibility: hidden;
                border-radius: 50px;
                opacity: 0;
                transition: opacity 0.3s ease-in-out;
            }

            .canvas-button:hover .hover-text4 {
                visibility: visible;
                opacity: 1;
            }

            .container{
                width: 100%;
                margin-top: 30px;
                margin-right: 20px;
                margin-left: 60px;
                /*                position: scroll;*/
            }
            r{
                font-size: 50px;
                ;
                justify-content: space-between;
                font-family: 'Poppins', sans-serif;
            }
            .form-input {
                width: 100%!important;
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
            /*            .card1 {
                            border: none;
                            background-color: transparent;
                            width: 40px;
                        }*/

            .card {
                border: none;
                background-color: transparent;
                box-shadow: rgba(50, 50, 93, 0.25) 0 6px 12px -2px, rgba(0, 0, 0, 0.3) 0 3px 7px -3px;
            }

            .card1 {
                border: none;
                background-color: transparent;
                box-shadow: rgba(50, 50, 93, 0.25) 0 6px 12px -2px, rgba(0, 0, 0, 0.3) 0 3px 7px -3px;
            }

            .card-body {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 5%;
                margin-bottom: 5%;
            }

            .card-body1 {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 5%;
                margin-bottom: 5%;
            }
            .card-img-top {
                width: 200px;
                height: 200px;
            }
            .item-card {
                display: block;
            }

            .item-card1 {
                display: block;
            }

            .item-card1:hover {
                box-shadow: rgba(50, 50, 93, 0.25) 0 6px 12px -2px, rgba(0, 0, 0, 0.3) 0 3px 7px -3px;
            }
            .card{
                transition: 0.5s ease;
                z-index: 2;
            }
            .card1{
                transition: 0.5s ease;
                z-index: 2;
            }

            .card ul{
                display: flex;
                align-items: flex-start;
                flex-direction: column;
                background: #ffffff;
                position: absolute;
                top: 1rem;
                right:0;
                border-radius: 10px;
                padding: 10px 50px 10px 20px;
            }
            .card ul li{
                padding: 5px 0;
                color: #FFF;
                font-size: 14px;
            }
            .card1 ul{
                display: flex;
                align-items: flex-start;
                flex-direction: column;
                background: #ffffff;
                position: absolute;
                top: 1rem;
                right:0;
                border-radius: 10px;
                padding: 10px 50px 10px 20px;
            }
            .card1 ul li{
                padding: 5px 0;
                color: #FFF;
                font-size: 14px;
            }
            .card-title{
                padding-top: 10px;
                margin-bottom: 4px;
                font-weight: 600;
                padding-left: 10px;
            }
            .card-title1{
                padding-top: 10px;
                margin-bottom: 4px;
                font-weight: 600;
                padding-left: 10px;
            }
            .card-text {
                padding-top: 10px;
                margin-left: 10px;
                margin-bottom: 4px;
                font-weight: 600;
                padding-left: 10px;
            }

            .card-text1 {
                padding-top: 10px;
                margin-left: 10px;
                margin-right: 10px;
                margin-bottom: 4px;
                font-weight: 600;
                padding-left: 10px;
            }
            .col {
                align-items: center;
            }
            td{
                padding: 30px 62px 50px 0;
            }
            .centre-button, .centre-button2, .centre-button3{
                border-width: 0px;
                text-decoration: none;
                padding: 3.8px 10px;
                color: #fff;
                background-color:blue;
                margin-left: 20px;
                margin-right: 20px;
                width: 250px;
                height: 60px;
                border-radius: 5px;
                align-self: center;
                margin-bottom: 2.5px;
                vertical-align: middle;
                justify-content: space-between;
            }
            
            .centre-button10{
                border-width: 0px;
                text-decoration: none;
                padding: 3.8px 10px;
                color: #fff;
/*                width: 250px;
                height: 60px;*/
                border-radius: 5px;
                align-self: center;
                vertical-align: middle;
                justify-content: space-between;
                
                position: absolute;
                left: 50%;
                text-align: center;
                transform: translateX(-50%);
                background-color: green;
            }
            
            .hover-textend {
                position: absolute;
/*                top: 100%;
                left: 120%;*/
                margin-top: 20px;
                transform: translateX(-50%);
                padding: 5px;
                width: 180px;
                background-color: #ffffff;
                color: red;
                font-size: 14px;
                visibility: hidden;
                border-radius: 50px;
                opacity: 0;
                
                transition: opacity 0.3s ease-in-out;
            }

            .centre-button10:hover .hover-textend {
                visibility: visible;
                opacity: 1;
            }
            
            /*            .centre-button2{
                            border-width: 0px;
                            text-decoration: none;
                            padding: 3.8px 10px;
                            color: #fff;
                            background-color:blue;
                            margin-left: 20px;
                            margin-right: 20px;
                            width: 250px;
                            height: 60px;
                            border-radius: 5px;
                            align-self: center;
                            margin-bottom: 2.5px;
                            vertical-align: middle;
                            justify-content: space-between;
                        }
                        .centre-button{
                            border-width: 0px;
                            text-decoration: none;
                            padding: 3.8px 10px;
                            color: #fff;
                            background-color:blue;
                            margin-left: 20px;
                            margin-right: 20px;
                            width: 250px;
                            height: 60px;
                            border-radius: 5px;
                            align-self: center;
                            margin-bottom: 2.5px;
                            vertical-align: middle;
                            justify-content: space-between;
                        }*/
            .custom-checkbox {
                display: inline-block;
                position: relative;
                cursor: pointer;
            }

            .custom-checkbox input[type="checkbox"] {
                display: none;
            }

            .custom-checkbox label {
                position: absolute;
                top: 0;
                left: 0;
                width: 15px;
                height: 15px;
                background-color: #ffffff;
                border: 1px solid #000;
            }

            .custom-checkbox label i {
                display: none;
                color: #00ff00;
                font-size: 15px;
            }

            .custom-checkbox input[type="checkbox"]:checked + label i {
                display: block;
            }

            .modal, .modal2, .modal3, .modal4, .modal5, .modal10{
                display: none;
                position: fixed;
                z-index: 3;
                align-self: center;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.2);
            }

            .modal-content, .modal-content2, .modal-content3, .modal-content4, .modal-content5, .modal-content10 {
                background-color: white;
                margin: 10% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
                position: relative;
            }

            .msg-button, .msg-button2, .msg-button3, .msg-button4, msg-button5{
                position: fixed;
                right: 20px;
                bottom: 20px;
                margin: 10px;
                background-color: green;
                color: #fff;
                padding: 5px 10px;
                border-radius: 10px;
                text-decoration: none;
                /*                width: 100px;*/
                border-color: white;
            }

            .modal button.close,.modal button.close, .modal3 button.close, .modal4 button.close, .modal5 button.close, .modal10 button.close{
                display: block;
            }

            form {
                padding: 0 1.5rem;
            }
            canvas {
                border: 5px solid #000;
                background-color: #fff;
                cursor: crosshair;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                overflow: auto;
            }
            #overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 3;
                display: none;
            }
            #closeButton {
                position: fixed;
                top: 40px;
                right: 50px;
                font-size: 24px;
                color: black;
/*                padding: 5px 5px 5px 5px;*/
                background-color:transparent;
                cursor: pointer;
                z-index: 4;
                display: none;
            }
            g{
                font-size:17px;
                color: black;
            }
            d{
                font-size:15px;
                color: gray;
            }
            .card-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .file-upload-container {
                display: flex;
                align-items: center;
/*                justify-content: space-between;*/
            }
            .file-upload-form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            
            .form-input1 {
                width: 100%!important;
                border: none;
                font-size: 0.9rem;
                border-bottom: 1px solid #949494;
                border-radius: 0;
                display: block;
                margin: 0 auto;
                outline: none;
                transition: 0.2s all;
            }

            .form-input1:focus {
                border-bottom: 2px solid #1e53ff;
                transition: 0.2s all;
            }
            
            .CodeMirror {
                font-size: 0.8rem;
                height: 300px; /* Adjust the height as desired */
                border: 1px solid #ccc;
                width: 680px;
                position: relative;
            }
            .CodeMirror-gutters {
                width: 35px;
                background-color: #f7f7f7;
                position: absolute;
                top: 0;
                left: 0;
                bottom: 0;
                z-index: 1;
            }
/*            .CodeMirror-gutter-elt {
                margin-right: -35px;  Adjust the margin to prevent overlapping 
              }

              .CodeMirror-lines {  Adjust the padding to create space for line numbers 
                box-sizing: border-box;  Include padding in the width calculation 
              }*/
              .CodeMirror-gutter.CodeMirror-linenumber {
                padding-left: 6px; /* Adjust the padding to create space for line numbers */
              }

              .CodeMirror pre.CodeMirror-line {
                padding-left: 40px; /* Adjust the padding to create space for line numbers */
              }

            
            .chart-container {
                display: flex;
                margin: 0 auto;
                justify-content: center;
                align-items: center;
                height: 400px;
                width: 600px;
            }
            .clock{
                color: black;
                font-size: 0.9rem;
                top: 4px;
                position: fixed;
                left: 0px;
                width: 18%;
                border-radius: 20px;
            }
            .progress {
                width: 100%;
                height: 20px;
                background-color: lightgray;
            }
            .progress-bar {
                height: 100%;
                width: 0%;
                background-color: blue;
            }
        </style>
    </head>
    <body>
        <%int cnt_announce = 0;
        int cnt_tasks = 0;%>
        <a href="dashboard" style="z-index: 1;" class="add-button">Back to Dashboard</a>
        <%try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                PreparedStatement stmt = con.prepareStatement("select count(*) from announcements where project_id=?");
                stmt.setString(1, v);

                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    cnt_announce = rs.getInt(1);
                }
                
                PreparedStatement stmt1 = con.prepareStatement("select count(*) from tasks where project_id=?");
                stmt1.setString(1, v);

                ResultSet rs1 = stmt1.executeQuery();
                while (rs1.next()) {
                    cnt_tasks = rs1.getInt(1);
                }
                
            } catch (Exception k) {
                k.getMessage();
            }
        %>
        <%if (cnt_announce != 0) {%>
        <button class="centre-button5">
            <span class="material-symbols-outlined">campaign</span>
            <span class="hover-text">Announcement</span>
            <span class="announcement-count">
                <%= cnt_announce%>
            </span>
        </button>
        <%} else {%>
        <button class="centre-button5">
            <span class="material-symbols-outlined">campaign</span>
            <span class="hover-text">Announcement</span>
        </button>
        <%}%>
        <%String rank = "";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                PreparedStatement stmt = con.prepareStatement("select * from users where username=?");
                stmt.setString(1, (String) session.getAttribute("userName"));

                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    rank = rs.getString("designation");
                    if (rank.equals("CEO") || rank.equals("Vice CEO") || rank.equals("Project Head") || rank.equals("Vice Project Head")) {%>
        <button class="centre-button4">
            <span class="material-symbols-outlined">tips_and_updates</span>
            <span class="hover-text3">Create Announcement</span>
        </button>
        <%} else {
                    }
                }
            } catch (Exception k) {
                k.getMessage();
            }
        %>
        <div align="center" class="canvass">
            <button class="canvas-button" onclick="showCanvas()">
                <span class="material-symbols-outlined">draw</span>
                <span class="hover-text4">White Board</span>
            </button>
            <canvas id="myCanvas" style="display: none; position: fixed; z-index: 4;"></canvas>
            <div id="overlay"></div>
            <div id="closeButton" onclick="closeCanvas()"><span class="material-symbols-outlined">close</span></div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <%
                        String title = "";
                        String desc = "";
                        String Proj_head = "";%>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                            PreparedStatement stmt = con.prepareStatement("select * from users natural join projects where project_id=?");
                            stmt.setString(1, v);
                            String phead = "";
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                                desc = rs.getString("description");
                                phead = rs.getString("project_head");
                                title = rs.getString("title");
                                System.out.println(rs.getString("project_head") + "  " + rs.getString("username"));
                            }
                            PreparedStatement stmt1 = con.prepareStatement("select * from users where username=?");
                            stmt1.setString(1, phead);
                            ResultSet rst = stmt1.executeQuery();
                            while (rst.next()) {
                                Proj_head = rst.getString("name");
                            }
                    %>
                    <r>&nbsp;<%=title%></r><br><br>
                    <hr style="color: black; width: 100%; top: 70px;display: inline-flex;">
                    <%
                        } catch (Exception k) {
                            k.getMessage();
                        }
                    %>
                </div>
                <div align="right" class="col" style="width: 50%;">
                    <r style="font-size:25px; color: gray;">This Project is headed by <%=Proj_head%></r><br><br>
                    <r style="font-size:20px; color: #333333;">About the Project</r><br>
                    <r style="font-size:17px; color: gray;"><%=desc%></r>
                </div>
            </div>
            <div class="row">
                <div align="center" class="col">
                    <%if(cnt_tasks==0){
                    if (rank.equals("CEO") || rank.equals("Vice CEO") || rank.equals("Project Head") || rank.equals("Vice Project Head")){%>
                    <r style="font-size:16px; color: gray;">Project Not started, create few tasks</r>
                    <%}else{%><r style="font-size:16px; color: gray;">Project Not started, wait for few tasks to be created</r><%}}%>
                    <%int notnull_done=0;
                        try{
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
                        PreparedStatement stmt1 = con.prepareStatement("select count(*) from tasks where project_id=? and done is not null");
                        stmt1.setString(1, v);
                        ResultSet rst1=stmt1.executeQuery();
                        
                        while (rst1.next()) {
                            notnull_done = rst1.getInt(1);
                        }
                        PreparedStatement stmt = con.prepareStatement("select * from projects where project_id=? group by project_id");
                        stmt.setString(1, v);
                        ResultSet rst=stmt.executeQuery();
                        
                        percentage = (notnull_done*100/cnt_tasks);
                        while(rst.next()){
                            if(rst.getString("progress").equals("Yes")){%><r style="font-size:16px; color: gray;">Project Completed</r><%}else{%><r style="font-size:16px; color: gray;">Project Not Completed&nbsp;&nbsp;&nbsp;Status: <%=notnull_done%> task(s) completed off <%=cnt_tasks%> task(s) (<%=percentage%>%)</r><%}
                        }

                        }
                    catch(Exception k){
                        k.getMessage();
                    }%>
                    <br><br>
                    <div class="progress">
                        <div id="progress-bar" class="progress-bar"><%=percentage%>%</div>
                    </div>
                    <script>
                        function fillProgressBar(targetWidth, duration = 400) {
                            const progressBar = document.getElementById('progress-bar');
                            const currentWidth = 0;
                            const increment = targetWidth / (duration / 10);

                            let width = currentWidth;

                            const interval = setInterval(() => {
                                width += increment;
                                progressBar.style.width = width + '%';

                                if (width >= targetWidth) {
                                    clearInterval(interval);
                                }
                            }, 10);
                        }

                        const percentageValue = <%=percentage%>;
                        fillProgressBar(percentageValue, 400);
                    </script>

                </div>
                <div class="clock" id="clock"></div>
            </div><br>
            <div class="row">
                <div class="col">
                    <r style="font-size:18px; color: gray;">Employees working under this project</r>
                    <table>
                        <%
                            int colind = 0;
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                                PreparedStatement stmt = con.prepareStatement("select * from projects where project_id=?");
                                stmt.setString(1, v);
                                ResultSet rs = stmt.executeQuery();
                                while (rs.next()) {
                                    PreparedStatement stmt2 = con.prepareStatement("select * from users where username=?");
                                    stmt2.setString(1, rs.getString("username"));
                        %><%--=rs.getString("username")--%><%
                                        ResultSet rst = stmt2.executeQuery();
                                        while (rst.next()) {
                        %>
                        <td class="item-td1">
                            <div class="card item-card" align="center" style="width: 14rem;">
                                <h4 class="card-title"><%= rst.getString("name")%></h4>
                                <p class="card-text">
                                <div align="center" style="margin-left: 10px; margin-right: 10px; font-size: 13px; margin-bottom: 5px; color: #494949;">
                                    <b><%=rst.getString("designation")%></b><br>
                                    <%=rst.getString("email")%><br>
                                    <%=rst.getString("qualifications")%><br>
                                    <a href="tel:+91<%=rst.getLong("phone")%>"><%= rst.getString("phone")%></a><br>
                                </div>
                                </p>
                            </div>
                        </td>                                    
                        <%colind++;%>
                        <% if (colind % 4 == 0) {
                        %></tr><tr>
                            <%}%>
                            <%}
                                    }

                                } catch (Exception k) {
                                    k.getMessage();
                                }
                            %>
                    </table>
                </div>
            </div>
        </div>

        <div id="modal5" class="modal5">
            <div style="border-radius: 10px;" class="modal-content5">
                <div class="modal-header5">
                    <div class="row">
                        <div class="col">
                            <h5 class="modal-title5" id="exampleModalLongTitle">New Announcements</h5>
                        </div>
                        <div class="col text-end">
                            <button type="button" class="float-end" style="border: none; background: transparent;" id="cancel-button5" data-bs-dismiss="modal"><span class="material-symbols-outlined">close</span></button>  
                        </div>
                    </div>
                  <button type="button" class="btn-close5" data-bs-dismiss="modal5" hidden></button>
                  <hr>
                </div>
                <div class="modal-body5">
                    <%try {
                            String usnm = "";
                            boolean disp = false;
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

                            PreparedStatement stmt1 = con.prepareStatement("select * from projects where username=?");
                            stmt1.setString(1, (String) session.getAttribute("userName"));
                            String usnm1 = (String) session.getAttribute("userName");

                            ResultSet rst = stmt1.executeQuery();
                            while (rst.next()) {
                                usnm = rst.getString("project_head");
                                if (usnm1.equals(usnm)) {
                                    disp = true;
                                } else {
                                    disp = false;
                                }
                            }
                            PreparedStatement stmt = con.prepareStatement("select * from announcements where project_id=?");
                            stmt.setString(1, v);

                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {%>
                    <%=rs.getString("announcement_block")%>
                    <%if (disp) {%>
                    <form action="announcedelete" method="post" onsubmit="return confirm('Are you sure you want to delete this announcement?');">
                        <br><button class="delete-announce" type="submit" style="margin-left: 280px;; border: none; background-color: transparent;">
                            <span class="material-symbols-outlined" style="background-color: white; ">playlist_remove</span>
                            <div class="text" style="font-size: 10px;">Delete Announcement</div>
                        </button>
                        <input name="a" value="<%=v%>" hidden>
                        <input name="b" value="<%=rs.getString("announce_id")%>" hidden>
                    </form>
                    <%} else {
                                    }%>
                    <hr style="color: black; width: 100%; top: 70px; left: 100px;">
                    <%}
                        } catch (Exception k) {
                            k.getMessage();
                        }
                    %>
                </div>
                <div class="modal-footer5">
                    <!--                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                </div>
            </div>
        </div>

        <div id="modal4" class="modal4">
            <div style="border-radius: 10px;" class="modal-content4">
                <div class="modal-header4">
                    <div class="row">
                        <div class="col">
                            <h5 class="modal-title4" id="exampleModalLongTitle">New Announcement</h5>
                        </div>
                        <div class="col text-end">
                            <button type="button" class="float-end" style="border: none; background: transparent;" id="cancel-button4" data-bs-dismiss="modal"><span class="material-symbols-outlined">close</span></button>  
                        </div>
                    </div>
                  <button type="button" class="btn-close4" data-bs-dismiss="modal4" hidden></button>
                  <hr>
                </div>
                <div class="modal-body4">
                    <form action="createannounce" method="post">
                        Project ID<input type="text" id="project-id" value="<%=v%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                        Announcement ID<input type="text" id="announcement-id" class="form-control form-input" placeholder="Announcement Id" name="b"/><br>
                        Announcement text<textarea id="project-desc" class="form-control form-input" placeholder="type announcement" name="c"/></textarea><br>
                        <button type="submit" class="btn btn-primary" value="submit">Announce</button>
                    </form>
                </div>
                <div class="modal-footer4">
                    <!--                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                </div>
            </div>
        </div>

        <div id="modal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">New Task</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="createtasks" method="post">
                        Project ID<input type="text" id="project-id" value="<%=v%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                        Task ID<input type="text" id="task-id" class="form-control form-input" placeholder="Task Id" name="b"/><br>
                        Task Type<input type="text" id="task-type" class="form-control form-input" placeholder="Task type" name="c"/><br>
                        Start Date<br><input type="date" style="margin-left: 90px;" id="date-input1" name="startdate"/><br><br>
                        End Date<br><input type="date" style="margin-left: 90px;" id="date-input2" name="enddate"/><br><br>
                        Brief<br><textarea id="project-desc" class="form-control form-input" placeholder="Task brief" name="desc"/></textarea><br><br>
                        <input type="hidden" value="1" name="new"/>
                        <button type="submit" class="btn btn-primary" value="submit">Create task</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <!--                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                </div>
            </div>
        </div>
        <div id="modal2" class="modal2">
            <div style="border-radius: 10px;" class="modal-content2">
                <div class="modal-header2">
                    <div class="row">
                        <div class="col">
                            <h5 class="modal-title2" id="exampleModalLongTitle">Assign Task</h5>
                        </div>
                        <div class="col text-end">
                            <button type="button" class="float-end" style="border: none; background: transparent;" id="cancel-button2" data-bs-dismiss="modal"><span class="material-symbols-outlined">close</span></button>  
                        </div>
                    </div>
                  <button type="button" class="btn-close2" data-bs-dismiss="modal2" hidden></button>
                  <hr>
                </div>
                <div class="modal-body2">
                    <form action="assigntasks" method="post">
                        Project ID<input type="text" id="project-id" value="<%=v%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

                                PreparedStatement stmt = con.prepareStatement("select * from users where username=?");
                                stmt.setString(1, (String) session.getAttribute("userName"));

                                ResultSet rs = stmt.executeQuery();
                                while (rs.next()) {
                                    if (rs.getString("designation").equals("CEO") || rs.getString("designation").equals("Vice CEO") || rs.getString("designation").equals("Project Head")) {
                        %>
                        Username<input list="myOptions" class="form-control form-input" name="b" placeholder="Search users"/><br>
                        <datalist id="myOptions" class="my-datalist">
                            <%
                                PreparedStatement stmt2 = con.prepareStatement("select * from users natural join projects where project_id=? and designation in ('Vice Project Head', 'Project Management', 'Member')");
                                stmt2.setString(1, v);
                                ResultSet rst = stmt2.executeQuery();

                                while (rst.next()) {
                            %><option value="<%=rst.getString("username")%>"><%=rst.getString("name")%>   <%=rst.getString("username")%>   <%=rst.getString("designation")%></option><%
                                   }
                            %>
                        </datalist>
                        <%} else {%>
                        Username<input list="myOptions" class="form-control form-input" name="b" placeholder="Search users"/><br>
                        <datalist id="myOptions" class="my-datalist">
                            <%
                                PreparedStatement stmt2 = con.prepareStatement("select * from users natural join projects where project_id=? and designation in ('Project Management', 'Member')");
                                stmt2.setString(1, v);
                                ResultSet rst = stmt2.executeQuery();

                                while (rst.next()) {
                            %><option value="<%=rst.getString("username")%>"><%=rst.getString("name")%>   <%=rst.getString("username")%>   <%=rst.getString("designation")%></option><%
                                    }
                            %>
                        </datalist>
                        <%}

                                }
                            } catch (Exception k) {
                                k.getMessage();
                            }
                        %>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                                PreparedStatement stmt = con.prepareStatement("select * from tasks where project_id=?");
                                stmt.setString(1, v);

                                ResultSet rs2 = stmt.executeQuery();
                        %>Task<input list="myOption1" class="form-control form-input" name="c" placeholder="Search tasks"/>
                        <datalist id="myOption1" class="my-datalist1"><%
                                while (rs2.next()) {%>
                            <option value="<%=rs2.getString("task_id")%>"><%=rs2.getString("task_type")%></option>
                            <%}%></datalist><%
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            %>
                        <br><button type="submit" class="btn btn-primary" value="submit">Assign</button>
                    </form>
                </div>
                <div class="modal-footer2">
                    <!--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                </div>
            </div>
        </div>
        <div id="modal3" class="modal3">
            <div style="border-radius: 10px;" class="modal-content3">
                <div class="modal-header3">
                    <div class="row">
                        <div class="col">
                            <h5 class="modal-title3" id="exampleModalLongTitle">Member Delete</h5>
                        </div>
                        <div class="col text-end">
                            <button type="button" class="float-end" style="border: none; background: transparent;" id="cancel-button3" data-bs-dismiss="modal"><span class="material-symbols-outlined">close</span></button>  
                        </div>
                    </div>
                  <button type="button" class="btn-close3" data-bs-dismiss="modal" hidden></button>
                  <hr>
                </div>
                <div class="modal-body3">
                    <form action="removemember" method="post">
                        Project ID<input type="text" id="project-id" value="<%=v%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

                                PreparedStatement stmt = con.prepareStatement("select * from users where username=?");
                                stmt.setString(1, (String) session.getAttribute("userName"));

                                ResultSet rs = stmt.executeQuery();
                                while (rs.next()) {
                                    if (rs.getString("designation").equals("CEO") || rs.getString("designation").equals("Vice CEO") || rs.getString("designation").equals("Project Head")) {
                        %>
                        Username<input list="myOptions2" class="form-control form-input" name="b" placeholder="Search users"/><br>
                        <datalist id="myOptions2" class="my-datalist2">
                            <%
                                PreparedStatement stmt2 = con.prepareStatement("select * from users natural join projects where project_id=? and designation in ('Vice Project Head', 'Project Management', 'Member')");
                                stmt2.setString(1, v);
                                ResultSet rst = stmt2.executeQuery();

                                while (rst.next()) {
                            %><option value="<%=rst.getString("username")%>"><%=rst.getString("name")%>   <%=rst.getString("username")%>   <%=rst.getString("designation")%></option><%
                                   }
                            %>
                        </datalist>
                        <button type="submit" class="btn btn-primary" value="submit">Remove</button>
                        <%} else {%>
                        Username<input list="myOptions3" class="form-control form-input" name="b" placeholder="Search users"/><br>
                        <datalist id="myOptions3" class="my-datalist3">
                            <%
                                PreparedStatement stmt2 = con.prepareStatement("select * from users natural join projects where project_id=? and designation in ('Project Management', 'Member')");
                                stmt2.setString(1, v);
                                ResultSet rst = stmt2.executeQuery();

                                while (rst.next()) {
                            %><option value="<%=rst.getString("username")%>"><%=rst.getString("name")%>   <%=rst.getString("username")%>   <%=rst.getString("designation")%></option><%
                                    }
                            %>
                        </datalist>
                        <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
                        <%}

                                }
                            } catch (Exception k) {
                                k.getMessage();
                            }
                        %>
                    </form>
                </div>
                <div class="modal-footer3">
                    <!--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                </div>
            </div>
        </div>
        <%
            String position = "";
            String member = "Member";
            String manage = "Project Management";
            boolean exists = false, exists1 = false;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

                PreparedStatement stmt2 = con.prepareStatement("select * from users where username=?");
                stmt2.setString(1, (String) session.getAttribute("userName"));

                ResultSet rst = stmt2.executeQuery();
                while (rst.next()) {
                    position = rst.getString("designation");
                    exists = position.equals(member);
                    exists1 = position.equals(manage);
                }

                if (!exists && !exists1) {
        %>
        <div align="center">
            <button class="centre-button">Create Tasks</button>
            <button class="centre-button2">Assign Tasks</button>
            <button class="centre-button3">Remove Members from Project</button>
        </div>
        <%} else {%><%}
            } catch (Exception k) {
                k.getMessage();
            }
        %>
        <div class="container">
            <div class="row">
                <div class="col">
                    <r style="font-size:30px;">Tasks</r>
                    <hr style="color: black; width: 100%; top: 70px; left: 100px;">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <%int count_create = 0, count_assign = 0;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                            PreparedStatement stmt = con.prepareStatement("select count(*) from tasks where project_id=? and username is NULL or username='null'");
                            stmt.setString(1, v);

                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                                count_create = rs.getInt(1);
                            }
                            PreparedStatement stmt1 = con.prepareStatement("select count(*) from tasks where project_id=? and username not in ('null', 'NULL')");
                            stmt1.setString(1, v);

                            ResultSet rst = stmt1.executeQuery();
                            while (rst.next()) {
                                count_assign = rst.getInt(1);
                            }
                            count_create = count_create + count_assign;
                        } catch (Exception k) {
                            k.getMessage();
                        }
                    %>
                    <r style="font-size:15px;"><%=count_create%> tasks created and <%=count_assign%> tasks assigned.</r>
                </div>
            </div><br>
            <div class="row">
                <div class="col">
                    <%String rank1 = "";
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                            PreparedStatement stmt = con.prepareStatement("select * from users where username=?");
                            stmt.setString(1, (String) session.getAttribute("userName"));

                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                                rank = rs.getString("designation");
                                if (rank.equals("CEO") || rank.equals("Vice CEO") || rank.equals("Project Head") || rank.equals("Vice Project Head")) {

                                    PreparedStatement stmt2 = con.prepareStatement("select * from tasks where project_id=?");
                                    stmt2.setString(1, v);

                                    ResultSet rs1 = stmt2.executeQuery();
                                    int count = 0;
                                        while (rs1.next()) {
                                            String nme = "";
                                            boolean status = rs1.getBoolean("done");
                                            String usnm = rs1.getString("username");%>
                    <div id="card-container">
                        <div align="center" class="card" style="width: 60%;">
                            <div class="card-header">
                                <form action="taskdelete" method="post" onsubmit="return confirm('Are you sure you want to delete this task?');">
                                    <button class="centre-button11" type="submit">
                                        <span class="material-symbols-outlined">close</span>
                                        <span class="hover-text10">Task delete</span>
                                    </button>
                                    <input name="a" value="<%=rs1.getString("task_id")%>" hidden>
                                    <input name="b" value="<%=v%>" hidden>
                                </form>
                                <d style="font-size: 20px;color: black;"><%=rs1.getString("task_type")%>
                                <%if(status == true){%><i style="float: right;" class="fas fa-check"></i>
                                <span class="hover-text3">Task Completed</span>
                                <%}%>
                                </d>
                            </div>
                            <div class="card-body" style="margin-bottom: 0px; margin-top: 0px;">
                                <div class="row" style="width:100%">
                                    <div class="col">
                                        <blockquote class="blockquote mb-0">
                                            <p><g>Start Date: </g><d><%=rs1.getString("start_date")%></d><br>
                                            <g>End Date: </g><d><%=rs1.getString("end_date")%></d><br>
                                            </p><%
                                                PreparedStatement st = con.prepareStatement("select name from users where username=?");
                                                st.setString(1, rs1.getString("username"));
                                                          ResultSet rt = st.executeQuery();
                                                          while (rt.next()) {
                                                              nme = rt.getString("name");
                                                          }%>
                                            <footer class="blockquote-footer" style="margin-top:0px;margin-bottom: 0px;">created for <cite title="Source Title"><%=nme%></cite></footer>
                                        </blockquote>
                                    </div>
                                    <div align="right" class="col">
                                        <div class="child-1" style="float: right;">
                                            <button class="btn btn-primary expandBtn btnn" style="background-color: transparent;color: black; border: none; width: 15%; height: 35%; align-self: center; margin-bottom: 10px; margin-top: 0px;"><span class="material-symbols-outlined">edit</span><span class="hover-textnn">Update dates</span></button>
                                            <div id="expanded-content" style="display: none;">
                                                <form action="submitdate" method="post">
                                                    Start Date<br><input type="date" value="<%=rs1.getString("start_date")%>" style="margin-left: 90px;" id="date-input1" name="startdate"/><br><br>
                                                    End Date<br><input type="date" value="<%=rs1.getString("start_date")%>" style="margin-left: 90px;" id="date-input2" name="enddate"/><br><br>
                                                    <input name="a" value="<%=rs1.getString("task_id")%>" hidden>
                                                    <input name="b" value="<%=v%>" hidden>
                                                     <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
    <!--                                                <button style="margin-left: 50px;" class="centre-button11" type="submit">
                                                        Update
                                                    </button>-->
                                                </form>
                                            </div>
                                            <button class="btn btn-primary closeBtn" style="color: black; border: none; width: 20%; height: 20%; background-color: transparent; align-self: center; margin-bottom: 10px; margin-top: 0px; display: none;"><span class="material-symbols-outlined">close</span></button>
                                        </div>
                                        <div class="child-2" style="float: right;">
                                            <%if(usnm==null){%><%}else{%>
                                            <form action="unassign" method="post">
                                                <input name="a" value="<%=rs1.getString("task_id")%>" hidden>
                                                <input name="b" value="<%=v%>" hidden>
                                                <button type="submit" class="btn btn-primary btnun" style="background-color: transparent;color: black; border: none; width: 15%; height: 35%; align-self: center; margin-bottom: 10px; margin-top: 0px;"><span class="material-symbols-outlined">person_remove</span><span class="hover-textun">Unassign task</span></button>
                                            </form><%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-primary expandBtn" style="width: 20%; align-self: center; margin-bottom: 10px; margin-top: 0px;">Expand</button>
                            <div id="expanded-content" style="display: none;">
                                <hr style="color: black; width: 80%;">
                                Brief: <d><%=rs1.getString("task_description")%></d><br>
                                <%if (usnm == null) {%><br>
                                Cannot be submitted without the task being assigned!!<br><br>
                                <div align="right" style="display: inline-block;">
                                    <button style="margin-right: 100px;" disabled>Submit your work</button>
                                    <div class="custom-checkbox">
                                        <input type="checkbox" style="margin-left: 100px;"  disabled>
                                        <label for="checkbox">
                                            <i class="fas fa-check"></i>
                                        </label>
                                    </div>
                                </div>
                                <%} else {%><br>
                                <%--int b = Integer.parseInt(rs1.getInt("done"));--%>
                                <%boolean b = rs1.getBoolean("done");%>
                                <%if(b){%>Submitted
                                <br><%}else{%>Not Submitted
                                <br>
                                <%}%>
                                <div align="center" style="display: inline-block;">
                                    
                                    <%
                                        Date end_date = rs1.getDate("end_date");
                                        Date ed_date = new Date();
                                    %>

                                    <button class="centre-button10" data-value="<%= rs1.getString("task_id") %>"
                                            <% if (ed_date.after(end_date)) { %>
                                            disabled
                                        <% } %>
                                    >
                                        Submit work
                                        <% if (ed_date.after(end_date)) { %>
                                            <span class="hover-textend">Deadline missed!!</span>
                                        <% } %>
                                    </button>
                                    
                                    <%--
                                    if(end_date.before(ennd_date)){%>
                                    <button class="centre-button10" data-value="<%=rs1.getString("task_id")%>">Submit work</button>
                                    
                                    <%}else{%>
                                    <button class="centre-button10" data-value="<%=rs1.getString("task_id")%>" disabled>Submit work<span class="hover-textend">Deadline missed!!</span></button>
                                    <%}--%>
                                    
                                    <div style="position: absolute;right: 40px;" class="custom-checkbox">
                                        <input type="checkbox" <% if (!b || b) { %> disabled<% } if (b) { %> checked<% }%>>
                                        <label for="checkbox">
                                            <i class="fas fa-check"></i>
                                        </label>
                                    </div>
                                        
                                </div><br><br>
                                <%if(b){%>
                                
                                <div style="display: inline-block;">
                                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
                                    <%String typee=rs1.getString("submit_type");String ttype=rs1.getString("task_type");
                                    
                                    if(typee.equals("pdf")){%>
                                    <a href="downloadPDF?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: red; font-size: 2.5rem;" class="fas fa-file-pdf"></i><br>Download PDF
                                    </a><%}
                                    
                                    else if(typee.equals("excel")){%>
                                    <a href="downloadExcel?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: green; font-size: 2.5rem;" class="fas fa-file-excel"></i><br>Download Excel
                                    </a><%}

                                    else if(typee.equals("ppt")){%>
                                    <a href="downloadPPT?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: blue; font-size: 2.5rem;" class="fas fa-file-powerpoint"></i><br>Download PPT
                                    </a><%}

                                    else if(typee.equals("doc")){%>
                                    <a href="downloadDoc?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: orange; font-size: 2.5rem;" class="fas fa-file-word"></i><br>Download DOCX
                                    </a><%}

                                    else if(typee.equals("media")){%>
                                    <a href="downloadMedia?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: purple; font-size: 2.5rem;" class="fas fa-video"></i><br>Download Media
                                    </a><%}

                                    else if(typee.equals("url")){
                                    String urll="";
                                    PreparedStatement stat1=con.prepareStatement("select * from tasks_links where task_id=?");
                                    stat1.setString(1,rs1.getString("task_id"));
                                    ResultSet rstt = stat1.executeQuery();
                                    while(rstt.next()){urll=rstt.getString("url");}
                                        stat1.close();%>
                                    <a href="<%=urll%>" target="_blank" style="color: blue; text-decoration: underline;display: inline-block;" class="btn"><%=urll%>
                                        <i style="color: teal; font-size: 2.5rem;" class="fas fa-dlink"></i><br>
                                    </a>                                   
                                    <%}

                                    else if(typee.equals("code")){%>
                                    <a href="downloadCode?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: blue; font-size: 2.5rem;" class="fas fa-code"></i><br>Download Code
                                    </a><%}%>
                                </div>
                                                                
                                <form action="deleteFile" method="post" onsubmit="return confirm('Are you sure you want to delete this submission?');" enctype="multipart/form-data" style="display: inline-block;">
                                    <input name="a" value="<%=v%>" hidden>
                                    <input name="b" value="<%=rs1.getString("task_id")%>" hidden>
                                    <input type="submit" class="btn btn-primary" value="Remove Submission">
                                </form>
                                <%}%>
                                <%}%>
                            </div><br>
                            <button class="btn btn-primary closeBtn" style="width: 20%; align-self: center; margin-bottom: 10px; margin-top: 0px;display: none;">Close</button>
                        </div><br><br>
                        
                    </div>
                    <%}
                                } else {
                                    boolean result = false;
                                    PreparedStatement stmt1 = con.prepareStatement("select count(*) from tasks where username=?");
                                    stmt1.setString(1, (String) session.getAttribute("userName"));
                                    ResultSet rst = stmt1.executeQuery();
                                    if (rst.next()) {
                                        int count = rst.getInt(1);
                                        if (count > 0) {
                                            result = true;
                                        }
                                    }
                                    if (result) {
                                        PreparedStatement stmt2 = con.prepareStatement("select * from tasks where username=? and project_id=?");
                                        stmt2.setString(1, (String) session.getAttribute("userName"));
                                        stmt2.setString(2, v);

                                        ResultSet rs1 = stmt2.executeQuery();
                                            while (rs1.next()) {
                                                String nme = "";
                                                boolean status = rs1.getBoolean("done");%>
                    <div id="card-container">
                        <div align="center" class="card" style="width: 60%;">
                            <div class="card-header">
                                <d style="font-size: 20px;color: black;"><%=rs1.getString("task_type")%>
                                <%if(status == true){%><i style="float: right;" class="fas fa-check"></i>
                                <span class="hover-text3">Task Completed</span>
                                <%}%>
                                </d>
                            </div>
                            <div class="card-body" style="margin-bottom: 0px; margin-top: 0px;">
                                <blockquote class="blockquote mb-0">
                                    <p><g>Start Date: </g><d><%=rs1.getString("start_date")%></d><br>
                                    <g>End Date: </g><d><%=rs1.getString("end_date")%></d><br>
                                    </p><%;
                                        PreparedStatement st = con.prepareStatement("select name from users where username=?");
                                        st.setString(1, rs1.getString("username"));
                                                  ResultSet rt = st.executeQuery();
                                                  while (rt.next()) {
                                                      nme = rt.getString("name");
                                                  }%>
                                    <footer class="blockquote-footer" style="margin-top:0px;margin-bottom: 0px;">created for <cite title="Source Title"><%=nme%></cite></footer>
                                </blockquote>
                            </div>
                            <button class="btn btn-primary expandBtn" style="width: 20%; align-self: center; margin-bottom: 10px; margin-top: 0px;">Expand</button>
                            <div id="expanded-content" style="display: none;">
                                <hr style="color: black; width: 80%;">
                                Brief: <d><%=rs1.getString("task_description")%></d>
                                <%boolean b = rs1.getBoolean("done");%><br>
                               <%if(b){%>Submitted
                                <br><%}else{%>Not Submitted
                                <br><br>
                                <%}%>
                                <div align="right" style="display: inline-block;">
                                    
                                    <%
                                        Date end_date = rs1.getDate("end_date");
                                        Date ed_date = new Date();
                                    %>

                                    <button class="centre-button10" data-value="<%= rs1.getString("task_id") %>"
                                            <% if (ed_date.after(end_date)) { %>
                                            disabled
                                        <% } %>
                                    >
                                        Submit work
                                        <% if (ed_date.after(end_date)) { %>
                                            <span class="hover-textend">Deadline missed!!</span>
                                        <% } %>
                                    </button>
                                    
                                    <div style="position: absolute;right: 40px;" class="custom-checkbox">
                                        <input type="checkbox" <% if (!b || b) { %> disabled<% } if (b) { %> checked<% }%>>
                                        <label for="checkbox">
                                            <i class="fas fa-check"></i>
                                        </label>
                                    </div><br>
                                    
                                </div><br>
                                <%if(b){%>
                                
                                <div style="display: inline-block;">
                                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
                                    <%String typee=rs1.getString("submit_type");String ttype=rs1.getString("task_type");
                                    
                                    if(typee.equals("pdf")){%>
                                    <a href="downloadPDF?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: red; font-size: 2.5rem;" class="fas fa-file-pdf"></i><br>Download PDF
                                    </a><%}
                                    
                                    else if(typee.equals("excel")){%>
                                    <a href="downloadExcel?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: green; font-size: 2.5rem;" class="fas fa-file-excel"></i><br>Download Excel
                                    </a><%}

                                    else if(typee.equals("ppt")){%>
                                    <a href="downloadPPT?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: blue; font-size: 2.5rem;" class="fas fa-file-powerpoint"></i><br>Download PPT
                                    </a><%}

                                    else if(typee.equals("doc")){%>
                                    <a href="downloadDoc?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: orange; font-size: 2.5rem;" class="fas fa-file-word"></i><br>Download DOCX
                                    </a><%}

                                    else if(typee.equals("media")){%>
                                    <a href="downloadMedia?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: purple; font-size: 2.5rem;" class="fas fa-video"></i><br>Download Media
                                    </a><%}

                                    else if(typee.equals("url")){%>
                                    <a href="downloadURL?taskId=<%=rs1.getString("task_id")%>" style="display: inline-block;" class="btn">
                                        <i style="color: teal; font-size: 2.5rem;" class="fas fa-dlink"></i><br>Download URL
                                    </a><%}

                                    else if(typee.equals("code")){%>
                                    <a href="downloadCode?taskID=<%=rs1.getString("task_type")%>" style="display: inline-block;" class="btn">
                                        <i style="color: blue; font-size: 2.5rem;" class="fas fa-code"></i><br>Download Code
                                    </a><%}%>
                                </div>
                                                                
                                <form action="deleteFile" method="post" onsubmit="return confirm('Are you sure you want to delete this submission?');" enctype="multipart/form-data" style="display: inline-block;">
                                    <input name="a" value="<%=v%>" hidden>
                                    <input name="b" value="<%=rs1.getString("task_id")%>" hidden>
                                    <input type="submit" class="btn btn-primary" value="Remove Submission">
                                </form>
                                <%}%>
                            </div><br>
                            <button class="btn btn-primary closeBtn" style="width: 20%; align-self: center; margin-bottom: 10px; margin-top: 0px;display: none;">Close</button>
                        </div><br><br>
                    </div>
                            <%}
                            } else {%><%}
                                    }
                                }
                            } catch (Exception k) {
                                k.getMessage();
                            }
                    %>
                </div>
            </div>
              
            <div align="center">
                <%boolean head=false;
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                    PreparedStatement stmt = con.prepareStatement("select * from projects where project_id=? group by project_id");
                    stmt.setString(1, v);
                    ResultSet rst=stmt.executeQuery();
                    while(rst.next()){
                        if(rst.getString("project_head").equals((String) session.getAttribute("userName")))
                            head=true;
                    }
                }
                catch (Exception k) {
                        k.getMessage();
                }%>
                <%if(head){%>
                <form action="completePoject" method="post">
                    <input type="text" value="<%=v%>" name="a" readonly="readonly" hidden/>
                    <button type="submit" style="z-index: 1;" class="add-button1" />Declare Project Complete</button>
                </form>
                <%}else{}%>
            </div>
                
            <div id="modal10" class="modal">
                <div style="border-radius: 10px; width: 1000px;" class="modal-content10">
                  <div class="modal-header10">
                      <div class="row">
                          <div class="col">
                            <h4 class="modal-title10" id="exampleModalLongTitle">Submission</h4>
                          </div>
                          <div class="col text-end">
                              <button type="button" class="float-end" style="border: none; background: transparent;" id="cancel-button10" data-bs-dismiss="modal"><span class="material-symbols-outlined">close</span></button>  
                          </div>
                      </div>
                    <button type="button" class="btn-close10" data-bs-dismiss="modal" hidden></button>
                    <hr>
                  </div>
                  <div class="modal-body10">
                    <%String pdf="pdf";String excel="excel";String ppt="ppt";String doc="doc";String media="media";String url="url";String code="code";%>
                    Upload in any of the following forms:
                    (pdf, word, excel, code snippet, url/link)<br><br>

                    <div class="file-upload-container">

                        <form action="uploadHandler" method="post" enctype="multipart/form-data" class="file-upload-form">
                            <label for="pdfFile" class="file-label">
                                <i style="color: red; font-size: 2.5rem;align-self: center;" class="fas fa-file-pdf"></i><br>
                                Select PDF<span class="hover-textexcel">(.pdf)</span>
                            </label>
                            <input type="file" id="pdfFile" name="pdfFile" style="display: none;">
                            <input name="a" value="<%=v%>" hidden>
                            <input name="b" id="inputValue"  hidden>
                            <input name="c" value="<%=pdf%>" hidden><br>
                            <input type="submit" class="btn btn-primary btn-success" style="background-color: green;" value="Upload PDF">
                        </form>    

                        <form action="uploadHandler2" method="post" enctype="multipart/form-data" class="file-upload-form">
                            <label for="excelFile" class="file-label">
                                <i style="color: green; font-size: 2.5rem; align-self: center;" class="fas fa-file-excel"></i><br>
                                Select Excel<span class="hover-textexcel">(.xlsx)</span>
                            </label>
                            <input type="file" name="excelFile" id="excelFile" style="display: none;">
                            <input name="a" value="<%= v %>" hidden>
                            <input name="b" id="inputValue2"  hidden>
                            <input name="c" value="<%=excel%>" hidden><br>
                            <input type="submit" class="btn btn-primary btn-success" style="background-color: green;" value="Upload Excel">
                        </form>

                        <form action="uploadHandler3" method="post" enctype="multipart/form-data" class="file-upload-form">
                            <label for="pptFile" class="file-label">
                                <i style="color: blue; font-size: 2.5rem; align-self: center;" class="fas fa-file-powerpoint"></i><br>
                                Select PowerPoint (PPT)<span class="hover-textexcel">(.pptx)</span>
                            </label>
                            <input type="file" name="pptFile" id="pptFile" style="display: none;">
                            <input name="a" value="<%= v %>" hidden>
                            <input name="b" id="inputValue3"  hidden>
                            <input name="c" value="<%= ppt %>" hidden><br>
                            <input type="submit" class="btn btn-primary btn-success" style="background-color: green;" value="Upload Presentation">
                        </form>

                        <form action="uploadHandler4" method="post" enctype="multipart/form-data" class="file-upload-form">
                            <label for="docFile" class="file-label">
                                <i style="color: orange; font-size: 2.5rem; align-self: center;" class="fas fa-file-word"></i><br>
                                Select Word (DOC)<span class="hover-textexcel">(.docx)</span>
                            </label>
                            <input type="file" name="docFile" id="docFile" style="display: none;">
                            <input name="a" value="<%= v %>" hidden>
                            <input name="b" id="inputValue4"  hidden>
                            <input name="c" value="<%= doc %>" hidden><br>
                            <input type="submit" class="btn btn-primary btn-success" style="background-color: green;" value="Upload Document">
                        </form>

                        <form action="uploadHandler5" method="post" enctype="multipart/form-data" class="file-upload-form">
                            <label for="mediaFile" class="file-label">
                                <i style="color: purple; font-size: 2.5rem; align-self: center;" class="fas fa-file-video"></i><br>
                                Select Media<span class="hover-textexcel">(.png .jpeg)</span>
                            </label>
                            <input type="file" name="mediaFile" id="mediaFile" style="display: none;">
                            <input name="a" value="<%= v %>" hidden>
                            <input name="b" id="inputValue5"  hidden>
                            <input name="c" value="<%= media %>" hidden><br>
                            <input type="submit" class="btn btn-primary btn-success" style="background-color: green;" value="Upload Media">
                        </form>

                    </div><br>

                    <div class="file-upload-container">

                         <form action="uploadHandler6" method="post" enctype="multipart/form-data" class="file-upload-form">
                            <label for="url" class="file-label">
                                <i style="color: teal; font-size: 2.5rem; align-self: center;" class="fas fa-link"></i><br>
                                Enter URL
                            </label><br>
                            <input type="text" class="form-input1" name="url" placeholder="Enter URL">
                            <input name="a" value="<%= v %>" hidden>
                            <input name="b" id="inputValue6"  hidden>
                            <input name="c" value="<%= url %>" hidden><br>
                            <input type="submit" class="btn btn-primary btn-success" style="background-color: green;" value="Upload URL">
                        </form>

                        <form action="uploadHandler7" method="post" class="file-upload-form">
                            <label for="codeEditor" class="file-label">
                                <i style="color: blue; font-size: 2.5rem; align-self: center;" class="fas fa-code"></i><br>
                                Enter Code Snippet<span style="z-index: 3;" class="hover-textexcel">(javascript java python cpp c kotlin octave php ruby go rust)</span>
                            </label>
                            <textarea style="left: 20px;" name="codeSnippet" id="codeEditor" rows="4" cols="50" placeholder="Enter code snippet"></textarea>
<!--                                    <input type="text" name="description" placeholder="Enter description">-->
                            <input name="a" value="<%= v %>" hidden>
                            <input name="b" id="inputValue7"  hidden>
                            <input name="c" value="<%= code %>" hidden><br>
                            <input type="submit" class="btn btn-primary btn-success" style="background-color: green;" value="Upload Code Snippet">
                        </form>
                    </div><br>

                  </div>
                  <div class="modal-footer10">
<!--                            <button type="button" class="btn btn-secondary" id="cancel-button10" data-bs-dismiss="modal">Close</button>-->
                  </div>
                </div>
            </div>
            
<!--            <br><br><br><br><br><br><br><br>
            
            <div align="center" class="chart-container">
                <canvas id="myChart" width="100" height="100"></canvas>
            </div>
            <%-- 
   // Establish database connection
   String jdbcUrl = "jdbc:mysql://localhost:3306/projekta";
   String username = "root";
   String divisionValue="";
   String password = "root";
   Connection conn = null;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl, username, password);
      
      // Execute the query to retrieve data
      String query = "SELECT done FROM tasks";
      stmt = conn.prepareStatement(query);
      rs = stmt.executeQuery();
      
      // Count the number of true and false values
      int trueCount = 0;
      int falseCount = 0;
      while (rs.next()) {
         boolean done = rs.getBoolean("done");
         if (done) {
            trueCount++;
         } else {
            falseCount++;
         }
      }
      
      // Calculate the division
      double division = (double) trueCount / (trueCount + falseCount) * 100;
      int roundedDivision = (int) Math.round(division);
      
      // Convert the rounded division to JavaScript format
      divisionValue = Integer.toString(roundedDivision);
} catch (Exception e) {
      e.printStackTrace();
} finally {
      // Close the database resources
      try {
         if (rs != null)
            rs.close();
         if (stmt != null)
            stmt.close();
         if (conn != null)
            conn.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
}
--%>
            -->
        </div>


<!--            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
   // Get the canvas element
   var ctx = document.getElementById('myChart').getContext('2d');

   // Define the chart data
   var chartData = {
      labels: ['Done', 'Not Done'],
      datasets: [{
         data: [<%--= divisionValue %>, <%= 100 - Integer.parseInt(divisionValue) --%>],
         backgroundColor: ['green', 'red']
      }]
   };

   // Create the pie chart
   var myChart = new Chart(ctx, {
      type: 'pie',
      data: chartData,
      options: {
                responsive: true,
                maintainAspectRatio: false
            }
   });
</script>-->

        <script>
            var editor = CodeMirror.fromTextArea(document.getElementById("codeEditor"), {
                lineNumbers: true,
                mode: "javascript", // Specify the modes you want to support, separated by a space
                theme: "default", // Adjust the theme as per your preference
            });
        </script>
        
        <script>
            function animateProgressBar() {
                var progressBar = document.getElementById('progress-bar');
                var targetWidth = progressBar.getAttribute('aria-valuenow') + '%';

                progressBar.style.width = '0%'; // Set initial width to 0%

                setTimeout(function() {
                    progressBar.style.transition = 'width 1s ease-in-out';
                    progressBar.style.width = targetWidth;
                }, 100); // Delay the animation for 100 milliseconds
            }

            window.onload = function () {
                animateProgressBar();
            };
        </script>
            
        <script>
            let card = document.querySelector(".card");
            let displayPicture = document.querySelector(".display-picture");

            displayPicture.addEventListener("click", function () {
                card.classList.toggle("hidden")
            })
        </script>
        <script>
            const addButton = document.querySelector('.centre-button');
            const modal = document.getElementById('modal');
            const cancelButton = document.getElementById('cancel-button');
            const saveButton = document.getElementById('save-button');
            const closeButton = document.querySelector('.btn-close');

            closeButton.addEventListener('click', () => {
                modal.classList.remove('show');
                modal.style.display = 'none';
            });

            addButton.addEventListener('click', () => {
                modal.style.display = 'block';
            });

            cancelButton.addEventListener('click', () => {
                modal.style.display = 'none';
            });

        </script>
        <script>
            const addButton2 = document.querySelector('.centre-button2');
            const modal2 = document.getElementById('modal2');
            const cancelButton2 = document.getElementById('cancel-button2');
            const saveButton2 = document.getElementById('save-button2');
            const closeButton2 = document.querySelector('.btn-close2');

            closeButton2.addEventListener('click', () => {
                modal2.classList.remove('show');
                modal2.style.display = 'none';
            });

            addButton2.addEventListener('click', () => {
                modal2.style.display = 'block';
            });

            cancelButton2.addEventListener('click', () => {
                modal2.style.display = 'none';
            });

        </script>
        <script>
            const addButton3 = document.querySelector('.centre-button3');
            const modal3 = document.getElementById('modal3');
            const cancelButton3 = document.getElementById('cancel-button3');
            const saveButton3 = document.getElementById('save-button3');
            const closeButton3 = document.querySelector('.btn-close3');

            closeButton3.addEventListener('click', () => {
                modal3.classList.remove('show');
                modal3.style.display = 'none';
            });

            addButton3.addEventListener('click', () => {
                modal3.style.display = 'block';
            });

            cancelButton3.addEventListener('click', () => {
                modal3.style.display = 'none';
            });

        </script>

        <script>
            const addButton4 = document.querySelector('.centre-button4');
            const modal4 = document.getElementById('modal4');
            const cancelButton4 = document.getElementById('cancel-button4');
            const saveButton4 = document.getElementById('save-button4');
            const closeButton4 = document.querySelector('.btn-close4');

            closeButton4.addEventListener('click', () => {
                modal4.classList.remove('show');
                modal4.style.display = 'none';
            });

            addButton4.addEventListener('click', () => {
                modal4.style.display = 'block';
            });

            cancelButton4.addEventListener('click', () => {
                modal4.style.display = 'none';
            });

        </script>

        <script>
            const addButton5 = document.querySelector('.centre-button5');
            const modal5 = document.getElementById('modal5');
            const cancelButton5 = document.getElementById('cancel-button5');
            const saveButton5 = document.getElementById('save-button5');
            const closeButton5 = document.querySelector('.btn-close5');

            closeButton5.addEventListener('click', () => {
                modal5.classList.remove('show');
                modal5.style.display = 'none';
            });

            addButton5.addEventListener('click', () => {
                modal5.style.display = 'block';
            });

            cancelButton5.addEventListener('click', () => {
                modal5.style.display = 'none';
            });

        </script>
        
        <script>
            
            const addButton10 = document.querySelectorAll('.centre-button10');
            const modal10 = document.getElementById('modal10');
            const closeButton10 = document.querySelector('.btn-close10');
            const inputValue = document.getElementById('inputValue');
            const inputValue2 = document.getElementById('inputValue2');
            const inputValue3 = document.getElementById('inputValue3');
            const inputValue4 = document.getElementById('inputValue4');
            const inputValue5 = document.getElementById('inputValue5');
            const inputValue6 = document.getElementById('inputValue6');
            const inputValue7 = document.getElementById('inputValue7');

            closeButton10.addEventListener('click', () => {
              modal10.style.display = 'none';
            });

            addButton10.forEach(button => {
              button.addEventListener('click', function() {
                const value = this.getAttribute('data-value');
                inputValue.value = value;
                inputValue2.value = value;
                inputValue3.value = value;
                inputValue4.value = value;
                inputValue5.value = value;
                inputValue6.value = value;
                inputValue7.value = value;
                modal10.style.display = 'block';
              });
            });
            
            const cancelButton10 = document.getElementById('cancel-button10');
            const saveButton10 = document.getElementById('save-button10');

            cancelButton10.addEventListener('click', () => {
              modal10.style.display = 'none';
            });

            saveButton10.addEventListener('click', () => {
              // Handle save functionality here
            });
            
        </script>
        
        <script>
            function showCanvas() {
                var canvas = document.getElementById("myCanvas");
                canvas.style.display = "block";
                var overlay = document.getElementById("overlay");
                overlay.style.display = "block";
                var closeButton = document.getElementById("closeButton");
                closeButton.style.display = "block";
                canvas.width = 1000; // Set the desired width of the canvas
                canvas.height = 500; // Set the desired height of the canvas

                var ctx = canvas.getContext("2d");

                // Set up event listeners for drawing
                canvas.addEventListener("mousedown", startDrawing);
                canvas.addEventListener("mousemove", draw);
                canvas.addEventListener("mouseup", stopDrawing);
                canvas.addEventListener("mouseout", stopDrawing);

                var isDrawing = false;
                var lastX = 0;
                var lastY = 0;

                function startDrawing(e) {
                    isDrawing = true;
                    [lastX, lastY] = [e.offsetX, e.offsetY];
                }

                function draw(e) {
                    if (!isDrawing)
                        return;
                    ctx.beginPath();
                    ctx.moveTo(lastX, lastY);
                    ctx.lineTo(e.offsetX, e.offsetY);
                    ctx.stroke();
                    [lastX, lastY] = [e.offsetX, e.offsetY];
                }

                function stopDrawing() {
                    isDrawing = false;
                }
            }
            function closeCanvas() {
                var canvas = document.getElementById("myCanvas");
                var overlay = document.getElementById("overlay");
                var closeButton = document.getElementById("closeButton");

                canvas.style.display = "none";
                overlay.style.display = "none";
                closeButton.style.display = "none";
            }
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const expandBtns = document.getElementsByClassName('expandBtn');
                const closeBtns = document.getElementsByClassName('closeBtn');

                for (let i = 0; i < expandBtns.length; i++) {
                    const expandBtn = expandBtns[i];
                    const closeBtn = closeBtns[i];
                    const expandedContent = expandBtn.nextElementSibling;

                    expandBtn.addEventListener('click', function () {
                        expandedContent.style.display = 'block';
                        expandBtn.style.display = 'none';
                        closeBtn.style.display = 'inline-block';
                    });

                    closeBtn.addEventListener('click', function () {
                        expandedContent.style.display = 'none';
                        expandBtn.style.display = 'inline-block';
                        closeBtn.style.display = 'none';
                    });
                }
                
            });
        </script>
        
        <script>
            function displayTime() {
                var date = new Date();
                var hours = date.getHours();
                var minutes = date.getMinutes();
                var seconds = date.getSeconds();
                var ampm = hours >= 12 ? 'PM' : 'AM';
                hours = hours % 12;
                hours = hours ? hours : 12;
                minutes = minutes < 10 ? '0' + minutes : minutes;
                seconds = seconds < 10 ? '0' + seconds : seconds;
                var time = hours + ':' + minutes + ':' + seconds + ' ' + ampm;
                var month = date.getMonth() + 1;
                var day = date.getDate();
                var year = date.getFullYear();
                var dateStr = month + '/' + day + '/' + year;
                var dateTimeStr = time + ' | ' + dateStr;
                document.getElementById('clock').innerHTML = dateTimeStr;

                setTimeout(displayTime, 1000);
            }

            window.onload = function () {
                displayTime();
            }
        </script>


    </body>
</html>