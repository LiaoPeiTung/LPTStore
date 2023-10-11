package tw.com.lptstore.controller.page;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.com.lptstore.model.bean.Competition;
import tw.com.lptstore.model.dao.CompetitionDAO;
import tw.com.lptstore.util.ConnectionFactory;

@WebServlet("/competition")
public class ToCompetition extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try (Connection conn = ConnectionFactory.getConnection()) {

			CompetitionDAO cDao = new CompetitionDAO(conn);

			List<Competition> cList = cDao.findAllCompetition();
			
			request.setAttribute("cList", cList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("view/competition.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
