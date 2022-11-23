<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin | Pending Employers</title>
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
		<br>
		<%-- 		<%=request.getAttribute("emprs")%> --%>
		<br>
		<table
			class='table caption-top table-light table-striped table-bordered '>
			<caption>List of pending employers</caption>

			<thead class='table-dark'>
				<tr>
					<td>Id</td>
					<td>Username</td>
					<td>Email</td>
					<td>Mobile</td>
					<td>Actions</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(emprs) > 0}">
					<c:forEach var="job" items="${emprs}">
						<tr>
							<td>${job.id}</td>
							<td>${job.username}</td>
							<td>${job.email}</td>
							<td>${job.mobile}</td>
							<td>
								<button class='btn btn-primary' data-id="${job.id}"
									data-email="${job.email}" data-psd="${job.password }"
									onclick="activate(this)">Activate</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<c:if test="${fn:length(emprs) == 0}">
			<p>No pending employers to activate
			<p />
		</c:if>
		<br> <br>
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
		function activate(th) {
			alert("esdf")
			let id = th.getAttribute('data-id')
			let email = th.getAttribute('data-email')
			let psd = th.getAttribute('data-psd');
			alert(id)
			alert(email)
			//  			request.setAttribute("asd", "asdf")
			document.location = 'update_active?id=' + id + '&email=' + email
					+ '&enc=' + psd + '&role=Employer';
		}
	</script>
</body>
</html>
