<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Employer</title>
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
#errmsg {
	width: 400px;
	height: 56px;
	margin: 0 auto;
	padding: 12px 20px;
	text-align: center;
	visibility: hidden;
}
</style>
</head>
<body>
	<div class="container">
		<div id="errmsg" class='alert alert-danger'></div>
		<div class='row'>
			<div class='register'>
				<div class='form'>
					<div style='text-align: center;'>
						<h2>Register Employer</h2>
					</div>
					<hr>
					<form name='regform' action="registerEmployer" method="post"
						onSubmit="return validate(event);">
						<div class='row'>
							<div class='col'>
								<label>Email</label> <br> <input type="text" name="email"
									class="form-control" >
							</div>
							<br>
							<div class='col'>
								<label>Employer Name</label> <br>
								<input type="text" name="username"
									class="form-control" > 
							</div>
							<br>
						</div>
						<div class='row'>
							<div class='col'>
								<label>Mobile Number</label> <br> <input type="text"
									name="mobile" class="form-control" >
							</div>
							<br>
							<div class='col'>
								<label>Password </label> <br> <input type="password"
									name="password" class="form-control" >
							</div>
							<br>
						</div>
						<div class='row'>
							<div class='col'>
								<label>Address</label> <br> <input type="text"
									name="address" class="form-control" >
							</div>
							<br>
							<div class='col'>
								<label>Company</label> <br> <input type="text"
									name="company" class="form-control" >
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
			    return false;  
			} 
		  if(email == null || email == "") {
				console.log("email is null")
				document.getElementById("errmsg").innerHTML ="Please enter the Email ID";
				document.getElementById("errmsg").style.visibility= "visible";
				return false;			
			}
		if(username == null || username == "") {
			console.log("username is null")
			document.getElementById("errmsg").innerHTML ="Please enter the Username";
			document.getElementById("errmsg").style.visibility= "visible";
			return false;			
		} else if(username.length < 3) {
			console.log("user len")
			document.getElementById("errmsg").innerHTML ="Username must be at least 3 chars long";
			document.getElementById("errmsg").style.visibility= "visible";
			return false;			
		}  else if(mobile == null || mobile == "") {
			console.log("mob null")
			document.getElementById("errmsg").innerHTML ="Please enter the mobile number";
			document.getElementById("errmsg").style.visibility= "visible";
			return false;
		} else if(mobile.length <10 || mobile.length > 10) {
			console.log("mob len ")
			document.getElementById("errmsg").innerHTML ="Please enter 10 digit mobile number";
			document.getElementById("errmsg").style.visibility= "visible";
			return false;
		} else if(password == null || password == "") {
			console.log("paass null")
			document.getElementById("errmsg").innerHTML ="Please enter the password";
			document.getElementById("errmsg").style.visibility= "visible";
			return false;
		} else if(password.length < 3) {
			console.log("pass less 3")
			document.getElementById("errmsg").innerHTML ="Password must be at least 6 chars long";
			document.getElementById("errmsg").style.visibility= "visible";
			return false;			
		}  else if(address == null || address == "") {
			console.log("address null")
			document.getElementById("errmsg").innerHTML ="Please enter the Address";
			document.getElementById("errmsg").style.visibility= "visible";
			return false;			
		} else if(company == null || company == "") {
			console.log("xep null")
			document.getElementById("errmsg").innerHTML ="Please enter the company name";
			document.getElementById("errmsg").style.visibility= "visible";
			return false;
		}  else {
			console.log("last else")
			document.getElementById("errmsg").style.visibility= "hidden";
			document.regform.submit();
		}
				
	}
	
</script>
</html>