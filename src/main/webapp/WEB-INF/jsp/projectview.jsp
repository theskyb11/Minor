<%-- 
    Document   : projectview
    Created on : May 3, 2023, 12:12:09 PM
    Author     : mrina
--%>

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
<%
%>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projekta | Projects</title>
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");
            body {
                scroll-behavior: smooth;
                font-family: 'Poppins', sans-serif;
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
            .container{
                width: 90%;
                margin-top: 30px;
                margin-right: 20px;
                margin-left: 50px;
/*                position: scroll;*/
            }
            r{
                font-size: 50px;
                ;
                justify-content: space-between;
                font-family: 'Poppins', sans-serif;
            }
            .form-input {
                width: 70%!important;
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

            .card-body {
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

/*            .item-card:hover {
                box-shadow: rgba(50, 50, 93, 0.25) 0 6px 12px -2px, rgba(0, 0, 0, 0.3) 0 3px 7px -3px;
            }*/
            .card{
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
            .card-title{
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
            .modal, .modal2, .modal3 {
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

            .modal-content, .modal-content2, .modal-content3 {
                background-color: white;
                margin: 10% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
                position: relative;
            }

            .msg-button, .msg-button2, .msg-button3{
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

            .modal button.close, .modal2 button.close, .modal3 button.close{
                display: none;
            }
            
            form {
                padding: 0 1.5rem;
            }
        </style>
    </head>
    <body>
        <a href="dashboard" class="add-button">Back to Dashboard</a>
<!--         style="display: flex;"-->
        <div class="container">
            <div class="row">
                <div class="col">
                    <% String v = request.getParameter("value");
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
                            <r><%=title%></r><br><br>
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
                                    <td class="item-td">
                                        <div class="card item-card" align="center" style="width: 14rem;">
                                            <h4 class="card-title"><%= rst.getString("name")%></h4>
                                            <p class="card-text">
                                                <div align="center" style="margin-left: 10px; margin-bottom: 5px; color: #494949;">
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
                    
        <div id="modal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">New Task</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="createtasks" method="post">
                        Project ID<input type="text" id="project-id" value="<%=v%>" class="form-control form-input" name="a" readonly="readonly"/><br>
                        Task ID<input type="text" id="task-id" class="form-control form-input" name="b"/><br>
                        Task Type<input type="text" id="task-type" class="form-control form-input" placeholder="Task type" name="c"/><br>
                        Start Date<br><input type="date" style="margin-left: 90px;" id="date-input1" name="startdate"/><br>
                        End Date<br><input type="date" style="margin-left: 90px;" id="date-input2" name="enddate"/><br><br>
                        <button type="submit" class="btn btn-primary" value="submit">Save changes</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <!--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                </div>
            </div>
        </div>
        <div id="modal2" class="modal2">
            <div class="modal-content2">
                <div class="modal-header2">
                    <h5 class="modal-title2" id="exampleModalLongTitle">Assign Task</h5>
                    <button type="button" class="btn-close2" data-bs-dismiss="modal"></button>
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
                            Username<input list="myOptions" class="form-control form-input" placeholder="Search users"/><br>
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
                             Username<input list="myOptions" class="form-control form-input" placeholder="Search users"/><br>
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
                <div class="modal-footer2">
                    <!--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>-->
                </div>
            </div>
        </div>
        <div id="modal3" class="modal3">
            <div class="modal-content3">
                <div class="modal-header3">
                    <h5 class="modal-title3" id="exampleModalLongTitle">Member Delete</h5>
                    <button type="button" class="btn-close3" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body3">
                    <form action="assigntasks" method="post">
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
                            Username<input list="myOptions" class="form-control form-input" placeholder="Search users"/><br>
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
                             Username<input list="myOptions" class="form-control form-input" placeholder="Search users"/><br>
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
    </body>
</html>
