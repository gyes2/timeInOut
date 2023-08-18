package workIn.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import workIn.dao.WorkInDao;
import workIn.dto.WorkInDto;
import workIn.entity.WorkIn;


/**
 * Servlet implementation class UserCalendar
 */
@WebServlet(urlPatterns = "/calendar/*")
public class UserCalendar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final WorkInDao workInDao = new WorkInDao();
	private static WorkInDto workInDto;
	private WorkIn workIn;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String path = request.getRequestURI();
		RequestDispatcher dispatcher = null;
		
		HashMap<String,WorkInDto> works = new HashMap<>();
		
		if(path.equals("/calendar")) {
			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("userId");
			
			works = workInDao.getWorkList(username);
			System.out.println("calendar 컨트롤러 맵 들어왔는지 확인");
			int i =0;
			for(Map.Entry<String, WorkInDto> entry: works.entrySet()) {
				System.out.println(i);
				System.out.println(entry.getValue().getWorkIn());
				System.out.println(entry.getValue().getWorkOut());
				System.out.println(entry.getValue().getStatus());
				i++;
			}
			request.setAttribute("workList", works);
			dispatcher = getServletContext().getRequestDispatcher("/userCalendar.jsp");
			dispatcher.forward(request,response);
		}
		else if(path.equals("/calendar/details")) {
			String today = request.getParameter("today");
			System.out.println(today);
			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("userId");
			
			works = workInDao.getWorkList(username);
			WorkInDto workDetail = works.get(today);
			System.out.println(workDetail);
			response.setContentType("text/plain;charset=UTF-8");
			
			//request.setAttribute("workDetail", workDetail);
			//dispatcher = getServletContext().getRequestDispatcher("/userCalendar.jsp");
		}

		
	}

}
