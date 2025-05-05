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
</head>
<body class="bg-white">
<%
String msg = (String)session.getAttribute("msg");
if(msg == null)
{
	msg="";
}

%>

	<section>

		<div class="container w-25 bg-light border rounded-3 p-3"
			style="margin-top: 7rem;">
			<p class="text-center text-lead bg-danger text-white border rounded-3"><%=msg %></p>
			<h1 class="text-center text-danger display-6">User Login</h1>
			<form action="user-login" method="post">
				<div class="row g-3">
					<div class="col col-md-12">
						<label for="aname" class="form-label">Enter username</label> <input
							class="form-control" type="text" name="name" id="aname">
					</div>
					<div class="col col-md-12">
						<label for="apass" class="form-label">Enter Password</label> <input
							class="form-control" type="text" name="pass" id="apass">
					</div>
					<div class="col col-md-6 offset-md-4">
						<button class="btn btn-success">Login</button>
					</div>
				</div>
			</form>
		</div>
	</section>
<%
session.removeAttribute("msg");
%>
</body>
</html>