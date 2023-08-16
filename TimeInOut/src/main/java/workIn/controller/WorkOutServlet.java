package workIn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import workIn.dao.WorkInDao;
import workIn.entity.WorkIn;

/**
 * Servlet implementation class userWorkOutServlet
 */
@WebServlet(urlPatterns = {"/work/*"})
public class WorkOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final WorkInDao workInDao = new WorkInDao();
	private WorkIn workIn = new WorkIn();
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String url = request.getRequestURI();
	
		String userId = request.getParameter("userId");
		
		if(url.equals("/work/in")) {
			int result = workInDao.insertUserWork(userId);
			response.setContentType("text/plain;charset=UTF-8");
			if(result == 1){
				
				workIn = workInDao.getUserWork(userId);
				String res = workIn.getWorkIn();
				response.getWriter().write(res);
			}
			else {
				response.getWriter().write("WorkOut Failed!");
			}
		}
		else if(url.equals("/work/out")) {
			
			
			int result = workInDao.modifyUserWork(userId);
			
			response.setContentType("text/plain;charset=UTF-8");
			if(result == 1){
				
				workIn = workInDao.getUserWork(userId);
				String res = workIn.getWorkOut();
				response.getWriter().write(res);
			}
			else {
				response.getWriter().write("WorkOut Failed!");
			}
		}
		
	}

}
