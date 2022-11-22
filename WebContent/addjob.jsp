<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Job Post</title>
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
.container {
	position: relative;
}

.form {
	padding: 20px;
	width: 600px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, 0%);
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class='container'>
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

		<div class='form card'>
			<div style='text-align: center;'>
				<h2>Add new job post</h2>
			</div>
			<hr>
			<form method="post" action="addnewjob">
				<div class='row'>
					<div class='col'>
						<label>Employer ID</label> <input type="number" name="empid"
							value="${id}" class="form-control" required readonly>
					</div>
				</div>

				<div class='row'>
					<div class='col'>
						<label>Job Name</label> <input type="text" name="jobname"
							class="form-control" required>
					</div>
					<div class='col'>
						<label>Company</label> <input type="text" name="company"
							class="form-control" required>
					</div>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Company Type</label> <select class='form-control'
							name='companytype' required>
							<option>--select type--</option>
							<option>MNC</option>
							<option>Corporate</option>
							<option>Startup</option>
							<option>Govt/PSU</option>
							<option>Others</option>
						</select>
					</div>
					<div class='col'>
						<label>Minimum Experience</label> <input type="number"
							name="minexperience" class="form-control" required>
					</div>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Salary</label> <input type="number" name="salary"
							class="form-control" required>
					</div>
					<div class='col'>
						<label>Location</label> <input type="text" name="location"
							class="form-control" required>
					</div>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Openings</label> <input type="number" name="openings"
							class="form-control" required>
					</div>
					<div class='col'>
						<label>Job Type</label> <select class='form-control'
							name='jobtype' required>
							<option>--select type--</option>
							<option>IT</option>
							<option>Banking</option>
							<option>BPO</option>
							<option>Financial Services</option>
							<option>Automobile</option>
							<option>Hardware</option>
							<option>Accounting</option>
							<option>Insurance</option>
							<option>Construction</option>
							<option>Management</option>
						</select>
					</div>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Skills</label> <input type="text" name="skills"
							class="form-control" required>
					</div>
					<div class='col'>
						<label>Website</label> <input type="text" name="website"
							class="form-control" required>
					</div>
				</div>
				<div>
					<label>Description</label>
					<textarea type="text" name="description" rows='7'
						class="form-control" required></textarea>
				</div>
				<br>
				<div style='text-align: center;'>
					<button class="btn btn-primary" style='width: 100%;' type="submit">Add
						Job</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>