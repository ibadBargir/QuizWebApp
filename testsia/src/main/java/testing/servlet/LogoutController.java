package testing.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Debug logs
            System.out.println("Logout attempt");
            
            HttpSession session = request.getSession(false);
            if (session != null) {
                // Debug logs
                System.out.println("Session found - ID: " + session.getId());
                System.out.println("User ID before logout: " + session.getAttribute("userId"));
                
                session.removeAttribute("user");
                session.removeAttribute("userId");
                session.invalidate();
                
                // Debug logs
                System.out.println("Session invalidated successfully");
            } else {
                // Debug logs
                System.out.println("No active session found");
            }
            
            // Redirect to login page
            response.sendRedirect("login.jsp");
            
        } catch (Exception e) {
            // Debug logs
            System.out.println("Error in LogoutServlet: " + e.getMessage());
            e.printStackTrace();
            
            response.sendRedirect("login.jsp");
        }
    }
}