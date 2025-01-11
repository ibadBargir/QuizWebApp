package testing.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import testing.model.Quiz;

public class QuizDAO {
    private Connection connection;

    public QuizDAO(Connection connection) {
        this.connection = connection;
    }

    // Method to fetch all quizzes
    public List<Quiz> getAllQuizzes() throws SQLException {
        List<Quiz> quizzes = new ArrayList<>();
        String query = "SELECT * FROM quizzes";

        try (PreparedStatement pstmt = connection.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setQuizId(rs.getInt("quiz_id"));
                quiz.setTitle(rs.getString("title"));
                quiz.setDescription(rs.getString("description"));
                quiz.setCategory(rs.getString("category"));
                quiz.setTotalQuestions(rs.getInt("total_questions"));
                quiz.setImagePath(rs.getString("image_path")); // Correct field name here
                quizzes.add(quiz);
            }
        }
        return quizzes;
    }

    // Method to save quiz with an image path
    public void saveQuiz(Quiz quiz) throws SQLException {
        String query = "INSERT INTO quizzes (title, description, category, total_questions, image_path) VALUES (?, ?, ?, ?, ?)";
        
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, quiz.getTitle());
            pstmt.setString(2, quiz.getDescription());
            pstmt.setString(3, quiz.getCategory());
            pstmt.setInt(4, quiz.getTotalQuestions());
            pstmt.setString(5, quiz.getImagePath()); // Using image_path here
            pstmt.executeUpdate();
        }
    }
}
