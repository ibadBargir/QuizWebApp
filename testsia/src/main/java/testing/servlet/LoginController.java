package testing.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import testing.dao.UserDAO;
import testing.model.Users;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private UserDAO userDAO;
    
    public LoginController() {
        super();
        userDAO = new UserDAO(null);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String pswd = request.getParameter("password");
            
            // Debug logs
            System.out.println("Login attempt - Email: " + email);
            
            Users user = userDAO.validateUser(email, pswd);
            
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getId());
                session.setAttribute("fname", user.getFname());
                
                // Debug logs
                System.out.println("Login successful for user ID: " + user.getId());
                System.out.println("Session ID: " + session.getId());
                
                response.sendRedirect("quizList");
            } else {
                // Debug logs
                System.out.println("Login failed - Invalid credentials");
                
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Debug logs
            System.out.println("Error in LoginController: " + e.getMessage());
            e.printStackTrace();
            
            request.setAttribute("errorMessage", "An error occurred during login");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}