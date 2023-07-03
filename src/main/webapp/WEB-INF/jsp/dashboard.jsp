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
<% int count = 0;
String company_name="";
String position="";
try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
    PreparedStatement state = con.prepareStatement("select * from projects where username=?");
    state.setString(1, (String) session.getAttribute("userName"));
    ResultSet rs=state.executeQuery();
    
    while(rs.next()){
        company_name=rs.getString("company_code");
    }
    }
catch(Exception k){
    k.getMessage();
    }%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Projekta | Dashboard</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="path/to/fontawesome/css/all.min.css">
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
            
            .modal2 {
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

            .modal-content2 {
                background-color: white;
                margin: 10% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
                position: relative;
            }

            .add-button2 {
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

            .msg-button2{
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

            .modal2 button.close{
                display: none;
            }
            
            .modal3 {
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

            .modal-content3{
                background-color: white;
                margin: 10% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
                position: relative;
            }

            .add-button3 {
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

            .msg-button3{
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
            
/*            .modal3 .btn-close3 {
                display: none;
            }*/

            .modal3 .button-close{
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
                left: 45%;
                width: 70%;
                text-align: center;
                transform: translateX(-50%);
            }

            .child-right {
                width: 30%;
                position: absolute;
                right: 0;
            }
            
            .child-right1 {
                width: 30%;
                position: absolute;
                right: 0;
            }
            
            .hover-textcomp {
                position: absolute;
                transform: translateX(-50%);
                padding: 5px;
                top: 20px;
                background-color: #fff;
                color: #000;
                font-size: 14px;
                visibility: hidden;
                border-radius: 50px;
                opacity: 0;
                width: 160%;
                transition: opacity 0.3s ease-in-out;
            }

            .child-right1:hover .hover-textcomp {
                visibility: visible;
                opacity: 1;
                z-index: 2;
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
            
            .card1 {
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                justify-content: space-between;
                margin-top: 10px;
                /*                padding: 20px;*/
                height: 100px;
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
                padding: 5px 15px;
                color: #fff;
                background-color:green;
                width: 40%;
                border-radius: 5px;
                align-self: center;
/*                margin-bottom: 20px;*/
                vertical-align: middle;
                border-color: black;
            }
            
            .centre-button3{
                border-width: 0px;
                text-decoration: none;
                padding: 3.8px 10px;
                color: #fff;
                background-color:green;
                width: 40%;
                border-radius: 5px;
                align-self: center;
                margin-bottom: 2.5px;
                vertical-align: middle;
            }
            
            .member-button{
                text-decoration: none;
                padding: 5px 10px;
                color: #fff;
                background-color:green;
                width: 40%;
                border-radius: 5px;
                align-self: center;
                vertical-align: middle;
                top: 0px;
            }
            .member-button{
                vertical-align: middle;                
                text-decoration: none;
                padding: 5px 10px;
                color: #fff;
                background-color:green;
                width: 40%;
                border-radius: 5px;
                align-self: center;
                margin-bottom: 10px;
                border-color: green;
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
                font-size: 30px;
                ;
                justify-content: space-between;
                font-family: 'Poppins', sans-serif;
            }
            .clock{
/*                color: black;
                font-size: 0.9rem;
                top: 4px;
                position: fixed;
                left: 10px;
                width: 18%;
                border-radius: 20px;*/
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
            <div class="row">
                <div class="col-md-12">
                    <r>Projects</r>
                    <hr style="color: black; width: 85%; top: 70px; left: 100px;">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                            PreparedStatement state = con.prepareStatement("select count(*) from projects where username=? and progress='No'");
                            state.setString(1, (String) session.getAttribute("userName"));

                            ResultSet rst = state.executeQuery();

                            while (rst.next()) {
                                count = rst.getInt(1);
                            }
                        } catch (Exception k) {
                            System.out.println(k.getMessage());
                        }
                    %>
                    <cnt><%=count%> projects ongoing</cnt>
                </div>
            </div>
            
                        <%
                            int colind = 0;
                            String member="Member";
                            String manage="Project Management";
                            boolean exists=false, exists1=false;
                            try{
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

                                PreparedStatement stmt2 = con.prepareStatement("select * from users where username=?");
                                stmt2.setString(1, (String) session.getAttribute("userName"));
                                
                                ResultSet rst=stmt2.executeQuery();
                                while(rst.next())
                                {
                                    company_name=rst.getString("company_code");
                                    position = rst.getString("designation");
                                    exists=position.equals(member);
                                    exists1=position.equals(manage);
                                }
                                
                                if (!exists && !exists1)
                                {
                                %><div class="row">
                <div class="col-md-4">
                                <table><%
                                PreparedStatement stmt = con.prepareStatement("select * from projects natural join users where username=? and progress='No'");
                                stmt.setString(1, (String) session.getAttribute("userName"));

                                ResultSet rs = stmt.executeQuery();

                                while (rs.next() && count < 7) {
                                
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
                                                <input name="b" value="<%=rs.getString("project_id")%>" hidden>
                                            </form>
                                        </div>
                                    </div>
                                    <hr style="width: 80%; color: black; align-self: center; margin-top: 60px; position: absolute;">
                                    <p class="card-text">
                                        <%= rs.getString("description")%></p>
                                    <div style="display: inline-block; margin-bottom: 10px;">
                                        <a href="projectview?value=<%=rs.getString("project_id")%>" class="centre-button">View Project</a>
                                        <button class="centre-button3" data-value="<%=rs.getString("project_id")%>">Add users</button>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <%colind++;%>
                        <%if (colind % 3 == 0) {
                        %></tr><tr>
                            <%}%>
                            <%
                                }
                        %>
                        <%
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
                            <%}
            else
{
%><div class="row">
                <div class="col-md-4">
                                <table><%
                                PreparedStatement stmt = con.prepareStatement("select * from projects natural join users where username=? and progress='No'");
                                stmt.setString(1, (String) session.getAttribute("userName"));

                                ResultSet rs = stmt.executeQuery();

                                while (rs.next() && count < 7) {
                                
                        %>
                        <td>
                            <div class="project-cards">
                                <div class="card">
                                    <div class="card-head" style="width: 100%">
                                        <h3><%= rs.getString("title")%></h3>
<!--                                        <div class="child-right">
                                            <form action="projectdelete" method="post" onsubmit="return confirm('Are you sure you want to delete this project?');">
                                                <button type="submit" style="border: none;">
                                                    <span class="material-symbols-outlined" style="color: red; background-color: white;margin-top: 0px; font-size: 1.6rem; border-top: 10px solid white; border-bottom: 10px solid white;">scan_delete</span>
                                                </button><div class="text">Delete Project</div><br>
                                                <input name="a" value="<%--=session.getAttribute("userName")%>" hidden>
                                                <input name="b" value="<%=rs.getString("project_id")--%>" hidden>
                                            </form>
                                        </div>
-->                                 </div><hr style="width: 80%; color: black; align-self: center; margin-top: 60px; position: absolute;">
                                    <p class="card-text" style="margin-top: 20px;">
                                        <%= rs.getString("description")%></p>
                                    <div style="margin-bottom: 10px; margin-top: 10px">
                                        <a href="projectview?value=<%=rs.getString("project_id")%>" class="centre-button">View Project</a>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <%colind++;%>
                        <%if (colind % 3 == 0) {
                        %></tr><tr>
                            <%}%>
                            <%
                                }
                        %>
                        <%
                            %>
                    </table>
                </div>
            </div>

            <br>
            
            <button class="add-button2">Enter into new Project</button>
                            <%}
                            }
                            catch(Exception k){
                                k.getMessage();
                            }%>
                            
            <!-- end -->

            <div id="modal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">New Project</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <form action="addproject" method="post">
                            <input type="text" id="project-user" value="<%=session.getAttribute("userName")%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                            <input type="text" id="project-id" class="form-control form-input" placeholder="id" name="d"/><br>
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
                            
            <div id="modal3" class="modal3">
                <div style="border-radius: 10px;" class="modal-content3">
                    <div class="modal-header3">
                        <div class="row">
                            <div class="col">
                                <h5 class="modal-title3" id="exampleModalLongTitle">New Member or Vice Project Head</h5>
                            </div>
                            <div class="col text-end">
                                <button type="button" class="float-end" style="border: none; background: transparent;" id="cancel-button3" data-bs-dismiss="modal"><span class="material-symbols-outlined">close</span></button>  
                            </div>
                        </div>
                      <button type="button" class="btn-close3" data-bs-dismiss="modal3" hidden></button>
                      <hr>
                    </div>
                    <div class="modal-body3">
                        <form action="enteruser" method="post">
                            <input type="text" id="project-user" value="<%=session.getAttribute("userName")%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                            <input type="text" id="inputValue" class="form-control form-input" name="b" readonly="readonly"/><br>
                                <%
                                    try{
                                    Class.forName("com.mysql.cj.jdbc.Driver");

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

                                    PreparedStatement stmt2 = con.prepareStatement("select * from users where designation in ('Member','Project Management','Vice Project Head') and company_code=?");
                                    stmt2.setString(1, company_name);
                                    ResultSet rs=stmt2.executeQuery();%>
                            <input list="myOptions" id="project-id" class="form-control form-input" placeholder="username" name="u"/><br>
                            <datalist id="myOptions" class="my-datalist">
                                    <%while(rs.next()){
                                    %><option value="<%=rs.getString("username")%>"><%=rs.getString("name")%> <%=rs.getString("username")%></option><%
                                    }%>
                            </datalist>
                            <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
                                    <%}
                                    catch(Exception k){
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
                            
            <div id="modal2" class="modal2">
                <div style="border-radius: 10px;" class="modal-content2">
                    <div class="modal-header2">
                        <div class="row">
                            <div class="col">
                                <h5 class="modal-title2" id="exampleModalLongTitle">New Project</h5>
                            </div>
                            <div class="col text-end">
                                <button type="button" class="float-end" style="border: none; background: transparent;" id="cancel-button2" data-bs-dismiss="modal"><span class="material-symbols-outlined">close</span></button>  
                            </div>
                        </div>
                      <button type="button" class="btn-close2" data-bs-dismiss="modal2" hidden></button>
                      <hr>
                    </div>
                    <!--                    <h2>New Project</h2>-->
                    <div class="modal-body2">
                        <form action="enterproject" method="post">
                            <input type="text" id="project-user" value="<%=session.getAttribute("userName")%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                            <%String company_code="";
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                                
                                PreparedStatement stmt1 = con.prepareStatement("select * from users where username=?");
                                stmt1.setString(1, (String) session.getAttribute("userName"));
                                
                                ResultSet rst=stmt1.executeQuery();
                                while(rst.next()){
                                    company_code=rst.getString("company_code");
                                }
                                
                                PreparedStatement stmt = con.prepareStatement("select * from projects where project_id like ? group by project_id");
                                stmt.setString(1, company_code + "%");

                                ResultSet rs12 = stmt.executeQuery();
                            %>
                            <input list="myOptions1" id="project-id" class="form-control form-input" placeholder="Select project" name="d"/>
                            <datalist id="myOptions1" class="my-datalist">
                                <%while (rs12.next()) {%><option value="<%=rs12.getString("project_id")%>"><%=rs12.getString("title")%>   <%=rs12.getString("project_head")%></option><%}%>
                            </datalist>
                            <br>
                            <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
                            <%
                                } catch (Exception k) {
                                    k.getMessage();
                                }
                            %>
                        </form>
                    </div>
                    <div class="modal-footer2">
                        <!--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                    </div>
                </div>
            </div>
                            
            
            <%if(position.equals("CEO") || position.equals("Vice CEO")){%>
            <br><br>
            <div class="row">
                <div class="col-md-12">
                    <r>Undergoing projects in your Company</r>
                    <hr style="color: black; width: 100%; top: 70px; left: 100px;" />
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                            PreparedStatement state = con.prepareStatement("select count(distinct(project_id)) from projects where project_id like ?");
                            state.setString(1, company_name + "%");

                            ResultSet rst = state.executeQuery();

                            while (rst.next()) {
                                count = rst.getInt(1);
                            }
                        } catch (Exception k) {
                            System.out.println(k.getMessage());
                        }
                    %>
                    <cnt><%=count%> projects ongoing and completed</cnt>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
            <%int colind1 = 0;
                try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                PreparedStatement state = con.prepareStatement("select * from projects where project_head like ? group by project_id");
                state.setString(1, company_name + "%");
                
                ResultSet rst=state.executeQuery();
                %><table><%
                while (rst.next()){
                    String b = rst.getString("progress");%>
                        <td>
                            <div class="project-cards">
                                <div class="card">
                                    <div class="card-head">
                                        <div class="child-center">
                                            <h3><%= rst.getString("title")%></h3>
                                        </div>
                                        <div style="top: 15px;" class="child-right1">
                                            <%if(b.equals("Yes")){%><i style="font-size: 1.2rem;" class="fas fa-check"></i>
                                            <span class="hover-textcomp">Project Completed</span>
                                            <%}else{%><%}%>
                                        </div>
                                    </div>
                                    <hr style="width: 80%; color: black; align-self: center; margin-top: 60px; position: absolute;">
                                    <p class="card-text">
                                        <%= rst.getString("description")%></p>
                                    <div style="display: inline-block; margin-bottom: 10px;">
                                        <a href="projectview?value=<%=rst.getString("project_id")%>" class="centre-button">View Project</a>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <%colind1++;%>
                        <%if (colind1 % 3 == 0) {
                        %></tr><tr>
                            <%}%>
                            <%
                                }
                        %>
                    </table>
                <%}
            catch(Exception k){
            k.getMessage();
    }%>
                </div>
            </div>
                <%}else{}%> 
            <br><br>
            <div class="row">
                <div class="col-md-12">
                    <r>Progress</r>
                    <hr style="color: black; width: 100%; top: 70px; left: 100px;">
                    <%boolean rank=false;
                    String yes="Yes";
                    int count1=0;
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                        PreparedStatement state = con.prepareStatement("select * from users where username=?");
                        state.setString(1, (String) session.getAttribute("userName"));
                        
                        ResultSet rst=state.executeQuery();
                        while(rst.next()){
                            if(rst.getString("designation").equals("CEO")){rank=true;}else{rank=false;}
                        }
                        
                        PreparedStatement state1 = con.prepareStatement("select count(*) from projects where username=? and progress=?");
                        state1.setString(1, (String) session.getAttribute("userName"));
                        state1.setString(2, yes);

                        ResultSet rst1 = state1.executeQuery();

                        while (rst1.next()) {
                            count1 = rst1.getInt(1);
                        }
                    }
                    catch(Exception k){
                        k.getMessage();
                    }%>
                    <%if(!rank){%>
                    All completed projects under you, <%=count1%> completed.
                    <br>
                    <%int colind1 = 0;
                        try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                        PreparedStatement state = con.prepareStatement("select * from projects where progress=? and project_head=? group by project_id");
                        state.setString(1, yes);
                        state.setString(2,(String) session.getAttribute("userName"));

                        ResultSet rst=state.executeQuery();
                        %><table><%
                        while (rst.next()){%>
                                <td>
                                    <div class="project-cards">
                                        <div class="card1">
                                            <div class="card-head" align="center">
                                                <h3><%= rst.getString("title")%></h3>
                                                <hr style="width: 80%; color: black; align-self: center;">
                                            </div>
                                            <%--<p class="card-text">
                                                <%= rst.getString("description")%></p>>--%>
                                            <div style="display: inline-block; margin-bottom: 10px;">
                                                <a href="projectview?value=<%=rst.getString("project_id")%>" class="centre-button">View Project</a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <%colind1++;%>
                                <%if (colind1 % 3 == 0) {
                                %></tr><tr>
                                    <%}%>
                                    <%
                                        }
                                %>
                            </table>
                        <%}
                    catch(Exception k){
                    k.getMessage();
            }%>
                    <%}else{%>
                    All completed projects under your company, <%=count1%> completed.
                    <%int colind1 = 0;
                        try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                        PreparedStatement state = con.prepareStatement("select * from projects where progress=? group by project_id");
                        state.setString(1, yes);

                        ResultSet rst=state.executeQuery();
                        %><table><%
                        while (rst.next()){%>
                                <td>
                                    <div class="project-cards">
                                        <div class="card">
                                            <div class="card-head">
                                                <div class="child-center">
                                                    <h3><%= rst.getString("title")%></h3>
                                                </div>
                                                <div class="child-right">
                                                </div>
                                            </div>
                                            <hr style="width: 80%; color: black; align-self: center; margin-top: 60px; position: absolute;">
                                            <p class="card-text">
                                                <%= rst.getString("description")%></p>
                                            <div style="display: inline-block; margin-bottom: 10px;">
                                                <a href="projectview?value=<%=rst.getString("project_id")%>" class="centre-button">View Project</a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <%colind1++;%>
                                <%if (colind1 % 3 == 0) {
                                %></tr><tr>
                                    <%}%>
                                    <%
                                        }
                                %>
                            </table>
                        <%}
                    catch(Exception k){
                    k.getMessage();
            }%>
                    <%}%>
                    
                </div>
            </div>
        <br><br>
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

                            <ion-icon name="lock-open-outline"></ion-icon>
                        </span>
                        <span class="title">Password</span>
                    </a>
                </li>
                <li class="list">
                    <b></b>
                    <b></b>
                    <a href="logout" onsubmit="return confirm('Are you sure you want to logout?');">
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
//            document.addEventListener('click', function(event){
//                if (event.target.matches('.centre-button3')) {
//                    value = event.target.getAttribute('data-value');
//                    document.getElementById('inputValue').textContent = value;
//                    document.getElementById('modal3').style.display = 'block';
//                }
//            });

            document.querySelector('.centre-button3').addEventListener('click', function() {
                var value = this.getAttribute('data-value');

                document.getElementById('inputValue').value = value;

                document.getElementById('modal3').style.display = 'block';
              });
        </script>
        
        <script>
            const addButton3 = document.querySelectorAll('.centre-button3');
            const modal3 = document.getElementById('modal3');
            const cancelButton3 = document.getElementById('cancel-button3');
            const saveButton3 = document.getElementById('save-button3');
            const closeButton3 = document.querySelector('.btn-close3');

            closeButton3.addEventListener('click', () => {
                modal3.classList.remove('show');
                modal3.style.display = 'none';
            });

//            addButton3.addEventListener('click', () => {
//                modal3.style.display = 'block';
//            });

            addButton3.forEach(button => {
                button.addEventListener('click', function() {
                  const value = this.getAttribute('data-value');
                  document.getElementById('inputValue').value = value;
                  document.getElementById('modal3').style.display = 'block';
                });
              });

            cancelButton3.addEventListener('click', () => {
                modal3.style.display = 'none';
            });            

        </script>
        
        <script>
            const addButton2 = document.querySelector('.add-button2');
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