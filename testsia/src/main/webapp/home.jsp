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
      background: linear-gradient(135deg, #1a1f2c 0%, #2d3754 100%);
      font-family: 'Poppins', sans-serif;
      margin-top: 80px; /* for fixed navbar */
      color: var(--text-color);
    
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
  box-shadow: 0 4px 6px rgba(0, 0, 0, 1);
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

.navbar  a {
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

/* navbar on scroll down*/
.navbar.hidden {
  transform: translateY(-100%);
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
      animation: fadeInOut 2s infinite;
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
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.9);
  transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
  color: #f5f5f5;
  
}

.feature:hover {
  transform: translateY(-10px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.4);
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

    .testimonials {
  text-align: center;
  margin: 3rem 0;
}

.testimonials h2 {
  font-size: 2.5rem;
  color: #f5f5f5;
  margin-bottom: 2rem;
}

.testimonial {
  max-width: 300px;
  padding: 1.5rem;
  background-color: #2b045e7b;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  color: #fff;
  margin: 1rem;
}

/* Lifts the testimonial */
.testimonial:hover {
  transform: translateY(-10px); 
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); 
}

/* styling for the text inside the testimonial */
.testimonial p {
  font-size: 1.2rem;
  color: #9597ed; 
}

/*  responsive */
@media (max-width: 768px) {
  .testimonials .testimonial {
    max-width: 100%;
  }
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

    a:hover 
    {
     text-decoration: underline;
    }
  </style>
</head>
<body>
  <nav class="navbar">
 <!--   <a href="/adminlogin" style="text-decoration: none;  ">
  <h2>WebApp</h2>
</a> -->

    <div>
   
      <a href="home.jsp">Home</a>
      <a href="about.jsp">About</a>
      <a href="contact.jsp">Contact</a>
      
    </div>
    <div class="navbar-buttons">
    <a href="login.jsp">
    <button class="btn">Login</button>
</a>
<a href="registration.jsp">
    <button class="btn">Register</button>
</a>

    </div>
  </nav>

  <div class="hero">
    <div class="carousel">
      <img src="images/1.jpeg" alt="Hero Image">
      <img src="images/2.jpeg" alt="Hero Image 2">
      <img src="images/1.jpeg" alt="Hero Image 3">
    </div>
    <h1>Welcome to Quiz Webapp</h1>
    <p>Test your knowledge and improve your skills.</p>
    <div class="hero-cta">
    <a href="login.jsp">
      <button class="btn">Start for Free</button>
      </a>
      <a href="registration.jsp">
      <button class="btn">Join Now</button>
      </a>
    </div>
  </div>

  <div class="features">
    <div class="feature">
      <h3>Programming Languages</h3>
      <p>Explore quizzes for various programming languages.</p>
    </div>
    <div class="feature">
      <h3>Tech Fundamentals</h3>
      <p>Test your understanding of core tech concepts.</p>
    </div>
    <div class="feature">
      <h3>Coding Challenges</h3>
      <p>Solve programming problems and sharpen your skills.</p>
    </div>
  </div>
  

  <div class="call-to-action">
    <h2>Why Choose Quiz Webapp?</h2>
    <p>
      Join a community of learners and developers improving their skills daily. From coding quizzes to tech challenges, we've got something for everyone. Start your journey now!
    </p>
    <button class="btn">
      <a href="about.jsp" style="text-decoration: none; color: inherit;">Learn More</a>
    </button> 
   </div>
  <div class="testimonials">
    <h2>What Our Users Say</h2>
    <div style="display: flex; justify-content: center; gap: 2rem; margin-top: 2rem; flex-wrap: wrap;">
      <div class="testimonial">
        <p>"I highly recommend this app for anyone looking to sharpen their skills and stay ahead."</p>
        <p>- <a href="https://github.com/ibadBargir/">Ibad Bargir</a></p>
      </div>
      <div class="testimonial">
        <p>"I love the coding challenges. They keep me motivated to learn something new every day."</p>
        <p>- <a href="https://github.com/Saima223">Saima Siddiqui</a></p>
      </div>
      <div class="testimonial">
        <p>"A fantastic tool for anyone looking to improve their knowledge."</p>
        <p>- <a href="https://github.com/SakshiArvindYadav"> Sakshi Yadav</a></p>
      </div>
      <div class="testimonial">
        <p>"A comprehensive and user-friendly app that keeps me motivated to learn consistently."</p>
        <p>- <a href="https://github.com/Rabina-Vishwakarma">Rabina Vishwakarma</a> </p>
      </div>
    </div>
  </div>
  
   <jsp:include page="footer.jsp" />
  
</body>
</html>