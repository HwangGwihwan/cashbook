package model;

import java.sql.*;
import java.util.*;
import dto.*;

public class CategoryDao {
	public void insertCategory(Category c) throws ClassNotFoundException, SQLException { // 삽입
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "insert into category (kind, title) values (?, ?)";
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, c.getKind());
		stmt.setString(2, c.getTitle());
		stmt.executeUpdate();
		
		conn.close();
	}
	
	public ArrayList<Category> selectCategoryList() throws ClassNotFoundException, SQLException { // 전체 리스트 출력
		ArrayList<Category> list = new ArrayList<Category>();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select category_no categoryNo, kind, title, createdate from category order by category_no asc";
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			Category c = new Category();
			c.setCateoryNo(rs.getInt("categoryNo"));
			c.setKind(rs.getString("kind"));
			c.setTitle(rs.getString("title"));
			c.setCreatedate(rs.getString("createdate"));
			
			list.add(c);
		}
		
		conn.close();
		return list;
	}
	
	public Category selectCategoryOne(int num) throws ClassNotFoundException, SQLException { // 한 개만 선택
		Category c = null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select category_no categoryNo, kind, title, createdate from category where category_no = ?";
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, num);
		rs = stmt.executeQuery();
		
		if (rs.next()) {
			c = new Category();
			c.setCateoryNo(rs.getInt("categoryNo"));
			c.setKind(rs.getString("kind"));
			c.setTitle(rs.getString("title"));
		}
		
		conn.close();
		return c;
	}
	
	public void updateCategoryTitle(int num, String title) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "update category set title = ? where category_no = ?";
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, title);
		stmt.setInt(2, num);
		stmt.executeUpdate();
		
		conn.close();	
	}
	
	
}
