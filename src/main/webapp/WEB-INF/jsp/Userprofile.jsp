<%-- 
    Document   : dashboard
    Created on : 17-Mar-2023, 1:19:58 pm
    Author     : Akash
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<% String p = (String) request.getAttribute("NM");
        String q = (String) request.getAttribute("PHN");
        String r = (String) request.getAttribute("USNM");
        String s = (String) request.getAttribute("EM");
        String t = (String) request.getAttribute("ALTEM");
        String u = (String) request.getAttribute("ADD");
        String z = (String) request.getAttribute("QUAL");
        String abt = (String) request.getAttribute("ABT");
        String lin = (String) request.getAttribute("LIN");
        String git = (String) request.getAttribute("GIT");
        String twit = (String) request.getAttribute("TWIT");
        String insta = (String) request.getAttribute("INSTA");
        String fb = (String) request.getAttribute("FB");
    %>
    <head>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Projekta | Profile</title>
        <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");
            @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap');
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            
            #edit-profile-btn {
                outline: none;
                border: 2px solid white;
                border-radius: 30px;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 15px;
                background-color: blue;
                color: white;
            }
            
            body {
                min-height: 100vh;
                background: #fff;
            }

            .navigation {
                position: fixed;
                top: 20px;
                left: 20px;
                bottom: 20px;
                width: 70px;
                border-radius: 10px;
                box-sizing: inital;
                border-left: 5px solid 4d5bf9;
                background: blue;
                transition: width 0.5s;
                overflow-x: hidden;
            }

            .navigation.active {
                width: 300px;
            }

            .navigation ul {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                padding-left: 5px;
                padding-top: 40px;
            }

            .navigation ul li {
                position: relative;
                list-style: none;
                width: 100%;
                border-top-left-radius: 20px;
                border-bottom-left-radius: 20px;

            }

            .navigation ul li.active {
                background: white;
            }

            .navigation ul li b:nth-child(1) {
                position: absolute;
                top: -20px;
                height: 20px;
                width: 100%;
                background: white;
                display: none;
            }

            .navigation ul li b:nth-child(1)::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                border-bottom-right-radius: 20px;
                background: blue;
            }

            .navigation ul li b:nth-child(2) {
                position: absolute;
                bottom: -20px;
                height: 20px;
                width: 100%;
                background: white;
                display: none;
            }

            .navigation ul li b:nth-child(2)::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                border-top-right-radius: 20px;
                background: blue;
            }

            .navigation ul li.active b:nth-child(1) .navigation ul li.active b:nth-child(2) {
                display: block;
            }

            .navigation ul li a {
                position: relative;
                display: block;
                width: 100%;
                display: flex;
                text-decoration: none;
                color: #fff;
            }

            .navigation ul li.active a {
                color: #333;
            }

            .navigation ul li a .icon {
                position: relative;
                display: block;
                min-width: 60px;
                height: 60px;
                line-height: 60px;
                text-align: center;
            }

            .navigation ul li a .icon ion-icon {
                font-size: 1.5em;
            }

            .navigation ul li a .title {
                position: relative;
                display: block;
                padding-left: 10px;
                height: 60px;
                line-height: 60px;
                white-space: normal;
            }

            .toggle {
                position: fixed;
                top: 20px;
                right: 20px;
                width: 50px;
                height: 50px;
                background: blue;
                border-radius: 10px;
                cursor: pointer;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .toggle.active {
                background: #ff4d89;
            }

            .toggle ion-icon {
                position: absolute;
                color: white;
                font-size: 34px;
            }

            .toggle ion-icon.open,
            .toggle.active ion-icon.close {
                display: block;
            }

            .toggle ion-icon.close,
            .toggle.active ion-icon.open {
                display: none;
            }

            @media only screen and (max-width: 768px) {
                .project-card {
                    width: 100%;
                }
            }

            .main-details-div {
                margin-top: 10px;
                font-family: 'Poppins', sans-serif;
                width: 100%;
            }
            .details-col {
                margin-top: 10px;
                background-color: white;
                width: 70%;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                border-radius: 10px;
            }

            .project-cards {
                position: fixed;
                top: 0;
                left: 120px;
                width: calc(100% - 220px);
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px;
            }

            .card {
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                padding: 20px;
                width: calc(33.33% - 20px);
                text-align: center;
            }

            .card h3 {
                font-size: 20px;
                margin-bottom: 10px;
            }

            .button {
                display: inline-block;
                background-color: #4CAF50;
                color: #fff;
                padding: 5px 10px;
                border-radius: 5px;
                text-decoration: none;
            }
            
            .button:hover {
                background-color: #3e8e41;
            }
            
            .card p {
                font-size: 16px;
                margin-bottom: 20px;
            }

            .button {
                display: inline-block;
                background-color: #4CAF50;
                color: #fff;
                padding: 5px 10px;
                border-radius: 5px;
                text-decoration: none;
            }

            .button:hover {
                background-color: #3e8e41;
            }

            .progress-container {
                border-radius: 50px;
                width: 85%;
                height: 30px;
                position: fixed;
                bottom: 10%;
                left:10%;
                right: -10px;
                background-color: #f2f2f2;
            }

            h1{
                font-family: 'Josefin Sans', sans-serif;
                font-weight: bold;
            }
            .progress-bar {
                border-radius: 50px;
                height: 100%;
                background-color: #4CAF50;
                width: 0%;
            }
            .clock{
                color: black;
                font-size: 0.9rem;
                top: 27px;
                position: fixed;
                margin-left: 960px;
                /*                padding: 5px 10px;
                                background-color: blue;  
                                border-radius: 10px;
                                width: 200px;*/
            }
            .btn-primary{
                border-radius: 40px;
                background-color: #1e53ff;
                border: none;
                outline: none;
                padding: 10px;
            }
            r{
                left: 380px;
                top: 90px;
                position:absolute;
                font-size: 30px;
/*                justify-content: space-between;*/
                font-family: 'Poppins', sans-serif;
            }
            
            .profile-image{
                width: 100%;
            }
            
            .hover-textpic {
                position: absolute;
/*                top: 100%;
                left: 120%;*/
                margin-top: 130px;
                width: 130px;
                transform: translateX(-50%);
                padding: 5px;
                background-color: white;
                color: #000;
                font-size: 14px;
                visibility: hidden;
                border-radius: 10px;
                opacity: 0;
                
                transition: opacity 0.3s ease-in-out;
            }

            .profile-image:hover .hover-textpic {
                visibility: visible;
                background-color: white;
                opacity: 1;
                z-index: 3;
            }
            
            .form-control, .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }
            
            .form-input {
                display: block;
                border: none;
                outline: none;
                border-bottom: 1px solid #949494;
                width: 70%;
                margin-left: 20px;
            }

            .form-input:hover {
                border-bottom: 2px solid #1e53ff;
            }
            
            .img-account-profile {
                height: 10rem;
                width: 10rem;
            }

            .img-account-profile:hover {
                border: 2px solid #1e53ff;
            }
            .container{
                width: 90%;
                margin-top: 30px;
                margin-right: 20px;
                margin-left: 120px;
                /*                position: scroll;*/
            }
            .card1 {
                top:100px;
                position: absolute;
                left: 120px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                padding: 20px;
                width:20%;
                text-align: center;
                height: 40%;
            }
            
            .card3 {
                top:60vh;
                position: absolute;
                left: 120px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                padding: 20px;
                width:20%;
                text-align: center;
                height: 40%;
            }
            
            .card2 {
                position: absolute;
                left: 400px;
                top: 150px;
                background-color: #fff;
/*                border-radius: 5px;*/
/*                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);*/
/*                padding: 20px;*/
                width:65%;
                text-align: center;
            }
            .display-picture{
                margin-left: auto;
            }
            .display-picture img{
                width: 50px;
                border-radius: 50%;
            }
            .display-picture img:hover{
                border:2px solid #1e53ff;
            }
        </style>
    </head>
    
    <%
        String usnm=(String) session.getAttribute("userName");
        String nm="";
        String mail="";
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("select * from users where username=?");
            stmt.setString(1, usnm);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next())
            {
                nm = rs.getString("name");
                mail = rs.getString("email");
            }
        }
        catch(Exception k)
        {
            System.out.println(k);
        }
    %>

    <body>
        <div class="clock" id="clock"></div>
        <div class="container">
            <form action="userprofile" method="post" id="form" enctype="multipart/form-data">
            <div class="row">
                <div class="col">
                    <div class="card1">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">
                            <%  boolean result = false;
                                try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
