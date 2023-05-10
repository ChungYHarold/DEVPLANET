package kr.co.sist.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.admin.vo.AdminLoginVO;
import kr.co.sist.admin.vo.AdminResultVO;
import kr.co.sist.dao.DbConnection;


public class AdminDAO {
	// 로그인 메서드
	public AdminResultVO adminLogin(AdminLoginVO alVO) throws SQLException {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		AdminResultVO arVO = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			con=dbCon.getConn();
			
			String SQL = "select admin_id, password from admin where admin_id=? and password=?";
	
			pstmt = con.prepareStatement(SQL);
			
			pstmt.setString(1, alVO.getId());
			pstmt.setString(2, alVO.getPw());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				arVO = new AdminResultVO();
			    arVO.setId(rs.getString("admin_id"));
			    arVO.setPass(rs.getString("password"));
			}
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		return arVO;
	}// adminLogin
	
	// 메인 페이지
	public int selectCountJoin() throws SQLException {
		int cnt = 0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder countJoin = new StringBuilder();
			countJoin
			.append("    select count(user_id)    ")
			.append("    from user_table    ")
			.append("    where TRUNC(reg_date) = TRUNC(sysdate)    ");
			
			pstmt = con.prepareStatement(countJoin.toString());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            cnt = rs.getInt(1);
	        }// end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return cnt;
	}// selectCountJoin
	
	public int selectCountQuitUser() throws SQLException {
		int cnt = 0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder countResume = new StringBuilder();
			countResume
			.append("    select count(user_id)    ")
			.append("    from user_table    ")
			.append("    where TRUNC(quit_date) = TRUNC(sysdate)    ");
			
			pstmt = con.prepareStatement(countResume.toString());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            cnt = rs.getInt(1);
	        }// end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return cnt;
	}// selectCountQuitUser
	
	public int selectCountResume() throws SQLException {
		int cnt = 0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder countResume = new StringBuilder();
			countResume
			.append("    select count(r_num)    ")
			.append("    from resume    ")
			.append("    where TRUNC(input_date) = TRUNC(sysdate)    ");
			
			pstmt = con.prepareStatement(countResume.toString());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            cnt = rs.getInt(1);
	        }// end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return cnt;
	}// selectCountResume
	
	public int selectCountJobSeeker() throws SQLException {
		int cnt = 0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder countJob = new StringBuilder();
			countJob
			.append("    select count(apply_num)    ")
			.append("    from apply    ")
			.append("    where TRUNC(inspec_date) = TRUNC(sysdate)    ");
			
			pstmt = con.prepareStatement(countJob.toString());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            cnt = rs.getInt(1);
	        }// end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return cnt;
	}// selectCountJobSeeker
	
	public int selectCountCorp() throws SQLException {
		int cnt = 0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder countCorp = new StringBuilder();
			countCorp
			.append("    select count(corp_num)    ")
			.append("    from corp    ")
			.append("    where TRUNC(input_date) = TRUNC(sysdate)    ");
			
			pstmt = con.prepareStatement(countCorp.toString());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            cnt = rs.getInt(1);
	        }// end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return cnt;
	}// selectCountCorp
	
	public int selectCountAd() throws SQLException {
		int cnt = 0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder countAd = new StringBuilder();
			countAd
			.append("    select count(job_num)    ")
			.append("    from job_ad    ")
			.append("    where TRUNC(input_date) = TRUNC(sysdate)    ");
			
			pstmt = con.prepareStatement(countAd.toString());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            cnt = rs.getInt(1);
	        }// end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return cnt;
	}// selectCountAd
	
	public int selectCountAllUser() throws SQLException {
		int cnt = 0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder countAllUser = new StringBuilder();
			countAllUser
			.append("    select count(user_id)    ")
			.append("    from user_table    ")
			.append("    where quit_date is null    ");
			
			pstmt = con.prepareStatement(countAllUser.toString());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            cnt = rs.getInt(1);
	        }// end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return cnt;
	}// selectCountAllUser
	
	public int selectCountAllCorp() throws SQLException {
		int cnt = 0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder countAllCorp = new StringBuilder();
			countAllCorp
			.append("    select count(corp_num)    ")
			.append("    from corp    ");
			
			pstmt = con.prepareStatement(countAllCorp.toString());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            cnt = rs.getInt(1);
	        }// end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return cnt;
	}// selectCountAllCorp
	
	public int selectCountAllJobSeeker() throws SQLException {
		int cnt = 0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder countAllJob = new StringBuilder();
			countAllJob
			.append("    select count(apply_num)    ")
			.append("    from apply    ");
			
			pstmt = con.prepareStatement(countAllJob.toString());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            cnt = rs.getInt(1);
	        }// end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return cnt;
	}// selectCountAllJobSeeker
	
}// class
