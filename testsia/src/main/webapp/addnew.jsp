<%@page import="java.sql.Connection"%>
<%@page import="testing.dbConnection.*"%>
<%@page import="testing.servlet.*" %>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    rel="stylesheet">
<%@ page import="testing.dbConnection.DBConnection" %>

<html>
<head>
    <title>Test DB Connection</title>
</head>
<body>



    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #2c3e50;"> 
        <a class="navbar-brand" href="AdminPanels.jsp" style="color: white;">Quiz App Admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="AdminPanels.jsp" style="color: white;">ADMIN HOME</a></li>
            </ul>
            <a class="btn btn-danger ms-auto me-3" href="/logout">Logout</a>
        </div>
    </nav>

    <div class="card mx-auto mt-5" style="max-width: 600px;">
        <div class="card-header text-center">
            <h4>Add New Student</h4>
        </div>

        <div class="card-body" style="background-color: #dee2e6;">
            <form action="add" method="post">
                <div class="mb-3">
                    <label for="anumber" class="form-label">Admission NO:</label>
                    <input type="text" class="form-control" id="anumber" name="anumber" required>
                </div>
                <div class="mb-3">
                    <label for="fname" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fname" name="fname" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="pnumber" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="pnumber" name="pnumber" required>
                </div>
                <div class="mb-3">
                    <label for="pswd" class="form-label">Password</label>
                    <input type="password" class="form-control" id="pswd" name="pswd" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Save</button>
            </form>
        </div>
    </div>

</body>
</html>