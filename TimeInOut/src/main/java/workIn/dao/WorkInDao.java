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

public class WorkInDao {
	//DB ���� ����
    static Connection conn = DbConfig.getConnection();
    static PreparedStatement pstmt;
    static ResultSet rs = null;
    
    private String workIn;
	private String workOut;
	private String today;
	private String userName;
	static UserDao userDao = new UserDao();
	static User user;
	static final WorkIn work = new WorkIn();
	
	public WorkIn getUserWork(String userName) {
		user = userDao.getUser(userName);
		System.out.println("getUserWork user: "+ user.getUserId()+"id: " +user.getId());
		long id = user.getId();
		String query = "SELECT * FROM WORKIN WHERE userId = ?";
		
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String date = dateTime.format(formatter);
		
		
		if(conn != null) {
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setLong(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					if(rs.getString("today").equals(date)) {
						System.out.println("getUserWorkIn rs.getString(\"workIn\"): "+rs.getString("workIn")+rs.getString("workOut"));
						work.setWorkIn(rs.getString("workIn"));
						work.setWorkOut(rs.getString("workOut"));
						work.setToday(date);
						work.setStatus(rs.getString("status"));
						work.setUser(user);
						
						break;
					}
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		System.out.println("getUserWorkIn userId: "+user.getId()+"��ٽð�: "+work.getWorkIn());
		return work;
	}
	
	public List<WorkIn> getWorkList(){
		return null;
	};
	
	public int insertUserWork(String userName) {
		String query = "INSERT INTO WORKIN(today,userId,status) VALUES (?,?,?)";
		
		LocalDateTime dateToday = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String today = dateToday.format(formatter);
		
		user = userDao.getUser(userName);

		long id = user.getId();
		if(conn != null) {
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, today);
				pstmt.setLong(2, id);
				pstmt.setString(3, "N");
				pstmt.executeUpdate();
				return 1;
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	public int modifyUserWork(String userId) {
		String query = "UPDATE timeinout.workin SET status = ? WHERE today = ? AND userId = ?";
		
		user = userDao.getUser(userId);
		
		long id = user.getId();
		
		LocalDateTime dateToday = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		today = dateToday.format(formatter);
		
		if(conn != null) {
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,"Y");
				pstmt.setString(2, today);  
				pstmt.setLong(3, id);
				pstmt.executeUpdate();
				return 1;
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		return 0;
	}

    public void deleteWorkIn(String userId) {
        String query = "DELETE FROM timeinout.workin "
                + "WHERE userId IN "
                + "(SELECT id FROM timeinout.user "
                + "WHERE userId = ?)";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
            pstmt.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
