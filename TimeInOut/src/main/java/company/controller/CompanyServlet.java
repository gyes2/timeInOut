package company.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import company.dao.CompanyDao;
import company.entity.Company;

/**
 * Servlet implementation class CompanyServlet
 */
@WebServlet("/company/*")
public class CompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final CompanyDao companyDao = new CompanyDao();
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        RequestDispatcher dispatcher;

        String path = request.getRequestURI();
        if(path.equals("/company")) {
        	Company company = companyDao.getCompany("한국소프트웨어산업협회");
        	request.setAttribute("company", company);
        	dispatcher = getServletContext().getRequestDispatcher("/companyTimeRegister.jsp");
        }

        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
