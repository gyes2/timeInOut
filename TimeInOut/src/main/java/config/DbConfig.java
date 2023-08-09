package config;
import java.sql.*;

public class DbConfig {
	
	public static Connection getConnection() {
		
		try {
            String dbURL = "jdbc:mysql://localhost:3306/timeinout";
            String dbID = "root";
            String dbPW = "**";
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(dbURL, dbID, dbPW);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
        return null;
	}
	
}
