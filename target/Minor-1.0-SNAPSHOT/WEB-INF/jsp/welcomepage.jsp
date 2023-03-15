<!DOCTYPE html>
<html>
    <head>
        <title>Progeakta</title>
        <style>
            body {
                background-color: #111;
                color: #fff;
                font-family: Arial, sans-serif;
            }
            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
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
        <nav class="navbar">
            <img src="logo.png" alt="Logo">
            <div class="navbar-links">
                <a class="navbar-link" href="#">Login</a>
                <a class="navbar-link" href="#">Signup</a>
                <a class="navbar-link" href="#">Contact Us</a>
            </div>
        </nav>
    </body>
</html>
