package kr.co.sist.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.admin.vo.AdminUserVO;
import kr.co.sist.admin.vo.SelectUserVO;
import kr.co.sist.dao.DbConnection;


public class AdminUserDAO {
	
	// 총 가입인원
	public int selectCountAllUser() throws SQLException {
		int cnt = 0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder countCorp = new StringBuilder();
			countCorp
			.append("    select count(user_id)  ")
			.append("    from user_table    ")
			.append("    where quit_date is null    ");
			
			pstmt = con.prepareStatement(countCorp.toString());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            cnt = rs.getInt(1);
	        }// end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		return cnt;
	}// selectCountAllUser
	
	// 가입자 현황 및 검색
	public List<SelectUserVO> selectUser(String uName) throws SQLException {
		List<SelectUserVO> list = new ArrayList<SelectUserVO>();
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder selectUser = new StringBuilder();
			selectUser
			.append("    select user_id, name, birth_date, addr, tel, reg_date  ")
			.append("    from   user_table    ")
			.append("    where quit_date is null    ");
			
			// 아이디 검색한 경우
			if(uName != null) {
				selectUser.append("    and user_id = ?  ");
				pstmt = con.prepareStatement(selectUser.toString());
				pstmt.setString(1, uName);
			}else {
				pstmt = con.prepareStatement(selectUser.toString());
			}// end else
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SelectUserVO suVO = new SelectUserVO();
				suVO.setId(rs.getString("user_id"));
				suVO.setName(rs.getString("name"));
				suVO.setBirthDate(rs.getDate("birth_date"));
				suVO.setAddr(rs.getString("addr"));
				suVO.setTel(rs.getString("tel"));
				suVO.setRegDate(rs.getDate("reg_date"));
				
				list.add(suVO);
			}// end while
			
			// 여기 else문
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		return list;
	}// selectUser
	
	// 회원 수정
	public AdminUserVO selectUserInfo(String id) throws SQLException {
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		AdminUserVO auVO = null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder selectEdit = new StringBuilder();
			selectEdit
			.append("    select name, user_id, tel, birth_date, email, zipcode, addr, detail_addr, img    ")
			.append("    from user_table     ")
			.append("    where user_id = ?   ");
			
			pstmt = con.prepareStatement(selectEdit.toString());
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				auVO = new AdminUserVO();
				auVO.setName(rs.getString("name"));
				auVO.setId(rs.getString("user_id"));
				auVO.setTel(rs.getString("tel"));
				auVO.setBirthDate(rs.getDate("birth_date"));
				auVO.setEmail(rs.getString("email"));
				auVO.setZipcode(rs.getInt("zipcode"));
				auVO.setAddr(rs.getString("addr"));
				auVO.setDetailAddr(rs.getString("detail_addr"));
				auVO.setImg(rs.getString("img"));
			}// end while
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		return auVO;
	}// selectOneUser
	
	public int updateUser(AdminUserVO auVO) throws SQLException {
		int result;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dbCon.getConn();
			StringBuilder updateUser = new StringBuilder();
			
			updateUser
			.append("    update user_table    ")
			.append("    set name=?, tel=?, birth_date=?, email=?, zipcode=?, addr=?, detail_addr=?, img=?    ")
			.append("    where user_id=?    ");
			
			pstmt = con.prepareStatement(updateUser.toString());
			
			pstmt.setString(1, auVO.getName());
			pstmt.setString(2, auVO.getTel());
			pstmt.setDate(3, auVO.getBirthDate());
			pstmt.setString(4, auVO.getEmail());
			pstmt.setInt(5, auVO.getZipcode());
			pstmt.setString(6, auVO.getAddr());
			pstmt.setString(7, auVO.getDetailAddr());
			pstmt.setString(8, auVO.getImg());
			pstmt.setString(9, auVO.getId());
			
			result = pstmt.executeUpdate();
		}finally {
		dbCon.dbClose(null, pstmt, con);
		}//end finally
	return result;
	}// updateUser
	
	// 회원 삭제
	public int updateQuitUser(String id) throws SQLException {
		int result;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dbCon.getConn();
			StringBuilder deleteUser = new StringBuilder();
			deleteUser 
			.append("    update user_table    ")
			.append("    set name='n/a',pass='n/a',email='n/a',tel='n/a',zipcode=0,addr='n/a',detail_addr='n/a',terms='N',reg_date=null,birth_date=null,img=null,gender=null,quit_date=sysdate    ")
			.append("    where user_id = ?    ");
			
			pstmt = con.prepareStatement(deleteUser.toString());
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		return result;
	}// deleteUser
}// class
