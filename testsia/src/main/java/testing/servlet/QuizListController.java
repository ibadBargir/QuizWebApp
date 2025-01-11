//no changes needed 
package testing.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import testing.dao.QuizDAO;
import testing.dbConnection.DBConnection;
import testing.model.Quiz;

@WebServlet("/quizList")
public class QuizListController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try (Connection conn = DBConnection.getConnection()) {
       	 // Fetch the list of quizzes from the database or model
            QuizDAO quizDAO = new QuizDAO(conn);
            List<Quiz> quizzes = quizDAO.getAllQuizzes();        
            request.setAttribute("quizzes", quizzes);
            // Forward the request to quizzes.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/quiz.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Database error", e);
        }
    }
}