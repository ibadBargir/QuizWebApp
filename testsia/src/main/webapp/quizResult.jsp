<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuizWeb - Results</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #1f1d2b 0%, #2d2b3a 100%);
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 100%;
            background: radial-gradient(circle at top right, rgba(108, 92, 231, 0.1), transparent 50%),
                        radial-gradient(circle at bottom left, rgba(162, 155, 254, 0.1), transparent 50%);
            pointer-events: none;
        }

        .navbar {
            background: rgba(45, 43, 58, 0.95);
            backdrop-filter: blur(10px);
            padding: 1.2rem 2.5rem;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 100;
        }

        .container-fluid {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand {
            color: #fff;
            font-size: 1.8rem;
            font-weight: 700;
            text-decoration: none;
            background: linear-gradient(45deg, #6c5ce7, #a29bfe);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: 0.5px;
        }

        .main-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 3rem 1.5rem;
            position: relative;
            z-index: 1;
        }

        .result-card {
            background: rgba(45, 43, 58, 0.9);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 2.5rem;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: slideUp 0.6s ease-out;
        }

        .category-badge {
            background: linear-gradient(135deg, #6c5ce7, #a29bfe);
            display: inline-block;
            padding: 0.5rem 1.5rem;
            border-radius: 25px;
            font-weight: 500;
            font-size: 0.9rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 15px rgba(108, 92, 231, 0.3);
            animation: fadeIn 0.6s ease-out 0.2s both;
        }

        .score-display {
            text-align: center;
            margin-bottom: 2.5rem;
            padding: 2rem;
            background: linear-gradient(165deg, rgba(108, 92, 231, 0.2), rgba(162, 155, 254, 0.1));
            border-radius: 15px;
            position: relative;
            overflow: hidden;
            animation: fadeIn 0.6s ease-out 0.4s both;
        }

        .score-display::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: translateX(-100%);
            animation: shine 3s infinite;
        }

        .score-label {
            font-size: 1.1rem;
            color: #a29bfe;
            margin-bottom: 1rem;
            font-weight: 500;
        }

        .score-value {
            font-size: 4.5rem;
            font-weight: 700;
            background: linear-gradient(45deg, #6c5ce7, #a29bfe);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1;
            margin-bottom: 1rem;
        }

        .feedback-message {
            background: rgba(108, 92, 231, 0.1);
            border-left: 4px solid #6c5ce7;
            padding: 1.2rem;
            border-radius: 0 10px 10px 0;
            margin-bottom: 2.5rem;
            font-size: 1.1rem;
            color: #a29bfe;
            animation: fadeIn 0.6s ease-out 0.6s both;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            animation: fadeIn 0.6s ease-out 0.8s both;
        }

        .btn {
            flex: 1;
            padding: 1rem;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background: linear-gradient(45deg, #6c5ce7, #a29bfe);
            color: white;
            box-shadow: 0 4px 15px rgba(18, 0.2, 31, 0.3);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: #a29bfe;
            border: 1px solid rgba(122, 155, 254, 0.3);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(108, 92, 221, 0.4);
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.15);
            border-color: #a29bfe;
        }

        footer {
            background: rgba(45, 43, 58, 0.95);
            backdrop-filter: blur(10px);
            padding: 2rem;
            text-align: center;
            position: relative;
            z-index: 100;
        }

        .social-icons {
            margin-bottom: 1.5rem;
        }

        .social-icons a {
            color: #a29bfe;
            margin: 0 12px;
            font-size: 1.3rem;
            transition: all 0.3s ease;
        }

        .social-icons a:hover {
            color: #6c5ce7;
            transform: translateY(-3px);
        }

        .copyright {
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .credits {
            color: #a29bfe;
            font-size: 0.9rem;
        }

        .developer-links {
            margin-top: 0.5rem;
        }

        .developer-links a {
            color: white;
            text-decoration: none;
            margin: 0 8px;
            transition: color 0.3s ease;
        }

        .developer-links a:hover {
            color: #6c5ce7;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes shine {
            to {
                transform: translateX(100%);
            }
        }

        @media (max-width: 768px) {
            .navbar {
                padding: 1rem 1.5rem;
            }

            .result-card {
                padding: 1.5rem;
            }

            .score-value {
                font-size: 3.5rem;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
        /* Enhanced Animations */
        @keyframes floatIn {
            0% {
                opacity: 0;
                transform: translateY(50px) scale(0.9);
            }
            60% {
                transform: translateY(-7px) scale(1.02);
            }
            100% {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        @keyframes pulseGlow {
            0% {
                box-shadow: 0 0 0 0 rgba(108, 92, 231, 0.4);
            }
            70% {
                box-shadow: 0 0 0 10px rgba(108, 92, 231, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(108, 92, 231, 0);
            }
        }

        @keyframes gradientMove {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        @keyframes scaleIn {
            0% {
                opacity: 0;
                transform: scale(0.8);
            }
            70% {
                transform: scale(1.1);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes shimmer {
            0% {
                transform: translateX(-150%) rotate(45deg);
            }
            100% {
                transform: translateX(150%) rotate(45deg);
            }
        }

        .result-card {
            animation: floatIn 0.8s cubic-bezier(0.23, 1, 0.32, 1) forwards;
            position: relative;
            overflow: hidden;
        }

        .result-card::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                45deg,
                transparent,
                rgba(255, 255, 255, 0.05),
                transparent
            );
            transform: translateX(-150%) rotate(45deg);
            animation: shimmer 3s infinite;
        }

        .category-badge {
            animation: scaleIn 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) 0.3s both;
            background-size: 200% 200%;
            animation: gradientMove 3s ease infinite;
        }

        .score-display {
            animation: scaleIn 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) 0.6s both;
            position: relative;
            overflow: hidden;
        }

        .score-value {
            position: relative;
            animation: pulseGlow 2s infinite;
            background-size: 200% 200%;
            animation: gradientMove 3s ease infinite;
        }

        /* Enhanced Buttons */
        .action-buttons {
            display: flex;
            gap: 1.5rem;
            padding: 0.5rem;
            animation: scaleIn 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) 0.9s both;
        }

        .btn {
            position: relative;
            padding: 1.2rem 2rem;
            border-radius: 15px;
            font-weight: 600;
            font-size: 1.1rem;
            letter-spacing: 0.5px;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.23, 1, 0.32, 1);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                120deg,
                transparent,
                rgba(255, 255, 255, 0.2),
                transparent
            );
            transform: translateX(-100%);
            transition: 0.6s;
        }

        .btn:hover::before {
            transform: translateX(100%);
        }

        .btn-primary {
            background: linear-gradient(45deg, #6c5ce7, #a29bfe);
            background-size: 200% 200%;
            animation: gradientMove 3s ease infinite;
        }

        .btn-primary:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 8px 25px rgba(0, 9.2, 0, 0.4);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .btn-secondary:hover {
            transform: translateY(-3px) scale(1.02);
            background: rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .btn i {
            margin-right: 8px;
            transform: scale(1.2);
            transition: transform 0.3s ease;
        }

        .btn:hover i {
            transform: scale(1.4);
        }

        /* Enhanced Score Display Animation */
        .score-display {
            position: relative;
            background: linear-gradient(165deg, 
                rgba(108, 92, 231, 0.2), 
                rgba(162, 155, 254, 0.1)
            );
        }

        .score-display::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                45deg,
                transparent,
                rgba(255, 255, 255, 0.1),
                transparent
            );
            transform: translateX(-150%) rotate(45deg);
            animation: shimmer 3s infinite;
        }

        .feedback-message {
            animation: scaleIn 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) 0.8s both;
            position: relative;
            overflow: hidden;
        }

        .feedback-message::after {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            width: 4px;
            height: 100%;
            background: linear-gradient(to bottom, #6c5ce7, #a29bfe);
            animation: pulseGlow 2s infinite;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .action-buttons {
                flex-direction: column;
                gap: 1rem;
            }

            .btn {
                width: 100%;
                padding: 1rem;
                font-size: 1rem;
            }

            .score-value {
                font-size: 3rem;
            }
        }
        
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin/login.jsp">QuizWeb</a>
            <div>
                <p class="text-white">Welcome, <strong><%= request.getAttribute("fname") %></strong></p>
            </div>
        </div>
    </nav>

    <div class="main-container">
        <div class="result-card">
            <div class="category-badge">
                <%= request.getAttribute("category") %>
            </div>

            <div class="score-display">
                <div class="score-label">Your Score</div>
                <div class="score-value">
                    <%
                        Integer score = (Integer) request.getAttribute("score");
                        Integer totalQuestions = (Integer) request.getAttribute("totalQuestions");
                        if (score == null || totalQuestions == null) {
                            out.print("Error");
                        } else {
                            out.print(score + "/" + totalQuestions);
                        }
                    %>
                </div>
                <div class="score-label">Questions Answered Correctly</div>
            </div>

            <div class="feedback-message">
                <%
                    if (score != null && totalQuestions != null) {
                        if (score == totalQuestions) {
                            out.print("🌟 Perfect Score! You've mastered this topic!");
                        } else if (score >= totalQuestions * 0.7) {
                            out.print("🎯 Excellent work! You're showing great understanding!");
                        } else if (score >= totalQuestions * 0.5) {
                            out.print("💪 Good effort! Keep practicing to improve!");
                        } else {
                            out.print("📚 Keep learning! Every attempt makes you stronger!");
                        }
                    }
                %>
            </div>

            <div class="action-buttons">
                <a href="quizList" class="btn btn-secondary">
                    <i class="fas fa-home"></i> Back to Home
                </a>
                <a href="quizQuestion?quizId=<%= request.getAttribute("quizId") %>" class="btn btn-primary">
                    <i class="fas fa-redo"></i> Try Again
                </a>
            </div>
        </div>
    </div>

    <footer>
        <div class="social-icons">
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-facebook"></i></a>
        </div>
        <div class="copyright">&copy; 2024 QuizWeb. All rights reserved.</div>
        <div class="credits">
            Developed & designed by
            <div class="developer-links">
                <a href="https://github.com/ibadbargir">Ibad</a> |
                <a href="https://github.com/Saima223">Saima</a> |
                <a href="https://github.com/Rabina-Vishwakarma">Rabina </a> |
                <a href="https://github.com/SakshiArvindYadav">Sakshi</a>
            </div>
        </div>
    </footer>
</body>
</html>