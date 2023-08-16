package user.controller;

import config.Base64Config;
import user.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/change-password")
public class ChangePasswordServlet extends HttpServlet {

    private final UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String password = encode(req.getParameter("newPassword"));

        HttpSession session = req.getSession();
        String userName = (String) session.getAttribute("userName");

        userDao.updatePassword(password, userName);
    }

    public String encode(String password) {
        return (new Base64Config().encode(password));
    }
}
