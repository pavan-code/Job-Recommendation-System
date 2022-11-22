<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
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

body {
	background: url(/welcome_image.jpg);
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.form {
	width: 640px;
	margin: 10px auto;
}

.register {
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
</style>
</head>
<body>
	<div class="container">
		<div class='row'>
			<div class='register'>
				<div class='form'>
					<div style='text-align: center;'>
						<h2>Register Employee</h2>
					</div>
					<hr>
					<form action="register" method="post">
						<div class='row'>
							<div class='col'>
								<label>Employee Name</label> <br>
								<input type="text" name="username"
									class="form-control" required> 
								<%-- 							<small style='color: red;'>${messages.username}</small> --%>
							</div>
							<br>
							<div class='col'>
								<label>Email</label> <br> <input type="text" name="email"
									class="form-control" required>
							</div>
							<br>
						</div>
						<div class='row'>
							<div class='col'>
								<label>Mobile Number</label> <br> <input type="text"
									name="mobile" class="form-control" required>
							</div>
							<br>
							<div class='col'>
								<label>Password </label> <br> <input type="password"
									name="password" class="form-control" required>
							</div>
							<br>
						</div>
						<div class='row'>
							<div class='col'>
								<label>Address</label> <br> <input type="text"
									name="address" class="form-control" required>
							</div>
							<br>
							<div class='col'>
								<label>Experience</label> <br> <input type="number"
									name="experience" class="form-control" required>
							</div>
							<br>
						</div>
						<div class='row'>
							<div class='col'>
							<label>Profile picture</label>
								<input type='file' name='image' class='form-control' required>
							</div>
						</div>
						
						<br>				
						<div style='text-align: center;'>
							<button class="btn btn-primary" style='width: 100%;'
								type="submit">Register</button>
						</div>
						<br>
	
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>