//                                PreparedStatement stmt = con.prepareStatement("select * from user_image where username=?");
                                PreparedStatement stmt = con.prepareStatement("select count(*) from user_image where username=?");
                                stmt.setString(1,(String) session.getAttribute("userName"));
                                ResultSet rst = stmt.executeQuery();
                                if (rst.next()) {
                                    int count = rst.getInt(1);
                                    if (count > 0) {
                                        result = true;
                                    }
                                }
                                if (result) {
                                    PreparedStatement stmt1 = con.prepareStatement("select * from user_image where username=?");
                                    stmt1.setString(1, (String) session.getAttribute("userName"));

                                    ResultSet rs=stmt1.executeQuery();

                                    while (rs.next())
                                    {
                                        Blob imageBlob = rs.getBlob("data");
                                        InputStream imageStream = imageBlob.getBinaryStream();
                                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                                        byte[] buffer = new byte[4096];
                                        int n = 0;
                                        while (-1 != (n = imageStream.read(buffer))) {
                                            outputStream.write(buffer, 0, n);
                                        }
                                        byte[] imageBytes = outputStream.toByteArray();

                            %>
                            <div class="profile-image"><img id="profile-image" class="img-account-profile rounded-circle mb-2" alt="..." align="center" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imageBytes) %>" /><span class="hover-textpic">Preferred if uploading a square image</span></div>
                            <input id="profile-image-input" type="file" style="font-size: 0.8rem;display:none;" accept="image/png, image/jpeg" name="profile-image" />
                            <%
                                }} else {
                            %>
                            <div id="image-upload">
                                <div class="profile-image" id="profile-image"><i style="font-size: 150px; color: #3b3b3b;" class="fas fa-user-circle"></i><span class="hover-textpic">Preferred if uploading a square image</span></div>
<!--                                <img id="profile-image" src="<!--c:url value="/resources/images/user-icon-default.png" />" alt="Projekta backgrnd" style="width: 100px; height: 100px;"/><br><br>-->
                                <input id="profile-image-input" type="file" style="font-size: 0.8rem;display:none;" accept="image/png, image/jpeg" name="profile-image"/>
                            </div>
                                <%
                                    }} catch(Exception k)
                                {
                                    System.out.println("here");
                                    System.out.println(k);
                                }
                            %>
                            <br><br><br>
                            <br><br>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card3">
                        <div class="card-header">About</div><br>    
                        <%
                            try{
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
                                PreparedStatement stmt = con.prepareStatement("select * from users where username=?");
                                stmt.setString(1, (String) session.getAttribute("userName"));
                                ResultSet rs=stmt.executeQuery();
                                while(rs.next())
                                {%>
                                <%= rs.getString("qualifications")%><hr><%= rs.getString("about")%>
                                <%}
                            }
                            catch(Exception k){
                            k.getMessage();
                            }
                        %>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <r><%=nm%></r>
                    <div class="col" style="display: flex; position: absolute; right: 90px; align-items: center;top: 80px;">
                        <button type="button" id="edit-profile-btn"><span class="material-symbols-outlined">edit</span>Edit Profile</button>
                    </div>
                    <hr style="color: black; width: 65%; top: 130px; left: 380px; position: absolute;">
                </div>
            </div>
            <div class="col-xl-8">
                <div class="card2">
