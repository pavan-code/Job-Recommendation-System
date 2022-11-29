<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="styles.css"> -->
<style>
body {
	font-family: "Lato", sans-serif;
}

.cb {
 	background-color: #3f51b5; 
 	border: 1px solid white; 
	color: white;
	min-width: 164px;
	outline: none;
	padding: 6px 12px;
	border-radius: 4px;
	margin: 0 5px;
}

.cb:hover {
	background-color: rgba(63, 81, 181, 0.88)
}

.container {
	background-color: #f1f1f1;
	height: auto;
}

a span {
	font-size: 24px;
	color: white;
}

a:hover {
	text-decoration: none;
}

.sidebar {
	height: 100%;
	width: 0;
	top: 120px;
	position: fixed;
	z-index: 1;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.3s;
	padding-top: 10px;
}

.sidebar a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	width: 100%;
	text-align: left;
	font-size: 20px;
	color: #818181;
	display: block;
	transition: 0.2s;
}

.sidebar a:hover {
	color: #f1f1f1;
	font-size: 21px
}

.main {
	transition: margin-left .3s;
}

.btn {
	margin: 0 5px;
}

.navbar {
	background-color: #3f51b5;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	height: 80px;
/* 	border-radius: 0 0 20px 20px; */
	z-index: 2;
/* 	box-shadow: 1px 1px 10px 10px lightgrey; */
}

.app-name {
	margin: auto 0;
	cursor: pointer;
}

.brand {
	display: flex;
	flex-direction: row;
	align-items: center;
/* 	border: 1px solid black; */
}
/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
	.sidebar {
		padding-top: 15px;
	}
	.sidebar a {
		font-size: 18px;
	}
}

.input {
	margin: 16px 0;
}

.search {
	margin: 10px 0;
	width: 400px;
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	margin: 10px 0;
}

#search {
	padding-right: 35px;
	font-weight: bold;
}

.fa-search {
	position: absolute;
	right: 0;
	padding: 3px 5px;
	margin: auto 4px;
}

</style>
</head>
<body>
	<%
	String id = null;
	Cookie cookie = null;
	Cookie[] cookies = request.getCookies();
	for (Cookie c : cookies) {
		if (c.getName().equals("id")) {
			id = c.getValue();
			request.setAttribute("id", id);
		} else if (c.getName().equals("role")) {
			request.setAttribute("role", c.getValue());
		}
	}
	%>
	<nav class="navbar sticky-top">
	<div class='brand'>
		<button class="btn" onclick="openNav()">
			<i style='font-size: 24px; color: white;' class='fa fa-bars'></i>
		</button>
		<c:if test="${role=='Employee'}">
			<a href='/Notifier/home' class='app-name'><span>Konnect</span></a>
		</c:if>
		<c:if test="${role=='Employer'}">
			<a href='/Notifier/empr-home' class='app-name'><span>Konnect</span></a>
		</c:if>
		<c:if test="${role=='Admin'}">
			<a href='/Notifier/admin-home' class='app-name'><span>Konnect</span></a>
		</c:if>
	</div>
	<!-- 	<div class='search'> --> <!-- 		<form action="search"> --> <!-- 			<div class='form-group input'> -->
	<!-- 				<i class='fa fa-search' style="font-size: 26px;"></i> <input -->
	<!-- 					type='text' id="search" name="search" --> <!-- 					placeholder="Search for jobs.." class='form-control'> -->
	<!-- 			</div> --> <!-- 		</form> --> <!-- 	</div> -->


	<div>
		<!-- 		<button id="noteButton" class='btn btn-dark' data-toggle='modal' -->
		<!-- 			data-target='#addNotes'>New Note</button> -->

		<!-- 		<button id="bookButton" class='btn btn-dark' data-toggle='modal' -->
		<!-- 			data-target='#addNotebook'><i class='fa fa-plus'></i> New Notebook</button> -->

		<!-- 		<button id="bell" class='btn btn-info'> -->
		<!-- 			<i class='fa fa-bell-o' style='color: white; font-size: 20px;'></i><span -->
		<!-- 				class='badge badge-light'>3</span> -->
		<!-- 		</button> -->
		&nbsp;
		<button class='cb' onclick="logout()">
			Log out <i class='fa fa-sign-out'></i>
		</button>
	</div>
	</nav>
	<script>
		var path = window.location.pathname;

		if (path === "/Notifier/notebooks") {
			document.getElementById("bell").style.display = "none";
			document.getElementById("noteButton").style.display = 'none';
			document.getElementById("bookButton").style.display = "";

		} else if (path == "/Notifier/notes") {
			document.getElementById("bell").style.display = "";
			document.getElementById("noteButton").style.display = "";
			document.getElementById("bookButton").style.display = "none";
		} else if (path == "/Notifier/allNotes") {
			document.getElementById("bell").style.display = "";
			document.getElementById("noteButton").style.display = "none";
			document.getElementById("bookButton").style.display = "none";
		}

		var toggle = false;
		function logout() {
			document.cookie.split(';').forEach(
					function(c) {
						console.log(c);
						document.cookie = c.trim().split('=')[0] + '=;'
								+ 'expires=Thu, 01 Jan 1970 00:00:00 UTC;';
					});
			setTimeout(function() {
				window.location.href = "/Notifier";
			}, 1500);
		}
		function openNav() {
			toggle = !toggle;
			if (toggle) {
				document.getElementById("mySidebar").style.width = "250px";
				document.getElementById("main").style.marginLeft = "250px";
			} else {
				document.getElementById("mySidebar").style.width = "0";
				document.getElementById("main").style.marginLeft = "0";
			}
		}
	</script>
</body>
</html>