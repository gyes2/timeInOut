package workIn.dao;

import config.DbConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WorkInDao {

    private Connection conn = DbConfig.getConnection();
    private PreparedStatement pstmt;
    ResultSet rs = null;

    public void deleteWorkIn(String userId) {
        String query = "DELETE FROM timeinout.workin "
                + "WHERE userId IN "
                + "(SELECT id FROM timeinout.user "
                + "WHERE userId = ?)";

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
}
