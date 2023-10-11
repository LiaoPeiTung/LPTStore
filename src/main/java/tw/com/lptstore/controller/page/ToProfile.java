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
import tw.com.lptstore.model.bean.Member;
import tw.com.lptstore.model.dao.CompetitionDAO;
import tw.com.lptstore.model.dao.MemberDAO;
import tw.com.lptstore.util.ConnectionFactory;


@WebServlet("/profile")
public class ToProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int mID = Integer.parseInt(request.getParameter("mID"));
//		Member m = (Member) request.getSession().getAttribute("loggedInMember");

		try (Connection conn = ConnectionFactory.getConnection()) {

			CompetitionDAO cDao = new CompetitionDAO(conn);

			List<Competition> cList = cDao.findCompetitionBymID(mID);
			
			request.setAttribute("cList", cList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		request.getRequestDispatcher("view/profile.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
