<%-- 
    Document   : Forward
    Created on : Apr 23, 2023, 11:18:46 PM
    Author     : mrina
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projekta | Code</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
              crossorigin="anonymous">
        <link href="<c:url value="/resources/css/forgot.css" />" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
            }

            .main-container1 {
                margin-top: 40px;
                height: 80vh;
                display: flex!important;
                justify-content: center!important;
                align-items: center!important;
            }

            .forgot-pass-div {
                box-shadow: rgba(0, 0, 0, 0.16) 0 1px 4px;
                width: 35%;
                text-align: center;
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

            .btn {
                background-color: #1e53ff;
                border-radius: 30px;
                padding: 10px;
            }
        </style>
    </head>
    <body>
    <%@ include file="headermp.jsp"%>
    <div class="main-container1">
        <div class="forgot-pass-div" style="border-radius: 10px;">
            <% String m=(String) session.getAttribute("resetEmail");
            %>
            <div align="center">
                <br><h3 style="font-weight: 700; padding-left: 50px; padding-right: 50px">Enter the Code Sent to your Email ID</h3>
                <br><p style="color: grey; padding-left: 30px; padding-right: 30px">We have sent a code to <%=m%>.
                Kindly enter the same below to proceed and reset your password.</p><br>
                <form action="code" method="post" id="form">
                    Code <br><input type="text" name="a" class="form-control" style="width: 80%" id="code" maxlength="6">
                    <br><br>
                    <input type="submit" value="   Submit   " class="btn-primary btn"><br><br><br>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="footermp.jsp"%>
    </body>
<script>
    const inputField = document.querySelector("#code");

    inputField.addEventListener("input", function(event) {
        const value = event.target.value;
        if (!/^\d*$/.test(value)) {
            event.target.value = value.replace(/[^0-9]/g, "");
        }
    });

    const form = document.getElementById("form");
    form.addEventListener("submit", function(event) {
        const a = document.getElementById("code");

        if (!a.value) {
            alert("All fields are required.");
            event.preventDefault();
        }
    });
</script>
</html>
