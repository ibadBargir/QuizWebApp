<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quiz Webapp</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
  <style>
    /* Global Styles */
    :root {
      --primary-gradient: linear-gradient(135deg, #1a1a3e 0%, #2a1b3d 100%);
      --accent-color: #ffc107;
      --text-color: #f5f5f5;
      --button-radius: 30px;
    }

    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: var(--primary-gradient);
      color: var(--text-color);
       margin-top: 80px;  /* for navbar fixed */
    }

    a {
      text-decoration: none;
      color: inherit;
    }

 /* Navbar Styles */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 4rem;
  background: linear-gradient(135deg, #303c5c 0%, #2d3754 100%);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  width: 100%;
  box-sizing: border-box;
  z-index: 1000;
  transition: all 0.3s ease;
}

.navbar > div {
  display: flex;
  align-items: center;
}

.navbar a {
  color: var(--text-color);
  text-decoration: none;
  margin-right: 2.5rem;
  font-weight: 600;
  transition: color 0.3s;
  white-space: nowrap;
}

.navbar a:hover {
  color: var(--accent-color);
}

.navbar-buttons {
  display: flex;
  gap: 1.5rem;
}



/* Media Queries for Responsive Navbar */
@media screen and (max-width: 1024px) {
  .navbar {
    padding: 1rem 2rem;
  }
  
  .navbar a {
    margin-right: 1.5rem;
  }
  
  .navbar-buttons .btn {
    padding: 0.8rem 1.5rem;
  }
}

@media screen and (max-width: 768px) {
  .navbar {
    padding: 1rem;
    flex-direction: column;
    gap: 1rem;
    height: auto;
  }
  
  .navbar > div {
    width: 100%;
    justify-content: center;
  }
  
  .navbar a {
    margin-right: 1.5rem;
    font-size: 0.9rem;
  }
  
  .navbar-buttons {
    gap: 1rem;
  }
  
  .navbar-buttons .btn {
    padding: 0.6rem 1.2rem;
    font-size: 0.9rem;
  }
  
  body {
    margin-top: 120px;
  }
}

@media screen and (max-width: 480px) {
  .navbar {
    padding: 0.8rem;
  }
  
  .navbar > div:first-child {
    flex-wrap: wrap;
    justify-content: center;
    gap: 0.5rem;
  }
  
  .navbar a {
    margin-right: 1rem;
    font-size: 0.85rem;
  }
  
  .navbar-buttons {
    flex-direction: row;
    width: auto;
  }
  
  .navbar-buttons .btn {
    padding: 0.5rem 1rem;
    font-size: 0.85rem;
  }
  
  body {
    margin-top: 140px;
  }
}

