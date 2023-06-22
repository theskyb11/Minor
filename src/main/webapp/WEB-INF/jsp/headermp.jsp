<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>


<nav class="navbar navbar-expand-lg nav-main navbar-dark bg-dark" id="nav-main" style="height: 60px;">
  <div class="container-fluid">
    <img src="https://www.linkpicture.com/q/Screenshot_2023-03-15_193046_edit_black-removebg-preview.png" alt="Projekta Logo" style="margin-left: 20px; margin-top: 2px; width: 20%; height: 20%;">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse"></div>
    <div class="collapse navbar-collapse " id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 justify-content-center">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="welcomepage">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contactus">Contact and Support</a>
        </li>
        
<!--        <li class="nav-item">
          <a class="nav-link" href="dashboard">Dashboard</a>
        </li>-->
        
        
        <li class="nav-item">
         <% boolean flag = false;
             Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
             if (loggedIn == null || !loggedIn) { %>
            <a class="nav-link" href="#" onclick="alert('Please Login')">Dashboard</a>
          <% } else { %>
            <a class="nav-link" href="dashboard">Dashboard</a>
          <% } %>
        </li>
      </ul>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 justify-content-center">
          <%
                    if (loggedIn == null || !loggedIn) {
                %>
        <li class="nav-item">
          <a class="nav-link nav-reg" href="login">Log In/Sign Up</a>
        </li>
        <%
                } else {} %>
<!--        <li class="nav-item">
                    <ul>
                        <a href="#" class="display-picture"><img src="<c:url value="/resources/img/user-icon-default.png" />" alt="User Icon"></a>
                    </ul>
                    <div class="card hidden">
                        <ul>
                            <li><a href="account">Account</a></li>
                            <li><a href="settings">Settings</a></li>
                            <li><a href="#">Log Out</a></li>
                            <%--
                                        }}}
                            --%>
                        </ul>
                    </div>

                    <%--
                            }catch (Exception k) {
                                System.out.println(k);
                            }
                        }
                    --%>
                </li>-->
      </ul>
    </div>
  </div>
</nav>
      <script>
          let card = document.querySelector(".card");
    let displayPicture = document.querySelector(".display-picture");

    displayPicture.addEventListener("click", function() {
        card.classList.toggle("hidden")})
      </script>