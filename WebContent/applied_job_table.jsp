<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Employee | Job Applications</title>
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
<link rel="stylesheet" href="styles.css">

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

#errmsg {
	width: 0;
	margin: 0 auto;
	text-align: center;
}

.cb:hover {
	background-color: rgba(63, 81, 181, 0.88)
}
</style>
</head>
<body>
	<div class='containers'>
		<c:if test="${fn:length(jobs) > 0}">
			<table
				class='table caption-top table-light table-striped table-bordered '>

				<thead class='table-dark'>
					<tr>
						<th>Job Id</th>
						<th>Job Title</th>
						<th>Company</th>
						<th>Location</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="job" items="${jobs}">
						<tr>
							<td>${job.id}</td>
							<td>${job.jobname}</td>
							<td>${job.company}</td>
							<td>${job.location}</td>
							<td
								<%if(((com.lms.models.Job)
										(pageContext.findAttribute("job")))
										.getStatus().equals("Applied")) {
									out.println("class=\"badge badge-warning\"");
								} else if(((com.lms.models.Job)
										(pageContext.findAttribute("job")))
										.getStatus().equals("Accepted")) {
									out.println("class=\"badge badge-success\"");
								} else if(((com.lms.models.Job)
										(pageContext.findAttribute("job")))
										.getStatus().equals("Rejected")) {
									out.println("class=\"badge badge-danger\"");
								}								
								%>>${job.status}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<c:if test="${fn:length(jobs) == 0}">
			<p>No job applications to display. Click <a href="/Notifier/home">here</a> to apply for jobs
			<p />
		</c:if>
	</div>
	<script>
		function alljobs() {
			document.location = "home"
		}
		function recommendedjobs(id) {			
			document.location = "rcmd_jobs?id="+id
		}		
		function appjobs(id) {
			document.location = "applied-jobs?id="+id
		}
	</script>
</body>
</html>
