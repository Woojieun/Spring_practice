package cosmetic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;

import cosmetic_color.Cosmetic_color;

public class CosmeticDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource dataSource;
	
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
	
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
	
	public List<Cosmetic> getAll() throws Exception {
		Connection conn = open();
		List<Cosmetic> CosmeticList = new ArrayList<>();
		
		String sql = "select cosmetic_id, cosmetic_name, cosmetic_price, cosmetic_img from cosmetic";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try {
			while(rs.next()) {
				Cosmetic n = new Cosmetic();
				n.setCosmetic_id(rs.getInt("cosmetic_id"));
				n.setCosmetic_name(rs.getString("cosmetic_name"));
				n.setCosmetic_price(rs.getInt("cosmetic_price")); 
				n.setCosmetic_img(rs.getString("cosmetic_img"));
				
				CosmeticList.add(n);
			}
					
		} catch(Exception e) {
			e.printStackTrace();
		}
		return CosmeticList;
	}
	
	public Cosmetic getCosmetic(int cosmetic_id) throws SQLException {
		Connection conn = open();
		
		Cosmetic n = new Cosmetic();
		String sql = "select cosmetic_id, cosmetic_name, cosmetic_price, cosmetic_img from cosmetic where cosmetic_id=?";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cosmetic_id);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		try {
			n.setCosmetic_id(rs.getInt("cosmetic_id"));
			n.setCosmetic_name(rs.getString("cosmetic_name"));
			n.setCosmetic_price(rs.getInt("cosmetic_price"));
			n.setCosmetic_img(rs.getString("cosmetic_img"));

			pstmt.executeQuery();
			return n;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public Cosmetic getTint(int cosmetic_id) throws SQLException {
		Connection conn = open();
		
		Cosmetic n = new Cosmetic();
		String sql = "select cosmetic_id, cosmetic_name, cosmetic_price, cosmetic_img from cosmetic where cosmetic_type='Tint'";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cosmetic_id);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		try {
			n.setCosmetic_id(rs.getInt("cosmetic_id"));
			n.setCosmetic_name(rs.getString("cosmetic_name"));
			n.setCosmetic_price(rs.getInt("cosmetic_price"));
			n.setCosmetic_img(rs.getString("cosmetic_img"));

			pstmt.executeQuery();
			return n;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	public List<Cosmetic_color> getAll_color() throws Exception {
		Connection conn = open();
		List<Cosmetic_color> CosmeticList = new ArrayList<>();
		
		String sql = "select a.cosmetic_id, b.cosmetic_color_id, b.cosmetic_color_name, b.cosmetic_color_sum from cosmetic a, cosmetic_color where a.cosmetic_id = b.cosmetic_id";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try {
			while(rs.next()) {
				Cosmetic_color n = new Cosmetic_color();
				n.setCosmetic_id(rs.getInt("cosmetic_id"));
				
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
		
		rs.next();
		
		try {
			while(rs.next()) {
				Cosmetic_color n = new Cosmetic_color();
			n.setCosmetic_id(rs.getInt("cosmetic_id"));
			n.setCosmetic_color_id(rs.getInt("cosmetic_color_id"));
			n.setCosmetic_color_name(rs.getString("cosmetic_color_name")); 
			n.setCosmetic_color_sum(rs.getInt("cosmetic_color_sum"));

			CosmeticList1.add(n);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return CosmeticList1;
	}
	
	
	/*
	 * public int getCosmetic_color_insert(String user_id, String cosmetic_ID,
	 * String cosmetic_color_ID, String cosmetic_count) { open(); String sql =
	 * "INSERT INTO loginandjoin values (?,?,?,?)";
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, user_id);
	 * pstmt.setString(2, cosmetic_ID); pstmt.setString(3, cosmetic_color_ID);
	 * pstmt.setString(4, cosmetic_count); return pstmt.executeUpdate(); }
	 * catch(Exception e) { e.printStackTrace(); } finally { try { if(rs != null)
	 * rs.close(); if(pstmt != null) pstmt.close(); } catch (Exception e) {
	 * e.printStackTrace(); } } return -1; }
	 */
}
