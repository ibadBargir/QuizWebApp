<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Interactive Quiz</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-bg: #1a1f2c;
            --secondary-bg: #2d3754;
            --accent-color: #4e54c8;
            --text-color: #ffffff;
            --hover-color: #8f94fb;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(135deg, var(--primary-bg) 0%, var(--secondary-bg) 100%);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .quiz-container {
            max-width: 700px;
            width: 95%;
            margin: 50px auto;
            padding: 20px;
        }

        .quiz-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding: 15px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            backdrop-filter: blur(10px);
        }

        .quiz-header h1 {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.8rem;
        }

        .quiz-header h1 i {
            color: var(--accent-color);
        }

        .quiz-timer {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: bold;
        }

        .quiz-timer i {
            color: var(--hover-color);
        }

        .quiz-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .quiz-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                45deg, 
                transparent, 
                var(--accent-color), 
                transparent
            );
            animation: borderGlow 5s linear infinite;
            opacity: 0.1;
        }

        @keyframes borderGlow {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .question-number {
            text-align: center;
            font-size: 1.5rem;
            color: var(--hover-color);
            margin-bottom: 15px;
            font-weight: bold;
        }

        .question-text {
            text-align: center;
            font-size: 1.3rem;
            margin-bottom: 25px;
            line-height: 1.6;
        }

        .quiz-option {
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .quiz-option input[type="radio"] {
            display: none;
        }

        .quiz-option-text {
            margin-left: 15px;
            flex-grow: 1;
        }

        .quiz-option:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(10px);
        }

        .quiz-option-icon {
            width: 30px;
            height: 30px;
            border: 2px solid var(--text-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .quiz-option input[type="radio"]:checked + .quiz-option-icon {
            background: var(--accent-color);
            border-color: var(--accent-color);
        }

        .submit-btn {
            display: block;
            width: 200px;
            margin: 30px auto;
            padding: 15px;
            background: linear-gradient(45deg, var(--accent-color), var(--hover-color));
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 20px rgba(78, 84, 200, 0.3);
        }

        .submit-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(78, 84, 200, 0.4);
        }

        @media (max-width: 600px) {
            .quiz-container {
                width: 98%;
                padding: 10px;
            }

            .quiz-header {
                flex-direction: column;
                text-align: center;
            }

            .quiz-timer {
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
    <%@ page import="testing.model.QuizQuestion" %>

    <div class="quiz-container">
        <div class="quiz-header">
            <h1>
                <i class="fas fa-brain"></i> Quiz Challenge
            </h1>
            <div class="quiz-timer">
                <i class="fas fa-clock"></i> Time Left: 30:00
            </div>
        </div>

        <%
        List<QuizQuestion> questions = (List<QuizQuestion>) request.getAttribute("questions");
        String quizId = (String) request.getAttribute("quizId");
        if (quizId == null) {
            quizId = (String) session.getAttribute("currentQuizId");
        }

        if (questions != null && !questions.isEmpty()) {
        %>
        <form action="submitQuiz" method="post">
            <input type="hidden" name="quizId" value="<%= quizId %>">

            <%
            int questionNumber = 1;
            for (QuizQuestion question : questions) {
            %>
            <div class="quiz-card">
                <div class="question-number">
                    Question <%= questionNumber %>
                </div>
                <div class="question-text">
                    <%= question.getQuestionText() %>
                </div>
                
                <label class="quiz-option">
                    <input type="radio" name="question_<%= question.getQuestionId() %>" 
                           value="1" required>
                    <span class="quiz-option-icon">A</span>
                    <span class="quiz-option-text"><%= question.getOption1() %></span>
                </label>
                
                <label class="quiz-option">
                    <input type="radio" name="question_<%= question.getQuestionId() %>" 
                           value="2">
                    <span class="quiz-option-icon">B</span>
                    <span class="quiz-option-text"><%= question.getOption2() %></span>
                </label>
                
                <label class="quiz-option">
                    <input type="radio" name="question_<%= question.getQuestionId() %>" 
                           value="3">
                    <span class="quiz-option-icon">C</span>
                    <span class="quiz-option-text"><%= question.getOption3() %></span>
                </label>
                
                <label class="quiz-option">
                    <input type="radio" name="question_<%= question.getQuestionId() %>" 
                           value="4">
                    <span class="quiz-option-icon">D</span>
                    <span class="quiz-option-text"><%= question.getOption4() %></span>
                </label>
            </div>
            <%
            questionNumber++;
            }
            %>
            
            <button type="submit" class="submit-btn">
                <i class="fas fa-paper-plane"></i> Submit Quiz
            </button>
        </form>
        <%
        } else {
        %>
        <div class="quiz-card">
            <div class="question-text">
                <i class="fas fa-exclamation-triangle"></i> No questions available for this quiz.
            </div>
        </div>
        <%
        }
        %>
    </div>

    <script>
        // Optional: Add some interactivity
        document.querySelectorAll('.quiz-option').forEach(option => {
            option.addEventListener('click', function() {
                // Remove selected from all options in this question
                this.closest('.quiz-card')
                    .querySelectorAll('.quiz-option')
                    .forEach(opt => opt.classList.remove('selected'));
                
                // Add selected to clicked option
                this.classList.add('selected');
                
                // Check the radio button
                this.querySelector('input[type="radio"]').checked = true;
            });
        });

        // Optional: Countdown Timer
        function startTimer(duration, display) {
            let timer = duration, minutes, seconds;
            let countdown = setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    clearInterval(countdown);
                    document.querySelector('form').submit();
                }
            }, 1000);
        }

        window.onload = function () {
            let thirtyMinutes = 60 * 30,
                display = document.querySelector('.quiz-timer');
            startTimer(thirtyMinutes, display);
        };
    </script>
</body>
</html>