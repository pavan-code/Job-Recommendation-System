<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.card {
	width: 100%;
}

.col {
	/*  	border: 1px solid black;  */
	
}

.left {
	width: 200px !important;
}

.right {
	/* 	width: 70%; */
	
}
input {
	width: 10px;
}
</style>
</head>
<body>
	<%
	String ctypes = request.getParameter("companytype");
	String jtypes = request.getParameter("jobtype");
	String id = request.getParameter("id");
	out.println(id);
	%>
	<div class='container'>
		<div class='row'>
			<div class='col col-3 left'>
				<div class='row'>
					<h4 class='col'>Filters</h4>
					<a class='col' href='/Notifier/home'>Clear filters</a>
				</div>
				<div class='companytype'>
					<b>Company Type</b> <br>					
					<input type='checkbox' onclick="ctypeclicked()" id="MNC" name='MNC'
						<%if (ctypes != null && ctypes.contains("MNC")) {
							out.print("checked=\"checked\"");
						}%>/> MNC <br> 
					<input type='checkbox' onclick="ctypeclicked()"	id="Corporate" name='Corporate'
					<%if (ctypes != null && ctypes.contains("Corporate")) {
							out.print("checked=\"checked\"");
						}%>/> Corporate <br> 
					<input type='checkbox' onclick="ctypeclicked()" id="Startup" name='Startup'
					<%if (ctypes != null && ctypes.contains("Startup")) {
							out.print("checked=\"checked\"");
						}%>/> Startup <br>
					<input type='checkbox' onclick="ctypeclicked()" id="Govt" name='Govt/PSU'
					<%if (ctypes != null && ctypes.contains("Govt/PSU")) {
							out.print("checked=\"checked\"");
						}%>/> Govt/PSU <br> 
					<input type='checkbox' onclick="ctypeclicked()"	id="Others" name='Others'
					<%if (ctypes != null && ctypes.contains("Others")) {
							out.print("checked=\"checked\"");
						}%>/> Others <br>
				</div>
				<div class='jobtype'>
					<b>Job Type</b> <br>					
					<input type='checkbox' onclick="ctypeclicked()" id="Accounting" name='Accounting'
						<%if (jtypes != null && jtypes.contains("Accounting")) {
							out.print("checked=\"checked\"");
						}%>/> Accounting <br> 
					<input type='checkbox' onclick="ctypeclicked()"	id="IT" name='IT'
					<%if (jtypes != null && jtypes.contains("IT")) {
							out.print("checked=\"checked\"");
						}%>/> IT <br> 
					<input type='checkbox' onclick="ctypeclicked()" id="BPO" name='BPO'
					<%if (jtypes != null && jtypes.contains("BPO")) {
							out.print("checked=\"checked\"");
						}%>/> BPO <br>
					<input type='checkbox' onclick="ctypeclicked()" id="Financial Services" name='Financial Services'
					<%if (jtypes != null && jtypes.contains("Financial Services/PSU")) {
							out.print("checked=\"checked\"");
						}%>/> Financial Services <br> 
					<input type='checkbox' onclick="ctypeclicked()"	id="jOthers" name='Others'
					<%if (jtypes != null && jtypes.contains("Others")) {
							out.print("checked=\"checked\"");
						}%>/> Others <br>
				</div>
				<div class='row'>
					<button onclick="apply(${id})" class='btn btn-secondary'>Apply
						filter</button>					
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
								<h4 class='card-title'>${job.jobname}
									| <span class='badge badge-pill badge-primary'>${job.jobtype}</span>
								</h4>
								<h5 class='card-subtitle mb-2 text-muted'>${job.company}|
									${job.companytype}</h5>
								<div class='card-text'>
									<div>
										<span class='font-weight-bold'>Min. Experience: </span> <span>${job.minexperience}
											Yrs.</span>
									</div>
									<div>
										<span class='font-weight-bold'>Expected Salary: </span> <span>&#8377;
											${job.salary} LPA</span>
									</div>
									<div>
										<span class='font-weight-bold'>Location: </span> <span>${job.location}</span>
									</div>
									<div>
										<span class='font-weight-bold'>Skills: </span> <span>${job.skills}</span>
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
		let i = 0
		console.log("clicked");
		if (document.getElementById("MNC").checked) {
			ctypes[i] = "MNC";
			i += 1;
		} else {
			ctypes.splice(ctypes.indexOf("MNC"), 1)
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
		} else {
			jtypes.splice(jtypes.indexOf("Accounting"), 1)
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
		if (document.getElementById("jOthers").checked) {
			jtypes[j] = "Others";
			j += 1;
		}
	
		console.log(jtypes);
	}
	function apply(id) {
		if(ctypes.length == 0)
			ctypes = [];
		if(jtypes.length == 0)
			jtypes = [];
// 		if(id != null)
// 			document.location = "/Notifier/rcmd_jobs?id="+id+"?companytype=" + ctypes + "&jobtype=" + jtypes;
// 		else
			document.location = "/Notifier/home?companytype=" + ctypes + "&jobtype=" + jtypes;
	}
</script>
</html>