<%@page import="java.util.Set"%>
<%@page import="com.MainApp.Entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
	crossorigin="anonymous"></script>


</head>
<body class="bg-white">
	<%
	String utoken = (String) session.getAttribute("utoken");
	if (utoken != null) {
	%>
	
	
	<!-- Nav Bar Start -->
	
	<%
	Set<String> s =(Set<String> )request.getAttribute("categories");
	%>
	
	


<nav class="navbar fixed-top navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Hello, <%=utoken%></a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

      <!-- Left side: Categories -->
      <ul class="navbar-nav mb-2 mb-lg-0">
        <li class="nav-item">
          <div class="dropdown">
            <button class="btn btn-secondary btn-sm dropdown-toggle" type="button"
              data-bs-toggle="dropdown" aria-expanded="false">
              Categories
            </button>
            <ul class="dropdown-menu">
              <%
                for(String c : s) {
              %>
              <li><a class="dropdown-item" href="/filter?category=<%=c%>"><%= c %></a></li>
              <%
                }
              %>
              <li><a class="dropdown-item" href="/remove-filter">Remove Filter</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item ms-2">
          <a class="btn btn-info nav-link active" aria-current="page" href="read-cart?uname=<%=utoken%>">Cart</a>
        </li>
      </ul>

      <!-- Right side: Search and Logout -->
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item me-3">
          <form class="d-flex" role="search" action="#">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </li>
        
        <li class="nav-item">
          <a class="btn btn-outline-danger" aria-current="page" href="user-logout">Logout</a>
        </li>
      </ul>

    </div>
  </div>
</nav>



<!-- Product Display Start -->
<%
List<Product> l =(List<Product>) request.getAttribute("lap");

%>

<section class="container mt-5">
<div class="row" >
<%
for(Product p:l)
{
	%>
	
	<div class="col-md-4 g-3">
	
	<div class="card  p-3" style="width: 18rem;">
	<h4 class="card-title"><%=p.getPname() %></h4>
  <img height="200" src="/images/<%=p.getPimageName()%>" class="card-img-top" alt="loading...">
  <div class="card-body">
  <h4 class="card-title"><%=p.getPprice() %></h4>
	<form action="add-cart" method="post">
	
	<input type="hidden" name="pid" value="<%=p.getPid() %>" >
	<input type="hidden" name="aname" value="<%=p.getAdminName() %>">
	<input type="hidden" name="uname" value="<%=utoken %>">	  
		<button class="btn btn-sm btn-outline-info" >Add to Cart</button>
		</form>
  </div>
		
	</div>

</div>

	
	
	
	
	<% 
}
%>
</div>

</section>









<!-- Product Display Start -->




	<%
	} else {
	response.sendRedirect("userlogin.jsp");
	session.setAttribute("msg", "login and then access User home");
	}
	%>
</body>
</html>