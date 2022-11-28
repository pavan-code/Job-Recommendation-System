<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
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
label {
	font-weight: bold;
}
.center {
	justify-content: center; 	
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
<!-- 	<br> -->
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
		<%-- 		<%=request.getAttribute("employees")%> --%>

		<h3 align='center'>Find your perfect employee now with Konnect</h3>
		<br> 
		<div class="row center">
			<button class='cb' onclick="viewjobs(<%out.println(id);%>)">View Jobs</button>
			<button class='cb' onclick="viewemployees(${id})">Recommended Employees</button>
		</div>
<!-- 		<hr> -->
		<jsp:include page="jobs.jsp">
			<jsp:param value="<%=request.getAttribute(\"jobs\")%>"
 				name="jobs" /> 
 		</jsp:include>
	</div>

	<script>
		function viewjobs(id) {
			document.location = "empr_jobs?id=" + id;
		}
		function viewemployees(empid) {
// 			alert(empid)
// 			document.location = "all_emps";
			document.location = "rcmd_emps?empid="+empid;
		}
	</script>
</body>
</html>
