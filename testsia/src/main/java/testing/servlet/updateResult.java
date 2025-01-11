package testing.servlet;

import java.io.IOException;
import java.sql.SQLException;

import testing.dao.QuizResultDAO;
import testing.dbConnection.DBConnection;
import testing.model.QuizResult;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateResult
 */
@WebServlet("/UpdateResult")
public class updateResult extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = parseIntOrDefault(request.getParameter("id"), -1);          // Use 'id' instead of 'quizid'
            int score = parseIntOrDefault(request.getParameter("score"), -1);
            int totalQuestions = parseIntOrDefault(request.getParameter("totalQuestions"), -1);

            if (id == -1 || score == -1 || totalQuestions == -1) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input data.");
                return;
            }

            QuizResultDAO resultDAO = new QuizResultDAO(DBConnection.getConnection());

            // Get the existing result based on id
            QuizResult existingResult = resultDAO.getResultById(id);
            
            if (existingResult != null) {
                // Update the result if it exists
                existingResult.setScore(score);
                existingResult.setTotalQuestions(totalQuestions);
                
                boolean isUpdated = resultDAO.updateQuizResult(existingResult);
                if (isUpdated) {
                    response.sendRedirect("AdminPanels.jsp");
                } else {
                    response.getWriter().println("Error updating the result.");
                }
            } else {
                response.getWriter().println("No quiz result found for ID: " + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }

    private int parseIntOrDefault(String value, int defaultValue) {
        if (value == null || value.isEmpty()) {
            return defaultValue;
        }
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}
