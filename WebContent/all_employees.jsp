<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Recommended Job Seekers</title>
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
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="center">
		<button class='cb' onclick="addjob()">
			<i class='fa fa-suitcase'></i> Add Job
		</button>
		<button class='cb' onclick="viewjobs(<%out.println(id);%>)">
			<i class='fa fa-suitcase'></i> View Jobs
		</button>
		<button class='cb' onclick="viewemployees(${id})">
			<i class='fa fa-user'></i> Recommended Job Seekers
		</button>
		<button onclick="viewapps(${id})" class='cb'>
			<i class='fa fa-user'></i> View Job Applications
		</button>
	</div>
	<div class='containers'>
		<h3 align='center'>List of suggested job seekers</h3>
		<jsp:include page="employees.jsp">
			<jsp:param value="<%=request.getAttribute(\"employees\")%>"
				name="employees" />
		</jsp:include>
	</div>
	<script>
	function viewapps(id) {
		document.location = "applied-employees?id=" + id;
	}
	function addjob() {
		document.location = "addjob"
	}
	function viewjobs(id) {
		document.location = "empr_jobs?id=" + id;
	}
	function viewemployees() {
		document.location = "all_emps";
	}
	</script>
</body>
</html>
