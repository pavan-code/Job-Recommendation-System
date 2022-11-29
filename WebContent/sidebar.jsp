<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notebooks</title>
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
i.menu {
	margin: 0 10px 0 0;
}

.sidebar a {
	padding: 8px 8px 8px 25px;
}
</style>
</head>
<body>
	<div id="mySidebar" class="sidebar">
		<%
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
		<div>
<!-- 			<h4 style="margin-left: 30px; color: white;'">Hello</h4> -->
<!-- 			<hr style='background-color: white;'> -->
		</div>
		<hr class='mb-0'>

		<c:if test="${role.equals('Employer')}">
			<a href="addjob" class='btn'> Add
				Job</a>

		</c:if>

		<c:if test="${role.equals('Employee')}">
			<a href="emp-profile?id=${id}&role=${role}" class='btn'><i class='fa fa-book menu'></i>Profile</a>
		</c:if>

		<c:if test="${role.equals('Employer')}">
			<a href="empr-profile?id=${id}&role=${role}" class='btn'> Profile</a>
		</c:if>

		<c:if test="${role.equals('Admin')}">
			<a href="jobs_admin" class='btn'>All Jobs</a>
		</c:if>
		<c:if test="${role.equals('Admin')}">
			<a href="employees_admin" class='btn'>All Job Seekers</a>
		</c:if>
		<c:if test="${role.equals('Admin')}">
			<a href="employers_admin" class='btn'>All Job Providers</a>
		</c:if>
		<c:if test="${role.equals('Admin')}">
			<a href="unactive_emp" class='btn'> Pending Job Seekers</a>
		</c:if>
		<c:if test="${role.equals('Admin')}">
			<a href="unactive_empr" class='btn'> Pending Job Providers</a>
		</c:if>
		<c:if test="${role.equals('Admin')}">
			<a href="change_pwd" class='btn'> Change Password </a>
		</c:if>
		
	</div>
	<script>
		var show = true;
		function showPassword() {
			show = !show;
			if (!show)
				document.getElementById("password").type = "text";
			else
				document.getElementById("password").type = "password";
		}
		$(document).on('click', '.dialog', function() {

			var id = $(this).data('id');
			var username = $(this).data('username');
			var mobile = $(this).data('mobile');
			var email = $(this).data('email');
			var password = $(this).data('password');
			$('.form-group #id').val(id);
			$('.form-group #username').val(username);
			$('.form-group #mobile').val(mobile);
			$('.form-group #email').val(email);
			$('.form-group #password').val(password);
		})
	</script>
</body>
</html>