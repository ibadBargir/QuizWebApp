package testing.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import testing.model.QuizResult;

public class QuizResultDAO {
    private Connection conn;

    public QuizResultDAO(Connection conn) {
        this.conn = conn;
    }

    // Save the quiz result to the database
    public void saveQuizResult(QuizResult result) throws SQLException {
        String query = "INSERT INTO quizresult (quiz_id, id, score, total_questions) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, result.getQuizId());
            pstmt.setInt(2, result.getId());
            pstmt.setInt(3, result.getScore());
            pstmt.setInt(4, result.getTotalQuestions());
            pstmt.executeUpdate();
        }
    }

    // Retrieve all quiz results from the database
    public List<QuizResult> getAllResult() throws SQLException {
        List<QuizResult> results = new ArrayList<>();
        String query = "SELECT quiz_id, id, score, total_questions FROM quizresult";

        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                QuizResult result = new QuizResult();
                result.setQuizId(rs.getInt("quiz_id"));
                result.setId(rs.getInt("id"));
                result.setScore(rs.getInt("score"));
                result.setTotalQuestions(rs.getInt("total_questions"));
                results.add(result);
            }
        }
        return results;
    }

    public QuizResult getResultById(int id) {
        QuizResult quizResult = null;
        try {
            String sql = "SELECT * FROM quizresult WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                quizResult = new QuizResult();
                quizResult.setQuizId(rs.getInt(1));   // Assuming this is part of your model
                quizResult.setId(rs.getInt(2));       // ID should be retrieved
                quizResult.setScore(rs.getInt(3));
                quizResult.setTotalQuestions(rs.getInt(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quizResult;
    }


    public boolean updateQuizResult(QuizResult quizResult) {
        String updateQuery = "UPDATE quiz_results SET score = ?, totalQuestions = ? WHERE id = ?";

        try (PreparedStatement preparedStatement = conn.prepareStatement(updateQuery)) {
            preparedStatement.setInt(1, quizResult.getScore());
            preparedStatement.setInt(2, quizResult.getTotalQuestions());
            preparedStatement.setInt(3, quizResult.getId());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	
	  public boolean deleteResult(int id) {
	        boolean result = false;
	        try {
	            String sql = "DELETE FROM quizresult WHERE id=?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, id);
	            
	            int rowsAffected = ps.executeUpdate();
	            if (rowsAffected > 0) {
	                result = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return result;
	    }

	

}
