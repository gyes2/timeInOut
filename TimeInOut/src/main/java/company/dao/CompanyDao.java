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
		
		String query = "SELECT c.id, c.companyName, c.companyInHour,c.companyInMinute, c.companyOutHour,c.companyOutMinute "
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
            	newCompany.setCompanyInHour(rs.getString("companyInHour"));
            	newCompany.setCompanyInMinute(rs.getString("companyInMinute"));
            	newCompany.setCompanyOutHour(rs.getString("companyOutHour"));
            	newCompany.setCompanyOutMinute(rs.getString("companyOutMinute"));
            }

        } catch(SQLException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }
		
		return newCompany;
	}
	public Company getCompanyByCompanyName(String companyName) {
		Company adminCompany = null;
		String query = "select * from company where companyName = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,companyName);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				adminCompany = new Company();
				adminCompany.setCompanyInHour(rs.getString("companyInHour"));
				adminCompany.setCompanyInMinute(rs.getString("companyInMinute"));
				adminCompany.setCompanyOutHour(rs.getString("companyOutHour"));
				adminCompany.setCompanyOutMinute(rs.getString("companyOutMinute"));
				adminCompany.setCompanyName(rs.getString("companyName"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return adminCompany;
	}
	
	public int saveTime(Company company) {
		int rowcount=0;
		if(Integer.parseInt(company.getCompanyInHour())>Integer.parseInt(company.getCompanyOutHour())){
			rowcount = -1;
		}
		else if(Integer.parseInt(company.getCompanyInHour())==Integer.parseInt(company.getCompanyOutHour())){
			if(Integer.parseInt(company.getCompanyInMinute())<=Integer.parseInt(company.getCompanyOutMinute())){
				rowcount = -1;
			}
		}
		else {
			String query = "update company"
					+" set companyInHour = ?,"
					+" companyInMinute=?,"
					+" companyOutHour=?,"
					+" companyOutMinute=?"
					+" where companyName=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,company.getCompanyInHour());
				pstmt.setString(2,company.getCompanyInMinute());
				pstmt.setString(3,company.getCompanyOutHour());
				pstmt.setString(4,company.getCompanyOutMinute());
				pstmt.setString(5,company.getCompanyName());
				rowcount = pstmt.executeUpdate();
				
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}

		return rowcount;
	}
}
