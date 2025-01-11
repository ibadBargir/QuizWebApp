<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuizWeb Registration</title>
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { transform: translateX(-100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        :root {
            --primary-color: #6366F1;
            --dark-bg: #1E1B3A;
            --card-bg: #28244D;
            --text-light: #B4B7CE;
            --error-color: #dc3545;
            --gradient-1: #2A2658;
            --gradient-2: #1E1B3A;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(-45deg, var(--gradient-1), var(--gradient-2));
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            color: var(--text-light);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: rgba(40, 36, 77, 0.95);
            padding: 2.5rem;
            border-radius: 1.5rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 440px;
            margin: 1rem;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: fadeIn 0.8s ease-out;
            transform-origin: center;
        }

        h2 {
            color: #fff;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2rem;
            font-weight: 600;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            animation: slideIn 0.6s ease-out;
        }

        .form-group {
            margin-bottom: 1.8rem;
            animation: fadeIn 0.6s ease-out;
            animation-fill-mode: both;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }
        .form-group:nth-child(5) { animation-delay: 0.5s; }

        .form-label {
            display: block;
            margin-bottom: 0.8rem;
            color: var(--text-light);
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .input-group {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-group-icon {
            position: absolute;
            left: 1rem;
            color: var(--text-light);
            font-size: 1.2rem;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .form-control {
            width: 100%;
            padding: 1rem 1rem 1rem 3rem;
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 1rem;
            background-color: rgba(255, 255, 255, 0.05);
            color: #fff;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            background-color: rgba(255, 255, 255, 0.08);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.2);
        }

        .form-control:focus + .input-group-icon {
            color: var(--primary-color);
            transform: scale(1.1);
        }

        .form-control.error {
            border-color: var(--error-color);
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }

        .error-message {
            color: var(--error-color);
            font-size: 0.875rem;
            margin-top: 0.5rem;
            display: none;
            transform-origin: left;
            animation: slideIn 0.3s ease;
        }

        .error-message.visible {
            display: block;
        }

        .btn-register {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(45deg, #6366F1, #7C3AED);
            color: #fff;
            border: none;
            border-radius: 1rem;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
            margin-top: 1rem;
            position: relative;
            overflow: hidden;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(99, 102, 241, 0.4);
            background: linear-gradient(45deg, #7C3AED, #6366F1);
        }

        .btn-register:active {
            transform: translateY(0);
        }

        .btn-register::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: rgba(255, 255, 255, 0.1);
            transform: rotate(45deg);
            transition: all 0.3s ease;
        }

        .btn-register:hover::after {
            transform: rotate(45deg) translate(50%, 50%);
        }

        .login-link {
            text-align: center;
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            animation: fadeIn 0.6s ease-out;
            animation-delay: 0.6s;
            animation-fill-mode: both;
        }

        .login-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .login-link a:hover {
            color: #7C3AED;
            text-shadow: 0 0 8px rgba(124, 58, 237, 0.4);
        }

        #admissionNumber {
            background-color: rgba(255, 255, 255, 0.05);
            cursor: not-allowed;
            font-weight: 500;
            letter-spacing: 1px;
        }

        /* Floating animation for the form */
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        .container {
            animation: float 6s ease-in-out infinite;
        }

        /* Glowing effect for focused inputs */
        .form-control:focus {
            box-shadow: 0 0 15px rgba(99, 102, 241, 0.3);
        }

        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: var(--dark-bg);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary-color);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #7C3AED;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Join QuizWeb</h2>
        <form action="registerr" method="POST" id="registerForm" onsubmit="return validateForm()">
            <div class="form-group">
                <label class="form-label" >Admission Number</label>
                <div class="input-group">
                    <input type="text" id="admissionNumber" name="anumber" class="form-control" readonly>
                    <span class="input-group-icon">🎓</span>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Full Name</label>
                <div class="input-group">
                    <input type="text" name="fname" class="form-control" placeholder="Enter your full name">
                    <span class="input-group-icon">👤</span>
                </div>
                <div class="error-message">Please enter your full name</div>
            </div>

            <div class="form-group">
                <label class="form-label">Email</label>
                <div class="input-group">
                    <input type="email" name="email" class="form-control" placeholder="Enter your email">
                    <span class="input-group-icon">✉️</span>
                </div>
                <div class="error-message">Please enter a valid email address</div>
            </div>

            <div class="form-group">
                <label class="form-label">Password</label>
                <div class="input-group">
                    <input type="password" name="pswd" class="form-control" placeholder="Create a password">
                    <span class="input-group-icon">🔒</span>
                </div>
                <div class="error-message">Password must be at least 8 characters</div>
            </div>

            <div class="form-group">
                <label class="form-label">Phone Number</label>
                <div class="input-group">
                    <input type="tel" name="pnumber" class="form-control" placeholder="Enter your phone number">
                    <span class="input-group-icon">📱</span>
                </div>
                <div class="error-message">Please enter a valid phone number</div>
            </div>

            <button type="submit" class="btn-register">Create Account</button>
            
            <div class="login-link">
                <p>Already have an account? <a href="login.jsp">Login Here</a></p>
            </div>
        </form>
    </div>

    <script>
        // Auto-increment admission number with animation
        window.onload = function() {
            const baseNumber = 2024000;
            const random = Math.floor(Math.random() * 1000);
            const admissionInput = document.getElementById('admissionNumber');
            const finalNumber = `S${baseNumber + random}`;
            
            let currentNumber = baseNumber;
            const increment = Math.floor((baseNumber + random - baseNumber) / 20);
            
            const interval = setInterval(() => {
                currentNumber += increment;
                admissionInput.value = `ADM${currentNumber}`;
                
                if (currentNumber >= baseNumber + random) {
                    clearInterval(interval);
                    admissionInput.value = finalNumber;
                }
            }, 50);
        }

        // Enhanced form validation with animations
        function validateForm() {
            const form = document.getElementById('registerForm');
            const inputs = form.querySelectorAll('.form-control:not([readonly])');
            let isValid = true;

            inputs.forEach(input => {
                const errorMessage = input.parentElement.nextElementSibling;
                input.classList.remove('error');
                errorMessage.classList.remove('visible');

                if (!input.value.trim()) {
                    showError(input, errorMessage);
                    isValid = false;
                } else if (input.type === 'email' && !validateEmail(input.value)) {
                    showError(input, errorMessage);
                    isValid = false;
                } else if (input.type === 'password' && input.value.length < 8) {
                    showError(input, errorMessage);
                    isValid = false;
                } else if (input.type === 'tel' && !validatePhone(input.value)) {
                    showError(input, errorMessage);
                    isValid = false;
                }
            });

            if (isValid) {
                document.querySelector('.btn-register').classList.add('pulse');
            }

            return isValid;
        }

        function showError(input, errorMessage) {
            input.classList.add('error');
            errorMessage.classList.add('visible');
            input.addEventListener('animationend', () => {
                input.classList.remove('error');
            }, {once: true});
        }

        function validateEmail(email) {
            return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
        }

        function validatePhone(phone) {
            return /^\d{10}$/.test(phone.replace(/[- )(]/g, ''));
        }

        // Add input focus animations
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', () => {
                input.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', () => {
                input.parentElement.classList.remove('focused');
            });
        });
    </script>
</body>
</html>