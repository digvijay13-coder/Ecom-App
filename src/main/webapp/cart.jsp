<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="com.MainApp.Entity.Product"%>
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
	<!-- Navbar starts -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<h1 class="navbar-brand">Cart Products</h1>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- navbar end -->


<%
List<Product> l = (List<Product>) request.getAttribute("lcp");
%>
<section>
<%
for(Product p: l)
{
%>
<div class="border rounded-3 p-3 w-50">
<h6>Product Name: <span class="lead"><%=p.getPname()%></span></h6>
<img width="150" alt="loading..." src="/images/<%=p.getPimageName()%>">
<h6>Product Price: <span class="lead"><%=p.getPprice()%></span></h6>
<p><%=p.getPdescription()%></p>
<button class="btn btn-success">Order</button>
<form action="delete-cart" method="post">

<input type="hidden" name="pid" value="<%=p.getPid()%>">
<input type="hidden" name="uname" value="<%=utoken%>">
<button class="btn btn-danger">Remove</button>
</form>

</div>
<hr>
<% 
}
if(l.size() == 0)
{
	%>
	<h1 class="text-center text-danger display-6">Cart Is Empty</h1>
	<% 
}
%>
</section>

	}
	<%
	} else {
	response.sendRedirect("userlogin.jsp");
	session.setAttribute("msg", "login and then access admin home");
	}
	%>
</body>
</html>