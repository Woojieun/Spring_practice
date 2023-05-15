package cosmetic_color;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cosmetic.Cosmetic;

public class Cosmetic_Color_DAO {
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb;MODE=LEGACY";
	
	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"jwbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public List<Cosmetic_color> getAll_color() throws Exception {
		Connection conn = open();
		List<Cosmetic_color> CosmeticList = new ArrayList<>();
		
		String sql = "select cosmetic_id, cosmetic_color_id, cosmetic_color_name, cosmetic_color_sum from cosmetic_color";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try {
			while(rs.next()) {
				Cosmetic_color n = new Cosmetic_color();
				n.setCosmetic_id(rs.getInt("cosmetic_id"));
				n.setCosmetic_color_id(rs.getInt("cosmetic_color_id"));
				n.setCosmetic_color_name(rs.getString("cosmetic_color_name")); 
				n.setCosmetic_color_sum(rs.getInt("cosmetic_color_sum"));
				
				CosmeticList.add(n);
			}
					
		} catch(Exception e) {
			e.printStackTrace();
		}
		return CosmeticList;
	}
	
	
	public List<Cosmetic_color> getCosmetic_color(int cosmetic_id) throws SQLException {
		Connection conn = open();
		List<Cosmetic_color> CosmeticList1 = new ArrayList<>();
		
		String sql = "select cosmetic_id, cosmetic_color_id, cosmetic_color_name, cosmetic_color_sum from cosmetic_color where cosmetic_id=?";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cosmetic_id);
		ResultSet rs = pstmt.executeQuery();
		
		try {
			while(rs.next()) {
			Cosmetic_color n1 = new Cosmetic_color();
			n1.setCosmetic_id(rs.getInt("cosmetic_id"));
			n1.setCosmetic_color_id(rs.getInt("cosmetic_color_id"));
			n1.setCosmetic_color_name(rs.getString("cosmetic_color_name")); 
			n1.setCosmetic_color_sum(rs.getInt("cosmetic_color_sum"));

			CosmeticList1.add(n1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return CosmeticList1;
	}

	
	public Cosmetic_color getCosmetic_cosmetic_id(int cosmetic_id) throws SQLException {
		Connection conn = open();
		
		Cosmetic_color cosmetic_color_id = new Cosmetic_color();
		String sql = "select cosmetic_id from cosmetic_color";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cosmetic_id);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		try {
			cosmetic_color_id.setCosmetic_id(rs.getInt("cosmetic_id"));

			pstmt.executeQuery();
			return cosmetic_color_id;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cosmetic_color_id;
	}
	
}
