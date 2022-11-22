<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
</style>
</head>
<body>
	<div class="container">
		<div class='row'>			
			<div class='login'>
				<div class='form'>
					<div style='text-align: center;'>
						<h2>Login</h2>
					</div>
					<hr>
					<form method="post" action="login">
						<div>
							<label>Email</label> <br>
							<input type="text" name="email" class="form-control" required>
							<span style='color: red;'>${messages.email}</span>
						</div> <br>
						<div>
							<label>Password</label> <br>
							<input type="password" name="password" class="form-control" required>
							<span style='color: red;'>${messages.password}</span>
						</div> <br>
						<div>
							<label>Role</label>
							<select class='form-control' name='type' required>
								<option>--select role--</option>
								<option>Employee</option>
								<option>Employer</option>
								<option>Admin</option>
							</select>
						</div> <br>
						<div style='text-align: center;'>
							<button class="btn btn-success" style='width: 100%;' type="submit">Login</button>
						</div> <br>						
					</form>
					Register new <a href="register.jsp">Employee</a>/<a href='RegisterEmployer.jsp'>Employer</a>
				</div>		
			</div>			
		</div>
	</div>
	
</body>
</html>