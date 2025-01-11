package testing.filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/quiz.jsp", "/quizResult.jsp", "/submitQuiz", "/quizQuestion", "/quizList"})  // Add other protected pages here
public class AuthenticationFilter implements Filter {

    // Initialize filter (optional)
    public void init(FilterConfig filterConfig) throws ServletException {
        // You can initialize resources here if needed
    }

    // Implement the filtering logic
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        // Cast to HttpServletRequest and HttpServletResponse to work with session
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Get the current session (don't create a new one if it doesn't exist)
        HttpSession session = httpRequest.getSession(false);

        // Debug log
        System.out.println("AuthenticationFilter - Checking session");

        // Check if the session exists and if the "user" attribute is present
        if (session == null || session.getAttribute("user") == null) {
            // No valid session or "user" attribute, redirect to login page
            System.out.println("AuthenticationFilter - No valid session found, redirecting to login");
            httpResponse.sendRedirect("login.jsp");
        } else {
            // Valid session found, allow the request to proceed
            System.out.println("AuthenticationFilter - Valid session found, proceeding");
            chain.doFilter(request, response);
        }
    }

    // Clean up resources when filter is destroyed (optional)
    public void destroy() {
        // Release any resources if needed (optional)
    }
}
