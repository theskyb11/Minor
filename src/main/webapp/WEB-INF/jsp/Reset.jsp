<%-- 
    Document   : dashboard
    Created on : 17-Mar-2023, 1:19:58 pm
    Author     : Akash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String pass="";%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Projekta - Dashboard</title>
        
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
                width: 90%;
                margin-top: 30px;
                margin-right: 20px;
                margin-left: 120px;
                /*                position: scroll;*/
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
            
            .forgot-pass-div {
/*                box-shadow: rgba(0, 0, 0, 0.16) 0 1px 4px;*/
                width: 80%;
                text-align: center;
            }

            .form-input {
                width: 50%!important;
                border: none;
                font-size: 0.9rem;
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

            .btn {
                background-color: #1e53ff;
                border-radius: 30px;
                padding: 10px;
                color: white;
                border: none;
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
            r{
                font-size: 30px;
/*                text-align: left;
                position:absolute;*/
                justify-content: space-between;
                font-family: 'Poppins', sans-serif;
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
        </style>
    </head>

    <body>
        <div class="clock" id="clock"></div>
        <div class="container">
            <div class="forgot-pass-div">
                <div class="row">
                    <div align="left" class="col-md-12">
                        <r>Change Password</r>
                        <hr style="color: black; width: 80%; position: absolute; top: 85px; left: 120px;">
                    </div>
                </div><br>
                <p style="color: #6b6b6b; text-align: center; margin-left: 80px; margin-right: 20px"><br>You'll be logged out of all sessions except this one to protect your account if anyone is trying to gain access.

<br><br>Your password must be at least 6 characters and should include a combination of numbers, letters and special characters (!$@%).</p><br><br>

                <form action="Resetpass" method="post" class="forgot-pass-form" id="form">
                    <input type="text" name="a" class="form-input" placeholder="Enter Old Password" id="oldpass" required /><br>
                    <input type="text" name="b" class="form-input" placeholder="Enter New Password" id="newpass" required /><br>
                    <input type="text" name="c" class="form-input" placeholder="Re-enter New Password" id="confirmpass" required /><br><br>
                    <span id="password-error" style="color: red;"></span><br>
                    <input type="submit" value="   Submit   " class="btn-primary btn"><br><br><br>
                </form>
            </div>
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
                <li class="list">
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
                <li class="list active">
                    <b></b>
                    <b></b>
                    <a href="Reset">
                        <span class="icon">

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
        <%try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
            PreparedStatement stmt = con.prepareStatement("select * from users where username=?");
            stmt.setString(1, (String) session.getAttribute("userName"));
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                pass=rs.getString("password");
            }
            }
        catch(Exception k){
        k.getMessage();
    }%>
        <script>
        const form = document.getElementById("form");
        form.addEventListener("submit", function(event) {
            const a = document.getElementById("oldpass");
            const b = document.getElementById("newpass");
            const c = document.getElementById("confirmpass");
            const d = '<%=pass%>';

            if (!a.value || !b.value || !c.value) {
                alert("All fields are required.");
                event.preventDefault();
            } else if (b.value !== c.value) {
                alert("New passwords do not match.");
                event.preventDefault();
            } else if (a.value !== d.value) {
                alert("Wrong password entered.");
                event.preventDefault();
            } else if (!isPasswordValid(b.value)) {
                alert("Password must be at least 6 characters and include a combination of numbers, letters, and special characters (!$@%).");
                event.preventDefault();
            }
            });
        function isPasswordValid(password) {
            const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/;
            return passwordPattern.test(password);
        }
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