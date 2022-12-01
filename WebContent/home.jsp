<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Employee | Home</title>
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
	<%
	java.util.Map<String, String> msg = (java.util.Map<String, String>) request.getAttribute("messages");
	String message = "";
	if (msg != null) {
		message = msg.get("message");
		// 		out.println(message);
	}
	String eid = request.getParameter("id");
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
	<div id="errmsg"
		<%if (message.startsWith("Applied")) {
			out.println("style=\" visibility: visible;width: 400px; margin: 0 auto; height: 56px; padding: 12px 20px;\" class=\"alert alert-success\"");
		} else if (message.startsWith("Already")) {
			out.println("class=\"alert alert-danger\" style=\" visibility: visible; width: 400px; margin: 0 auto; height: 56px; padding: 12px 20px;\"");
		} else {
			out.println("style=\" visibility: hidden; width: 0; height: 0; padding: 0; margin: 0;\"");
		}
		%>>
		<%if (message != null)
			out.println(message);
		%>
		<button class='btn' onclick="closed()">X</button>
	</div>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class='center' align='center'>
		<button onclick="alljobs()" class='cb'>All Jobs</button>
		<button	onclick="recommendedjobs(${id})" class='cb'>Recommended Jobs</button>
		<button onclick="appjobs(${id})" class='cb'>View Applied Jobs</button>
	</div>
	<div class='containers'>
		<h3 align='center'>Find your dream job now with Konnect</h3>
		<jsp:include page="jobs.jsp">
			<jsp:param value="<%=request.getAttribute(\"jobs\")%>" name="jobs" />
			<jsp:param value="${eid}" name="eid" />
		</jsp:include>
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
		
		function closed() {
// 			alert('clicked')
			console.log('sdfsdf')
			document.getElementById("errmsg").innerHTML = "";
			document.getElementById("errmsg").style.visibility = "hidden";
			document.getElementById("errmsg").style.width = "0";
			document.getElementById("errmsg").style.height= "0";
			document.getElementById("errmsg").style.margin= "0";
			document.getElementById("errmsg").style.padding= "0";
			document.getElementById("errmsg").classList.remove("alert")
		}
		
	</script>
</body>
</html>
