package user.dao;

import java.sql.*;
import user.dto.UserDto;
import config.DbConfig;

public class UserDao {
	Connection conn = DbConfig.getConnection();
	
	public void login(String userName) {
		
	};

}
