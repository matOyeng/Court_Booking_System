package com.ben;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String id = request.getParameter("userid");
	    String password = request.getParameter("password");
	    String role = request.getParameter("role");

	    // Check if user ID and password are provided
	    if (id.isEmpty() || password.isEmpty()) {
	        response.sendRedirect("Login.jsp?error=required"); // Redirect to login page with error parameter
	        return;
	    }

	    CheckLogin check = new CheckLogin(id, password, role);
	    MySQL mysql;
	    try {
	        int userID = check.checkLogin(MySQL.getInstance().getSQLConnection());
	        if (userID != 0) {
	            HttpSession session = request.getSession(true);
	            response.sendRedirect("Home.jsp?id=" + userID); // Logged-in page
	        } else {
	            response.sendRedirect("Login.jsp?error=incorrect"); // Redirect to login page with error parameter
	        }

	    } catch (SQLException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	}


}
