<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin | Pending Job Seekers</title>
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
::-webkit-scrollbar {
  width: 2px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: blue; 
  border-radius: 10px;
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
	width: 90% !important;
	margin: 0 auto;
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
		<button onclick="empUnactive()" class='cb'><i class="fa fa-user"></i> Pending Job Seekers</button>
		<button onclick="emprUnactive()" class='cb'><i class="fa fa-user"></i> Pending Job Providers</button>
	</div>
	<div class='containers'>
		
		<h3 align='center'>List of Pending Job Seekers</h3>
		<table class='table caption-top table-light table-striped table-bordered '>
			
			<thead class='table-dark'>
				<tr>
					<th>Id</th>
					<th>Username</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(emps) > 0}">
					<c:forEach var="job" items="${emps}">
						<tr>
							<td>${job.id}</td>
							<td>${job.username}</td>
							<td>${job.email}</td>
							<td>${job.mobile}</td>
							<td>
								<button class='cb' data-id="${job.id}"
									data-email="${job.email}" data-psd="${job.password }"
									onclick="activate(this)">Activate</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<c:if test="${fn:length(emps) == 0}">
			<p>No pending job seekers to activate
			<p />
		</c:if>
		<br>
		<br>
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
		function activate(th) {
			alert("esdf")
			let id = th.getAttribute('data-id')
			let email = th.getAttribute('data-email')
			let psd = th.getAttribute('data-psd');
			alert(id)
			alert(email)
			//  			request.setAttribute("asd", "asdf")
			document.location = 'update_active?id=' + id + '&email=' + email
					+ '&enc=' + psd + '&role=Employee';
		}
	</script>
</body>
</html>
