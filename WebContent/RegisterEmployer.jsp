<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Job Provider</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
html {
	height: 100%;
	margin: 0;
	padding: 0;
}
p {
	text-align: center;
}
body {
	background: url(/welcome_image.jpg);
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
a:hover {
	text-decoration: none;
}
.form {
	width: 640px;
	margin: 10px auto;
}

.register {
	margin: auto;
	padding: 15px;
	/* 	border: 1px solid gray; */
	border-radius: 8px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	z-index: 2;
	box-shadow: 1px 1px 10px 5px lightblue;
}

#errmsg {
	width: 400px;
	height: 56px;
	margin: 0 auto;
	padding: 12px 20px;
	text-align: center;
	visibility: hidden;
}

body {
	background: #3399ff;
	overflow-y: hidden;
}

.circle {
	position: absolute;
	border-radius: 50%;
	background: white;
	animation: ripple 15s infinite;
	box-shadow: 0px 0px 1px 0px #508fb9;
}

.sm {
	width: 200px;
	height: 200px;
	left: -100px;
	bottom: -100px;
}

.m {
	width: 400px;
	height: 400px;
	left: -200px;
	bottom: -200px;
}

.l {
	width: 600px;
	height: 600px;
	left: -300px;
	bottom: -300px;
}

.xl {
	width: 800px;
	height: 800px;
	left: -400px;
	bottom: -400px;
}

.xxl {
	width: 1000px;
	height: 1000px;
	left: -500px;
	bottom: -500px;
}

.s1 {
	opacity: 0.2;
}

.s2 {
	opacity: 0.5;
}

.s3 {
	opacity: 0.7;
}

.s4 {
	opacity: 0.8;
}

.s5 {
	opacity: 0.9;
}

