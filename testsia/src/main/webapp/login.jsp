<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - QuizWeb</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #1e1b4b, #2d2b5a);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        /* Animated background */
        .background-shapes {
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: 1;
        }

        .shape {
            position: absolute;
            background: rgba(99, 102, 241, 0.1);
            border-radius: 50%;
            animation: float 15s infinite;
        }

        .shape:nth-child(1) {
            width: 200px;
            height: 200px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            width: 150px;
            height: 150px;
            top: 60%;
            right: 15%;
            animation-delay: -3s;
        }

        .shape:nth-child(3) {
            width: 100px;
            height: 100px;
            bottom: 10%;
            left: 20%;
            animation-delay: -6s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-40px) rotate(180deg);
            }
        }

        .login-container {
            background: rgba(45, 43, 90, 0.95);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            width: 90%;
            max-width: 400px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
            position: relative;
            z-index: 2;
            transform: translateY(50px);
            opacity: 0;
            animation: slideUp 0.8s forwards;
        }

        @keyframes slideUp {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .logo {
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, #6366f1, #8b5cf6);
            margin: 0 auto 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            color: white;
            transform: rotate(0deg);
            transition: transform 0.5s;
        }

        .login-container:hover .logo {
            transform: rotate(360deg);
        }

        .title {
            color: #a5b4fc;
            text-align: center;
            font-size: 28px;
            margin-bottom: 30px;
            position: relative;
        }

        .title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, #6366f1, transparent);
        }

        .input-group {
            margin-bottom: 25px;
            position: relative;
            overflow: hidden;
        }

        .input-group label {
            display: block;
            color: #a5b4fc;
            margin-bottom: 8px;
            font-size: 16px;
            transform: translateY(0);
            transition: transform 0.3s;
        }

        .input-group input {
            width: 100%;
            padding: 15px;
            border: 2px solid transparent;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 12px;
            outline: none;
            font-size: 16px;
            transition: all 0.3s ease;
            position: relative;
            z-index: 1;
        }

        .input-group input:focus {
            border-color: #6366f1;
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.2);
        }

        .input-group::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: #6366f1;
            transform: scaleX(0);
            transition: transform 0.3s;
        }

        .input-group input:focus + .input-group::after {
            transform: scaleX(1);
        }

        .error {
            border-color: #ff4e4e !important;
            animation: shake 0.5s;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }

        .login-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(45deg, #6366f1, #8b5cf6);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .login-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: 0.5s;
        }

        .login-btn:hover::before {
            left: 100%;
        }

        .login-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(99, 102, 241, 0.3);
        }

        .register-link {
            text-align: center;
            margin-top: 25px;
            color: #a5b4fc;
            font-size: 15px;
            opacity: 0;
            animation: fadeIn 0.5s 0.8s forwards;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        .register-link a {
            color: #6366f1;
            text-decoration: none;
            font-weight: bold;
            position: relative;
        }

        .register-link a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background: #6366f1;
            transform: scaleX(0);
            transition: transform 0.3s;
        }

        .register-link a:hover::after {
            transform: scaleX(1);
        }

        .error-message {
            background: rgba(255, 78, 78, 0.1);
            border-left: 4px solid #ff4e4e;
            color: #ff4e4e;
            padding: 10px 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            transform: translateX(-100%);
            animation: slideIn 0.5s forwards;
        }

        @keyframes slideIn {
            to {
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>
    <div class="background-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <div class="login-container">
        <div class="logo">Q</div>
        <h1 class="title">Welcome Back</h1>
        
        <form action="login" method="post">
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null && !errorMessage.isEmpty()) {
            %>
                <div class="error-message">
                    <%= errorMessage %>
                </div>
            <% } %>

            <div class="input-group">
                <label for="email">Email Address</label>
                <input 
                    type="email" 
                    id="email" 
                    name="email" 
                    
                    value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
                    class="<%= errorMessage != null ? "error" : "" %>"
                    placeholder="Enter your email"
                >
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input 
                    type="password" 
                    id="password" 
                    name="password" 
                    
                    class="<%= errorMessage != null ? "error" : "" %>"
                    placeholder="Enter your password"
                >
            </div>

            <button type="submit" class="login-btn">Login</button>

            <div class="register-link">
                Don't have an account? <a href="registration.jsp">Register here</a>
            </div>
        </form>
    </div>
</body>
</html>