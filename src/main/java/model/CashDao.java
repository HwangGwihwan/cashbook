package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import dto.*;

public class CashDao {
	public ArrayList<Cash> selectCashByDate(String date) throws ClassNotFoundException, SQLException { // 날짜별 수입,지출 확인
		ArrayList<Cash> list = new ArrayList<Cash>();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select cs.cash_no cashNo, cs.category_no categoryNo, ct.kind, ct.title, cs.cash_date cashDate, cs.amount, cs.memo, cs.color"
				+ " from cash cs INNER JOIN category ct on cs.category_no = ct.category_no where cash_date = ?";
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, date);
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			Cash cash = new Cash();
			cash.setCashNo(rs.getInt("cashNo"));
			cash.setCategoryNo(rs.getInt("categoryNo"));
			cash.setCash_date(rs.getString("cashDate"));
			cash.setAmount(rs.getInt("amount"));
			cash.setMemo(rs.getString("memo"));
			cash.setColor(rs.getString("color"));
			
			Category category = new Category();
			category.setKind(rs.getString("kind"));
			category.setTitle(rs.getString("title"));
			
			cash.setCategory(category);
			list.add(cash);
		}
		
		conn.close();
		return list;
	}
	
	public void insertCash(Cash c) throws ClassNotFoundException, SQLException { // 입력
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "insert into cash (category_no, cash_date, amount, memo, color) values (?, ?, ?, ?, ?)";
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, c.getCategoryNo());
		stmt.setString(2, c.getCash_date());
		stmt.setInt(3, c.getAmount());
		stmt.setString(4, c.getMemo());
		stmt.setString(5, c.getColor());
		stmt.executeUpdate();
		
		conn.close();
	}

}
