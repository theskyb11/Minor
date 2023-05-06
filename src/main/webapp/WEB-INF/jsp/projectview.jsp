<%-- 
    Document   : projectview
    Created on : May 3, 2023, 12:12:09 PM
    Author     : mrina
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projekta | Projects</title>
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");
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
                margin-left: 120px;
                /*                position: scroll;*/
            }
            r{
                font-size: 30px;
                ;
                justify-content: space-between;
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>
    <body>
        <a href="dashboard" class="add-button">Back to Dashboard</a>
        
        <div class="container">
            <div class="row">
                <div class="col">
                    <% String v = request.getParameter("value");
                    String name="";%>
                        <%=v%><%
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
                            PreparedStatement stmt = con.prepareStatement("select * from projects where project_id=?");
                            stmt.setString(1,v);
                            
                            ResultSet rs= stmt.executeQuery();
                            while(rs.next())
                            {
                                name=rs.getString("title");
                                System.out.println(rs.getString("project_head") + "  " + rs.getString("username"));
                            }
                            %>
                            <r><%=name%></r>
                            <hr style="color: black; width: 100%; top: 70px;right: 100px;">
                    <%
                        }
                        catch(Exception k){
                        k.getMessage();
                        }
                    %>
                </div>
            </div>
        </div>
        <br>
    </body>
</html>
