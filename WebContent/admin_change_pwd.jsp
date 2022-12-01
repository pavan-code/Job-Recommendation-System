<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin | Change Password</title>
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
	width: 90% !important;
	margin: 0 auto;
}

.form {
	width: 340px;
	margin: 10px auto;
}

#errmsg {
	width: 400px;
	height: 56px;
	top: 10px;
	padding: 12px 20px;
	text-align: center;
	visibility: hidden;
	margin: 0 auto;
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
	<div class='center'>
		<button onclick="jobs()" class='cb'>All Jobs</button>
		<button onclick="employees()" class='cb'>All Job Seekers</button>
		<button onclick="employers()" class='cb'>All Job Providers</button>
		<button onclick="empUnactive()" class='cb'>Pending Employees</button>
		<button onclick="emprUnactive()" class='cb'>Pending Employers</button>
	</div>
	<%
	java.util.Map<String, String> msg = (java.util.HashMap<String, String>) request.getAttribute("messages");
	// 	out.println(msg);
	String message = "";
	if (msg != null) {
		message = msg.get("message");
// 		out.println(message);
	}
	%>
	<div class='containers'>
		<c:if test="${message != \"\"}">
			<div 
				<%if (message == "success") {
					out.println("style=\" visibility: visible;\" class=\"alert alert-success\"");
				} else if(message != null && message != "") {
					out.println("class=\"alert alert-danger\" style=\" visibility: visible; width: 400px; margin: 0 auto; height: 56px; padding: 12px 20px;\"");
				} else {
					out.println("class=\"alert alert-danger\"");
				}%>	id="errmsg">
				<% if(message != "success" && message != null && message != "")
				out.println(message);
				else
					out.println("Password updated successfully");
				%>
			</div>
		</c:if>
		<br>
		<h3 align='center'>Change Admin Password</h3>
		<div class='form'>
			<hr>
			<form name="pwdchange" method="post" action="adminpwdchange?aid=${id}"
				onSubmit="return validate(event);">
				<div>
					<label>Current Password</label> <br> <input type="password"
						id="password1" name="password1" class="form-control password">
					<label> </label>
				</div>

				<div>
					<label>New Password</label> <br> <input type="password"
						id="password2" name="password2" class="form-control password">
					<label> </label>
				</div>
				<div>
					<label>Confirm New Password</label> <br> <input
						type="password" id="password3" name="password3"
						class="form-control password"> <label> </label>
				</div>
				<label> <input onchange="showpassword()" type="checkbox"
					id="show"> Show Passwords
				</label> <br> <input class="btn btn-primary btn-block" type="submit"
					value="Change Password" /> <br>
			</form>
		</div>

	</div>
	<script>
		function showpassword() {
			if (document.getElementById("show").checked) {
				document.getElementsByClassName("password")[0].type = "text";
				document.getElementsByClassName("password")[1].type = "text";
				document.getElementsByClassName("password")[2].type = "text";
			} else {
				document.getElementsByClassName("password")[0].type = "password";
				document.getElementsByClassName("password")[1].type = "password";
				document.getElementsByClassName("password")[2].type = "password";
			}

		}

		function validate(event) {
			event.preventDefault();
			var p1 = document.pwdchange.password1.value;
			var p2 = document.pwdchange.password2.value;
			var p3 = document.pwdchange.password3.value;

			if (p1 == null || p1 == "") {
				//	 			alert("Please enter the Email ID");
				document.getElementById("errmsg").innerHTML = "Please enter current password";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("password1").style.borderColor = "red";
				document.pwdchange.password1.focus();
				return false;
			} else if (p2 == null || p2 == "") {
				document.getElementById("password1").style.borderColor = "";
				document.getElementById("errmsg").innerHTML = "Please enter new password";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("password2").style.borderColor = "red";
				document.pwdchange.password2.focus();
				return false;
			} else if (p2.length < 6) {
				document.getElementById("errmsg").innerHTML = "Password should be at least 6 characters";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("password2").style.borderColor = "red";
				document.pwdchange.password2.focus();
				return false;
			} else if (p3 == null || p3 == "") {
				document.getElementById("password2").style.borderColor = "";
				document.getElementById("errmsg").innerHTML = "Please confirm new password";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("password2").style.borderColor = "red";
				document.pwdchange.password3.focus();
				return false;
			} else if (p3.length < 6) {
				document.getElementById("errmsg").innerHTML = "Password should be at least 6 characters";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("password3").style.borderColor = "red";
				document.pwdchange.password3.focus();
				return false;
			} else if (p2 != p3) {
				document.getElementById("password2").style.borderColor = "";
				document.getElementById("errmsg").innerHTML = "Password does not match";
				document.getElementById("errmsg").style.visibility = "visible";
				document.getElementById("password3").style.borderColor = "red";
				document.pwdchange.password3.focus();
				return false;
			} else {
				document.getElementById("password2").style.borderColor = "";
				document.getElementById("password3").style.borderColor = "";
				document.pwdchange.submit();
			}
		}

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
