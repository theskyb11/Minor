<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>


<nav class="navbar navbar-expand-lg nav-main navbar-dark bg-dark" id="nav-main">
  <div class="container-fluid">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse"></div>
    <div class="collapse navbar-collapse " id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 justify-content-center">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="contactus">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contactus">Contact and Support</a>
        </li>
      </ul>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 justify-content-center">
          <%
                    boolean flag = false;
                    Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
                    if (loggedIn == null || !loggedIn) {
                %>
        <li class="nav-item">
          <a class="nav-link nav-reg" href="login">Log In/Sign Up</a>
        </li>

<!--        <li class="nav-item">
          <a class="nav-link nav-reg" href="register">Sign Up</a>
        </li>-->
        <%
                } else {} %>
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