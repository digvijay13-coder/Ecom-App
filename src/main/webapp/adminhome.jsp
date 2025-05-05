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

<style type="text/css">
#box {
	display: none;
}

#btnclose {
	position: absolute;
	top: 0.8rem;
	right: 0.8rem;
}
</style>


</head>
<body class="bg-white">
	<%
	String atoken = (String) session.getAttribute("atoken");
	if (atoken != null) {
	%>
	<nav class="navbar navbar-expand-lg bg-body-tertiary shadow-sm">
		<div class="container-fluid">
			<h1 class="navbar-brand">
				Hello,
				<%=atoken%></h1>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					<li class="nav-item">
						<p class="btn btn-outline-primary btn-sm" onclick="openbox()">Add
							Product</p>
					</li>
					<li class=" ms-3 nav-item"
						style="position: absolute; top: 0.8rem; right: 0.8rem;"><a
						class="btn btn-outline-danger btn-sm " aria-current="page"
						href="admin-logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- navbar end -->



	<!-- Add product form start -->

	<section class="container w-50 mt-5" id="box">
		<div class="card">
			<div class="card-header">
				<h1 class="display-6">Add Product Section</h1>
				<button class="btn-close" id="btnclose" onclick="closebox()"></button>
			</div>
			<div class="card-body">
				<h5 class="card-title">Enter Product Information</h5>



	<%--Add product form start --%>
				<form action="add-product" method="post" enctype="multipart/form-data" class="row g-3">
					<div class="col-md-12">

						<input class="form-control" type="file" id="formFile" name="pimage" >
					</div>
					<div class="col-md-6">
						<input type="text" class="form-control" id="inputEmail4"
							placeholder="Product Name" name="pname">
					</div>
					
					<div class="col-md-6">
						<input type="text" class="form-control" id="inputEmail4"
							placeholder="Product Category" name="category">
					</div>
				
					<div class="col-md-6">
						<input type="text" class="form-control" id="inputEmail4"
							placeholder="Product Price" name="pprice">
					</div>

					<div class="col-md-6">
						<input type="text" class="form-control" id="inputEmail4"
							placeholder="Product Quantity" name="pquantity">
					</div>

					<div class="col-md-12">

						<textarea placeholder="Product Information" class="form-control"
							id="exampleFormControlTextarea1" rows="2" name="pdescription" ></textarea>
					</div>

					<div class="d-grid gap-2 col-12">
						<button type="submit" class="btn btn-primary" onclick="closebox" >Add Product</button>
					</div>
					<input type="hidden" name="adminName" value="<%=atoken %>" > 
					
				</form>
	<%--Add product form start --%>


			</div>
		</div>
	</section>
	<!-- Add product form end -->
	
	
	<!-- Edit Product Start -->
	
	<%
	Product pp=(Product) session.getAttribute("p");
	if(pp != null)
	{
		%>
		
		
		<section class="container w-50 mt-5 p-2" id="box1">
		<div class="card">
			<div class="card-header">
				<h1 class="display-6">Edit Product Section</h1>
				<button class="btn-close" id="btnclose" onclick="closebox1()"></button>
			</div>
			<div class="card-body">
				<h5 class="card-title">Enter Product Information</h5>



	<%--Edit product form start --%>
				<form action="edit-product" method="post" enctype="multipart/form-data" class="row g-4">
					<div class="col-md-12">

						<input class="form-control" type="file" id="formFile" name="pimage" >
					</div>
					<div class="col-md-6">
						<input type="text" class="form-control" id="inputEmail4"
							placeholder="Product Name" name="pname" value="<%=pp.getPname() %>" >
					</div>
					
					<div class="col-md-6">
						<input type="text" class="form-control" id="inputEmail4"
							placeholder="Product Category" name="category" value="<%=pp.getCategory() %>" >
					</div>
				
					<div class="col-md-6">
						<input type="text" class="form-control" id="inputEmail4"
							placeholder="Product Price" name="pprice" value="<%=pp.getPprice()%>" >
					</div>

					<div class="col-md-6">
						<input type="text" class="form-control" id="inputEmail4"
							placeholder="Product Quantity" name="pquantity" value="<%=pp.getPquantity()%>"  >
					</div>

					<div class="col-md-12">

						<textarea placeholder="Product Information" class="form-control"
							id="exampleFormControlTextarea1" rows="2" name="pdescription" ><%=pp.getPdescription()%>"</textarea>
					</div>

					<div class="d-grid gap-2 col-12">
						<button type="submit" class="btn btn-primary" onclick="closebox1" >Save Changes</button>
					</div>
					<input type="hidden" name="adminName" value="<%=atoken %>" > 
					<input type="hidden" name="pid" value="<%=pp.getPid() %>" >
					
				</form>
	<%--Edit product form start --%>


			</div>
		</div>
	</section>
		
		
		
		
		
		
		<% 
	}
	session.removeAttribute("p");
	
	%>
	
	
	
	
	
		<!-- Edit Product End -->
	
	
	
	








<!-- Display Product Start  -->
<%
List<Product> l =(List<Product>)  request.getAttribute("lp");
%>


<section class="container mt-5">

	<table class="table table-bordered text-center caption-top">
	<caption class="text-center display-6 p-3" >Product Information</caption>
	<thead>
	<tr>
		<th>Product Name</th>
		<th>Product Price</th>
		<th>Product Quantity</th>
		<th>Product Category</th>
		<th>Product Image</th>
		<th>Product Description</th>
		<th>Edit</th>
		<th>Delete</th>
		
	</tr>
	
	</thead>
	
	<tbody>
	<%
	for(Product p:l)
	{
		%>
		<tr>
		<td><%=p.getPname() %></td>
		<td><%=p.getPprice() %></td>
		<td><%=p.getPquantity()%></td>
		<td><%=p.getCategory()%></td>
		<td><img width="200" alt="Loading.. " src="/images/<%=p.getPimageName() %>"></td>
		<td><%=p.getPdescription() %></td>
		<td>
		
		<form action="/read-edit-product" method="post">
		<input type="hidden" name="pid" value="<%=p.getPid() %>" >
		<button class="btn btn-sm btn-info">Edit</button>
		</form>
		
		</td>
		<td>
		
		<form action="/delete-product" method="post">
		<input type="hidden" name="pid" value="<%=p.getPid() %>" >
		<button class="btn btn-sm btn-danger">Delete</button>
		</form>
		
		</td>
		</tr>
		
		<% 
	}
	if(l.size() == 0)
	{
		%>
		<tr>
		<td colspan="8" >No Products </td>
		</tr>
		
		<% 
		
	}
	%>
	
	</tbody>
	
	</table>


</section>













<!-- Display Product End  -->













































	<script type="text/javascript">
		function openbox() {
			document.getElementById("box").style.display = "block";
		}
		function closebox() {
			document.getElementById("box").style.display = "none";
		}
		
		function closebox1() {
			document.getElementById("box1").style.display = "none";
		}
		
	</script>

	<%
	} else {
	response.sendRedirect("adminlogin.jsp");
	session.setAttribute("msg", "login and then access admin home");
	}
	%>
</body>
</html>