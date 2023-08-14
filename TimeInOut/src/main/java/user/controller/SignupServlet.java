package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import config.Base64Config;
import user.dao.UserDao;
import user.dto.SignupDto;

@WebServlet(value = "/signup")
public class SignupServlet extends HttpServlet {

    private final UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String userId = req.getParameter("userId");
        String password = encode(req.getParameter("password"));
        String userName = req.getParameter("userName");
        String email = req.getParameter("email");

        SignupDto signupDto = new SignupDto(userId, password, userName, email);

        boolean isSignUpSuccessful  = userDao.insertUser(signupDto);

        res.setContentType("text/html;charset=utf-8");
        if (isSignUpSuccessful) {
            res.getWriter().write("success");
        } else {
            res.getWriter().write("failure");
        }
    }

    public String encode(String password) {
        return (new Base64Config().encode(password));
    }
}