@keyframes ripple { 
	0%{
		transform: scale(0.8);
	}
	50% {
		transform:scale(1.2);
	}
	100%{
		transform:scale(0.8);
	}
}
label {
	font-weight: bold;
}
</style>
</head>
<body>
	<div class='rbg'>
		<div class='circle xxl s1'></div>
		<div class='circle xl s2'></div>
		<div class='circle l s3'></div>
		<div class='circle m s4'></div>
		<div class='circle sm s5'></div>
	</div>
	<div class="container">
		<%
		java.util.Map<String, String> msg = (java.util.HashMap<String, String>) request.getAttribute("messages");
		// 	out.println(msg);
		String message = "";
		if (msg != null) {
			message = msg.get("message");
			// 		out.println(message);
		}
		%>
		<c:if test="${message != \"\"}">
			<div class="alert alert-danger"
				<%if (message != "") {
	out.println("style=\" visibility: visible; width: 400px; margin: 0 auto; height: 56px; padding: 12px 20px;\"");
}%>
				id="errmsg">
				<%
				out.println(message);
				%>
			</div>
		</c:if>
		<div class='row'>
			<div class='register'>
				<div class='form'>
					<div style='text-align: center;'>
						<h2>Register Job Provider</h2>
					</div>
					<hr>
					<form name='regform' action="registerEmployer" method="post"
						onSubmit="return validate(event);">
						<div class='row'>
							<div class='col'>
								<label>Email</label> <br> <input type="text" name="email"
									id='email' class="form-control">
							</div>
							<br>
							<div class='col'>
								<label>Job Provider Name</label> <br> <input type="text"
									name="username" id='username' class="form-control">
							</div>
							<br>
						</div>
						<div class='row'>
							<div class='col'>
								<label>Mobile Number</label> <br> <input type="text"
									id='mobile' name="mobile" class="form-control">
							</div>
							<br>
							<div class='col'>
								<label>Password </label> <br> <input type="password"
									id='password' name="password" class="form-control">
							</div>
							<br>
						</div>
						<div class='row'>
							<div class='col'>
								<label>Address</label> <br> <input type="text" id='address'
									name="address" class="form-control">
							</div>
							<br>
							<div class='col'>
								<label>Company</label> <br> <input type="text" id='company'
									name="company" class="form-control">
							</div>
							<br>
						</div>

						<br>
						<div style='text-align: center;'>
							<input class="btn btn-primary" style='width: 100%;' type="submit"
								value="Register">
						</div>
						<br>
					</form>
					<p>
						Already have an account? <a href="index.jsp">Login</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	function validate(event) {
		event.preventDefault();
		var username = document.regform.username.value;
		var email = document.regform.email.value;
		var mobile = document.regform.mobile.value;
		var password = document.regform.password.value;
		var address = document.regform.address.value;
		var company = document.regform.company.value;
		const c = console.log.bind(document);
		c("=========================")
		c("username: " + username)
		console.log("email: " + email)
		console.log("mobile: " + mobile)
		console.log("password: " + password)
		console.log("address: " + address)
		console.log("company: " + company)
		
		var atposition=email.indexOf("@");  
		  var dotposition=email.lastIndexOf(".");  
		  console.log(atposition + " " + dotposition)
		  console.log(atposition<1 || dotposition<atposition+2 || dotposition+2>=email.length)
		  if (atposition<1 || dotposition<atposition+2 || dotposition+2>=email.length){
			  console.log("email not valid")
			    document.getElementById("errmsg").innerHTML ="Please enter a valid Email ID";
				document.getElementById("errmsg").style.visibility= "visible";
				document.getElementById("email").style.borderColor= "red";
				document.regform.email.focus();

			    return false;  
			} 
		  if(email == null || email == "") {
				console.log("email is null")
				document.getElementById("errmsg").innerHTML ="Please enter the Email ID";
				document.getElementById("errmsg").style.visibility= "visible";
				document.getElementById("email").style.borderColor= "red";
				document.regform.email.focus();

				return false;			
			}
		  if(email != null) {
			  document.getElementById("email").style.borderColor= "";				
			}
		if(username == null || username == "") {
			document.getElementById("email").style.borderColor= "";
			console.log("username is null")
			document.getElementById("errmsg").innerHTML ="Please enter the Username";
			document.getElementById("errmsg").style.visibility= "visible";
			document.getElementById("username").style.borderColor= "red";
			document.regform.username.focus();
			return false;			
		} else if(username.length < 3) {
			document.getElementById("email").style.borderColor= "";
			console.log("user len")
			document.getElementById("errmsg").innerHTML ="Username must be at least 3 chars long";
			document.getElementById("errmsg").style.visibility= "visible";
			document.getElementById("username").style.borderColor= "red";
			document.regform.username.focus();
			return false;			
		}  else if(mobile == null || mobile == "") {
			document.getElementById("username").style.borderColor= "";
			console.log("mob null")
			document.getElementById("errmsg").innerHTML ="Please enter the mobile number";
			document.getElementById("errmsg").style.visibility= "visible";
			document.getElementById("mobile").style.borderColor= "red";
			document.regform.mobile.focus();
			return false;
		} else if(mobile.length <10 || mobile.length > 10) {
			document.getElementById("username").style.borderColor= "";
			console.log("mob len ")
			document.getElementById("errmsg").innerHTML ="Please enter 10 digit mobile number";
			document.getElementById("errmsg").style.visibility= "visible";
			document.getElementById("mobile").style.borderColor= "red";
			document.regform.mobile.focus();
			return false;
		} else if(password == null || password == "") {
			document.getElementById("mobile").style.borderColor= "";
			console.log("paass null")
			document.getElementById("errmsg").innerHTML ="Please enter the password";
			document.getElementById("errmsg").style.visibility= "visible";
			document.getElementById("password").style.borderColor= "red";
			document.regform.password.focus();
			return false;
		} else if(password.length < 6) {
			document.getElementById("mobile").style.borderColor= "";
			console.log("pass less 3")
			document.getElementById("errmsg").innerHTML ="Password must be at least 6 chars long";
			document.getElementById("errmsg").style.visibility= "visible";
			document.getElementById("password").style.borderColor= "red";
			document.regform.password.focus();
			return false;			
		}  else if(address == null || address == "") {
			document.getElementById("password").style.borderColor= "";
			console.log("address null")
			document.getElementById("errmsg").innerHTML ="Please enter the Address";
			document.getElementById("errmsg").style.visibility= "visible";
			document.getElementById("address").style.borderColor= "red";
			document.regform.address.focus();
			return false;			
		} else if(company == null || company == "") {
			document.getElementById("address").style.borderColor= "";
			console.log("xep null")
			document.getElementById("errmsg").innerHTML ="Please enter the company name";
			document.getElementById("errmsg").style.visibility= "visible";
			document.getElementById("company").style.borderColor= "red";
			document.regform.company.focus();
			return false;
		}  else {
			document.getElementById("company").style.borderColor= "";
			console.log("last else")
			document.getElementById("errmsg").style.visibility= "hidden";
			document.regform.submit();
		}
				
	}
	
</script>
</html>