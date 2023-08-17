package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.Base64Config;
import config.DbConfig;
import user.dto.SignupDto;
import user.entity.User;


public class UserDao {
	
	Connection conn = DbConfig.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private static User user;
	
	public User getUser(String userId) {
		String query = "select * "+"from user";
		User newUser = new User();
		long id=0;
		if(conn != null){
			try {
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String name = rs.getString("userId");

					if(name.equals(userId)) {
						newUser.setUserId(name);
						System.out.println("user id: "+rs.getLong("id"));
						newUser.setId(rs.getLong("id"));
						newUser.setPassword(rs.getString("password"));
						break;
					}
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return newUser;
	}

	public int login(String userId, String password) {
		user = getUser(userId);
		String decodePw = (String)(new Base64Config().decode(user.getPassword()));

		if(user == null) {
			return -2;
		}
		if(user.getUserId().equals(userId) 
				&& decodePw.equals(password)) {
			return 1;
		}
		else if(user.getUserId().equals(userId) 
				&& !decodePw.equals(password)) {
			return 0;
		}
		else {
			return -1;
		}
	}
	
	public int existsUserId(String userId) {
        int res = -1;

        String query = "select exists("
                + "select userId"
                + "	from timeinout.`user`"
                + "	where userId = (?)"
                + "	limit 1) as success";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);

            rs = pstmt.executeQuery();

            rs.next();
            res = rs.getInt(1);

        } catch(SQLException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return res;
    }

    public boolean insertUser(SignupDto req) {
        boolean res = false;

        String query = "insert into timeinout.`user`"
                + "(userId, password, userName, email)"
                + "VALUES(?, ?, ?, ?);";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, req.getUserId());
            pstmt.setString(2, req.getPassword());
            pstmt.setString(3, req.getUserName());
            pstmt.setString(4, req.getEmail());
            pstmt.executeUpdate();
            conn.commit();
            res = true;
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return res;
    }
    
    public void deleteUser(String userId){
        String query = "DELETE FROM timeinout.`user`"
                + "WHERE userId=?";

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

    public void updatePassword(String password, String userId) {
        String query = "UPDATE timeinout.`user`" +
                "SET password=?" +
                "WHERE userId=?";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, password);
            pstmt.setString(2, userId);
            pstmt.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}

