package team.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.DbConfig;

public class TeamDao {
	
	Connection conn = DbConfig.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<String> getAllTeamByCompanyId(String companyName) {
		
		List<String> res = new ArrayList<>();
		
		String query = "select t.teamName "
				+ "from company c "
				+ "join team t on c.id = t.companyId "
				+ "where c.companyName = ?";
		
		try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, companyName);
            
            rs = pstmt.executeQuery();
            while(rs.next()) {
            	res.add(rs.getString("teamName"));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return res;
	}
}
