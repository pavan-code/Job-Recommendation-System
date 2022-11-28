<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Success</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<style>
.progress {
   width: 134.4px;
   height: 24.6px;
   border-radius: 22.4px;
   color: #3ab52e;
   border: 2.2px solid;
   position: relative;
}

.progress::before {
   content: "";
   position: absolute;
   margin: 2.2px;
   inset: 0 100% 0 0;
   border-radius: inherit;
   background: currentColor;
   animation: progress-pf82op 2s infinite;
}

@keyframes progress-pf82op {
   100% {
      inset: 0;
   }
}
</style>
</head>
<body>
	<div class='container mt-4'>
		<div align='center' class='alert alert-success'>
			<p>Login Successful.</p>
		</div>
		<div align='center'>
			<p>Redirecting to Home page..</p>
			<div class="progress"></div>
		</div>
	</div>
	<script>
// 	document.location = "admin";
		setTimeout(function() {
			document.location = "empr-home";
		}, 2000);
	</script>
</body>
</html>