package testing.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import testing.dao.UserDAO;
import testing.model.Users;

@WebServlet("/registerr")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String anumber = request.getParameter("anumber");
			String fname = request.getParameter("fname");
			String email = request.getParameter("email");
			long pnumber = Long.parseLong(request.getParameter("pnumber"));
			String pswd = request.getParameter("pswd");

			Users users = new Users();
			users.setAnumber(anumber);
			users.setFname(fname);
			users.setEmail(email);
			users.setPnumber(pnumber);
			users.setPswd(pswd);

			System.out.println(anumber);
			System.out.println(fname);
			System.out.println(email);
			System.out.println(pnumber);
			System.out.println(pswd);

			UserDAO userdao = new UserDAO(null);

			 
			if (userdao.userExists(email)) {
				
				request.setAttribute("errorMessage", "Sorry, you are already registered with this email and password.");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
				
				dispatcher.forward(request, response);
				return; 
			}

			
			boolean isInsert = userdao.registerUser(users);

			if (isInsert) {
				
				request.setAttribute("fname", fname);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
				
				dispatcher.forward(request, response);
			} else {
				response.sendRedirect("error.jsp");
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			
			response.sendRedirect("error.jsp");
		}
	}
}
