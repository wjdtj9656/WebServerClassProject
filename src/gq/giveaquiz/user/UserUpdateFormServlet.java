package gq.giveaquiz.user;

import java.io.IOException;
import java.sql.SQLException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/updateform")
public class UserUpdateFormServlet extends HttpServlet {
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object object = session.getAttribute(LoginServlet.SESSION_USER_ID);
        
        if(object == null){
            resp.sendRedirect("/");
            return;
        }
        String userId = (String)object;
        System.out.println("User Id : " + userId);
        UserDAO userDAO = new UserDAO();
        try {
            User user = userDAO.findByUserId(userId);
            req.setAttribute("user", user);
            RequestDispatcher rd = req.getRequestDispatcher("/user_update.jsp");
            rd.forward(req, resp);
        } catch (SQLException e) {
        }
    }
}
