<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Profile</title>
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
	<%

	%>
	<div class='container'>
		<%
		// 		if (request.getAttribute("role").equals("Employee")) {
		com.lms.models.Employee emp = (com.lms.models.Employee) request.getAttribute("employee");

		// 			out.println(emp);
		// 		if (emp.getImage() != null) {
		// 			java.io.InputStream inputStream = emp.getImage();

		// 			java.io.ByteArrayOutputStream outputStream = new java.io.ByteArrayOutputStream();
		// 			byte[] buffer = new byte[4096];
		// 			int bytesRead = -1;

		// 			while ((bytesRead = inputStream.read(buffer)) != -1) {
		// 				outputStream.write(buffer, 0, bytesRead);
		// 			}

		// 			byte[] imageBytes = outputStream.toByteArray();

		// 			String img = java.util.Base64.getEncoder().encodeToString(imageBytes);
		// 			// 		out.println(img);
		// 			request.setAttribute("img", img);
		// 		}

		request.setAttribute("emp", emp);
		%>

		<div class='form'>
			<div style='text-align: center;'>
				<h2>Update Profile</h2>
			</div>
			<hr>
			<form action="update" method="post">
				<h5>Personal Details</h5>
				<div class='row'>
					<div class='col-3'>
						<label>Profile picture</label> <br> <img
							alt="profile picture"
							src="/Notifier/WebContent/images/${emp.image}" width='200px'>
					</div>
					<div class='col-3'>
						<label>Employee ID</label> <br> <input type="text" readonly
							value="${emp.id}" name="id" class="form-control">
					</div>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Employee Name</label> <br> <input type="text" readonly
							value="${emp.username}" name="username" class="form-control">
					</div>
					<br>
					<div class='col'>
						<label>Email</label> <br> <input type="text" name="email"
							readonly value="${emp.email}" class="form-control">
					</div>
					<br>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Mobile Number</label> <br> <input type="text"
							value="${emp.mobile}" name="mobile" class="form-control" required>
					</div>
					<br>
					<div class='col'>
						<label>Password </label> <br> <input type="password"
							value="${emp.password}" name="password" class="form-control"
							required>
					</div>
					<br>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Address</label> <br> <input type="text" name="address"
							value="${emp.address}" class="form-control" required>
					</div>
					<br>
				</div>

				<br> <br>
				<h5>Professional Details</h5>
				<div class='row'>
					<div class='col'>
						<label>Notice Period (months)</label> <br> <input
							type="number" value="${emp.noticeperiod}" name="noticeperiod"
							class="form-control" required>
					</div>
					<br>
					<div class='col'>
						<label>Experience (Years)</label> <br> <input type="number"
							value="${emp.experience}" name="experience" class="form-control"
							required>
					</div>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Skills (comma ',' seperated)</label> <br> <input
							type="text" value="${emp.skills}" name="skills"
							class="form-control" required>
					</div>
					<br>
				</div>

				<br>
				<div style='text-align: center;'>
					<button class="btn btn-primary" style='width: 100%;' type="submit">Update
						details</button>
				</div>
				<br>

			</form>
		</div>
	</div>

</body>
</html>
