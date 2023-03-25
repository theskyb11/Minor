<%-- 
    Document   : dashboard
    Created on : 17-Mar-2023, 1:19:58 pm
    Author     : Akash
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int count=0;%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Projekta | Dashboard</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");
            @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Alkatra&family=Josefin+Sans&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Alkatra&family=Josefin+Sans&family=Nunito:wght@400;600;700&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=PT+Sans&display=swap');
            
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                align-self: center;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.2);
            }

            .modal-content {
                background-color: white;
                margin: 10% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
                position: relative;
            }
            
            .add-button {
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
            
            .msg-button{
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
            
            .modal button.close{
                display: none;
            }
            
            .text {
                display: none;
                font-size: 0.6rem;
            }

            button:hover + .text {
                display: block;
            }
            
/*            .add-button:hover {
                background-color: #3e8e41;
            }*/

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
            
            form {
                    padding: 0 1.5rem;
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
/*            .project-cards {
                width: calc(100% - 200px);
                justify-content: space-between;
                align-items: center;
                padding: 20px;
            }*/

            .card-text {
                padding-top: 10px;
                margin-top: 30px;
/*                margin-bottom: 4px;*/
                font-weight: 600;
                padding-left: 10px;
                font-family: 'PT Sans', sans-serif;
/*                font-family: 'Alkatra', cursive;*/
/*                font-family: 'Josefin Sans', sans-serif;*/
            }
            
            .card-head{
                position: relative;
            }
            
            .child-center {
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
            }

            .child-right {
                position: absolute;
                right: 0;
            }
            
            .card {
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                justify-content: space-between;
                margin-top: 10px;                
/*                padding: 20px;*/
                height: 250px;
                width: 300px;
                margin-left: 5px;
                margin-right: 5px;
                text-align: center;
            }

            .card h3 {
                margin-bottom: 10px;
                margin-top: 10px;
                font-size: 30px;
                font-weight: bold;
                font-family: 'Nunito', sans-serif;
            }

            .card p {
                font-size: 18px;
                font-weight: normal;
                margin-bottom: 0px;
                margin-left: 10px;
                margin-right: 10px;
            }
            
            .centre-button{
                text-decoration: none;
                 padding: 5px 10px;
                 color: #fff;
                 background-color:green;
                 width: 40%;
                 border-radius: 5px;
                 align-self: center;
                 margin-bottom: 10px;
            }
            
            .button {
                display: inline-block;
                background-color: #4CAF50;
                color: #fff;
                padding: 5px 10px;
                border-radius: 5px;
                text-decoration: none;
                width: 100px;
            }

            .button:hover {
                background-color: #3e8e41;
            }

            .container{
                width: 90%;
                margin-top: 30px;
                margin-right: 20px;
                margin-left: 120px;
/*                position: scroll;*/
            }
            
            cnt{
                font-size: 20px;
                width: calc(100% - 220px);
                justify-content: space-between;
                font-family: 'Poppins', sans-serif;
            }
            r{
                font-size: 30px;;
                justify-content: space-between;
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <r>Projects</r>
                    <hr style="color: black; width: 85%; top: 70px; left: 100px;">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <%
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
                            PreparedStatement state = con.prepareStatement("select count(*) from projects where username=?");
                            state.setString(1,(String) session.getAttribute("userName"));
                            
                            ResultSet rst = state.executeQuery();
                            
                            while (rst.next()) {
                                count = rst.getInt(1);
                            }
                        }
                        catch (Exception k){
                            System.out.println(k.getMessage());
                        }
                    %>
                    <cnt><%=count%> projects ongoing</cnt>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <table>
                        <%
                        int colind = 0;
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");

                            PreparedStatement stmt = con.prepareStatement("select * from projects where username=?");
                            stmt.setString(1,(String) session.getAttribute("userName"));
                            
                            ResultSet rs = stmt.executeQuery();

                            while(rs.next() && count<7){
                        %>
                        <td>
                            <div class="project-cards">
                                <div class="card">
                                    <div class="card-head">
                                        <div class="child-center">
                                            <h3><%= rs.getString("title")%></h3>
                                        </div>
                                        <div class="child-right">
                                            <form action="projectdelete" method="post" onsubmit="return confirm('Are you sure you want to delete this project?');">
                                                <button type="submit" style="border: none;">
                                                    <span class="material-symbols-outlined" style="color: red; background-color: white;margin-top: 0px; font-size: 1.6rem; border-top: 10px solid white; border-bottom: 10px solid white;">scan_delete</span>
                                                </button><div class="text">Delete Project</div><br>
                                                <input name="a" value="<%=session.getAttribute("userName")%>" hidden>
                                                <input name="b" value="<%=rs.getString("title")%>" hidden>
                                            </form>
                                        </div>
                                    </div>
                                    <hr style="width: 80%; color: black; align-self: center; margin-top: 60px; position: absolute;">
                                    <p class="card-text">
                                        <%= rs.getString("description")%></p>
                                    <a href="#" class="centre-button">View Project</a>
                                </div>
                            </div>
                        </td>
                        <%colind++;%>
                            <%if(colind % 3 == 0)
                            {
                            %></tr><tr>
                            <%}%>
                            <%
                            }
                            %>
                            <%
                            }
                            catch (Exception k){
                                System.out.println(k.getMessage());
                            }
                        %>
                    </table>
                </div>
            </div>
                              
                                        <br>
            <%
            if (count < 6) {
            %>
            <button class="add-button">Create New Project</button>
            <%
            } else {
            %>
            <button class="msg-button" onclick="alert('Maximum 6 projects allowed')" >Create New Project</button>
            <%
            }
            %>
            <!--button class="add-button">Create New Project</button-->

            <div id="modal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">New Project</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
<!--                    <h2>New Project</h2>-->
                    <div class="modal-body">
                        <form action="addproject" method="post">
                            <input type="text" id="project-user" value="<%=session.getAttribute("userName")%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                            <input type="text" id="project-title" class="form-control form-input" placeholder="title" name="b"/><br>
                            <textarea id="project-desc" class="form-control form-input" placeholder="descrition (word limit 100)" name="c" maxlength="100" /></textarea><br>                                
                            <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
                        </form>
                    </div>
                    <div class="modal-footer">
<!--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                    </div>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-md-12">
                    <r>Progress</r>
                    <hr style="color: black; width: 85%; top: 70px; left: 100px;">
                </div>
            </div>
        </div>
        <div class="navigation">

            <ul>
                <li class="list active">
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
                    <a href="welcomepage">
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
            const addButton = document.querySelector('.add-button');
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

            saveButton.addEventListener('click', (event) => {
              event.preventDefault();
              const nameInput = document.getElementById('project-user');
              const titleInput = document.getElementById('project-title');
              const descriptionInput = document.getElementById('project-description');
              const name = nameInput.value;
              const title = titleInput.value;
              const description = descriptionInput.value;
              // You can save the data to a database or perform any other action here
              console.log('Name:', name);
              console.log('Title:', title);
              console.log('Description:', description);
              modal.style.display = 'none';
            });
            
//            // Get a reference to the textarea element
//            const textarea = document.getElementById('prject-desc');
//
//            // Add an event listener to the textarea for the "input" event
//            textarea.addEventListener('input', () => {
//              // Get the current value of the textarea
//              const value = textarea.value.trim();
//
//              // Split the value into an array of words
//              const words = value.split(/\s+/);
//
//              // If the number of words is greater than 20, remove the last word
//              if (words.length > 20) {
//                // Remove the last word from the array
//                words.pop();
//                // Join the words back into a string and set it as the new textarea value
//                textarea.value = words.join(' ');
//              }
//            });

        </script>

    </body>

</html>


<!--                        <div class="card">
                                    <h3>Project 2</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet nibh eget lacus vestibulum
                                        malesuada. Aenean vel purus sapien.</p>
                                    <a href="#" class="button">View Project</a>
                                    <a href="https://www.imi.europa.eu/sites/default/files/uploads/documents/apply-for-funding/call-documents/imi1/Annex2_FinalReportTemplate.pdf" class="button btn-small">Print Report</a>
                                </div>-->

                                <!--        <div class="card">
                                            <h3>Project 3</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet nibh eget lacus vestibulum
                                                malesuada. Aenean vel purus sapien.</p>
                                            <a href="#" class="button">View Project</a>
                                            <a href="https://www-users.york.ac.uk/~dajp1/Project%20Reports.pdf" class="button btn-small">Print Report</a>
                                        </div>-->
                                
                                <!--                    <input type="text" value="<%--=session.getAttribute("res_id")--%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                                        <input type="text" id="offer-value" class="form-control form-input" placeholder="title" name="b"/><br>
                                        <input type="text" id="offer-id" class="form-control form-input" placeholder="descrition" name="c"/><br>-->
<!--                      <div class="add-button">
                      <button  onclick="openModal()">
                            Create New Project
                        </button>
                        <button id="add-project" onclick="addCard()">Create New Project</button>
                    </div>-->

<!--            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                Create New Project
            </button>
                                        
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                        </div>
                        <div class="modal-body">
                            <form action="addproject" method="post">
                                <input type="text" value="<%=session.getAttribute("res_id")%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                                <input type="text" id="offer-value" class="form-control form-input" placeholder="title" name="b"/><br>
                                <input type="text" id="offer-id" class="form-control form-input" placeholder="descrition" name="c"/><br>                                
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>-->

<!-- <a href="https://www.arsdcollege.ac.in/wp-content/uploads/2020/04/Lecture-2-Project-Report.pdf" class="button">Print Report</a>-->