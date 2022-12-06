<!DOCTYPE html>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- Site Metas -->
<title>OTP Verification</title>
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
#errmsg {
	width: 0;
	margin: 0 auto;
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

@
keyframes ripple { 0%{
	transform: scale(0.8);
}

50
%
{
transform
:
scale(
1.2
);
}
100
%
{
transform
:
scale(
0.8
);
}
}
body {
	text-align: center;
}

form {
	width: 250px;
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
	out.println("OTP: " + session.getAttribute("OTP"));
	String message = (String) request.getAttribute("message");
	// 	out.println(request.getAttribute("message"));
	%>

	<div class="container">

		<div class="alert alert-danger"
			<%if (message != null) {
	out.println("style=\"width: 400px; margin: 0 auto; height: 56px; padding: 12px 20px; visibility: visible\"");
}%>
			<%if (message == "") {
	out.println("style=\"width: 0;height: 0; padding:0; margin:0;\"");
}%>
			id="errmsg" role="alert">
			<%
			out.println(message);
			%>
		</div>


		<div align='center'>
			<h3>Please enter the OTP sent to your registered email!</h3>
			<br>
			<form name='otpform' action="checkOTP" method="post"
				onSubmit="return validate(event);">
				<div>
					<input type="number" id="otp" name="otp" class="form-control"
						placeholder="Enter OTP" />
				</div>
				<br>
				<div>
					<input type="submit" class="btn btn-success btn-sm"
						value='Submit OTP' />
				</div>
			</form>
		</div>
	</div>

	<script>
		function validate(event) {
			event.preventDefault();
			var otp = document.otpform.otp.value;
// 			alert(otp);
			if(otp == "" || otp == null || otp.includes("e") || otp.length <=0 || otp.length > 6) {
				document.getElementById("errmsg").innerHTML ="Please enter a valid 6 digit OTP";
			    document.getElementById("errmsg").style.width = "400px";
			    document.getElementById("errmsg").style.height = "56px";
			    document.getElementById("errmsg").style.padding = "12px 20px";
			    document.getElementById("errmsg").style.margin = "0 auto";
				document.getElementById("errmsg").style.visibility= "visible";

			    return false;			    
			} else {
				document.otpform.submit();
			}					
		}
	</script>
</body>
</html>
