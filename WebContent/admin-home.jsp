<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin | Home</title>
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
::-webkit-scrollbar {
	width: 2px;
}

::-webkit-scrollbar-track {
	box-shadow: inset 0 0 5px grey;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb {
	background: blue;
	border-radius: 10px;
}

label {
	font-weight: bold;
}

.cb {
	background-color: #3f51b5;
	border: 1px solid white;
	color: white;
	min-width: 164px;
	outline: none;
	padding: 6px 12px;
	border-radius: 4px;
	margin: 0 5px;
}

.cb:hover {
	background-color: rgba(63, 81, 181, 0.88)
}

.center {
	display: flex;
	justify-content: center;
	padding: 10px 5px;
	position: sticky;
	top: 80px;
	background: lightgrey;
	margin: 0 auto;
	z-index: 1;
}

.containers {
	margin: 0 auto;
	width: 90% !important;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class='center'>
		<button onclick="jobs()" class='cb'> <i class='fa fa-suitcase'></i> All Jobs</button>
		<button onclick="employees()" class='cb'><i class="fa fa-users"></i> All Job Seekers</button>
		<button onclick="employers()" class='cb'><i class="fa fa-users"></i> All Job Providers</button>
		<button onclick="empUnactive()" class='cb'><i class="fa fa-user"></i> Pending Job Seekers
		<span class="badge badge-pill badge-warning">${fn:length(uemps)}</span></button>
		<button onclick="emprUnactive()" class='cb'><i class="fa fa-user"></i> Pending Job Providers
		<span class="badge badge-pill badge-warning">${fn:length(uemprs)}</span></button>
	</div>
	<!-- 	<br> -->
	<div class='containers'>

		<h3 align='center'>Admin Home Page</h3>
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
		function employers() {
			document.location = 'employers_admin'
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
