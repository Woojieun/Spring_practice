package faq;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class faqDAO {
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
	
	public List<faq> getAll() throws Exception {
		Connection conn = open();
		List<faq> FaqList = new ArrayList<>();
		
		String sql = "select faq_id, faq_title, faq_content from faq";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try {
			while(rs.next()) {
				faq n = new faq();
				n.setFaq_id(rs.getInt("faq_id"));
				n.setFaq_title(rs.getString("faq_title"));
				n.setFaq_content(rs.getString("faq_content")); 
				
				FaqList.add(n);
			}
					
		} catch(Exception e) {
			e.printStackTrace();
		}
		return FaqList;
	}
	
	public faq getFAQ(int faq_id) throws SQLException {
		Connection conn = open();
		
		faq n = new faq();
		String sql = "select faq_id, faq_title, faq_content from faq where faq_id=?";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, faq_id);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		try {
			n.setFaq_id(rs.getInt("faq_id"));
			n.setFaq_title(rs.getString("faq_title"));
			n.setFaq_content(rs.getString("faq_content")); 

			pstmt.executeQuery();
			return n;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
}
