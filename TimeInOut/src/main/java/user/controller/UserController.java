package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/user/*"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");

        String path = req.getRequestURI();

        RequestDispatcher dispatcher;

        if(path.equals("/user/signup")) {
            dispatcher = getServletContext().getRequestDispatcher("/signup.jsp");
        }
        else {
            // 404 페이지
            dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
        }

        dispatcher.forward(req, res);
    }

}
