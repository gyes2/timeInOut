package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import company.dao.CompanyDao;
import company.entity.Company;
import user.dao.UserDao;
import user.dto.MyPageDto;
import user.entity.User;

@WebServlet(urlPatterns = {"/user/*"})
public class UserController extends HttpServlet {
	
	private final UserDao userDao = new UserDao();
	private final CompanyDao companyDao = new CompanyDao();
	

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");

        String path = req.getRequestURI();

        RequestDispatcher dispatcher;

        if(path.equals("/user/signup")) {
            dispatcher = getServletContext().getRequestDispatcher("/signup.jsp");
        }
        else if(path.equals("/user/mypage")) {
            // Session에서 불러오기
            HttpSession session = req.getSession();
            String userId = (String) session.getAttribute("userName");

            MyPageDto myPageDto = fetchMyPageInfoFromDB(userId);

            req.setAttribute("mypage", myPageDto);
            System.out.println(req.getAttribute("mypage"));
            dispatcher = getServletContext().getRequestDispatcher("/mypage.jsp");
        }
        else {
            // 404 페이지
            dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
        }

        dispatcher.forward(req, res);
    }
    
    public MyPageDto fetchMyPageInfoFromDB(String userId) {
        MyPageDto myPageDto = new MyPageDto();

        // Setter로 데이터 추가
        // userDao, companyDao
        User user = userDao.getUser(userId);
        Company company = companyDao.getCompany(userId);
        
        myPageDto.setUserId(user.getUserId());
        myPageDto.setCompanyName(company.getCompanyName());
        myPageDto.setCompanyIn(company.getCompanyIn());
        myPageDto.setCompanyOut(company.getCompanyOut());

        return myPageDto;
    }

}
