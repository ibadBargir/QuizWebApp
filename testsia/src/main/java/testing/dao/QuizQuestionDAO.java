package testing.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import testing.model.QuizQuestion;

public class QuizQuestionDAO {
    private Connection connection;
    
    public QuizQuestionDAO(Connection connection) {
        this.connection = connection;
    }
    
    public List<QuizQuestion> getQuestionsByQuizId(int quizId) throws SQLException {
        List<QuizQuestion> questions = new ArrayList<>();
        String query = "SELECT * FROM questions WHERE quiz_id = ?";
        
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, quizId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    QuizQuestion question = new QuizQuestion();
                    question.setQuestionId(rs.getInt("question_id"));
                    question.setQuizId(rs.getInt("quiz_id"));
                    question.setQuestionText(rs.getString("question_text"));
                    question.setOption1(rs.getString("option1"));
                    question.setOption2(rs.getString("option2"));
                    question.setOption3(rs.getString("option3"));
                    question.setOption4(rs.getString("option4"));
                    question.setCorrectOption(rs.getInt("correct_option"));
                    questions.add(question);
                }
            }
        }
        return questions;
    }
    public String getCategory(int quizId) throws SQLException {
        String category = null;
        String query = "SELECT category FROM quizzes WHERE quiz_id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, quizId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    category = rs.getString("category");
                }
            }
        }
        return category;
    }
}
