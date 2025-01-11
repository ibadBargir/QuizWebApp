package testing.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import testing.dbConnection.DBConnection;
import testing.model.Users;

public class UserDAO {
	
	private Connection connection;

    // Constructor to accept a Connection
    public UserDAO(Connection connection) {
        this.connection = connection;
    }

	// Check if a user with the given email exists
	public boolean userExists(String email) throws ClassNotFoundException {
		boolean exists = false;
		String sql = "SELECT COUNT(*) FROM userregister WHERE email = ?";

		// Load the JDBC driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

			preparedStatement.setString(1, email);

			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				exists = resultSet.getInt(1) > 0; // Check if user exists
			}
		} catch (Exception e) {
			e.printStackTrace(); // Log any exceptions for debugging
		}

		return exists;
	}

	// Register a new user
	public boolean registerUser(Users user) throws ClassNotFoundException {
		boolean result = false;
		String sql = "INSERT INTO userregister (anumber, fname, email, pnumber, pswd) VALUES (?, ?, ?, ?, ?)";

		// Load the JDBC driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

			preparedStatement.setString(1, user.getAnumber());
			preparedStatement.setString(2, user.getFname());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setLong(4, user.getPnumber());
			preparedStatement.setString(5, user.getPswd());

			int rowsInserted = preparedStatement.executeUpdate();
			result = rowsInserted > 0;
		} catch (Exception e) {
			e.printStackTrace(); // Log any exceptions for debugging
		}

		return result;
	}

	// Validate user credentials for login
	public Users validateUser(String email, String pswd) {
		String sql = "SELECT * FROM userregister WHERE email = ? AND pswd = ?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

			preparedStatement.setString(1, email);
			preparedStatement.setString(2, pswd);

			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				if (resultSet.next()) {
					Users user = new Users();
					user.setId(resultSet.getInt("id")); // Retrieve ID
					user.setAnumber(resultSet.getString("anumber")); // Retrieve admission number
					user.setFname(resultSet.getString("fname")); // Retrieve username
					user.setEmail(resultSet.getString("email")); // Retrieve email
					user.setPnumber(resultSet.getLong("pnumber")); // Retrieve phone number
					user.setPswd(resultSet.getString("pswd")); // Retrieve password
					return user;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// Add user to the database
	public boolean addUser(Users user) {
	    boolean result = false; // Default result is false
	    String sql = "INSERT INTO userregister (anumber, fname, email, pnumber, pswd) VALUES (?, ?, ?, ?, ?)";

	    try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
	        // Set the parameters for the query
	        statement.setString(1, user.getAnumber());
	        statement.setString(2, user.getFname());
	        statement.setString(3, user.getEmail());
	        statement.setLong(4, user.getPnumber()); // Ensure this matches the database column type
	        statement.setString(5, user.getPswd());

	        // Execute the update and check affected rows
	        int rowsAffected = statement.executeUpdate();
	        if (rowsAffected > 0) {
	            result = true;

	            // Retrieve the generated id (if needed)
	            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
	                if (generatedKeys.next()) {
	                    long generatedId = generatedKeys.getLong(1);
	                    System.out.println("User added with ID: " + generatedId); // Optional logging
	                }
	            }
	        }

	    } catch (SQLException e) {
	        System.err.println("Error occurred while adding user: " + e.getMessage());
	        e.printStackTrace(); // Print stack trace for debugging
	    }
	    return result; // Return the result
	}



	public List<Users> getAllUsers() {
	    List<Users> list = new ArrayList<>();

	    Users users = null;
	    String sql = "SELECT * FROM userregister";
	    
	    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	         
	        	users = new Users();
	            users.setId(rs.getInt(1));         // Assuming ID is in the first column
	            users.setAnumber(rs.getString(2)); // Assuming 'anumber' is the second column
	            users.setFname(rs.getString(3));   // Assuming 'fname' is the third column
	            users.setEmail(rs.getString(4));   // Assuming 'email' is the fourth column
	            users.setPnumber(rs.getLong(5));   // Assuming 'pnumber' is the fifth column
	            users.setPswd(rs.getString(6));    // Assuming 'pswd' is the sixth column

	           
	            list.add(users);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}




	public Users getUserById(int id) {
		Users user = null;

		String sql = "SELECT * FROM userregister WHERE id = ?";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

			preparedStatement.setInt(1, id);

			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				user = new Users();

				user.setId(rs.getInt(1));
				user.setAnumber(rs.getString(2));
				user.setFname(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setPnumber(rs.getLong(5));
				user.setPswd(rs.getString(6));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean updateUser(Users users) {
		boolean f = false;

		String sql = "update userregister set anumber=?, fname=?, email=?, pnumber=?, pswd=? WHERE id=?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

			preparedStatement.setString(1, users.getAnumber());
			preparedStatement.setString(2, users.getFname());
			preparedStatement.setString(3, users.getEmail());
			preparedStatement.setLong(4, users.getPnumber());
			preparedStatement.setString(5, users.getPswd());
			preparedStatement.setInt(6, users.getId());

			int i = preparedStatement.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return f;

	}

	public boolean deleteUsers(int id) {

		boolean f = false;

		String sql = "DELETE FROM userregister WHERE id=?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

			preparedStatement.setInt(1, id);

			int i = preparedStatement.executeUpdate();
			if (i == 1) {

				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}
}
