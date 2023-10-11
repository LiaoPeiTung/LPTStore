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
import tw.com.lptstore.model.bean.Competition;
import tw.com.lptstore.model.dao.CompetitionDAO;
import tw.com.lptstore.util.ConnectionFactory;

@WebServlet("/UpdateCompetition.do")
@MultipartConfig
public class UpdateCompetition extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int cID = Integer.parseInt(request.getParameter("cID"));

		String cName = request.getParameter("cName");

		int cFee = Integer.parseInt(request.getParameter("cFee"));

		String cTime = request.getParameter("cTime");

		String cReward = request.getParameter("cReward");

		Competition c = new Competition(cID, cName, cFee, cTime, cReward);

		try (Connection conn = ConnectionFactory.getConnection()) {

			CompetitionDAO cDao = new CompetitionDAO(conn);
			cDao.updateCompetition(c);
			;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.setContentType("text/html;charset=UTF-8");
		response.sendRedirect("competition");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
