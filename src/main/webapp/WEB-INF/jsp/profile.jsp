<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String v = request.getParameter("value");%>
<html>
<head>
    <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    <link rel="icon" href="http://d1ujqdpfgkvqfi.cloudfront.net/favicon-generator/htdocs/favicons/2015-01-25/4757e4ccd8a23c97566ae55feb33e917.ico">
    <title>User Profile</title>
    <style>
                
        body {
            font-family: Arial, sans-serif;
            background-color: #eee;
            margin: 0;
/*            padding: 20px;*/
        }
        
        .back-button{
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
        .back-button:hover {
            color: white;
            background-color: #009900;
        }
        
        .back-button1{
            position: fixed;
            right: 170px;
            bottom: 20px;
            margin: 10px;
            background-color: green;
            color: #fff;
            padding: 10px 20px;
            border-radius: 10px;
            text-decoration: none;
            border-color: white;
        }
        .back-button1:hover {
            color: white;
            background-color: #009900;
        }

        .profile-card {
            max-width: 700px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
/*            margin: 0 auto;*/
            margin-left: 10px;
            margin-top: 10px;
            
        }

        h1 {
            margin-top: 0;
        }

        .profile-info {
            margin-bottom: 20px;
        }

        .profile-info label {
            font-weight: bold;
        }

        .profile-info p {
            margin: 0;
        }
    </style>
</head>
<body>
    <%if(v.equals((String) session.getAttribute("userName"))){%><a href="userprofile" class="back-button1" style="z-index: 1;">Edit Profile</a><%}else{%><%}%>
    <a href="users" class="back-button" style="z-index: 1;">Back to Users</a>
    <%@ include file="headermp.jsp"%>
    <%byte[] imageBytes = null;String abt="";String lin="";String git="";String twit="";String fb="";int cnt_pic=0;int cnt_link=0;
    String name="";String email="";String phone="";String address="";String rank="";String qual="";String altem="";String insta="";String comp="";%>

    <%try{
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
        PreparedStatement stmt=con.prepareStatement("select * from users where username=?");
        stmt.setString(1, v);

        ResultSet rs=stmt.executeQuery();
        while(rs.next()){
            name=rs.getString("name");
            email=rs.getString("email");
            phone=rs.getString("phone");
            address=rs.getString("address");
            rank=rs.getString("designation");
            qual=rs.getString("qualifications");
            altem=rs.getString("alt_email");
            abt=rs.getString("about");
            comp=rs.getString("company_name");
        }
        
        PreparedStatement stmt2=con.prepareStatement("select * from user_professional_links where username=?");
        stmt2.setString(1, v);

        ResultSet rs2=stmt2.executeQuery();
        while(rs2.next()){
            lin=rs2.getString("linkedin");
            git=rs2.getString("github");
            twit=rs2.getString("twitter");
            insta=rs2.getString("insta");
            fb=rs2.getString("fb");
        }
        
        PreparedStatement stmt1=con.prepareStatement("select * from user_image where username=?");
        stmt1.setString(1, v);

        ResultSet rs1=stmt1.executeQuery();
        while(rs1.next()){
            Blob imageBlob = rs1.getBlob("data");
            InputStream imageStream = imageBlob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int n = 0;
            while (-1 != (n = imageStream.read(buffer))) {
                outputStream.write(buffer, 0, n);
            }
            imageBytes = outputStream.toByteArray();
        }
        
        PreparedStatement stmt3=con.prepareStatement("select count(*) from user_image where username=?");
        stmt3.setString(1, v);

        ResultSet rs3=stmt3.executeQuery();
        while(rs3.next()){
            cnt_pic=rs3.getInt(1);
        }
        
        PreparedStatement stmt4=con.prepareStatement("select count(*) from user_professional_links where username=?");
        stmt4.setString(1, v);

        ResultSet rs4=stmt4.executeQuery();
        while(rs4.next()){
            cnt_link=rs4.getInt(1);
        }
        
    }catch(Exception k){
        k.getMessage();
    }%>

  <div style="background-color: #eee;" class="container py-5">
<!--    <div class="row">
      <div class="col">
        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">User</a></li>
            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
          </ol>
        </nav>
      </div>
    </div>-->

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
              <%if(imageBytes==null || cnt_pic==0){%>
              <i style="font-size: 150px; color: #3b3b3b;" class="fas fa-user-circle"></i>
              <%}else{%>
              <img style="width: 150px;" class="rounded-circle img-fluid" alt="..." align="center" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imageBytes) %>" />
              <%}%>
            <h5 class="my-3"><%=name%></h5>
            <p style="font-size: 1.3rem;;" class="text-muted mb-1"><b><%=rank%> (<%=comp%>)</b></p>
            <p class="text-muted mb-4"><%=qual%></p>
            <div class="d-flex justify-content-center mb-2">
