<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin | Jobs</title>
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
		<h3>Admin Home Page</h3>
		<button onclick="jobs()" class='btn btn-primary'>All Jobs</button>
		<button onclick="employees()" class='btn btn-primary'>All
			Employees</button>
		
		<button onclick="empUnactive()" class='btn btn-primary'>Pending
			Employees</button>
		<button onclick="emprUnactive()" class='btn btn-primary'>Pending
			Employers</button>
	<br> <br>
		<h3>All Jobs</h3>
		<br>
		<jsp:include page="jobs.jsp">
			<jsp:param value="<%=request.getAttribute(\"jobs\")%>" name="jobs" />
		</jsp:include>
	</div>

	<script>
		function jobs() {
			document.location = 'jobs_admin'
		}
		function employees() {
			document.location = 'employees_admin'
		}
		function empUnactive() {
			document.location = 'unactive_emp'
		}
		function emprUnactive() {
			document.location = 'unactive_empr'
		}
	</script>

</body>
</html>
