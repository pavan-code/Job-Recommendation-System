<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.card {
	width: 100%;
}

.img {
	/* 	border: 1px solid black; */
	text-align: center;
	
}

img {
	border-radius: 50%;
	height: 100px;
}

.left {
	width: 200px !important;
}

.right {
	/* 	width: 70%; */
	
}
</style>
</head>
<body>
	<%
	// 		if (request.getAttribute("role").equals("Employee")) {
	java.util.List<com.lms.models.Employee> emps = (java.util.List<com.lms.models.Employee>) request
			.getAttribute("employees");

	// 	out.println(emp);
// 	for (com.lms.models.Employee emp : emps) {
// 		if (emp.getImage() != null) {
// 			java.io.InputStream inputStream = emp.getImage();

// 			java.io.ByteArrayOutputStream outputStream = new java.io.ByteArrayOutputStream();
// 			byte[] buffer = new byte[4096];
// 			int bytesRead = -1;

// 			while ((bytesRead = inputStream.read(buffer)) != -1) {
// 		outputStream.write(buffer, 0, bytesRead);
// 			}

// 			byte[] imageBytes = outputStream.toByteArray();

// 			String img = java.util.Base64.getEncoder().encodeToString(imageBytes);

// 			emp.setImgstr(img);
// 		}
// 	}
	%>

	<div class='containers'>
		<div class='row'>
		
			<div class='col right'>
				<c:if test="${employees.size() == 0}">
					<h3>No employees to display!</h3>
				</c:if>
				<c:if test="${employees.size() != 0}">
					
					<br>
					<c:forEach var="emp" items="${employees}">
						<div class="card shadow p-3 mb-3 bg-white rounded">
							<div class="card-body">
								<div class='row'>
									<div class='img col-3'>
<%-- 										<img alt="" src="${pageContext.request.contextPath}/WebContent/images/${emp.image}" --%>
<!-- 											width='100px'> -->
											<img alt="employee profile pic" src="/WebContent/images/${emp.image}"
											width='100px'>
										<h4 class='card-title'>${emp.username}
											
										</h4>
									</div>
									<div class='col'>

										<div class='card-text'>
											<div>
												<span class='font-weight-bold'>Email: </span> <span>${emp.email}
												</span>
											</div>
											<div>
												<span class='font-weight-bold'>Mobile: </span> <span>+91
													${emp.mobile} </span>
											</div>
											<div>
												<span class='font-weight-bold'>Experience: </span> <span>${emp.experience}
													Yrs.</span>
											</div>

											<div>
												<span class='font-weight-bold'>Skills: </span>
												<%
												String skills = ((com.lms.models.Employee) (pageContext.findAttribute("emp"))).getSkills();

												if (skills != null) {

													String[] sks = skills.split(",");
													for (String sk : sks)
														out.println(sk + " | ");
												} else {
													out.println("No Skills");
												}
												%>
											</div>
											<div>
												<span class='font-weight-bold'>Address: </span> <span>${emp.address}
												</span>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>

		</div>
	</div>
</body>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</html>