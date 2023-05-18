<%-- 
    Document   : blog
    Created on : 16-Mar-2023, 5:32:09 pm
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">

        <title>Projekta Blog</title>    
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: lightgray;
            }
            main {
                font-family: Poppins, sans-serif;
                max-width: 800px;
                margin: 20px auto;
                padding: 0 20px;
            }

            .blog-post {
                margin-left: 20px;
                margin-right: 20px;
                margin-bottom: 40px;
                margin-top: 20px;
            }

            .blog-post h2 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .blog-post p {
                font-size: 16px;
                line-height: 1.5;
                margin-bottom: 20px;
            }

            .blog-post ul {
                margin-bottom: 40px;
            }

            .blog-post li {
                margin-bottom: 10px;
            }

/*            a {
                background-color: #0077c2;
                color: #fff;
                padding: 10px 20px;
                text-decoration: none;
                display: inline-block;
                border-radius: 5px;
            }

            a:hover {
                background-color: #005c99;
            }*/
            .details-col {
                background-color: white;
                width: 100%;
                height: 100%;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                border-radius: 10px;
            }
        </style>

    </head>
    <body>
        <%@ include file="headermp.jsp"%>
        <main>
            <div class="details-col">
            <section class="blog-post">
                <h2>Introducing Projekta</h2>
                <p>Projekta is a project management tool designed to help teams collaborate more effectively. With Projekta,
                    you can create and manage projects, assign tasks to team members, track progress, and more.</p>
                <p>Whether you're working on a small project or a large one, Projekta can help you stay organized and on
                    track.</p>
            </section>

            <section class="blog-post">
                <h2>Why Projekta is the Best Project Management Tool</h2>
                <p>There are a lot of project management tools out there, but Projekta stands out from the rest. Here are
                    just a few reasons why:</p>
                <ul>
                    <li>Easy to use</li>
                    <li>Powerful features</li>
                    <li>Great customer support</li>
                    <li>Affordable pricing</li>
                </ul>
            </section>
            </div>
        </main>
        <%@ include file="footermp.jsp"%>
    </body>
</html>