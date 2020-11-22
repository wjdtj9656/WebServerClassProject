package gq.giveaquiz.user;

import java.io.IOException;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/update")
public class UserUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
 
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String name = request.getParameter("name");

        
        User user = new User(userId, password, name);
        UserDAO userDAO = new UserDAO();
        try {
            userDAO.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("/");
    }
}
