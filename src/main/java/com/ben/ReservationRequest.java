package com.ben;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReservationRequest
 */
@WebServlet("/ReservationRequest")
public class ReservationRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReservationRequest() {
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
		String id = request.getParameter("id");
		System.out.println(id);
		String college = request.getParameter("college");
		String court = request.getParameter("court");
		String duration = request.getParameter("duration");
		String number = request.getParameter("number");
		CheckRedundant check = new CheckRedundant(college, court, duration);
		try {
			int isReserved;
			isReserved = check.checkRedundant(MySQL.getInstance().getSQLConnection());
			if (isReserved == 0) {
				AddReservation add = new AddReservation(id, number, college, court, duration);
				add.addReservation(MySQL.getInstance().getSQLConnection());
				response.sendRedirect("ViewReservation.jsp?id=" + id);
			} else
				response.sendRedirect("ReservationFailed.jsp?id=" + id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
