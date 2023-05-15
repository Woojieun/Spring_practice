package Shopping_basket;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;

import cosmetic.Cosmetic;

public class Shopping_basket_DAO {
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource dataSource;
	
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb;MODE=LEGACY";
	
	public void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "jwbook", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getCosmetic_cosmetic_insert(String sessionId, String cosmetc_id, String cosmetic_color_id, String cosmetic_num) {
		open();
		String sql = "INSERT INTO shopping_basket(id, cosmetc_id, cosmetic_color_id, cosmetic_num) values (?,?,?,?)";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sessionId);
			pstmt.setString(2, cosmetc_id);
			pstmt.setString(3, cosmetic_color_id);
			pstmt.setString(4, cosmetic_num);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	

	
}
