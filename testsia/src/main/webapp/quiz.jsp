<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="testing.model.Quiz" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuizWeb - Modern Learning Platform</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --primary-gradient: linear-gradient(135deg, #1a1a3e 0%, #2a1b3d 100%);
            --card-gradient: linear-gradient(145deg, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0.05) 100%);
            --accent-color: #4f46e5;
            --text-primary: #ffffff;
            --text-secondary: #b4b4b4;
            --card-shadow: 0 8px 32px rgba(0,0,0,0.2);
            --hover-transform: translateY(-5px);
        }

        body {
            background: var(--primary-gradient);
            color: var(--text-primary);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Header Styles */
        .header {
            padding: 1rem 2rem;
            background: rgba(0,0,0,0.2);
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 100;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--text-primary);
            text-decoration: none;
            letter-spacing: 1px;
        }

        .user-controls {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .logout-btn {
            background: #dc2626;
            color: white;
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            background: #ef4444;
            transform: var(--hover-transform);
        }

        /* Main Content Styles */
        .main-content {
            margin-top: 80px;
            padding: 2rem;
            flex: 1;
        }

        .welcome-section {
            text-align: center;
            margin-bottom: 3rem;
            animation: fadeIn 1s ease-out;
        }

        .welcome-section h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            background: linear-gradient(to right, #fff, #4f46e5);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .welcome-section h2 {
            color: var(--text-secondary);
            font-size: 1.2rem;
        }

        .quiz-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            padding: 0 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }

        .quiz-card {
            background: var(--card-gradient);
            border-radius: 20px;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.1);
            box-shadow: var(--card-shadow);
            transition: all 0.3s ease;
            animation: slideUp 0.5s ease-out forwards;
            opacity: 0;
        }

        .quiz-card:hover {
            transform: var(--hover-transform);
            box-shadow: 0 12px 40px rgba(0,0,0,1.3);
        }

        .quiz-card img {
            width: 110px;
    height: 110px;
    border-radius: 50%; 
    margin-top:-12px;
    margin-left:-10px;
    object-fit: cover;
    
        }

        .quiz-card h3 {
            color: #4f46e5;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .quiz-card p {
            color: var(--text-secondary);
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .start-quiz-btn {
            background: var(--accent-color);
            color: white;
            text-decoration: none;
            padding: 0.8rem 2rem;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .start-quiz-btn:hover {
            background: #6366f1;
            transform: translateY(-2px);
        }

        /* Footer Styles */
        .footer {
            background: rgba(0,0,0,0.2);
            padding: 2rem;
            text-align: center;
            margin-top: auto;
        }

        .social-links {
            margin: 1rem 0;
        }

        .social-links a {
            color: var(--text-primary);
            margin: 0 1rem;
            font-size: 1.5rem;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .social-links a:hover {
            color: var(--accent-color);
            transform: translateY(-3px);
        }

        .developer-info {
            color: var(--text-secondary);
            margin-top: 1rem;
        }

        .developer-info a {
            color: var(--accent-color);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .developer-info a:hover {
            color: #6366f1;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .quiz-card:nth-child(1) { animation-delay: 0.1s; }
        .quiz-card:nth-child(2) { animation-delay: 0.2s; }
        .quiz-card:nth-child(3) { animation-delay: 0.3s; }
        .quiz-card:nth-child(4) { animation-delay: 0.4s; }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header {
                padding: 1rem;
            }

            .logo {
                font-size: 1.5rem;
            }

            .main-content {
                padding: 1rem;
            }

            .welcome-section h1 {
                font-size: 2rem;
            }

            .quiz-grid {
                padding: 0 1rem;
                gap: 1rem;
            }
        }

        /* Questions Page Styles */
        .question-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: var(--card-gradient);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.1);
            box-shadow: var(--card-shadow);
        }

        .question-text {
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
            color: var(--text-primary);
        }

        .options-container {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .option-label {
            display: flex;
            align-items: center;
            padding: 1rem;
            background: rgba(255,255,255,0.05);
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .option-label:hover {
            background: rgba(255,255,255,0.1);
        }

        .option-input {
            margin-right: 1rem;
        }

        .submit-btn {
            background: var(--accent-color);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 25px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 2rem;
            width: 100%;
        }

        .submit-btn:hover {
            background: #6366f1;
            transform: var(--hover-transform);
        }

        /* Results Page Styles */
        .result-container {
            max-width: 600px;
            margin: 4rem auto;
            padding: 2rem;
            background: var(--card-gradient);
            border-radius: 20px;
            text-align: center;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.1);
            box-shadow: var(--card-shadow);
        }

        .score-display {
            font-size: 3rem;
            margin: 2rem 0;
            color: var(--accent-color);
        }

        .result-message {
            font-size: 1.2rem;
            margin: 1rem 0;
            color: var(--text-secondary);
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .action-btn {
            background: var(--accent-color);
            color: white;
            text-decoration: none;
            padding: 0.8rem 2rem;
            border-radius: 25px;
            transition: all 0.3s ease;
        }

        .action-btn:hover {
            background: #6366f1;
            transform: var(--hover-transform);
        }
        
        .proimge  {
    width: 120px;
    height: 120px;
    border-radius: 50%; /* Makes the image circular */
    margin-bottom: 1.5rem;
    background: rgba(255,255,255,0.1);
    padding: 1rem;
    object-fit: cover;
}
        

    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <a href="#" class="logo">QuizWeb</a>
        <div class="user-controls">
            <span>Hello, <%= session.getAttribute("fname") %></span>
            <form action="logout" method="get" style="display: inline;">
                <button type="submit" class="logout-btn">Logout</button>
            </form>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <section class="welcome-section">
            <h1>Available Quizzes</h1>
            <h2>Welcome to the Quiz</h2>
        </section>

        <div class="quiz-grid">
            <%
            List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
            if (quizzes != null) {
                for (Quiz quiz : quizzes) {
        %>
            <div class="quiz-card">
            <div class="proimge">
             <% if (quiz.getImagePath() != null && !quiz.getImagePath().isEmpty()) { %>
                    <img src="<%= request.getContextPath() %>/<%= quiz.getImagePath() %>" class="quiz-image" />

                <% } else { %>
                    <p>No image available.</p>
                <% }
                
                %></div>
                <h2><%= quiz.getTitle() %></h2>
                <p><%= quiz.getDescription() %></p>
                <p>Category: <%= quiz.getCategory() %></p>
                <p>Total Questions: <%= quiz.getTotalQuestions() %></p>
                
                 <a href="quizQuestion?quizId=<%= quiz.getQuizId() %>" class="start-quiz-btn">Start Quiz</a>
                
                
            </div>
        <% 
                }
            } else {
        %>
            <p>No quizzes available at the moment.</p>
            <%
            }
            %>
        </div>
    </main>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>