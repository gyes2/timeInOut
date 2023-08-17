package workIn.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import config.DbConfig;
import user.dao.UserDao;
import user.entity.User;
import workIn.dto.WorkInDto;
import workIn.entity.WorkIn;

public class WorkInDao {
	//DB 연결 설정
    static Connection conn = DbConfig.getConnection();
    static PreparedStatement pstmt;
    static ResultSet rs = null;
    
    private String workIn;
	private String workOut;
	private String today;
	private String userName;
	
	static final UserDao userDao = new UserDao();
	static User user;
	static final WorkIn work = new WorkIn();
	static WorkInDto workInDto;
	
	
	
	public WorkIn getUserWork(String userName) {
		user = userDao.getUser(userName);
		long id = user.getId();
		String query = "SELECT * FROM WORKIN "+"WHERE userId = ?";
		
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
		return work;
	}
	
	public HashMap<String,WorkInDto> getWorkList(String userId){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		user = new User();
		user = userDao.getUser(userId);
		long id = user.getId();
		HashMap<String,WorkInDto> works = new HashMap<>();
		
		LocalDateTime dateToday = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String today = dateToday.format(formatter);
		
		String query = "SELECT * "
				+ "FROM WORKIN "
				+ "WHERE userId = ?";
		
		if (conn != null) {
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setLong(1, id);
				System.out.println(pstmt.toString());
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String u_name = userDao.getUserIdFromId(rs.getLong("userId"));
					String workIn = rs.getString("workIn");
					String workOut = rs.getString("workOut");
					String status = getWorkStatus(workIn,workOut);
					workInDto = new WorkInDto(u_name,workIn,workOut,status);
					works.put(today, workInDto);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return works;
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
    
    public String getWorkStatus(String workIn, String workOut) {
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date start;
		try {
			start = (Date) simpleDateFormat.parse("2023-08-17 09:00:00");
			Date finish = (Date) simpleDateFormat.parse("2023-08-17 19:00:00");
			Date middle = (Date) simpleDateFormat.parse("2023-08-17 14:00:00");
		
			if (simpleDateFormat.parse(workIn).before(start)
				&& simpleDateFormat.parse(workOut).after(finish)) {
				return "Y";
			}
			else if((simpleDateFormat.parse(workIn).after(start)&&simpleDateFormat.parse(workIn).before(middle))
					&& simpleDateFormat.parse(workOut).after(finish)) {
				return "L";
			}
			else if(simpleDateFormat.parse(workIn).before(start)&&
					(simpleDateFormat.parse(workOut).after(middle)&&simpleDateFormat.parse(workOut).before(finish))) {
				return "E";
			}
			else {
				return "N";
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
    }
}
