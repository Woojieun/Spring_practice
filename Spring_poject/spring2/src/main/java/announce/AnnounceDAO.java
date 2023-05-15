package announce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AnnounceDAO {
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
	
	public List<Announce> getAll() throws Exception {
		Connection conn = open();
		List<Announce> AnnounceList = new ArrayList<>();
		
		String sql = "select announce_id, announce_title, announce_content from announce";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try {
			while(rs.next()) {
				Announce n = new Announce();
				n.setAnnounce_id(rs.getInt("announce_id"));
				n.setAnnounce_title(rs.getString("announce_title")); 
				n.setAnnounce_content(rs.getString("announce_content"));
				
				AnnounceList.add(n);
			}
					
		} catch(Exception e) {
			e.printStackTrace();
		}
		return AnnounceList;
	}
	
	public Announce getAnnounce(int announce_id) throws SQLException {
		Connection conn = open();
		
		Announce n = new Announce();
		String sql = "select announce_id, announce_title, announce_content from announce where announce_id=?";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, announce_id);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		try {
			n.setAnnounce_id(rs.getInt("announce_id"));
			n.setAnnounce_title(rs.getString("announce_title")); 
			n.setAnnounce_content(rs.getString("announce_content"));

			pstmt.executeQuery();
			return n;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
}
