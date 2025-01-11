<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us - Quiz WebApp</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<style>
:root {
	--primary-gradient: linear-gradient(135deg, #1a1a3e 0%, #2a1b3d 100%);
	--accent-color: #ffc107;
	--text-color: #f5f5f5;
	--button-radius: 30px;
	--transition: all 0.3s ease;
}

body {
	margin: 0;
	font-family: 'Poppins', sans-serif;
	background: var(--primary-gradient);
	color: var(--text-color);
	margin-top: 80px;
	line-height: 1.6;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0.8rem 4rem;
	background: linear-gradient(135deg, #303c5c 0%, #2d3754 100%);
	box-shadow: 0 4px 6px rgba(0, 0, 0, 1);
	backdrop-filter: blur(10px);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	width: 100%;
	box-sizing: border-box;
	z-index: 1000;
	height: 80px;
}

.navbar>div {
	display: flex;
	align-items: center;
	gap: 2rem;
}

.navbar a {
	color: var(--text-color);
	text-decoration: none;
	font-weight: 600;
	transition: var(--transition);
	position: relative;
	padding: 0.5rem 0;
	font-size: 0.95rem;
}

.btn {
	background-color: var(--accent-color);
	color: #333;
	border: none;
	border-radius: var(--button-radius);
	padding: 0.8rem 1.8rem;
	font-size: 0.95rem;
	font-weight: 600;
	cursor: pointer;
	transition: var(--transition);
	box-shadow: 0 4px 15px rgba(255, 193, 7, 0.2);
}

.main-container {
	max-width: 1200px;
	margin: 1rem auto;
	padding: 1rem;
	display: grid;
	grid-template-columns: 3fr 2fr;
	gap: 1.5rem;
}

.contact-header {
	grid-column: 1/-1;
	text-align: center;
	margin-bottom: 1.5rem;
}

.contact-header h1 {
	font-size: 2.5rem;
	margin-bottom: 0.5rem;
}

.left-section, .right-section {
	background: rgba(26, 26, 62, 0.98);
	border-radius: 15px;
	padding: 1.5rem;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
}

.contact-info {
	background: #2a1b3d;
	padding: 1.5rem;
	border-radius: 10px;
	margin-bottom: 1.5rem;
}

.info-item {
	margin-bottom: 1rem;
	position: relative;
	padding-left: 1.8rem;
}

.info-item i {
	position: absolute;
	left: 0;
	top: 0.3rem;
	color: var(--accent-color);
	font-size: 1rem;
}

.info-item h3 {
	font-size: 1rem;
	margin-bottom: 0.3rem;
	color: var(--accent-color);
}

.info-item p {
	font-size: 0.9rem;
	margin: 0;
}

.contact-form {
	background: #2a1b3d;
	padding: 1.5rem;
	border-radius: 10px;
}

.form-group {
	margin-bottom: 1rem;
}

.form-group label {
	display: block;
	margin-bottom: 0.4rem;
	color: var(--accent-color);
	font-weight: 600;
	font-size: 0.9rem;
}

.form-group input, .form-group textarea {
	width: 100%;
	padding: 0.8rem;
	background: rgba(26, 26, 62, 0.98);
	border: 2px solid #3c3c6b;
	border-radius: 8px;
	color: var(--text-color);
	font-size: 0.9rem;
}

.form-group textarea {
	height: 100px;
	resize: vertical;
}

.map-container {
	background: #2a1b3d;
	padding: 1.5rem;
	border-radius: 10px;
	height: 95%;
}

.map-header {
	margin-bottom: 1rem;
}

.map-header h2 {
	font-size: 1.5rem;
	margin: 0 0 0.3rem 0;
	color: var(--accent-color);
}

.map-header p {
	font-size: 0.9rem;
	margin: 0;
	color: #9597ed;
}

.map-frame {
	width: 100%;
	height: 300px; /* Reduced height */
	border-radius: 8px;
	overflow: hidden;
}

.map-frame iframe {
	width: 100%;
	height: 100%;
	border: none;
}

.social-links {
	display: flex;
	gap: 1rem;
	margin-top: 1rem;
}

.social-links a {
	color: var(--accent-color);
	font-size: 1.2rem;
	transition: var(--transition);
}

footer {
	grid-column: 1/-1;
	padding: 1.5rem;
	background-color: rgba(26, 26, 62, 0.98);
	color: #fff;
	text-align: center;
	border-radius: 10px;
	margin-top: 1rem;
	font-size: 0.9rem;
}

@media screen and (max-width: 992px) {
	.main-container {
		grid-template-columns: 1fr;
	}
	.map-frame {
		height: 250px;
	}
}

@media screen and (max-width: 768px) {
	.navbar {
		padding: 0.8rem;
	}
	.navbar>div {
		gap: 0.8rem;
	}
	.contact-header h1 {
		font-size: 2rem;
	}
	.main-container {
		padding: 0.8rem;
	}
}

.rating-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-top: 50px;
}

.rating-box {
	background: linear-gradient(135deg, #1a1f2c 0%, #2d3754 100%);
	padding: 2rem;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.stars {
	font-size: 2.5rem;
	cursor: pointer;
	color: #ddd;
}

.stars .fas {
	color: #ffd700;
}

.feedback-text {
	margin-top: 1rem;
	min-height: 24px;
}

.submit-btn {
	margin-top: 1rem;
	padding: 0.5rem 2rem;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.submit-btn:hover {
	background-color: #45a049;
}

.btn:hover {
	background-color: #ffd740;
	transform: translateY(-5px);
}

.navbar a:hover {
	color: var(--accent-color);
}
</style>
</head>
<body>
	<nav class="navbar">
		<div>
			<a href="home.jsp">Home</a> <a href="about.jsp">About</a> <a
				href="contact.jsp">Contact</a>
		</div>
		<div class="navbar-buttons">
			<a href="login.jsp">
				<button class="btn">Login</button>
			</a> <a href="register.jsp">
				<button class="btn">Register</button>
			</a>

		</div>
	</nav>

	<div class="main-container">
		<div class="contact-header">
			<h1>Get in Touch</h1>
			<p>Have questions? We'd love to hear from you.</p>
		</div>

		<div class="left-section">
			<div class="contact-info">
				<div class="info-item">
					<i class="fas fa-map-marker-alt"></i>
					<h3>Address</h3>
					<p>123 Quiz Street, Mumbai, Maharashtra - 400001</p>
				</div>

				<div class="info-item">
					<i class="fas fa-phone"></i>
					<h3>Phone</h3>
					<p>+91 (22) 1234-5678</p>
				</div>

				<div class="info-item">
					<i class="fas fa-envelope"></i>
					<h3>Email</h3>
					<p>info@quizwebapp.com</p>
				</div>

				<div class="social-links">
					<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
						class="fab fa-twitter"></i></a> <a href="#"><i
						class="fab fa-instagram"></i></a>
				</div>
			</div>

			<div class="contact-form">
				<form>
					<div class="form-group">
						<label for="name">Full Name</label> <input type="text" id="name"
							name="name" required placeholder="Enter your full name">
					</div>

					<div class="form-group">
						<label for="email">Email Address</label> <input type="email"
							id="email" name="email" required
							placeholder="Enter your email address">
					</div>

					<div class="form-group">
						<label for="subject">Subject</label> <input type="text"
							id="subject" name="subject" placeholder="Enter message subject">
					</div>

					<div class="form-group">
						<label for="message">Message</label>
						<textarea id="message" name="message" required
							placeholder="Enter your message"></textarea>
					</div>

					<button type="submit" class="btn">Send Message</button>
				</form>
			</div>
		</div>

		<div class="right-section">
			<div class="map-container">
				<div class="map-header">
					<h2>Find Us</h2>
					<p>Visit our office in Mumbai</p>
				</div>
				<div class="map-frame">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d241317.11609823277!2d72.74109995709657!3d19.08219783958221!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c6306644edc1%3A0x5da4ed8f8d648c69!2sMumbai%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1651913800607!5m2!1sen!2sin"
						allowfullscreen="" loading="lazy"> </iframe>
				</div>


				<div class="rating-container">
					<div class="rating-box">
						<h2>Rate Your Experience</h2>
						<p>How satisfied are you with our service?</p>
						<div class="stars" id="stars">
							<i class="far fa-star" data-rating="1"></i> <i
								class="far fa-star" data-rating="2"></i> <i class="far fa-star"
								data-rating="3"></i> <i class="far fa-star" data-rating="4"></i>
							<i class="far fa-star" data-rating="5"></i>
						</div>
						<div class="feedback-text" id="feedback"></div>
						<button class="submit-btn" id="submit-rating">Submit
							Rating</button>
					</div>
				</div>
			</div>



		</div>


	</div>
	<jsp:include page="footer.jsp" />
	<script>
        const stars = document.querySelectorAll('.stars i');
        const feedback = document.getElementById('feedback');
        const submitBtn = document.getElementById('submit-rating');
        let rating = 0;

        const feedbackMessages = {
            1: "We're sorry to hear that. We'll try to do better!",
            2: "Not good enough? We'll work on improving!",
            3: "Thanks for your feedback. We'll keep working hard!",
            4: "Glad you had a good experience!",
            5: "Awesome! Thank you for your amazing rating!"
        };

        stars.forEach(star => {
            star.addEventListener('mouseover', function() {
                const currentRating = this.getAttribute('data-rating');
                updateStars(currentRating);
            });

            star.addEventListener('mouseout', function() {
                updateStars(rating);
            });

            star.addEventListener('click', function() {
                rating = this.getAttribute('data-rating');
                updateStars(rating);
                feedback.textContent = feedbackMessages[rating];
            });
        });

        function updateStars(count) {
            stars.forEach(star => {
                const starRating = star.getAttribute('data-rating');
                if (starRating <= count) {
                    star.classList.remove('far');
                    star.classList.add('fas');
                } else {
                    star.classList.remove('fas');
                    star.classList.add('far');
                }
            });
        }

        submitBtn.addEventListener('click', function() {
            if (rating === 0) {
                feedback.textContent = "Please select a rating before submitting!";
                return;
            }
            // Here you can add code to send the rating to your server
            alert(`Thank you for your ${rating}-star rating!`);
        });
    </script>
</body>
</html>