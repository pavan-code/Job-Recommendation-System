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

.form {
	padding: 20px;
	width: 600px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, 0%);
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
		<button class='cb' onclick="addjob()"> <img alt="" src="WebContent/images/notes.png"> Add Job</button>
		<button class='cb' onclick="viewjobs(<%out.println(id);%>)">View
			Jobs</button>
		<button class='cb' onclick="viewemployees(${id})">Recommended
			Employees</button>
				<button onclick="viewapps(${id})" class='cb'>View Job Applications</button>
			
	</div>
	<div class='containers'>

		<div class='form card'>
			<div style='text-align: center;'>
				<h2>Add new job post</h2>
			</div>
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
		function viewemployees(empid) {
			document.location = "rcmd_emps?empid="+empid;
		}
	</script>
</body>
</html>