<%@page import="testing.dbConnection.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="testing.model.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<%@ page import="testing.dbConnection.*" %>
<%@ page import="testing.dao.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User - Admin Panel</title>
    <style type="text/css">
    
   nav {
    background-color: #2c3e50;
    color: white;
}

.navbar .nav-link {
    color: white;  /* This will make all links white */
}

.navbar .nav-link:hover {
    color: #ddd;  /* Optional: Light color on hover */
}

    .navbar, .navbar a {
        font-weight: bold;
    }
    .brand{
    color: white;  
    text-decoration: none;
    font-weight: bold;
    
    
    }
    
    
    </style>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light ">
        <a class="brand" href="AdminPanels.jsp">Quiz App Admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="#manageUsers">Manage Users</a></li>
                <li class="nav-item"><a class="nav-link" href="#manageQuestions">Manage Questions</a></li>
                <li class="nav-item"><a class="nav-link" href="#manageResults">Manage Results</a></li>
            </ul>
            <a class="btn btn-danger ms-auto me-3" href="/logout">Logout</a>
        </div>
    </nav>

    <div class="container my-5">
        <%
            // Retrieve the 'id' parameter from the request to fetch the user details
            String userIdParam = request.getParameter("id");
            if (userIdParam == null || userIdParam.isEmpty()) {
                response.sendRedirect("manageUsers.jsp?error=Missing user ID");
                return;
            }

            int userId = 0;
            try {
                userId = Integer.parseInt(userIdParam); 
            } catch (NumberFormatException e) {
                response.sendRedirect("manageUsers.jsp?error=Invalid user ID");
                return;
            }

            // Fetch the user details using the valid userId
            UserDAO dao = new UserDAO(DBConnection.getConnection());
            Users user = dao.getUserById(userId);  // Retrieve the user from the database

            if (user == null) {
                response.sendRedirect("manageUsers.jsp?error=User not found");
                return;
            }
        %>

        <!-- Error message if any -->
        <%
            String errorMessage = request.getParameter("error");
            if (errorMessage != null) {
        %>
            <div class="alert alert-danger">
                <%= errorMessage %>
            </div>
        <%
            }
        %>
        
        

        <!-- Edit User Form inside Bootstrap Card -->
        <div class="card mx-auto" style="max-width: 600px;">
            <div class="card-header text-center">
                <h4>Edit User Information</h4>
            </div>

            <div class="card-body">
                <form action="updateUser" method="post">
                   <%--  <input type="hidden" name="id" value="<%= user.getId() %>"> --%>
                    
                    <div class="mb-3">
                        <label for="fname" class="form-label">ID</label>
                        <input type="text" class="form-control" id="id" name="id" value="<%= user.getId() %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="fname" class="form-label">Admisstion No</label>
                        <input type="text" class="form-control" id="anumber" name="anumber" value="<%= user.getAnumber() %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="fname" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="fname" name="fname" value="<%= user.getFname() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="text" class="form-control" id="phone" name="pnumber" value="<%= user.getPnumber() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="pswd" value="<%= user.getPswd() %>" required>
                    </div>
                    
                    <!-- Hidden ID field for the update operation -->
                    <input type="hidden" name="id" value="<%= user.getId() %>">

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary w-100">Save Changes</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
