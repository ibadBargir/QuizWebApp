<!-- footer.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.footer {
    background: linear-gradient(to right, #0a0f2c, #1a0f2c);
    color: #ffffff;
    padding: 3rem 0 1rem 0;
    font-family: Arial, sans-serif;
}

.footer-content {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    padding: 0 2rem;
}

.footer-column {
    flex: 1;
    margin-right: 2rem;
}

.footer-column:last-child {
    margin-right: 0;
}

.logo-img {
    height: 40px;
    margin-bottom: 1rem;
}

.description {
    color: #cccccc;
    font-size: 0.9rem;
    line-height: 1.5;
}

h3 {
    color: #ffffff;
    margin-bottom: 1.5rem;
    font-size: 1.1rem;
    position: relative;
}

h3::after {
    content: '';
    position: absolute;
    left: 42%;
    bottom: -0.5rem;
    width: 2.5rem;
    border-radius: 30%;
    height: 3px;
    background-color: #ffffff;
}

.office-details p {
    color: #cccccc;
    margin-bottom: 0.5rem;
    font-size: 0.9rem;
}

.footer-links {
    list-style: none;
    padding: 0;
}

.footer-links li {
    margin-bottom: 0.8rem;
}

.footer-links a {
    color: #cccccc;
    text-decoration: none;
    font-size: 0.9rem;
    transition: color 0.3s ease;
}

.footer-links a:hover {
    color: #ffffff;
}

.newsletter-form .input-group {
    display: flex;
    margin-bottom: 1.5rem;
}

.newsletter-form input {
    flex: 1;
    padding: 1.3rem;
    background: rgba(255, 255, 255, 0.1);
    border: none;
    color: #ffffff;
    border-radius: 4px 0 0 4px;
}

.newsletter-form input::placeholder {
    color: #cccccc;
}

.submit-btn {
    background: none;
    border: none;
    color: #ffffff;
    padding: 0 1rem;
    cursor: pointer;
    font-size: 1.2rem;
    margin: 7px;
    transition: color 0.5s ease;
}

.submit-btn:hover {
    color: #a8a8ff;
}

.social-icons {
    display: flex;
    gap: 1rem;
}

.social-icon {
    background: rgba(255, 255, 255, 0.1);
    width: 35px;
    height: 35px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #ffffff;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.social-icon:hover {
    background: rgba(255, 255, 255, 0.2);
}

.footer-bottom {
    text-align: center;
    margin-top: 3rem;
    padding-top: 1rem;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    color: #cccccc;
    font-size: 0.9rem;
}

@media (max-width: 768px) {
    .footer-content {
        flex-direction: column;
    }
    
    .footer-column {
        margin-right: 0;
        margin-bottom: 2rem;
    }
}

</style>
<footer class="footer">
    <div class="footer-content">
        <!-- Logo and Description Column -->
        <div class="footer-column">
            <h3>Developed & designed by</h3>
            <ul class="footer-links">
                <li><a href="https://github.com/ibadbargir" style="color: white;"><span>Ibad Bargir</span></a></li>
                <li><a href="https://github.com/Saima223"  style="color: white;"><span>Saima Siddiqui</span></a></li>
                <li><a href="https://github.com/Rabina-Vishwakarma"  style="color: white;"><span>Rabina </span></a></li>
                <li><a href="https://github.com/SakshiArvindYadav"  style="color: white;"><span>Sakshi</span></a></li>
            </ul>
        </div>

        <!-- Office Column -->
        <div class="footer-column">
            <h3>Office</h3>
            <div class="office-details">
                <p>ITPL Road</p>
                <p>Whitefield, Bangalore</p>
                <p>Karnataka, PIN 560066,</p>
                <p>India</p>
                <p class="email">avinashdm@outlook.com</p>
                <p class="phone">+91 - 0123456789</p>
            </div>
        </div>

        <!-- Links Column -->
        <div class="footer-column">
            <h3>Links</h3>
            <ul class="footer-links">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="error.jsp">Services</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="home.jsp">Features</a></li>
                <li><a href="contact.jsp">Contacts</a></li>
            </ul>
        </div>

        <!-- Newsletter Column -->
        <div class="footer-column">
            <h3>Newsletter</h3>
            <div class="newsletter-form">
                <div class="input-group">
                    <input type="email" placeholder="Enter your email id">
                    <button type="submit" class="submit-btn">→</button>
                </div>
            </div>
            <div class="social-icons">
                <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-whatsapp"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-pinterest-p"></i></a>
            </div>
        </div>
    </div>
    
    <div class="footer-bottom">
        <p>QuizWeb © 2024 - All Rights Reserved</p>
    </div>
</footer>

