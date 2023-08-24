package config;
import java.sql.*;

public class DbConfig {
	
	public static Connection getConnection() {
		
		try {
            String dbURL = "jdbc:mysql://localhost:3306/timeinout?useUnicode=true&serverTimezone=Asia/Seoul";
            String dbID = "root";
            String dbPW = "123456";
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(dbURL, dbID, dbPW);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
        return null;
	}
	
}
