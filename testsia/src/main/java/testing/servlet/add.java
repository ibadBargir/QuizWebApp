package testing.servlet;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import testing.dao.UserDAO;
import testing.dbConnection.DBConnection;
import testing.model.Users;


@WebServlet("/add")
public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String anumber = request.getParameter("anumber");
		String fname = request.getParameter("fname");
		String email = request.getParameter("email");
		long pnumber = Long.parseLong(request.getParameter("pnumber"));
		String pswd = request.getParameter("pswd");
		Users users = new Users(0, anumber ,fname , email, pnumber, pswd);
		
		
		
		UserDAO userdao = null;
		try {
			userdao = new UserDAO(DBConnection.getConnection());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		boolean f=userdao.addUser(users);
		
		if(f) {
			
			System.out.println("Student Deatils submit Sucessfully..");
			response.sendRedirect("AdminPanels.jsp");			
		}
		else {
			
			System.err.println("Somthing Wents wrong...");
		}
		
	
		
		
		
	}
	
	}


