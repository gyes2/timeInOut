package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.UserDao;

@WebServlet(value = "/checked")
public class CheckIdServlet extends HttpServlet {

    private final UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String userId = req.getParameter("userId");

        String result = "";

        int flag = userDao.existsUserId(userId);

        if(flag == 1) {
            result = "unavailable";
        }
        else if (flag == 0) {
            result = "available";
        }
        else {
            result = "db connection failed";
        }

        res.setContentType("text/html;charset=utf-8");
        res.getWriter().write(result);

    }
}
