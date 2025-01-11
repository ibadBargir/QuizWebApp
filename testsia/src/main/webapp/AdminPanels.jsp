 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ page import="java.util.List"%>
    <%@ page import="testing.*"%>
    <%@ page import="testing.dbConnection.*"%>
    <%@ page import="testing.servlet.*"%>
    <%@ page import="testing.dao.*"%>
    <%@ page import="testing.model.*"%>
    <%@ page import="testing.dao.*" %>
	
<%@ page import="testing.model.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.IOException"%>
<%@ page import="testing.dbConnection.*"%>
<%@ page import="testing.dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quiz Admin Panel</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #f4f6f9;
}

.admin-header {
	background-color: #2c3e50;
	color: white;
	padding: 15px 0;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.card-custom {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.table-responsive {
	max-height: 400px;
	overflow-y: auto;
}

.btn-custom {
	margin-right: 5px;
}
</style>
</head>
<body>
	<%@ page import="java.util.List"%>
	<%@ page import="testing.*"%>
	<%@ page import="testing.dbConnection.*"%>
	<%@ page import="testing.servlet.*"%>
	<%@ page import="testing.dao.*"%>
	<%@ page import="testing.model.*"%>
	<%@ page import="testing.dao.*"%>

	<div class="admin-header text-center">
		<h2>Quiz Management Dashboard</h2>
	</div>

	<div class="container-fluid mt-4">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-custom" id="manageUsers">
					<div
						class="card-header d-flex justify-content-between align-items-center">
						<h4>User Management</h4>
						<button class="btn btn-success"
							onclick="window.location.href='addnew.jsp';">Add New
							User</button>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>Admission NO</th>
										<th>Full Name</th>
										<th>Email</th>
										<th>Password</th>
										<th>Phone Number</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<%
									UserDAO dao = new UserDAO(DBConnection.getConnection());
									List<Users> list = dao.getAllUsers();

									for (Users users : list) {
									%>
									<tr>
										<td><%=users.getId()%></td>
										<td><%=users.getAnumber()%></td>
										<td><%=users.getFname()%></td>
										<td><%=users.getEmail()%></td>
										<td><%=users.getPswd()%></td>
										<td><%=users.getPnumber()%></td>
										<td class="btn-custom"><a
											href="editUser.jsp?id=<%=users.getId()%>"
											class="btn btn-warning btn-sm">Update</a> <a
											href="deleteUser?id=<%=users.getId()%>"
											class="btn btn-danger btn-sm">Delete</a></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="card card-custom" id="manageQuestions">
					<div
						class="card-header d-flex justify-content-between align-items-center">
						<h4>Question Management</h4>
						<button class="btn btn-primary" data-toggle="modal"
							data-target="#addQuestionModal">Add Question</button>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>Question</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>What is the capital of France?</td>
										<td>
											<button class="btn btn-warning btn-sm">Update</button>
											<button class="btn btn-danger btn-sm">Delete</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="card card-custom" id="manageResults">
					<div class="card-header">
						<h4>Results Management</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>QUIZID</th>
										<th>ID</th>
										<th>SCORE</th>
										<th>Total Questions</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<%
									QuizResultDAO resultDAO = new QuizResultDAO(DBConnection.getConnection());
									List<QuizResult> quizResults = resultDAO.getAllResult();

									for (QuizResult quizResult : quizResults) {
									%>
									<tr>
										<td><%=quizResult.getQuizId()%></td>
										<td><%=quizResult.getId()%></td>
										<td><%=quizResult.getScore()%></td>
										<td><%=quizResult.getTotalQuestions()%></td>

										<td>
											<form action="UpdateResult" method="post"
												class="d-inline-block mr-2">
												<a class="btn btn-warning btn-sm"
													href="UpdateResult.jsp?id=<%=quizResult.getId()%>">Update</a>
											</form>


											<form action="deleteQuizResult" method="post"
												style="display: inline;">
												<input type="hidden" name="id"
													value="<%=quizResult.getId()%>" />
												<button type="submit" class="btn btn-danger btn-sm">Delete</button>
											</form> <!-- <form action="deleteQuizResult" method="POST">
												<input type="hidden" name="id" value="1">
												<button type="submit">Delete</button>
											</form>
											 -->
										</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>