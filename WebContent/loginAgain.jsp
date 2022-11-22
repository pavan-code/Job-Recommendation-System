<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redirect</title>
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
</head>
<body>
	<div class='container mt-5'>
		<h2 class='alert alert-danger'>Session Expired</h2>
		<h5>Redirecting to Login page..</h5>
	</div>
	
	<script>
	document.cookie.split(';').forEach(
			function(c) {
				console.log(c);
				document.cookie = c.trim().split('=')[0] + '=;'
						+ 'expires=Thu, 01 Jan 1970 00:00:00 UTC;';
			});
	setTimeout(function() {
		window.location.href = "/Notifier";
	}, 2000);
	</script>
</body>
</html>