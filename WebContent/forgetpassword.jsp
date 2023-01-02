<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
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

p {
	text-align: center;
}

body {
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.form {
	width: 340px;
	margin: 10px auto;
}

a:hover {
	text-decoration: none;
}

.forgot {
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

@
keyframes ripple { 0%{
	transform: scale(0.8);
}

50








%
{
transform








:








scale






(








1






.2








)






;
}
100








%
{
transform








:








scale






(








0






.8








)






;
}
}
.roles {
	display: flex;
	justify-content: space-between;
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
	<%
	String otp = (String) request.getAttribute("OTP");
	String status = (String) request.getAttribute("status");
	out.println("OTP: " + otp);
// 	out.println(status);
	request.setAttribute("otp", otp);
	request.setAttribute("status", status);
	%>
	<div class="container">
		<div class='row'>
			<div class='forgot'>
				<div class='form'>
					<div style='text-align: center;'>
						<h2>Reset Password</h2>
					</div>
					<hr>
					<form name="forgotform" method="post" action="login"
						onSubmit="return validate(event);">
						<c:if test="${otp == null && status == null}">
							<div>
								<label>Registered Email</label> <br> <input id='email' type="text"
									name="email" class="form-control" required> <br>
								<button class='btn btn-info btn-block btn-sm' onclick="getotp()">Get
									OTP</button>
							</div>
						</c:if>

						<c:if test="${otp != null}">
							<p>Please enter the OTP sent to your Registered Email ID.</p>
							<div>
								<input id='otp' type="number" name="otp" class="form-control">
								<br>
								<button class='btn btn-info btn-block btn-sm'
									onclick="submitotp()">Submit OTP</button>

							</div>
						</c:if>
						<c:if test="${status == 'matched' }">
							<div>
								<label>Enter New Password</label> <input type='password'
									name='pass' id='pass' class='form-control' />
								<label>Confirm New Password</label> <input type='password'
									name='newpass' id='newpass' class='form-control' /> <br>
								<button class='btn btn-info btn-sm btn-block' onclick="changepass()">Change Password</button>
							</div>
						</c:if>
						<br>

					</form>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
function changepass() {
	var pass = document.getElementById("pass").value;
	var newpass = document.getElementById("newpass").value;
// 	alert(pass + " " + newpass);
	if(pass == newpass) {
		document.location = "sendotpforreset?p=" + pass;
	}
}
	function getotp() {		
		var email = document.getElementById("email").value;
		if(email == null || email == "") {
			alert("Please enter a valid email address")
		} else
		document.location = "sendotpforreset?email=" + email;
	}
	function submitotp() {
		var otp = document.getElementById("otp").value
		document.location = "sendotpforreset?otp=" + otp;
	}
	function showpassword() {
		if(document.getElementById("show").checked) {
			document.getElementById("password").type = "text";
		} else {
			document.getElementById("password").type = "password";
		}
		
	}
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
	    document.getElementById("errmsg").style.margin = "0 auto";
	    return false;  
	    }  
				  
		if (email == null || email == "") {
// 			alert("Please enter the Email ID");
			document.getElementById("errmsg").innerHTML ="Please enter the Email ID";
			document.getElementById("errmsg").style.width = "400px";
			document.getElementById("errmsg").style.height = "56px";
			document.getElementById("errmsg").style.padding = "12px 20px";
			document.getElementById("errmsg").style.margin = "0 auto";
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