package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    	req.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/loginAction.jsp");
        dispatcher.forward(req, res);

    }

}