<!--                    <div class="card-header">Account Details</div>-->
                        <div class="card-body">
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputUsername" style="margin-left: 20px;color: #6b6b6b;">Username</label>
                                <input class="form-input" id="inputUsername" name="inputUsername" type="text" value="<%= r%>" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputName" style="margin-left: 20px;color: #6b6b6b;">Name</label>
                                <input class="form-input" id="inputName" name="inputName" type="text" value="<%= p%>" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputPhone" style="margin-left: 20px;color: #6b6b6b;">Phone</label>
                                <input class="form-input" id="inputPhone" name="inputPhone" type="text" value="<%= q%>" maxlength="10" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputEmail" style="margin-left: 20px;color: #6b6b6b;">Email</label>
                                <input class="form-input" id="inputEmail" name="inputEmail" type="text" value="<%= s%>" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputAlternateEmail" style="margin-left: 20px;color: #6b6b6b;">Alternate Email</label>
                                <input class="form-input" id="inputAlternateEmail" name="inputAlternateEmail" type="text" value="<%= t%>" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputAddress" style="margin-left: 20px;color: #6b6b6b;">Address</label>
                                <input class="form-input" id="inputAddress" name="inputAddress" type="text" value="<%= u%>" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputQualifications" style="margin-left: 20px;color: #6b6b6b;">Qualifications</label>
                                <input class="form-input" id="inputQualifications" name="inputQualifications" type="text" value="<%= z%>" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputAbout" style="margin-left: 20px;color: #6b6b6b;">About</label>
                                <textarea class="form-input" id="inputAbout" name="inputAbout" value="<%= abt%>" readonly></textarea>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputLinkedin" style="margin-left: 20px;color: #6b6b6b;">LinkedIn Profile</label>
                                <input class="form-input" id="inputLinkedin" name="inputLinkedin" type="text" value="<%= lin%>" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputGit" style="margin-left: 20px;color: #6b6b6b;">Github Profile</label>
                                <input class="form-input" id="inputGit" name="inputGit" type="text" value="<%= git%>" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputTwitter" style="margin-left: 20px;color: #6b6b6b;">Twitter Profile</label>
                                <input class="form-input" id="inputTwitter" name="inputTwitter" type="text" value="<%= twit%>" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputInsta" style="margin-left: 20px;color: #6b6b6b;">Instagram Profile</label>
                                <input class="form-input" id="inputInsta" name="inputInsta" type="text" value="<%= insta%>" readonly>
                            </div>
                            <div class="mb-3">
                                <br><label class="small mb-1" for="inputFB" style="margin-left: 20px;color: #6b6b6b;">Facebook Profile</label>
                                <input class="form-input" id="inputFB" name="inputFB" type="text" value="<%= fb%>" readonly>
                            </div>
                            <br>
                            <input class="btn-primary" type="submit" value="Save changes"><br><br>
                        </div>
                </div>
            </div>
            </form>
        </div>

        <div class="navigation">

            <ul>
                <li class="list">
                    <b></b>
                    <b></b>
                    <a href="dashboard">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Home</span>
                    </a>
                </li>
                <li class="list  active">
                    <b></b>
                    <b></b>
                    <a href="userprofile">
                        <span class="icon">

                            <ion-icon name="person-circle-outline"></ion-icon>
                        </span>
                        <span class="title">Profile</span>
                    </a>
                </li>
                <li class="list">
                    <b></b>
                    <b></b>
                    <a href="#">
                        <span class="icon">

                            <ion-icon name="chatbox-ellipses-outline"></ion-icon>
                        </span>
                        <span class="title">Message</span>
                    </a>
                </li>
                <li class="list">
                    <b></b>
                    <b></b>
                    <a href="settings">
                        <span class="icon">

                            <ion-icon name="settings-outline"></ion-icon>
                        </span>
                        <span class="title">Setting</span>
                    </a>
                </li>
                <li class="list">
                    <b></b>
                    <b></b>
                    <a href="users">
                        <span class="icon">

                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                        <span class="title">Users</span>
                    </a>
                </li>
                <li class="list">
                    <b></b>
                    <b></b>
                    <a href="Reset">
                        <span class="icon">
