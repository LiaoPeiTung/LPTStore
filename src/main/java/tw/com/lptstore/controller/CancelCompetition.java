package tw.com.lptstore.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tw.com.lptstore.model.dao.CompetitionDAO;
import tw.com.lptstore.util.ConnectionFactory;

@WebServlet("/CancelCompetition.do")
@MultipartConfig
public class CancelCompetition extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int cID = Integer.parseInt(request.getParameter("cID"));

		try (Connection conn = ConnectionFactory.getConnection()) {

			CompetitionDAO cDao = new CompetitionDAO(conn);
			cDao.cancelCompetitionByID(cID);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect("competition");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
