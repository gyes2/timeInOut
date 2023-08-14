package user.dao;

import java.sql.*;

import config.DbConfig;
import user.service.*;
import user.entity.User;


public class UserDao {
	private String userName;
	private String password;
	
	Connection conn = DbConfig.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	User user = null;
	
	public UserDao() {
		this.userName = "";
		this.password="";
	}
	
	public User getUser(String userName) {
		String query = "select * "+"from user";
		User newUser = null;
		if(conn != null){
			try {
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String name = rs.getString("userName");
					if(name.equals(userName)) {
						newUser = new User();
						newUser.setId(Long.parseLong(rs.getString("id")));
						newUser.setUserName(name);
						newUser.setPassword(rs.getString("password"));
						break;
					}
				}
				conn.close();
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return newUser;
	}
	public int login(String userName, String password) {
		user = getUser(userName);
		if(user == null) {
			return -2;
		}
		if(user.getUserName().equals(userName) 
				&& user.getPassword().equals(password)) {
			return 1;
		}
		else if(user.getUserName().equals(userName) 
				&& !user.getPassword().equals(password)) {
			return 0;
		}
		else {
			return -1;
		}
	}

}

