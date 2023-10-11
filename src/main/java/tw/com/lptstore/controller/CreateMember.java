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
import tw.com.lptstore.model.bean.Member;
import tw.com.lptstore.model.dao.MemberDAO;
import tw.com.lptstore.util.ConnectionFactory;

@WebServlet("/CreateMember.do")
@MultipartConfig
public class CreateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String account = request.getParameter("account");

		String password = request.getParameter("password");

		String level = request.getParameter("level");

		String mName = request.getParameter("mName");

		String mPhone = request.getParameter("mPhone");

		
		Member m = new Member(account, password, level, mName, mPhone);

		try (Connection conn = ConnectionFactory.getConnection()) {

			MemberDAO mDao = new MemberDAO(conn);
			mDao.insertMember(m);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect("/LPTStore/login");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
