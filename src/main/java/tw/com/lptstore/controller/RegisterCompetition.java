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

import tw.com.lptstore.model.bean.Register;
import tw.com.lptstore.model.dao.RegisterDAO;
import tw.com.lptstore.util.ConnectionFactory;

@WebServlet("/RegisterCompetition.do")
@MultipartConfig
public class RegisterCompetition extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int mID = Integer.parseInt(request.getParameter("mID"));
		int cID = Integer.parseInt(request.getParameter("cID"));

		Register r = new Register(mID, cID);
		
		try (Connection conn = ConnectionFactory.getConnection()) {

			RegisterDAO rDao = new RegisterDAO(conn);
			rDao.registerCompetition(r);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("mID", mID);
		request.getRequestDispatcher("profile")
		.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
