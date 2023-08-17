package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.UserDao;

@WebServlet(value = "/change-teamid")
public class ChangeTeamIdServlet extends HttpServlet {
	
	private final UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String userId = req.getParameter("userId");

        userDao.updateTeamId(userId);

        res.sendRedirect(req.getHeader("referer"));
    }

}
