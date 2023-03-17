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
            <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
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

        .project-cards {
            position: fixed;
            top: 0;
            left: 220px;
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

        .card p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .button {
            display: inline-block;
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }

        .button:hover {
            background-color: #3e8e41;
        }





        .progress-container {
            width: 100%;
            height: 30px;
            position: fixed;
            bottom: 10%;
            left:10%;
            right: -10px;
            background-color: #f2f2f2;
        }

        .progress-bar {
            height: 100%;
            background-color: #4CAF50;
            width: 0%;
        }
    </style>
</head>

<body>
    <div class="project-cards">
        <div class="card">
            <h3>Project 1</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet nibh eget lacus vestibulum
                malesuada. Aenean vel purus sapien.</p>
            <a href="#" class="button">View Project</a>
        </div>
        <div class="card">
            <h3>Project 2</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet nibh eget lacus vestibulum
                malesuada. Aenean vel purus sapien.</p>
            <a href="#" class="button">View Project</a>
        </div>
        <div class="card">
            <h3>Project 3</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet nibh eget lacus vestibulum
                malesuada. Aenean vel purus sapien.</p>
            <a href="#" class="button">View Project</a>
        </div>
    </div>
    <div class="progress-container">
        <div class="progress-bar" id="myBar"></div>
    </div>

    <div class="navigation">

        <ul>
            <li class="list active">
                <b></b>
                <b></b>
                <a href="#">
                    <span class="icon">
                        <ion-icon name="home-outline"></ion-icon>
                    </span>
                    <span class="title">Home</span>
                </a>
            </li>
            <li class="list">
                <b></b>
                <b></b>
                <a href="#">
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
                <a href="#">
                    <span class="icon">

                        <ion-icon name="settings-outline"></ion-icon>
                    </span>
                    <span class="title">Setting</span>
                </a>
            </li>
            <li class="list">
                <b></b>
                <b></b>
                <a href="#">
                    <span class="icon">

                        <ion-icon name="help-circle-outline"></ion-icon>
                    </span>
                    <span class="title">Help</span>
                </a>
            </li>
            <li class="list">
                <b></b>
                <b></b>
                <a href="#">
                    <span class="icon">

                        <ion-icon name="lock-open-outline"></ion-icon>
                    </span>
                    <span class="title">Password</span>
                </a>
            </li>
            <li class="list">
                <b></b>
                <b></b>
                <a href="#">
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
</body>

</html>