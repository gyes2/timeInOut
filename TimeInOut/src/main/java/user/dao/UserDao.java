package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.DbConfig;
import user.dto.SignupDto;
import user.entity.User;


public class UserDao {
	
	Connection conn = DbConfig.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	User user = new User();
	
	public User getUser(String userId) {
		String query = "select * "+"from user";
		User newUser = null;
		long id=0;
		if(conn != null){
			try {
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					newUser = new User();
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
	
	public String getUserIdFromId(long id) {
		String query = "select * "+"from user"+" where id = ?";
		String name="";
		
		if(conn != null){
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setLong(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					if(id == rs.getLong("id")) {
						name = rs.getString("userId");
						break;
					}
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return name;
	}

	public int login(String userId, String password) {

		User l_user = getUser(userId);
		

		if(l_user == null) {
			System.out.println("login user null");
			return -2;
		}
		else {
			System.out.println("login user null¾Æ´Ô: "+user.getUserId());
			if(l_user.getUserId().equals(userId) 
					&& user.getPassword().equals(password)) {
				return 1;
			}
			else if(l_user.getUserId().equals(userId) 
					&& !user.getPassword().equals(password)) {
				return 0;
			}
			else {
				return -1;
			}
		}
	}
	
	public int existsUserId(String userId) {
        int res = -1;

        String query = "select exists("
                + "select userName"
                + "	from timeinout.`user`"
                + "	where userName = (?)"
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
            pstmt.setString(3, req.getuserName());
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