<!--                            <ion-icon name="password-change-outline"></ion-icon>-->
                            <ion-icon name="lock-open-outline"></ion-icon>
                        </span>
                        <span class="title">Password</span>
                    </a>
                </li>
                <li class="list">
                    <b></b>
                    <b></b>
                    <a href="logout">
                        <span class="icon">

                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="toggle" ?>
            <ion-icon name="menu-outline" class="open"></ion-icon>
            <ion-icon name="close-outline" class="close"></ion-icon>
        </div>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

        <script>
            let menuToggle = document.querySelector('.toggle');
            let navigation = document.querySelector('.navigation')
            menuToggle.onclick = function () {
                menuToggle.classList.toggle('active');
                navigation.classList.toggle('active');
            }
            let list = document.querySelectorAll('.list');
            for (let i = 0; i < list.length; i++) {
                list[i].onclick = function () {
                    let j = 0;
                    while (j < list.length) {
                        list[j++].className = 'list';
                    }
                    list[i].className = 'list active';
                }
            }


            function move() {
                var elem = document.getElementById("myBar");
                var width = 0;
                var id = setInterval(frame, 10);
                function frame() {
                    if (width >= 100) {
                        clearInterval(id);
                    } else {
                        width++;
                        elem.style.width = width + '%';
                    }
                }
            }
            window.onload = move;

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
        <script>
            const inputField = document.querySelector("#inputPhone");

            inputField.addEventListener("input", function(event) {
                const value = event.target.value;
                if (!/^\d*$/.test(value)) {
                    event.target.value = value.replace(/[^0-9]/g, "");
                }
            });
            
            const form = document.getElementById("form");
            form.addEventListener("submit", function(event) {
                const a = document.getElementById("inputUsername");
                const b = document.getElementById("inputName");
                const c = document.getElementById("inputPhone");
                const d = document.getElementById("inputEmail");
                const e = document.getElementById("inputAlternateEmail");
                const f = document.getElementById("inputQualifications");
                const g = document.getElementById("inputAbout");
                const h = document.getElementById("inputLinkedin");
                const i = document.getElementById("inputGit");
                const j = document.getElementById("inputTwitter");
                const k = document.getElementById("inputInsta");
                const l = document.getElementById("inputFB");

                if (!a.value || !b.value || !c.value || !d.value || !e.value || !e.value || !f.value || !h.value || !i.value || !j.value || !k.value || !l.value) {
                    alert("All fields are required.");
                    event.preventDefault();
                }
            });
            
            document.getElementById("edit-profile-btn").addEventListener("click", function() {
            document.getElementById("inputName").removeAttribute("readonly");
            document.getElementById("inputEmail").removeAttribute("readonly");
            document.getElementById("inputAlternateEmail").removeAttribute("readonly");
            document.getElementById("inputAddress").removeAttribute("readonly");
            document.getElementById("inputPhone").removeAttribute("readonly");
            document.getElementById("inputQualifications").removeAttribute("readonly");
            document.getElementById("inputAbout").removeAttribute("readonly");
            document.getElementById("inputLinkedin").removeAttribute("readonly");
            document.getElementById("inputGit").removeAttribute("readonly");
            document.getElementById("inputTwitter").removeAttribute("readonly");
            document.getElementById("inputInsta").removeAttribute("readonly");
            document.getElementById("inputFB").removeAttribute("readonly");
        });
        </script>
<!--        <script>
        function toggleImageInput() {
          var input = document.getElementById("profile-image");
          if (input.style.display === "none") {
            input.style.display = "inline";
          } else {
            input.style.display = "none";
          }
        }
        </script>-->
        
        <script>
  // Get references to the image and input elements
  const profileImage = document.getElementById("profile-image");
  const profileImageInput = document.getElementById("profile-image-input");

  // Add a click event listener to the image
  profileImage.addEventListener("click", function() {
    // Trigger the click event on the file input
    profileImageInput.click();
  });
</script>


        
    </body>

</html>