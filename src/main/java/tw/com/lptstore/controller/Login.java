package tw.com.lptstore.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.com.lptstore.model.bean.Member;
import tw.com.lptstore.model.dao.MemberDAO;
import tw.com.lptstore.util.ConnectionFactory;

@WebServlet("/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String account = request.getParameter("account");
		String password = request.getParameter("password");

		try (Connection conn = ConnectionFactory.getConnection()) {

			MemberDAO mDAO = new MemberDAO(conn);

			Member m = mDAO.findMemberByAccountAndPassword(account, password);

			if (m == null) {
				request.setAttribute("message", "登入失敗，帳號或密碼錯誤");
				request.getRequestDispatcher("login").forward(request, response);
				return;
			}

			request.getSession().setAttribute("loggedInMember", m);
			response.sendRedirect("index");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