/* Optional: Hide navbar on scroll down, show on scroll up */
.navbar.hidden {
  transform: translateY(-100%);
}

    .navbar-buttons {
      display: flex;
      gap: 1.5rem;
    }

    .btn {
      background-color: var(--accent-color);
      color: #333;
      border: none;
      border-radius: var(--button-radius);
      padding: 1rem 2.5rem;
      font-size: 1.1rem;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.3s;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .btn:hover {
      background-color: #ffd740;
      transform: translateY(-5px);
    }

    /* Hero Section */
    .hero {
      position: relative;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 80vh;
      text-align: center;
      overflow: hidden;
    }

    .carousel {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      display: flex;
      animation: slide 9s infinite;
    }

    .carousel img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      animation: fadeInOut 9s infinite;
    }

    .hero h1 {
      font-family: 'Playfair Display', serif;
      font-size: 5rem;
      margin-bottom: 2rem;
      font-weight: 700;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      z-index: 1;
    }

    .hero p {
      font-size: 2.5rem;
      margin-bottom: 4rem;
      font-weight: 500;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      z-index: 1;
    }

    .hero-cta {
      display: flex;
      gap: 2rem;
      z-index: 1;
    }

    .hero-cta .btn {
      font-size: 1.5rem;
      padding: 1.2rem 3rem;
      animation: pulse 2s infinite;
    }

    @keyframes fadeInOut {
      0% {
        opacity: 0;
      }
      20% {
        opacity: 1;
      }
      25% {
        opacity: 1;
      }
      45% {
        opacity: 0;
      }
      100% {
        opacity: 0;
      }
    }

    @keyframes slide {
      0% {
        transform: translateX(0);
      }
      33.33% {
        transform: translateX(-100%);
      }
      66.66% {
        transform: translateX(-200%);
      }
      100% {
        transform: translateX(0);
      }
    }

    @keyframes pulse {
      0% {
        transform: scale(1);
      }
      50% {
        transform: scale(1.1);
      }
      100% {
        transform: scale(1);
      }
    }

    /* About Section */
    .about {
      padding: 5rem 2rem;
      background: #f4f4f4;
      color: #333;
      text-align: center;
    }

    .about h2 {
      font-size: 3rem;
      margin-bottom: 2rem;
    }

    .about p {
      font-size: 1.5rem;
      line-height: 1.8;
      max-width: 800px;
      margin: 0 auto;
      margin-bottom: 2rem;
    }

    .about .about-images {
      display: flex;
      justify-content: center;
      gap: 2rem;
      margin-top: 3rem;
    }

    .about .about-image {
      max-width: 300px;
      border-radius: 15px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    .about .about-image img {
      width: 100%;
      height: auto;
    }
/*  for cards */
.features {
  display: flex;
  justify-content: space-around;
  padding: 4rem 2rem;
  text-align: center;
  background-color: #3c3c6b; 
}

.feature {
  max-width: 300px;
  padding: 2rem;
  background-color: #2a1b3d;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
  color: #f5f5f5;
  
}

.feature:hover {
  transform: translateY(-10px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
  background-color: var(--accent-color); 
}

.feature h3 {
  color: #fff;
  font-size: 1.6rem;
  margin-bottom: 1rem;
}

.feature p {
  color: #9597ed;
  font-size: 1.2rem;
}



.feature:hover {
  animation: featureHoverAnimation 0.3s ease-in-out forwards;
}

    /* Call to Action */
    .call-to-action {
      background-color: #1a1a3e;
      color: #fff;
      text-align: center;
      padding: 4rem 2rem;
    }
    .call-to-action h2 {
      font-size: 2.5rem;
      margin-bottom: 1.5rem;
    }
    .call-to-action p {
      font-size: 1.2rem;
      margin-bottom: 2rem;
      max-width: 800px;
      margin: 0 auto;
    }
    .call-to-action button {
      background-color: #ff8a00;
      color: #fff;
      border: none;
      padding: 1rem 2rem;
      font-size: 1.2rem;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    .call-to-action button:hover {
      background-color: #e07b00;
    }

    /* Footer */
    footer {
      padding: 2rem;
      background-color: #1a1a3e;
      color: #fff;
      text-align: center;
      margin-top: 4rem;
    }
    footer a {
      color: #ff8a00;
      text-decoration: none;
    }
    footer a:hover {
      text-decoration: underline;
    }
    
  </style>
</head>
<body>
  <nav class="navbar">
    <div>
      <a href="home.jsp">Home</a>
      <a href="about.jsp">About</a>
      <a href="contact.jsp">Contact</a>
    </div>
    <div class="navbar-buttons">
    <a href="login.jsp">
      <button class="btn">Login</button>
      </a>
      <button class="btn">Register</button>
    </div>
  </nav>

  <!-- Hero Section -->
  <div class="hero">
    <div class="carousel">
      <img src="images/1.jpeg" alt="Hero Image">
      <img src="images/2.jpeg" alt="Hero Image 2">
      <img src="images/1.jpeg" alt="Hero Image 3">
    </div>
    <h1>Welcome to Quiz Webapp</h1>

    <h1 style="font-size: 70px; font-weight: bold; background-image: linear-gradient(135deg, #303c5c 0%, #2d3754 100%); -webkit-background-clip: text; color: transparent;">
      About
    </h1>
    
    <div class="hero-cta">
      <button class="btn">Start for Free</button>
      <button class="btn">Join Now</button>
    </div>
  </div>

  <!-- About Section -->
  <div class="about">
    <h2 style="padding: 0; margin: 0;">About Us</h2>
    <p>We are a team of passionate developers dedicated to providing a platform that helps you test and improve your knowledge in various fields. Our mission is to offer an engaging learning experience through interactive quizzes and challenges.</p>
    <div class="about-images">
      <div class="about-image">
        <img src="images/3.png" alt="Team Image 1">
      </div>
      <div class="about-image">
        <img src="images/4.png" alt="Team Image 2">
      </div>
    </div>
  </div>

  <!-- Features Section -->
  <div class="features">
    <div class="feature">
      <h3>Interactive Quizzes</h3>
      <p>Engage with quizzes designed to challenge your knowledge and keep you learning.</p>
    </div>
    <div class="feature">
      <h3>Track Your Progress</h3>
      <p>Monitor your performance and see how you improve over time with detailed reports.</p>
    </div>
    <div class="feature">
      <h3>Multiple Categories</h3>
      <p>Explore quizzes in various categories like Science, History, Math, and more!</p>
    </div>
  </div>

  <!-- Call to Action Section -->
  <div class="call-to-action">
    <h2>Ready to get started?</h2>
    <p>Join us today and take your learning to the next level with quizzes and interactive challenges.</p>
 
    <button class="btn">
            <a href="about.jsp" style="text-decoration: none; color: inherit;">Started</a>
    </button>

  </div>

  <jsp:include page="footer.jsp" />
</body>
</html>