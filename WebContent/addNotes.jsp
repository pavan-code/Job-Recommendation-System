<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Notes</title>
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

	<div class="modal fade" id="addNotes" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Add New Notes</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">
					<%
						int nid = Integer.parseInt(request.getParameter("nid"));
						int id = 0;
						Cookie cookies[] = request.getCookies();
						for (Cookie c : cookies) {
							if (c.getName().equals(("id"))) {
								id = Integer.parseInt(c.getValue());								
							}
						}						
					%>
					<form
						action='addNotes?sid=<%=id%>&nid=${nid}&book=<%=request.getParameter("book")%>'
						method='post'>

						<div class='form-group'>
							<label>Note name</label> <input type='text' class='form-control'
								name='name' id='name' value="">
						</div>
						<div class='row'>
							<div class='col'>
								<div class='form-group'>
									<label for="startDate">Start Date</label> <input type='date'
										class='form-control' name='startDate' id='startDate' value=""
										required>
								</div>
							</div>
							<div class='col'>
								<div class='form-group'>
									<label for="endDate">End Date</label> <input type='date'
										class='form-control' name='endDate' id='endDate' value=''
										required>
								</div>
							</div>
							<div class='col'>
								<div class='form-group'>
									<label for="remDate">End Date</label> <input type='date'
										class='form-control' name='remDate' id='remDate' value=''
										required>
								</div>
							</div>
						</div>
						<div class='row'>
							<div class='form-group col'>
								<label for="status">Status</label> <select class='form-control'
									id='status' name='status' value=''>
									<option>Started</option>
									<option>Completed</option>
								</select>
							</div>
							<div class='form-group col'>
								<label for='tag'>Tag:</label> <select class='form-control'
									id='tag' name='tag' value=''>
									<option>Private</option>
									<option>Public</option>
								</select>
							</div>
						</div>
						<div class='form-group'>
							<label>Description</label>
							<textarea type='text' class='form-control' name='description'
								id='description' value='' required></textarea>
						</div>
						<br>
						<div class='float-right'>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type='submit' class='btn btn-success'>Save Notes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>