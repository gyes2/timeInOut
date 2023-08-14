package workIn.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import config.DbConfig;
import user.dao.UserDao;
import user.entity.User;
import workIn.entity.WorkIn;

public class WorkInDao{
	private String workIn;
	private String workOut;
	private String today;
	private String userId;
	private UserDao userDao;
	private static User user;
	private static WorkIn work;
	
	//DB ���� ����
	Connection conn = DbConfig.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public WorkIn getUserWork(String userId) {
		user = userDao.getUser(userId);
		long id = user.getId();
		String query = "SELECT * FROM WORKIN WHERE userId = (?)";
		
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String date = dateTime.format(formatter);
		
		work = new WorkIn();
		
		if(conn != null) {
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setLong(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					if(rs.getString("today") == date) {
						work.setWorkIn(rs.getString("workIn"));
						work.setToday(date);
						work.setUser(user);
						break;
					}
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return work;
	}
	
	public List<WorkIn> getWorkList(){
		return null;
	};
	
	public void insertUserWork(String userName) {
		String query = "INSERT INTO WORKIN(status,today,userId) VALUES (?,?,?)";
		
		LocalDateTime dateToday = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String today = dateToday.format(formatter);
		
		user = userDao.getUser(userName);
		Long id = user.getId();
		if(conn != null) {
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "y");
				pstmt.setString(2, today);
				pstmt.setLong(3, id);
				pstmt.executeUpdate();
				conn.close();
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}