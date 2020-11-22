package gq.giveaquiz.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import gq.giveaquiz.user.PasswordMismatchException;
import gq.giveaquiz.user.User;
import gq.giveaquiz.user.UserNotFoundException;

@WebServlet("/user/login")
public class LoginServlet extends HttpServlet {
	public static final String SESSION_USER_ID = "userId";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		try {
			User.login(userId, password);
			HttpSession session = request.getSession();
			session.setAttribute(SESSION_USER_ID, userId);
			response.sendRedirect("/");
		} catch (UserNotFoundException e) {
			forwardJSP(request, response, "�������� �ʴ� ����� �Դϴ�. �ٽ� �α����ϼ���.");
		} catch (PasswordMismatchException e) {
			forwardJSP(request, response, "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �α����ϼ���.");
		}
	}

	private void forwardJSP(HttpServletRequest request,
			HttpServletResponse response, String errorMessage) throws ServletException, IOException {
		request.setAttribute("errorMessage", errorMessage);
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		rd.forward(request, response);
	}
}