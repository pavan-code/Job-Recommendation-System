<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Job post</title>
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

label {
	font-weight: bold;
}

.form {
	padding: 20px;
	width: 800px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, 0%);
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
	<div class='containers'>
		<%
		com.lms.models.Job job = (com.lms.models.Job) request.getAttribute("job");
		request.setAttribute("job", job);
		// 		out.println(job);
		String role = null;
		Cookie cookie = null;
		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("role")) {
				role = c.getValue();
			}
		}
		%>

		<div class='form card'>
			<div style='text-align: center;'>
				<h2>Update Job post</h2>
			</div>

			<form method="post"
				action="updateJobdetails?jobid=${job.id}&role=${role}">
				<div class='row'>
					<div class='col'>
						<label>Employer ID</label> <input type="number" name="empid"
							value="${job.eid}" class="form-control" readonly>
					</div>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Job Name</label> <input type="text" name="jobname"
							value='${job.jobname}' class="form-control">
					</div>
					<div class='col'>
						<label>Company</label> <input type="text" name="company"
							value='${job.company }' class="form-control">
					</div>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Company Type</label> <select class='form-control'
							name='companytype'>
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
							value="${job.minexperience }" name="minexperience"
							class="form-control">
					</div>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Salary</label> <input type="number" name="salary"
							value="${job.salary }" class="form-control">
					</div>
					<div class='col'>
						<label>Location</label> <input type="text" name="location"
							value="${job.location }" class="form-control">
					</div>
				</div>
				<div class='row'>
					<div class='col'>
						<label>Openings</label> <input type="number" name="openings"
							value="${job.openings }" class="form-control">
					</div>
					<div class='col'>
						<label>Job Type</label> <select class='form-control'
							name='jobtype' value='${job.jobtype }'>
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
							value="${job.skills}" class="form-control">
					</div>
					<div class='col'>
						<label>Website</label> <input type="text" name="website"
							value="${job.website }" class="form-control">
					</div>
				</div>
				<div>
					<label>Description</label>
					<textarea name="description" rows='6' class="form-control">${job.description }</textarea>
				</div>
				<br>
				<div style='text-align: center;'>
					<button class="cb" style='width: 100%;' type="submit">Update
						Job Details</button>
				</div>
			</form>
		</div>
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