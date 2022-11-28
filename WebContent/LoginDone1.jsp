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

body{
  background: #3399ff;  
  overflow-y: hidden;
}


.circle{
  position: absolute;
  border-radius: 50%;
  background: white;
  animation: ripple 15s infinite;
  box-shadow: 0px 0px 1px 0px #508fb9;
}

.sm{
  width: 200px;
  height: 200px;
  left: -100px;
  bottom: -100px;
}

.m{
  width: 400px;
  height: 400px;
  left: -200px;
  bottom: -200px;
}

.l{
  width: 600px;
  height: 600px;
  left: -300px;
  bottom: -300px;
}

.xl{
  width: 800px;
  height: 800px;
  left: -400px;
  bottom: -400px;
}

.xxl{
  width: 1000px;
  height: 1000px;
  left: -500px;
  bottom: -500px;
}

.s1{
  opacity: 0.2;
}
.s2{
  opacity: 0.5;
}

.s3{
  opacity: 0.7;
}

.s4{
  opacity: 0.8;
}

.s5{
  opacity: 0.9;
}

@keyframes ripple{
  0%{
    transform: scale(0.8);
  }
  
  50%{
    transform: scale(1.2);
  }
  
  100%{
    transform: scale(0.8);
  }
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
	<div class='container mt-4'>
		<div align='center' class='alert alert-success'>
			<h4>Login Successful.</h4>
		</div>
		<div align='center'>
			<h5>Redirecting to Home page..</h5>
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