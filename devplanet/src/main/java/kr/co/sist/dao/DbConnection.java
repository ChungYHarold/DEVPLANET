package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConnection {
	
	private static DbConnection dbCon;
	private DbConnection() {
		
	}//DbConnection

	public static DbConnection getInstance()  {
		if(dbCon==null) {
			dbCon=new DbConnection();
		}//end if
		return dbCon;
	}//getInstance
	
	public Connection getConn() throws SQLException {
		Connection con=null;
		
		//1. JNDI 사용객체 생성
		try {
			Context ctx=new InitialContext();
			//2. JNDI로 찾아낸 DBCP에서 DataSource얻기
			DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/testDbcp");
			//3. Connection 얻기
			con=ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}//end catch
		
		return con;
	}//getCon
	
	
	public void dbClose(ResultSet rs, Statement stmt, Connection con)throws SQLException {
		
		try {
			if(rs != null) {rs.close();}//end if
			if(stmt != null) {stmt.close();}//end if
		}finally {
			if(con != null) {con.close();}//end if
		}//end finally
		
	}//dbClose
	
}//class
