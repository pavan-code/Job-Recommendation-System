<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Employee | Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
label {
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class='container'>
		<%
		String eid = request.getParameter("id");
		String id = null;
		Cookie cookie = null;
		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("id")) {
				id = c.getValue();				
				request.setAttribute("id", id);
			} else if (c.getName().equals("role")) {
				request.setAttribute("role", c.getValue());
			}
		}		
		%>
		
		<%-- 			<%= request.getAttribute("jobs") %> --%>

		<h3 align='center'>Find your dream job now with Konnect</h3>
		<br>
		<div class='row' align='center'>
			<button 
			<%
				if(eid == null) {
					out.println("style=\"border: 3px solid blue\"");
				}
			%>
			 onclick="alljobs()" class='btn btn-primary'>All Jobs</button>
			<button 
			<%
				if(eid != null) {
					out.println("style=\"border: 3px solid blue\"");
				}
			%>
			onclick="recommendedjobs(${id})" class='btn btn-primary'>Recommended
				Jobs</button>
		</div>
		<br>
		
		<jsp:include page="jobs.jsp">
			<jsp:param value="<%=request.getAttribute(\"jobs\")%>" name="jobs" />
			<jsp:param value="${eid}" name="eid" />
		</jsp:include>
	</div>
	<script>
		function alljobs() {
			document.location = "home"
		}
		function recommendedjobs(id) {			
			document.location = "rcmd_jobs?id="+id
		}
	</script>
</body>
</html>