<!--              <button type="button" class="btn btn-primary">Follow</button>-->
              <button type="button" class="btn btn-outline-primary ms-1">Message</button>
            </div>
          </div>
        </div>
        <div class="card mb-4 mb-lg-0">
          <div class="card-body p-0">
            <ul class="list-group list-group-flush rounded-3">
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i style="margin-left: 40px;font-size: 2rem;" class="fab fa-linkedin fa-lg"></i>
                <p style="margin-right: 80px;" class="mb-0"><%if(lin==null || cnt_link==0 || lin.equals("null")){%>Not regsitered<%}else{%><a href="<%=lin%>" target="_blank">Follow</a><%}%></p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i style="margin-left: 40px;font-size: 2rem;color: #333333;" class="fab fa-github fa-lg"></i>
                <p style="margin-right: 80px;" class="mb-0"><%if(git==null || cnt_link==0 || git.equals("null")){%>Not regsitered<%}else{%><a href="<%=git%>" target="_blank">Follow</a><%}%></p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i style="margin-left: 40px;font-size: 2rem;color: #55acee;" class="fab fa-twitter fa-lg" ></i>
                <p style="margin-right: 80px;" class="mb-0"><%if(twit==null || cnt_link==0 || twit.equals("null")){%>Not regsitered<%}else{%><a href="<%=twit%>" target="_blank">Follow</a><%}%></p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i style="margin-left: 40px;font-size: 2rem;color: #ac2bac;" class="fab fa-instagram fa-lg" ></i>
                <p style="margin-right: 80px;" class="mb-0"><%if(insta==null || cnt_link==0 || insta.equals("null")){%>Not regsitered<%}else{%><a href="<%=insta%>" target="_blank">Follow</a><%}%></p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i style="margin-left: 40px;font-size: 2rem;color: #3b5998;" class="fab fa-facebook-f fa-lg" ></i>
                <p style="margin-right: 80px;" class="mb-0"><%if(fb==null || cnt_link==0 || fb.equals("null")){%>Not regsitered<%}else{%><a href="<%=fb%>" target="_blank">Follow</a><%}%></p>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=name%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=email%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Aternate Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=altem%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><a href="tel:+91<%=phone%>"><%=phone%></a></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=address%></p>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="card mb-4 mb-md-0">
              <div class="card-body">
                <p class="mb-4" style="font-size: 1.2rem;"><span class="text-primary font-italic me-1">About</span>
                </p>
                <p class="mb-1" style="font-size: 1rem;">
                    <%=qual%><br><hr>
                </p>
                <p class="mb-1" style="font-size: 0.8rem;">
                    <%if(abt==null){%><%}else{%><%=abt%><%}%>
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card mb-4 mb-md-0">
              <div class="card-body">
                <p class="mb-4"><span class="text-primary font-italic me-1">Projects</span>Ongoing and completed
                </p>
                <%
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projekta?characterEncoding=utf8","root","root");
                    PreparedStatement stmt=con.prepareStatement("select * from projects where username=?");
                    stmt.setString(1, v);
                    ResultSet rs=stmt.executeQuery();
                    while(rs.next()){
                        String nm="";String rnk="";
                        PreparedStatement stmt10 = con.prepareStatement("select name, designation from users where username=?");
                        stmt10.setString(1, rs.getString("project_head"));
                        ResultSet rst10=stmt10.executeQuery();

                        while (rst10.next()) {
                            nm = rst10.getString(1);
                            rnk = rst10.getString(2);
                        }%>
                        <p class="mb-1" style="font-size: 0.8rem;"><%=rs.getString("title")%><r style="font-size: 0.8rem;color: #999999;"> (Headed by: <%=nm%>)</r></p>
                        <%String progress = rs.getString("progress");
                        if(progress.equals("Yes")){%>
                        <div class="progress rounded" style="height: 5px;">
                            <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100"
                            aria-valuemin="0" aria-valuemax="100"></div>
                        </div>    
                        <%}else{%>
                        <%int total=0; int done=0; int percentage=0;String pid=rs.getString("project_id");
                        PreparedStatement stmt1 = con.prepareStatement("select count(*) from tasks where project_id=?");
                        stmt1.setString(1, pid);

                        ResultSet rs1 = stmt1.executeQuery();
                        while (rs1.next()) {
                            total = rs1.getInt(1);
                        }
                        
                        if(total==0){%>
                        <div class="progress rounded" style="height: 5px;">
                            <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0"
                            aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <%}else{
                            PreparedStatement stmt2 = con.prepareStatement("select count(*) from tasks where project_id=? and done is not null");
                            stmt2.setString(1, pid);
                            ResultSet rst2=stmt2.executeQuery();

                            while (rst2.next()) {
                                done = rst2.getInt(1);
                            }
                            percentage = (done*100/total);
                            %><%--=done%>&nbsp;<%=total%>&nbsp;<%=percentage--%>
                        <div class="progress rounded" style="height: 5px;">
                            <div class="progress-bar" role="progressbar" style="width: <%=percentage%>%" aria-valuenow="<%=percentage%>"
                            aria-valuemin="0" aria-valuemax="100"></div>
                        </div><br>
                        <%}
                        }}
                }catch(Exception k){
                    k.getMessage();
                }%>
<!--                <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                <div class="progress rounded" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                <div class="progress rounded mb-2" style="height: 5px;">
                  <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                    aria-valuemin="0" aria-valuemax="100"></div>
                </div>-->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    
</body>
</html>
