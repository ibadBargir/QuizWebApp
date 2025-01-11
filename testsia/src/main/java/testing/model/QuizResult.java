package testing.model;

public class QuizResult {
    private int quizId;  
    private int id;     
    private int score;
    private int totalQuestions;

    // Constructor with all fields
    public QuizResult(int quizId, int id, int score, int totalQuestions) {
        this.quizId = quizId;
        this.id = id;
        this.score = score;
        this.totalQuestions = totalQuestions;
    }

    public QuizResult() {
		// TODO Auto-generated constructor stub
	}

	// Getters and setters
    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getTotalQuestions() {
        return totalQuestions;
    }

    public void setTotalQuestions(int totalQuestions) {
        this.totalQuestions = totalQuestions;
    }
}
