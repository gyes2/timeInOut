package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.UserDao;
import user.dto.AdminUserDto;

@WebServlet(urlPatterns = {"/admin/*"})
public class AdminController extends HttpServlet {
	
	private final UserDao userDao = new UserDao();
	private final int sizeOfPage = 10;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	
    	
    	req.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");

        String path = req.getRequestURI();

        RequestDispatcher dispatcher;

        if(path.equals("/admin/user")) {
        	
        	String userName;
        	if(req.getParameter("userName") != null) {
        		userName = req.getParameter("userName");
        	}
        	else {
        		userName = "";
        	}
        	
        	List<AdminUserDto> userList = userDao.getAllUsersByCompanyName("A", userName);

            int pageSize = sizeOfPage;
            int currentPage = 1;

            String pageParam = req.getParameter("page");
            if (pageParam != null) {
                currentPage = Integer.parseInt(pageParam);
            }

            int startIdx = (currentPage - 1) * pageSize;
            int endIdx = Math.min(startIdx + pageSize, userList.size());

            List<AdminUserDto> currentPageUsers = userList.subList(startIdx, endIdx);

            req.setAttribute("currentPageUsers", currentPageUsers);
            req.setAttribute("totalPages", (int) Math.ceil((double) userList.size() / pageSize));
        	
            dispatcher = getServletContext().getRequestDispatcher("/userlist.jsp");
        }
        else {
            // 404 페이지
            dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
        }

        
        
        dispatcher.forward(req, res);
    }

}
