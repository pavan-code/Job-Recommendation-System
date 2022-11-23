<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
html {
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	background-image: url(./notes.jpg);
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.form {
	width: 340px;
	margin: 10px auto;
}

.login {
	margin: auto;
	padding: 15px;
	border: 1px solid gray;
	border-radius: 8px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
}

#errmsg {
	width: 0;
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>
	<%
	java.util.Map<String, String> msg = (java.util.HashMap<String, String>) request.getAttribute("messages");
	// 	out.println(msg);
	String message = "";
	if (msg != null) {
		message = msg.get("message");
	}
	%>
	<div class="container">
		<c:if test="${message != \"\"}">
			<div class="alert alert-danger"
				<%if (message != "") {
	out.println("style=\"width: 400px; height: 56px; padding: 12px 20px;\"");
}%>
				<%if (message == "") {
				out.println("style=\"width: 0;height: 0; padding:0; margin:0;\"");
			}%>
				id="errmsg" role="alert">
				<%
				out.println(message);
				%>
			</div>
		</c:if>
		<div class='row'>
			<div class='login'>
				<div class='form'>
					<div style='text-align: center;'>
						<h2>Login</h2>
					</div>
					<hr>
					<form name="loginform" method="post" action="login"
						onSubmit="return validate(event);">
						<div>
							<label>Email</label> <br> <input type="text" name="email"
								class="form-control"> <span style='color: red;'>${messages.email}</span>
						</div>
						<br>
						<div>
							<label>Password</label> <br> <input type="password"
								name="password" class="form-control"> <span
								style='color: red;'>${messages.password}</span>
						</div>
						<br>
						<div>
							<label>Role</label> <select class='form-control' name='type'>
								<!-- 								<option>--select role--</option> -->
								<option>Employee</option>
								<option>Employer</option>
								<option>Admin</option>
							</select>
						</div>
						<br>
						<div style='text-align: center;'>
							<input class="btn btn-primary" style='width: 100%;' type="submit"
								value="Login" />
						</div>
						<br>
					</form>
					Register new <a href="register.jsp">Employee</a>/<a
						href='RegisterEmployer.jsp'>Employer</a>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	function validate(event) {
		event.preventDefault(); // this will prevent the submit event.
		var email = document.loginform.email.value;
		var password = document.loginform.password.value;
// 		alert(email + " " + password)
	  var atposition=email.indexOf("@");  
	  var dotposition=email.lastIndexOf(".");  
	  if (atposition<1 || dotposition<atposition+2 || dotposition+2>=email.length){  
// 	    alert("Please enter a valid e-mail address!");
	    document.getElementById("errmsg").innerHTML ="Please enter a valid Email ID";
	    document.getElementById("errmsg").style.width = "400px";
	    document.getElementById("errmsg").style.height = "56px";
	    document.getElementById("errmsg").style.padding = "12px 20px";
	    return false;  
	    }  
				  
		if (email == null || email == "") {
// 			alert("Please enter the Email ID");
			document.getElementById("errmsg").innerHTML ="Please enter the Email ID";
			document.getElementById("errmsg").style.width = "400px";
			document.getElementById("errmsg").style.height = "56px";
			document.getElementById("errmsg").style.padding = "12px 20px";
			return false;
		} else if (password ==null || password == "") {
			document.getElementById("errmsg").innerHTML ="Please enter the Password";
			document.getElementById("errmsg").style.width = "400px";
			document.getElementById("errmsg").style.height = "56px";
			document.getElementById("errmsg").style.padding = "12px 20px";
// 			alert("Please enter the Password");
			return false;
		} else {			
			document.loginform.submit();
		}
	}
</script>
</html>