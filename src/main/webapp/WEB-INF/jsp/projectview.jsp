<%-- 
    Document   : projectview
    Created on : May 3, 2023, 12:12:09 PM
    Author     : mrina
--%>

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
<!DOCTYPE html>
<%String v = request.getParameter("value");
%>
<html>
    <head>
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
            .modal, .modal2, .modal3, .modal4, .modal5{
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

            .modal-content, .modal-content2, .modal-content3, .modal-content4, .modal-content5 {
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

            .modal button.close, .modal2 button.close, .modal3 button.close, .modal4 button.close, .modal5 button.close{
                display: none;
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
                color: #fff;
                padding: 5px 5px 5px 5px;
                background-color: black;
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
        </style>
    </head>
    <body>
        <%int cnt_announce=0;%>
        <a href="dashboard" class="add-button">Back to Dashboard</a>
        <%try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("select count(*) from announcements where project_id=?");
            stmt.setString(1, v);
            
            ResultSet rs=stmt.executeQuery();
            while(rs.next())
            {
                cnt_announce= rs.getInt(1);
            }
            }
        catch(Exception k){
        k.getMessage();
            }
        %>
        <%if (cnt_announce!=0){%>
        <button class="centre-button5">
            <span class="material-symbols-outlined">campaign</span>
            <span class="hover-text">Announcement</span>
            <span class="announcement-count">
                <%= cnt_announce%>
            </span>
        </button>
            <%}
    else{%>
    <button class="centre-button5">
            <span class="material-symbols-outlined">campaign</span>
            <span class="hover-text">Announcement</span>
    </button>
    <%}%>
        <%String rank="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("select * from users where username=?");
            stmt.setString(1, (String) session.getAttribute("userName"));
            
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {
                rank=rs.getString("designation");
                if(rank.equals("CEO") ||  rank.equals("Vice CEO") || rank.equals("Project Head") || rank.equals("Vice Project Head"))
                {%>
                <button class="centre-button4">
                    <span class="material-symbols-outlined">tips_and_updates</span>
                    <span class="hover-text3">Create Announcement</span>
                </button>
                <%}
                else{}
            }
         }
         catch(Exception k){
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
            <div id="closeButton" onclick="closeCanvas()">X</div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <%
                    String title="";
                    String desc="";
                    String Proj_head="";%>
                        <%
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
                            PreparedStatement stmt = con.prepareStatement("select * from users natural join projects where project_id=?");
                            stmt.setString(1,v);
                            String phead="";
                            ResultSet rs= stmt.executeQuery();
                            while(rs.next())
                            {
                                desc=rs.getString("description");
                                phead=rs.getString("project_head");
                                title=rs.getString("title");
                                System.out.println(rs.getString("project_head") + "  " + rs.getString("username"));
                            }
                            PreparedStatement stmt1 = con.prepareStatement("select * from users where username=?");
                            stmt1.setString(1,phead);
                            ResultSet rst= stmt1.executeQuery();
                            while(rst.next())
                            {
                                Proj_head=rst.getString("name");
                            }
                            %>
                            <r>&nbsp;<%=title%></r><br><br>
                            <hr style="color: black; width: 100%; top: 70px;display: inline-flex;">
                    <%
                        }
                        catch(Exception k){
                        k.getMessage();
                        }
                    %>
                </div>
                <div align="right" class="col" style="width: 50%;">
                    <r style="font-size:25px; color: gray;">This Project is headed by <%=Proj_head%></r><br><br>
                    <r style="font-size:20px; color: #333333;">About the Project</r><br>
                    <r style="font-size:17px; color: gray;"><%=desc%></r>
                </div>
            </div><br>
            <div class="row">
                <div class="col">
                    <r style="font-size:18px; color: gray;">Employees working under this project</r>
                    <table>
                    <%
                        int colind = 0;
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                            PreparedStatement stmt=con.prepareStatement("select * from projects where project_id=?");
                            stmt.setString(1,v);
                            ResultSet rs=stmt.executeQuery();
                            while(rs.next())
                            {
                                PreparedStatement stmt2 = con.prepareStatement("select * from users where username=?");
                                stmt2.setString(1, rs.getString("username"));
                                %><%--=rs.getString("username")--%><%
                                ResultSet rst=stmt2.executeQuery();
                                while (rst.next())
                                {
                                    %>
                                    <td class="item-td1">
                                        <div class="card item-card" align="center" style="width: 14rem;">
                                            <h4 class="card-title"><%= rst.getString("name")%></h4>
                                            <p class="card-text">
                                                <div align="center" style="margin-left: 10px; margin-right: 10px; font-size: 13px; margin-bottom: 5px; color: #494949;">
                                                    <b><%=rst.getString("designation")%></b><br>
                                                    <%=rst.getString("email")%><br>
                                                    <%=rst.getString("qualifications")%><br>
                                                    <a href="tel:+91<%=rst.getLong("phone")%>"><%= rst.getString("phone") %></a><br>
                                                </div>
                                            </p>
                                        </div>
                                    </td>                                    
                                    <%colind++;%>
                                    <% if(colind % 4 == 0)
                                    {
                                    %></tr><tr>
                                    <%}%>
                                <%}
                            }

                        }
                        catch(Exception k){
                            k.getMessage();
                        }
                    %>
                    </table>
                </div>
            </div>
        </div>
                    
        <div id="modal5" class="modal5">
            <div class="modal-content5">
                <div class="modal-header5">
                    <h5 class="modal-title5" id="exampleModalLongTitle">New Announcements</h5>
                    <button type="button" class="btn-close5" data-bs-dismiss="modal5"></button>
                </div>
                <div class="modal-body5">
                    <%try{String usnm="";
                    boolean disp=false;
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                        
                        PreparedStatement stmt1=con.prepareStatement("select * from projects where username=?");
                        stmt1.setString(1, (String) session.getAttribute("userName"));
                        String usnm1=(String) session.getAttribute("userName");

                        ResultSet rst = stmt1.executeQuery();
                        while(rst.next()){
                            usnm=rst.getString("project_head");
                            if(usnm1.equals(usnm)){
                            disp=true;
                            }
                            else{disp=false;}
                        }
                        PreparedStatement stmt = con.prepareStatement("select * from announcements where project_id=?");
                        stmt.setString(1, v);
                        
                        ResultSet rs=stmt.executeQuery();
                        while(rs.next()){%>
                            <%=rs.getString("announcement_block")%>
                            <%if(disp){%>
                            <form action="announcedelete" method="post" onsubmit="return confirm('Are you sure you want to delete this announcement?');">
                                <br><button class="delete-announce" type="submit" style="margin-left: 280px;; border: none; background-color: transparent;">
                                    <span class="material-symbols-outlined" style="background-color: white; ">playlist_remove</span>
                                    <div class="text" style="font-size: 10px;">Delete Announcement</div>
                                </button>
                                <input name="a" value="<%=v%>" hidden>
                                <input name="b" value="<%=rs.getString("announce_id")%>" hidden>
                            </form>
                                <%}else{}%>
                            <hr style="color: black; width: 100%; top: 70px; left: 100px;">
                        <%}
                    }
                    catch(Exception k){
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
            <div class="modal-content4">
                <div class="modal-header4">
                    <h5 class="modal-title4" id="exampleModalLongTitle">New Announcement</h5>
                    <button type="button" class="btn-close4" data-bs-dismiss="modal4"></button>
                </div>
                <div class="modal-body4">
                    <form action="createannounce" method="post">
                        Project ID<input type="text" id="project-id" value="<%=v%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                        Announcement ID<input type="text" id="announcement-id" class="form-control form-input" placeholder="Announcement Id" name="b"/><br>
                        Announcement text<textarea id="project-desc" class="form-control form-input" placeholder="type announcement" name="c"/></textarea><br>
                        <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
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
                        <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
                    </form>
                </div>
                <div class="modal-footer">
<!--                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                </div>
            </div>
        </div>
        <div id="modal2" class="modal2">
            <div class="modal-content2">
                <div class="modal-header2">
                    <h5 class="modal-title2" id="exampleModalLongTitle">Assign Task</h5>
                    <button type="button" class="btn-close2" data-bs-dismiss="modal2"></button>
                </div>
                <div class="modal-body2">
                    <form action="assigntasks" method="post">
                        Project ID<input type="text" id="project-id" value="<%=v%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                        <%
                            try{
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

                                PreparedStatement stmt = con.prepareStatement("select * from users where username=?");
                                stmt.setString(1, (String) session.getAttribute("userName"));
                                
                                ResultSet rs=stmt.executeQuery();
                                while(rs.next())
                                {
                                    if (rs.getString("designation").equals("CEO") || rs.getString("designation").equals("Vice CEO") || rs.getString("designation").equals("Project Head")){
                                    %>
                            Username<input list="myOptions" class="form-control form-input" name="b" placeholder="Search users"/><br>
                            <datalist id="myOptions" class="my-datalist">
                                 <%
                                    PreparedStatement stmt2 = con.prepareStatement("select * from users natural join projects where project_id=? and designation in ('Vice Project Head', 'Project Management', 'Member')");
                                    stmt2.setString(1, v);
                                    ResultSet rst=stmt2.executeQuery();
                                    
                                    while(rst.next())
                                    {
                                    %><option value="<%=rst.getString("username")%>"><%=rst.getString("name")%>   <%=rst.getString("username")%>   <%=rst.getString("designation")%></option><%
                                    }
                                %>
                            </datalist>
                                    <%}
                                    else{%>
                             Username<input list="myOptions" class="form-control form-input" name="b" placeholder="Search users"/><br>
                            <datalist id="myOptions" class="my-datalist">
                                <%
                                    PreparedStatement stmt2 = con.prepareStatement("select * from users natural join projects where project_id=? and designation in ('Project Management', 'Member')");
                                    stmt2.setString(1, v);
                                    ResultSet rst=stmt2.executeQuery();
                                    
                                    while(rst.next())
                                    {
                                    %><option value="<%=rst.getString("username")%>"><%=rst.getString("name")%>   <%=rst.getString("username")%>   <%=rst.getString("designation")%></option><%
                                    }
                                %>
                                </datalist>
                                <%}
                                
                                }
                            }
                            catch(Exception k){
                            k.getMessage();
                            }
                        %>
                        <%
                            try{
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");
                                PreparedStatement stmt = con.prepareStatement("select * from tasks where project_id=?");
                                stmt.setString(1, v);

                                ResultSet rs2=stmt.executeQuery();
                        %>Task<input list="myOption" class="form-control form-input" name="c" placeholder="Search tasks"/>
                            <datalist id="myOption" class="my-datalist"><%
                                while(rs2.next())
                                {%>
                                <option value="<%=rs2.getString("task_id")%>"><%=rs2.getString("task_type")%></option>
                                <%}%></datalist><%
                            }
                            catch(SQLException e){
                            e.printStackTrace();
                            }
                        %>
                        <br><button type="submit" class="btn btn-primary" value="submit">Save changes</button>
                    </form>
                </div>
                <div class="modal-footer2">
                    <!--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                </div>
            </div>
        </div>
        <div id="modal3" class="modal3">
            <div class="modal-content3">
                <div class="modal-header3">
                    <h5 class="modal-title3" id="exampleModalLongTitle">Member Delete</h5>
                    <button type="button" class="btn-close3" data-bs-dismiss="modal3"></button>
                </div>
                <div class="modal-body3">
                    <form action="removemember" method="post">
                        Project ID<input type="text" id="project-id" value="<%=v%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                        <%
                            try{
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8", "root", "root");

                                PreparedStatement stmt = con.prepareStatement("select * from users where username=?");
                                stmt.setString(1, (String) session.getAttribute("userName"));
                                
                                ResultSet rs=stmt.executeQuery();
                                while(rs.next())
                                {
                                    if (rs.getString("designation").equals("CEO") || rs.getString("designation").equals("Vice CEO") || rs.getString("designation").equals("Project Head")){
                                    %>
                            Username<input list="myOptions" class="form-control form-input" name="b" placeholder="Search users"/><br>
                            <datalist id="myOptions" class="my-datalist">
                                 <%
                                    PreparedStatement stmt2 = con.prepareStatement("select * from users natural join projects where project_id=? and designation in ('Vice Project Head', 'Project Management', 'Member')");
                                    stmt2.setString(1, v);
                                    ResultSet rst=stmt2.executeQuery();
                                    
                                    while(rst.next())
                                    {
                                    %><option value="<%=rst.getString("username")%>"><%=rst.getString("name")%>   <%=rst.getString("username")%>   <%=rst.getString("designation")%></option><%
                                    }
                                %>
                            </datalist>
                            <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
                                    <%}
                                    else{%>
                             Username<input list="myOptions" class="form-control form-input" name="b" placeholder="Search users"/><br>
                            <datalist id="myOptions" class="my-datalist">
                                <%
                                    PreparedStatement stmt2 = con.prepareStatement("select * from users natural join projects where project_id=? and designation in ('Project Management', 'Member')");
                                    stmt2.setString(1, v);
                                    ResultSet rst=stmt2.executeQuery();
                                    
                                    while(rst.next())
                                    {
                                    %><option value="<%=rst.getString("username")%>"><%=rst.getString("name")%>   <%=rst.getString("username")%>   <%=rst.getString("designation")%></option><%
                                    }
                                %>
                            </datalist>
                                <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
                                <%}
                                
                                }
                            }
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
        <%
            String position="";
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
                    position = rst.getString("designation");
                    exists=position.equals(member);
                    exists1=position.equals(manage);
                }

                if(!exists && !exists1){
                %>
                <div align="center">
                    <button class="centre-button">Create Tasks</button>
                    <button class="centre-button2">Assign Tasks</button>
                    <button class="centre-button3">Remove Members from Project</button>
                </div>
                <%}
                else{%><%}
            }
            catch(Exception k){
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
                    <%int count_create=0, count_assign=0;
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
                        PreparedStatement stmt=con.prepareStatement("select count(*) from tasks where project_id=? and username is NULL or username='null'");
                        stmt.setString(1, v);
                        
                        ResultSet rs=stmt.executeQuery();
                        while(rs.next()){
                            count_create=rs.getInt(1);
                        }
                        PreparedStatement stmt1=con.prepareStatement("select count(*) from tasks where project_id=? and username not in ('null', 'NULL')");
                        stmt1.setString(1, v);
                        
                        ResultSet rst=stmt1.executeQuery();
                        while(rst.next()){
                            count_assign=rst.getInt(1);
                        }
                        count_create=count_create+count_assign;
                    }
                    catch(Exception k){
                    k.getMessage();
                    }
                    %>
                    <r style="font-size:15px;"><%=count_create%> tasks created and <%=count_assign%> tasks assigned.</r>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <%String rank1="";
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
                            PreparedStatement stmt=con.prepareStatement("select * from users where username=?");
                            stmt.setString(1, (String) session.getAttribute("userName"));

                            ResultSet rs = stmt.executeQuery();
                            while(rs.next())
                            {
                                rank=rs.getString("designation");
                                if(rank.equals("CEO") ||  rank.equals("Vice CEO") || rank.equals("Project Head") || rank.equals("Vice Project Head")){
                                    
                                    PreparedStatement stmt2 = con.prepareStatement("select * from tasks where project_id=?");
                                    stmt2.setString(1,v);

                                    ResultSet rs1=stmt2.executeQuery();
                                    int count = 0;
                                    %><%
                                    while(rs1.next())
                                    {String nme="";%>
                                    <div id="card-container">
                                    <div align="center" class="card" style="width: 60%;">
                                        <div class="card-header">
                                            <d style="font-size: 20px;color: black;"><%=rs1.getString("task_type")%></d>
                                        </div>
                                        <div class="card-body" style="margin-bottom: 0px; margin-top: 0px;">
                                          <blockquote class="blockquote mb-0">
                                              <p><g>Start Date: </g><d><%=rs1.getString("start_date")%></d><br>
                                              <g>End Date: </g><d><%=rs1.getString("end_date")%></d><br><g>Brief: </g><d><%=rs1.getString("task_description")%></d>
                                              </p><%;
                                              PreparedStatement st=con.prepareStatement("select name from users where username=?");
                                              st.setString(1,rs1.getString("username"));
                                              ResultSet rt=st.executeQuery();
                                              while(rt.next()){nme=rt.getString("name");}%>
                                            <footer class="blockquote-footer" style="margin-top:0px;margin-bottom: 0px;">created for <cite title="Source Title"><%=nme%></cite></footer>
                                          </blockquote>
                                        </div>
                                        <button class="btn btn-primary expandBtn" style="width: 20%; align-self: center; margin-bottom: 10px; margin-top: 0px;">Expand</button>
                                            <div id="expanded-content" style="display: none;">
                                                <hr style="color: black; width: 80%;">
                                                End Date: <d><%=rs1.getString("end_date")%></d><br>Brief: <d><%=rs1.getString("task_description")%></d>
                                          </div>
                                        <button class="btn btn-primary closeBtn" style="width: 20%; align-self: center; margin-bottom: 10px; margin-top: 0px;display: none;">Close</button>
                                    </div><br><br>
                                    </div>
                                    <%}
                                }
                                else{
                                    boolean result = false;
                                    PreparedStatement stmt1 = con.prepareStatement("select count(*) from tasks where username=?");
                                    stmt1.setString(1,(String) session.getAttribute("userName"));
                                    ResultSet rst = stmt1.executeQuery();
                                    if (rst.next()) {
                                        int count = rst.getInt(1);
                                        if (count > 0) {
                                            result = true;
                                        }
                                    }
                                    if (result){
                                        PreparedStatement stmt2 = con.prepareStatement("select * from tasks where username=? and project_id=?");
                                        stmt2.setString(1,(String) session.getAttribute("userName"));
                                        stmt2.setString(2, v);
                                        
                                        ResultSet rs1=stmt2.executeQuery();
                                        while(rs1.next())
                                        {String nme="";%>
                                        <div id="card-container">
                                    <div align="center" class="card" style="width: 60%;">
                                        <div class="card-header">
                                            <d style="font-size: 20px;color: black;"><%=rs1.getString("task_type")%></d>
                                        </div>
                                        <div class="card-body" style="margin-bottom: 0px; margin-top: 0px;">
                                          <blockquote class="blockquote mb-0">
                                              <p><g>Start Date: </g><d><%=rs1.getString("start_date")%></d><br>
                                              <g>End Date: </g><d><%=rs1.getString("end_date")%></d><br><g>Brief: </g><d><%=rs1.getString("task_description")%></d>
                                              </p><%;
                                              PreparedStatement st=con.prepareStatement("select name from users where username=?");
                                              st.setString(1,rs1.getString("username"));
                                              ResultSet rt=st.executeQuery();
                                              while(rt.next()){nme=rt.getString("name");}%>
                                            <footer class="blockquote-footer" style="margin-top:0px;margin-bottom: 0px;">created for <cite title="Source Title"><%=nme%></cite></footer>
                                          </blockquote>
                                        </div>
                                        <button class="btn btn-primary expandBtn" style="width: 20%; align-self: center; margin-bottom: 10px; margin-top: 0px;">Expand</button>
                                            <div id="expanded-content" style="display: none;">
                                                <hr style="color: black; width: 80%;">
                                                End Date: <d><%=rs1.getString("end_date")%></d><br>Brief: <d><%=rs1.getString("task_description")%></d>
                                          </div>
                                        <button class="btn btn-primary closeBtn" style="width: 20%; align-self: center; margin-bottom: 10px; margin-top: 0px;display: none;">Close</button>
                                    </div><br><br>
                                    </div>
                                        <%}
                                    }
                                    else{%><%}
                                }
                            }
                        }
                        catch(Exception k){
                        k.getMessage();
                        }
                    %>
                </div>
            </div>
        </div>

        <script>
            let card = document.querySelector(".card");
    let displayPicture = document.querySelector(".display-picture");

    displayPicture.addEventListener("click", function() {
        card.classList.toggle("hidden")})
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
            const modal4= document.getElementById('modal4');
            const cancelButton4= document.getElementById('cancel-button4');
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
            const modal5= document.getElementById('modal5');
            const cancelButton5= document.getElementById('cancel-button5');
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
                  if (!isDrawing) return;
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
  document.addEventListener('DOMContentLoaded', function() {
        const expandBtns = document.getElementsByClassName('expandBtn');
        const closeBtns = document.getElementsByClassName('closeBtn');

        for (let i = 0; i < expandBtns.length; i++) {
            const expandBtn = expandBtns[i];
            const closeBtn = closeBtns[i];
            const expandedContent = expandBtn.nextElementSibling;

            expandBtn.addEventListener('click', function() {
                expandedContent.style.display = 'block';
                expandBtn.style.display = 'none';
                closeBtn.style.display = 'inline-block';
            });

            closeBtn.addEventListener('click', function() {
                expandedContent.style.display = 'none';
                expandBtn.style.display = 'inline-block';
                closeBtn.style.display = 'none';
            });
        }
    });
</script>


    </body>
</html>
