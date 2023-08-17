package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.Base64Config;
import config.DbConfig;
import user.dto.AdminUserDto;
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
    
    public List<AdminUserDto> getAllUsersByCompanyName(String companyName, String userName) {

        List<AdminUserDto> res = new ArrayList<>();

        String query = "select u.userId, u.userName, t.teamName, u.email " +
                "from company c " +
                "join team t on c.id = t.companyId " +
                "join `user` u on t.id = u.teamId " +
                "where c.companyName = ? " + 
                "and u.userName like ?";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, companyName);
            pstmt.setString(2, "%" + userName + "%");
            rs = pstmt.executeQuery();
            while(rs.next()) {

                AdminUserDto adminUserDto = new AdminUserDto();

                adminUserDto.setUserId(rs.getString("userId"));
                adminUserDto.setUserName(rs.getString("userName"));
                adminUserDto.setTeamName(rs.getString("teamName"));
                adminUserDto.setEmail(rs.getString("email"));

                res.add(adminUserDto);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return res;
    }
    
    public void updateTeamId(String userId) {
        String query = "UPDATE timeinout.`user` " +
                "SET teamId=NULL " +
                "WHERE userId=?";

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
    
    public List<AdminUserDto> getAllUsersByTeamIsNull(String userName) {

        List<AdminUserDto> res = new ArrayList<>();

        String query = "SELECT u.userId, u.userName, u.email " +
                "FROM timeinout.`user` u " +
                "LEFT JOIN team t ON t.id = u.teamId " +
                "WHERE u.teamId IS NULL " +
                "AND u.userName like ?";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, "%" + userName + "%");
            
            rs = pstmt.executeQuery();
            while(rs.next()) {

                AdminUserDto adminUserDto = new AdminUserDto();

                adminUserDto.setUserId(rs.getString("userId"));
                adminUserDto.setUserName(rs.getString("userName"));
                adminUserDto.setEmail(rs.getString("email"));

                res.add(adminUserDto);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return res;
    }

    public void updateTeamId(String teamName, String userId) {
        String query = "UPDATE timeinout.`user` "
        		+ "SET teamId=(SELECT id from team WHERE teamName=?) "
        		+ "WHERE userId=?";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, teamName);
            pstmt.setString(2, userId);
            pstmt.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}

