<%@ page import="java.util.*" %>
<%@ page import="testing.servlet.*" %>
<%@ page import="testing.model.*" %>
<%@ page import="testing.dao.*" %>
<%@ page import = "testing.dbConnection.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Quiz Result</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

<%
    // Get quizid parameter from the request
    String quizidParam = request.getParameter("quizid");

    if (quizidParam != null) {
        int quizid = Integer.parseInt(quizidParam);  // Parse the quizid

        // Initialize the DAO and get the specific quiz result
        QuizResultDAO resultDAO = new QuizResultDAO(DBConnection.getConnection());
        QuizResult quizResult = resultDAO.getQuizResultByQuizId(quizid);  // Fetch the result for the quizid

        // Check if the result is found
        if (quizResult == null) {
            out.println("<h3>No quiz result found for the given quiz ID.</h3>");
        } else {
%>

    <div class="container mt-4">
        <h2>Update Quiz Result</h2>
      <form action="upres" method="POST">

            <!-- Hidden field to store quizid -->
            <input type="hidden" name="quizid" value="<%= quizResult.getQuizId() %>">

            <!-- Score input -->
            <div class="form-group">
                <label for="score">Score</label>
                <input type="number" class="form-control" id="score" name="score" 
                       value="<%= quizResult.getScore() %>" required>
            </div>

            <!-- Total Questions input -->
            <div class="form-group">
                <label for="totalQuestions">Total Questions</label>
                <input type="number" class="form-control" id="totalQuestions" name="totalQuestions" 
                       value="<%= quizResult.getTotalQuestions() %>" required>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary">Update Result</button>
        </form>
    </div>

<%
        }
    } else {
        out.println("<h3>No quiz ID provided in the request.</h3>");
    }
%>

</body>
</html>
