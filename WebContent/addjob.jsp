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
	width: 800px;
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
#errmsg {
	width: 0;
	margin: 0 auto;
	text-align: center;
	visibility: hidden;
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
		<div class="alert alert-danger" id="errmsg"></div>
		<div class='form card'>
			<div style='text-align: center;'>
				<h2>Add new job post</h2>
			</div>
			<form name='jobform' method="post" action="addnewjob"
				onSubmit="return validate(event)">
				<div class='row' style='display: none;'>
					<div class='col'>
						<label>Job Provider ID</label> <input name="empid" value="${id}"
							class="form-control"  readonly>
					</div>
				</div>

				<div class='row'>
					<div class='col'>
						<label>Job Name</label> <input type="text" name="jobname"
							id='jobname' class="form-control">
					</div>
					<div class='col'>
						<label>Company</label> <input type="text" name="company"
							id='company' class="form-control" >
					</div>
					<div class='col'>
						<label>Company Type</label> <select class='form-control'
							id='ctype' name='companytype' >
							<option>--select type--</option>
							<option>MNC</option>
							<option>Corporate</option>
							<option>Startup</option>
							<option>Govt/PSU</option>
							<option>Others</option>
						</select>
					</div>
					
				</div>
				<div class='row'>
					<div class='col'>
						<label>Minimum Experience</label> <input type="number" id='minexp'
							name="minexperience" class="form-control" >
					</div>
					<div class='col'>
						<label>Salary</label> <input type="number" name="salary"
							id='sal' class="form-control" >
					</div>
					<div class='col'>
						<label>Location</label> <input type="text" name="location"
							id='loc' class="form-control" >
					</div>
					
					
				</div>
				<div class='row'>
					<div class='col'>
						<label>Openings</label> <input type="number" name="openings"
							id='openings' class="form-control" >
					</div>
					<div class='col'>
						<label>Job Type</label> <select class='form-control' id='jtype'
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
					<div class='col'>
						<label>Web site</label> <input type="text" name="website"
							id='website' class="form-control" >
					</div>
				</div>
				
				<div class='row'>
					<div class='col'>
						<label>Skills</label> <input type="text" name="skills" id='skills'
							class="form-control" >
					</div>
					
				</div>
				<div>
					<label>Description</label>
					<textarea type="text" name="description" rows='1' id='desc'
						class="form-control" ></textarea>
				</div>
				<br>
				<div style='text-align: center;'>
					<button class="btn btn-primary" style='width: 100%;' type="submit">
						<i class='fa fa-plus'></i> Add Job
					</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		function validate(event) {
			event.preventDefault();
			var jname = document.jobform.jobname.value;
			var comp = document.jobform.company.value;
			var ctype = document.jobform.ctype.value;
			var minexp = document.jobform.minexp.value;
			var sal = document.jobform.sal.value;
			var loc = document.jobform.loc.value;
			var opn = document.jobform.openings.value;
			var jtype = document.jobform.jtype.value;
			var skills = document.jobform.skills.value;
			var site = document.jobform.website.value;
			var desc = document.jobform.desc.value;
			
			if (jname == null || jname == "") {
				document.getElementById("errmsg").innerHTML ="Please enter the Job Name";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("errmsg").style.visibility = "visible";				
				document.getElementById("jobname").style.borderColor= "red";
				document.jobform.jobname.focus();
				return false;
			} else if(comp == null || comp == "") {
				document.getElementById("jobname").style.borderColor= "";				
				document.getElementById("errmsg").innerHTML ="Please enter the Company Name";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("company").style.borderColor= "red";
				document.jobform.company.focus();				
				return false;
			} else if(ctype == null || ctype == "" || ctype == "--select type--") {
				document.getElementById("company").style.borderColor= "";
				document.getElementById("errmsg").innerHTML ="Please select the Company type";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("ctype").style.borderColor= "red";
				document.jobform.ctype.focus();
				return false;
			} else if(minexp == null || minexp == "" || minexp < 0) {
				document.getElementById("ctype").style.borderColor= "";				
				document.getElementById("errmsg").innerHTML ="Please enter a valid experience";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("minexp").style.borderColor= "red";
				document.jobform.minexp.focus();
				return false;
			} else if(sal == null || sal == "" || sal < 0) {
				document.getElementById("minexp").style.borderColor= "";		
				document.getElementById("errmsg").innerHTML ="Please enter a valid Salary value";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("sal").style.borderColor= "red";
				document.jobform.sal.focus();
				return false;
			} else if(loc == null || loc == "") {
				document.getElementById("sal").style.borderColor= "";
				document.getElementById("errmsg").innerHTML ="Please enter the locations";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("loc").style.borderColor= "red";
				document.jobform.loc.focus();
				return false;
			} else if(opn == null || opn == "" || opn < 0) {
				document.getElementById("loc").style.borderColor= "";
				document.getElementById("errmsg").innerHTML ="Please enter a valid No. of Openings";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("openings").style.borderColor= "red";
				document.jobform.openings.focus();
				return false;
			} else if(jtype == null || jtype == "" || jtype == "--select type--") {
				document.getElementById("openings").style.borderColor= "";
				document.getElementById("errmsg").innerHTML ="Please select the Job Type";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("jtype").style.borderColor= "red";
				document.jobform.jtype.focus();
				return false;
			}  else if(site == null || site == "") {
				document.getElementById("jtype").style.borderColor= "";
				document.getElementById("errmsg").innerHTML ="Please enter the Company's web site";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("website").style.borderColor= "red";
				document.jobform.website.focus();
				return false;
			} else if(skills == null || skills == "") {
				document.getElementById("website").style.borderColor= "";
				document.getElementById("errmsg").innerHTML ="Please enter the skills set for job";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("skills").style.borderColor= "red";
				document.jobform.skills.focus();
				return false;
			} else if(desc == null || desc == "") {
				document.getElementById("skills").style.borderColor= "";
				document.getElementById("errmsg").innerHTML ="Please enter the job description";
				document.getElementById("errmsg").style.width = "400px";
				document.getElementById("errmsg").style.height = "50px";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("errmsg").style.padding = "12px 20px";
				document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("desc").style.borderColor= "red";
				document.jobform.desc.focus();
				return false;
			} else {
				document.getElementById("desc").style.borderColor= "";
				document.jobform.submit();
			}
		}
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