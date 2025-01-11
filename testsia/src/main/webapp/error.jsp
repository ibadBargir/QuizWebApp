<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>QuizWeb - ${pageType}</title>
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(-45deg, #1a1b2e, #252547, #2d2a54, #1f1f3a);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #fff;
            padding: 20px;
        }

        .status-container {
            background: rgba(37, 37, 71, 0.9);
            backdrop-filter: blur(10px);
            padding: 4rem;
            border-radius: 1.5rem;
            text-align: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2),
                        0 0 0 1px rgba(255, 255, 255, 0.05);
            max-width: 550px;
            width: 90%;
            animation: fadeIn 1s ease-out;
            position: relative;
            overflow: hidden;
        }

        .status-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, #6366F1, #8B5CF6, #6366F1);
            background-size: 200% 100%;
            animation: gradientBG 3s linear infinite;
        }

        .icon {
            width: 150px;
            height: 150px;
            margin-bottom: 2.5rem;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: auto;
            margin-right: auto;
            animation: floating 3s ease-in-out infinite;
            position: relative;
        }

        .success .icon {
            background: linear-gradient(45deg, rgba(52, 211, 153, 0.1), rgba(52, 211, 153, 0.2));
            box-shadow: 0 0 30px rgba(52, 211, 153, 0.3);
        }

        .error .icon {
            background: linear-gradient(45deg, rgba(239, 68, 68, 0.1), rgba(239, 68, 68, 0.2));
            box-shadow: 0 0 30px rgba(239, 68, 68, 0.3);
        }

        .icon::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            border: 2px solid currentColor;
            animation: pulse 2s infinite;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            background: linear-gradient(90deg, #8B5CF6, #6366F1);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            font-weight: 700;
        }

        p {
            color: #94A3B8;
            margin-bottom: 2.5rem;
            line-height: 1.8;
            font-size: 1.1rem;
        }

        .btn {
            background: linear-gradient(45deg, #6366F1, #8B5CF6);
            color: white;
            padding: 1rem 2.5rem;
            border-radius: 999px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            display: inline-block;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(99, 102, 241, 0.3);
        }

        .btn:active {
            transform: translateY(0);
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                120deg,
                transparent,
                rgba(255, 255, 255, 0.2),
                transparent
            );
            transition: 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .success .icon::before {
            content: "✓";
            font-size: 5rem;
            background: linear-gradient(45deg, #34D399, #10B981);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .error .icon::before {
            content: "×";
            font-size: 5rem;
            background: linear-gradient(45deg, #EF4444, #DC2626);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        /* Decorative elements */
        .particles {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }

        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            pointer-events: none;
        }

        @media (max-width: 768px) {
            .status-container {
                padding: 3rem 2rem;
            }

            h1 {
                font-size: 2rem;
            }

            .icon {
                width: 120px;
                height: 120px;
            }
        }
    </style>
</head>
<body>
    
    <!-- Error Page -->
    <div class="status-container error" style="display: ${pageType == 'error' ? 'block' : 'none'}">
        <div class="particles"></div>
        <div class="icon"></div>
        <h1>Oops! Hold On...</h1>
        <p>We've encountered a small hiccup while processing your request. Don't worry - these things happen! Let's try again.</p>
        <a href="home.jsp" class="btn">Try Again</a>
    </div>

    <script>
        // Add animated particles
        function createParticles() {
            const containers = document.querySelectorAll('.particles');
            containers.forEach(container => {
                for (let i = 0; i < 20; i++) {
                    const particle = document.createElement('div');
                    particle.className = 'particle';
                    const size = Math.random() * 5 + 2;
                    particle.style.width = size + 'px';
                    particle.style.height = size + 'px';
                    particle.style.left = Math.random() * 100 + '%';
                    particle.style.top = Math.random() * 100 + '%';
                    particle.style.animation = `floating ${Math.random() * 3 + 2}s linear infinite`;
                    container.appendChild(particle);
                }
            });
        }

        document.addEventListener('DOMContentLoaded', createParticles);
    </script>
</body>
</html>