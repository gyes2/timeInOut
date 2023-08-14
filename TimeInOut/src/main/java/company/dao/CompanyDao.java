package company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import company.entity.Company;
import config.DbConfig;

public class CompanyDao {

	Connection conn = DbConfig.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Company getCompany(String userId) {
		Company newCompany = null;
		
		String query = "SELECT c.id, c.companyName, c.companyIn, c.companyOut "
				+ "FROM timeinout.`user` u "
				+ "JOIN timeinout.team t ON u.teamId = t.id "
				+ "JOIN timeinout.company c ON t.companyId = c.id "
				+ "WHERE u.userId = ?";
		
		try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);

            rs = pstmt.executeQuery();

            while(rs.next()) {
            	newCompany = new Company();
            	newCompany.setCompanyName(rs.getString("companyName"));
            	newCompany.setCompanyIn(rs.getString("companyIn"));
            	newCompany.setCompanyOut(rs.getString("companyOut"));
            }

        } catch(SQLException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }
		
		return newCompany;
	}
}
