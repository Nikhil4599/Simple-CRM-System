package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Product;
import com.beans.User;

public class DB {
	private String username="root";
	private String password="";
	private String dbname="cart";
	private String url="jdbc:mysql://localhost:3306/" + dbname;
	private String driver="com.mysql.jdbc.Driver";
	
	private Connection con;
	
	private void dbConnect() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			con=DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private ArrayList<Product> list= new ArrayList<>();
	public ArrayList<Product> fetchProduts() throws SQLException {
		dbConnect();
		PreparedStatement stmt=con.prepareStatement("select * from product");
		ResultSet rs=stmt.executeQuery();
		while(rs.next()) {
			int pid=rs.getInt("pid");
			String pname =rs.getString("pname");
			String pprice=rs.getString("pprice");
			String pdesc=rs.getString("pdesc");
			String pcat_id=rs.getString("pcat_id");
			String fid=rs.getString("fid");
			Product p=new Product(pid,pname,pprice,pdesc,pcat_id,fid);
			list.add(p);
		}
		dbClose();
		return list;
	}
	public void addUser(User u) throws SQLException {
		dbConnect();
		PreparedStatement stmt=con.prepareStatement("insert into user(name,address,email,username,password) values(?,?,?,?,?)");
		stmt.setString(1,u.getName());
		stmt.setString(2,u.getAddress());
		stmt.setString(3,u.getEmail());
		stmt.setString(4,u.getUsername());
		stmt.setString(5,u.getPassword());
		stmt.executeUpdate();
		dbClose();
	}
	public boolean checkUser(User u) throws SQLException {
		dbConnect();
		int count =0;
		String sql="select * from user where username=? AND password=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,u.getUsername());
		pstmt.setString(2,u.getPassword());
		ResultSet rs=pstmt.executeQuery();		
		if(rs.next()) {
			count=1;
		}
		dbClose();
		if(count==0)
			return false;
		return true;
	}
	public void deleteProduct(String id) throws SQLException {
		dbConnect();
		PreparedStatement stmt=con.prepareStatement("delete from product where pid=?");
		stmt.setString(1, id);
		stmt.executeUpdate();
		dbClose();
	}
	public Product fetchProduct(String pid) throws SQLException {
		dbConnect();
		String sql = "select * from product where pid=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pid);
		ResultSet rst = pstmt.executeQuery();
		Product p = new Product();
		while(rst.next()){
			p.setId(rst.getInt("pid"));
			p.setPname(rst.getString("pname"));
			p.setPprice(rst.getString("pprice"));
			p.setPdesc(rst.getString("pdesc"));
			p.setPcat_id(rst.getString("pcat_id"));
			p.setFid(rst.getString("fid"));
		}
		dbClose();
		return p;
	}
	public void updateProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "update product set pname=?,pprice=?,pdesc=?,pcat_id=?,fid=? where pid=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, p.getPname());
		pstmt.setString(2, p.getPprice());
		pstmt.setString(3, p.getPdesc());
		pstmt.setString(4, p.getPcat_id());
		pstmt.setString(5, p.getFid());
		pstmt.setInt(6, p.getId());
		pstmt.executeUpdate();
		dbClose();
	}
}
