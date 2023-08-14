package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.dao.UserDao;
import workin.dao.WorkinDao;

@WebServlet(value = "/delete-user")
public class DeleteAccountServlet extends HttpServlet {

    private final UserDao userDao = new UserDao();
    private final WorkinDao  workinDao = new WorkinDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String userName = (String) session.getAttribute("userName");

        workinDao.deleteWorkIn(userName);
        userDao.deleteUser(userName);

        res.sendRedirect("index.jsp");
    }
}
