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

/**
 * Servlet implementation class UpdateServletUser
 */
@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        String anumber = request.getParameter("anumber");
        String fname = request.getParameter("fname");
        String email = request.getParameter("email");
        long pnumber = Long.parseLong(request.getParameter("pnumber"));
        String pswd = request.getParameter("pswd");
        int id = Integer.parseInt(request.getParameter("id"));
        
        Users users = new Users(id, anumber, fname, email, pnumber, pswd);
        
        UserDAO userdao = null;
        try {
            userdao = new UserDAO(DBConnection.getConnection());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        boolean f = userdao.updateUser(users);
        
        if(f) {
            System.out.println("Student Details submitted successfully..");
            response.sendRedirect("AdminPanels.jsp");
        } else {
            System.err.println("Something went wrong...");
            response.sendRedirect("index.jsp");
        }
    }
}
