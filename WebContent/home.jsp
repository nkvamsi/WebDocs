<!doctype html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home Page</title>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
        crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- Main Container -->
<div class="p-3 bg-dark text-white">Documnets</div>
  <!-- nav Section -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link text-dark" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#">Shared Docs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#">Log Out</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button type="submit" class="btn btn-light"><i class="fas fa-search"></i></button>
            </form>
        </div>
    </nav>
 <!-- Banner Section -->
 <div class="p-3 bg-dark text-white">
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <br><br><br><br>
                    <h2 class="mb-3">Welcome</h2>
                    <h3><h3><%=request.getSession().getAttribute("name").toString() %></h3></h3>
                </div>
                <div class="col-sm">
                    <img class="img-circle" src="images/profile.png">
                </div>
            </div>
        </div>
    </div>
   <%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
	String user_id = request.getSession().getAttribute("user_id").toString();
	PreparedStatement ps = con.prepareStatement("select * from document where user_id=?");
	ps.setString(1, user_id);
	
	ResultSet rs = ps.executeQuery();
	
	%>
	<div class="btn-group mr-4" style="float: right;">
  	<button type="button" class="btn btn-secondary dropdown-toggle mt-2 mb-2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Tags
  	</button>
	  <div class="dropdown-menu dropdown-menu-right">
	    <a class="dropdown-item" href="#">Important</a>
	    <a class="dropdown-item" href="#">In Complete</a>
	    <a class="dropdown-item" href="#">Success</a>
	    <a class="dropdown-item" href="#">Not Important</a>
	   </div>
	  </div>
	<div class="bg-light">
        <div class="card-columns p-5">
        <%while (rs.next()){ %>
            
        <div class="card">
          <img class="card-img-top p-3" src="get_image()" alt="image_icon">
          <div class="card-body">
            <a href ="ViewDocument.jsp?id=<%=rs.getString("id")%>"><h5 class="card-title"><%=rs.getString("name") %></h5></a>
            <p class="card-text"><%=rs.getString("tag") %></p>
            <button type="button" class="btn btn-light"><i class="fa fa-download" aria-hidden="true"></i></button>
            <button type="button" class="btn btn-light"><i class="fa fa-share-alt" aria-hidden="true"></i></button>
            <button type="button" class="btn btn-light"><i class="fa fa-trash" aria-hidden="true"></i></button>
          </div>
        </div>
            <%} %>
            </div>
        
    </div>
	<%
	con.close();

} catch (Exception e) {
	e.printStackTrace();
}
%>

 <!-- Footer Section -->
 <div class="p-3 mt-3 bg-dark text-white">View Your Documents</div>
<!-- Main Container Ends -->
</body>
</html>
