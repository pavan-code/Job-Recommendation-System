<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>
<style>
.containers {
	/* 	padding: 20px; */
	width: 90% !important;
	margin: 0 auto;
}

.card {
	width: 100%;
}

.left {
	width: 220px !important;
}

.right {
	height: 470px;
	overflow-y: scroll;
}

input {
	width: 10px;
}

.rows {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

a:hover {
	text-decoration: none;
}

input.check {
	width: 19px;
	height: 19px;
}

input[type="checkbox"].check:checked {
	background-color: red;
}

label {
	margin: 0;
	/* 	display: flex; */
	align-items: center;
}
i {	
	width: 15px;
	text-align: center;
	margin-right: 3px;
}
</style>
</head>
<body>
	<%
	String ctypes = request.getParameter("companytype");
	String jtypes = request.getParameter("jobtype");
	String id = request.getParameter("id");
	String path = request.getServletPath();
	// 			out.println(path);
	String end = request.getQueryString();
	// 	out.println(end);
	request.setAttribute("path", path.substring(1));
	request.setAttribute("end", end);
	String role = null;
	Cookie cookie = null;
	Cookie[] cookies = request.getCookies();
	for (Cookie c : cookies) {
		if (c.getName().equals("role")) {
			role = c.getValue();
		}
	}
	%>
<!-- 	<div class="alert alert-danger" id="errmsg"></div> -->
	<div class='containers'>
		<div class='row'>
			<div class='col col-3 left'>
				<div class='row'>
					<h4 class='col'>Filters</h4>
					<a class='col'
						href='/Notifier/
						<%if (path.equals("/jobs_admin.jsp")) {
	out.println("jobs_admin");
} else if (path.equals("/home.jsp")) {
	out.println("home");
} else if (path.equals("/empr_jobs.jsp")) {
	out.println("empr_jobs?id=" + id);
} else if (path.equals("/emp-home.jsp")) {
	out.println("empr-home");
}%>
					'>Clear
						filters</a>
				</div>
				<div class='companytype'>
					<h5>Company Type</h5>
					<label><input type='checkbox' class='check'
						onclick="ctypeclicked()" id="MNC" name='MNC'
						<%if (ctypes != null && ctypes.contains("MNC")) {
	out.print("checked=\"checked\"");
}%> />
						MNC</label> <br> <label><input type='checkbox'
						onclick="ctypeclicked()" class='check' id="Corporate"
						name='Corporate'
						<%if (ctypes != null && ctypes.contains("Corporate")) {
	out.print("checked=\"checked\"");
}%> />
						Corporate</label> <br> <label><input type='checkbox'
						onclick="ctypeclicked()" class='check' id="Startup" name='Startup'
						<%if (ctypes != null && ctypes.contains("Startup")) {
	out.print("checked=\"checked\"");
}%> />
						Startup </label> <br> <label> <input type='checkbox'
						onclick="ctypeclicked()" class='check' id="Govt" name='Govt/PSU'
						<%if (ctypes != null && ctypes.contains("Govt/PSU")) {
	out.print("checked=\"checked\"");
}%> />
						Govt/PSU
					</label> <br> <label> <input type='checkbox'
						onclick="ctypeclicked()" class='check' id="Others" name='Others'
						<%if (ctypes != null && ctypes.contains("Others")) {
	out.print("checked=\"checked\"");
}%> />
						Others
					</label> <br>
				</div>
				<br>
				<div class='jobtype'>
					<h5>Job Type</h5>
					<label> <input type='checkbox' class='check'
						onclick="ctypeclicked()" id="Accounting" name='Accounting'
						<%if (jtypes != null && jtypes.contains("Accounting")) {
	out.print("checked=\"checked\"");
}%> />
						Accounting
					</label> <br> <label> <input type='checkbox' class='check'
						onclick="ctypeclicked()" id="IT" name='IT'
						<%if (jtypes != null && jtypes.contains("IT")) {
	out.print("checked=\"checked\"");
}%> />
						IT
					</label> <br> <label> <input type='checkbox'
						onclick="ctypeclicked()" class='check' id="BPO" name='BPO'
						<%if (jtypes != null && jtypes.contains("BPO")) {
	out.print("checked=\"checked\"");
}%> />
						BPO
					</label> <br> <label> <input type='checkbox'
						onclick="ctypeclicked()" class='check' id="Financial Services"
						name='Financial Services'
						<%if (jtypes != null && jtypes.contains("Financial Services")) {
	out.print("checked=\"checked\"");
}%> />
						Financial Services
					</label> <br> <label> <input type='checkbox' class='check'
						onclick="ctypeclicked()" id="Banking" name='Banking'
						<%if (jtypes != null && jtypes.contains("Banking")) {
	out.print("checked=\"checked\"");
}%> />
						Banking
					</label> <br> <label> <input type='checkbox'
						onclick="ctypeclicked()" class='check' id="jOthers" name='Others'
						<%if (jtypes != null && jtypes.contains("Others")) {
	out.print("checked=\"checked\"");
}%> />
						Others
					</label>
					<hr>
				</div>
				<div class='row'>
					<button onclick="apply('${path}', ${id}, '${end}')"
						class='btn btn-secondary btn-block'>Apply filter</button>
				</div>
			</div>
			<div class='col right'>

				<c:if test="${jobs.size() == 0}">
					<h3>You don't have any job to display!</h3>
				</c:if>
				<c:if test="${jobs.size() != 0}">

					<br>
					<c:forEach var="job" items="${jobs}">
						<div class="card shadow p-3 mb-3 bg-white rounded">
							<div class="card-body">
								<div class='rows'>
									<h4 class='card-title'>${job.jobname}
										| <span class='badge badge-pill badge-info'><i class='fa fa-tag'></i> ${job.jobtype}</span>
									</h4>
									<div>
										<c:if test="${role != 'Employee' }">
											<button onclick="updateJob(${job.id})"
												class='btn btn-info btn-sm'>
												<i class='fa fa-edit'></i> Edit
											</button>
											<button onclick="deleteJob(${job.id}, '${role}', ${job.eid})"
												class='btn btn-danger btn-sm'>
												<i class='fa fa-trash'></i> Delete
											</button>
										</c:if>
										<c:if test="${role == 'Employee' }">
											<button id="appbtn" onclick="applyjob(${job.id}, '${role}', ${id}, ${job.eid})" class="btn btn-success btn-sm">
											 <i class='fa fa-plus'></i>	Apply</button>
										</c:if>
									</div>
								</div>
								<h5 class='card-subtitle mb-2 text-muted'>${job.company} |
									${job.companytype}</h5>
								<div class='card-text'>
									<div>
										<span class='font-weight-bold'><i class='fa fa-line-chart'></i> Min. Experience: </span> <span>${job.minexperience}
											Yrs.</span>
									</div>
									<div>
									<i class='fa fa-money'></i>
										<span class='font-weight-bold'>Expected Salary: </span> <span>&#8377;
											${job.salary} LPA</span>
									</div>
									<div>
									<i class='fa fa-map-marker'></i>
										<span class='font-weight-bold'>Location: </span> <span>${job.location}</span>
									</div>
									<div>
										<span class='font-weight-bold'><i class='fa fa-gear'></i> Skills: </span> <span></i> ${job.skills}</span>
									</div>
									<%-- 									${job.description} --%>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>

		</div>
	</div>
</body>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	var ctypes = []
	var jtypes = []
	function ctypeclicked() {
// 		console.log(document.getElementsByTagName("label")[1].innerText);
		let i = 0
		console.log("clicked");
		if (document.getElementById("MNC").checked) {
			ctypes[i] = "MNC";
			i += 1;
		} 
		if (document.getElementById("Corporate").checked) {
			ctypes[i] = "Corporate";
			i += 1;
		}
		if (document.getElementById("Startup").checked) {
			ctypes[i] = "Startup";
			i += 1;
		}
		if (document.getElementById("Govt").checked) {
			ctypes[i] = "Govt/PSU";
			i += 1;
		}
		if (document.getElementById("Others").checked) {
			ctypes[i] = "Others";
			i += 1;
		}
		console.log(ctypes);
// 	}
// 	function jtypeclicked() {
		let j = 0
		console.log("clicked");
		if (document.getElementById("Accounting").checked) {
			jtypes[j] = "Accounting";
			j += 1;
		}
		if (document.getElementById("BPO").checked) {
			jtypes[j] = "BPO";
			j += 1;
		}
		if (document.getElementById("Financial Services").checked) {
			jtypes[j] = "Financial Services";
			j += 1;
		}
		if (document.getElementById("IT").checked) {
			jtypes[j] = "IT";
			j += 1;
		}
		if (document.getElementById("Banking").checked) {
			jtypes[j] = "Banking";
			j += 1;
		}
		if (document.getElementById("jOthers").checked) {
			jtypes[j] = "Others";
			j += 1;
		}
	
		console.log(jtypes);
	}
	function apply(path, id, end) {		
		console.log(path + " "+id+ " " + end)
		if(ctypes.length == 0)
			ctypes = [];
		if(jtypes.length == 0)
			jtypes = [];
		if(path == 'jobs_admin.jsp') {			
			document.location = "/Notifier/jobs_admin?companytype=" + ctypes + "&jobtype=" + jtypes;
		} else if(path == 'empr_jobs.jsp') {			
			document.location = "/Notifier/empr_jobs?id=" + id + "&companytype=" + ctypes + "&jobtype=" + jtypes;
		} else if(path == 'emp-home.jsp') {			
			document.location = "/Notifier/empr-home?id=" + id + "&companytype=" + ctypes + "&jobtype=" + jtypes;
		} else if(end.startsWith("id")) {
			document.location = "/Notifier/rcmd_jobs?id="+id+"&companytype=" + ctypes + "&jobtype=" + jtypes;
		} else {
			document.location = "/Notifier/home?companytype=" + ctypes + "&jobtype=" + jtypes;
		}
	}
	
	function updateJob(jobid) {
		
		document.location = "/Notifier/update_job?jobid=" + jobid;
	}
	function deleteJob(jobid, role, eid) {
// 		alert(jobid = " " + role + " " + eid)
		console.log(jobid + " " + role + " " + eid);
		document.location = "/Notifier/deleteJobdetails?jobid="+ jobid + "&role=" + role + "&empid=" + eid;
	}
	
	function applyjob(jobid, role, id, empid) {
		
		console.log(jobid + " " + role + " " + id + " " + empid);
		document.location = "/Notifier/applyjob?jobid="+jobid+"&empid="+id+"&emprid="+empid
		
// 		setTimeout(() => {
// 			document.getElementById("appbtn").style.visibility= "hidden";
// 			document.getElementById("appbtn").style.innerHTML = "Applied";
// 			document.getElementById("appbtn").style.disabled = true;
// 			//document.location = "/Notifier/home";
// 		}, 1500);	
	}
</script>
</html>