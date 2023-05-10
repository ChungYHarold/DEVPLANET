package kr.co.sist.user.dao;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.user.vo.FindIdVO;
import kr.co.sist.user.vo.FindPassVO;
import kr.co.sist.user.vo.LoginResultVO;
import kr.co.sist.user.vo.LoginVO;
import kr.co.sist.user.vo.ModifiyInfoVO;
import kr.co.sist.user.vo.ModifiyPassVO;
import kr.co.sist.user.vo.NewVO;
import kr.co.sist.user.vo.ResetPassVO;
import kr.co.sist.user.vo.ResultIdVO;
import kr.co.sist.util.cipher.DataEncrypt;

public class UserDAO {
	
	//회원가입
	public void insertNew(NewVO nVO)throws SQLException {
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder insertInfo=new StringBuilder();
			insertInfo
			.append("   insert into user_table(user_id, name, pass, email, tel, zipcode, addr, detail_addr, terms, reg_date)")
			.append("   values(?,?,?,?,?,?,?,?,?,sysdate)");
			
			pstmt=con.prepareStatement(insertInfo.toString());
			
			pstmt.setString(1, nVO.getUserId());
			pstmt.setString(2, nVO.getName());
			pstmt.setString(3, nVO.getPass());
			pstmt.setString(4, nVO.getEmail());
			pstmt.setString(5, nVO.getTel());
			pstmt.setInt(6, nVO.getZipcode());
			pstmt.setString(7, nVO.getAddr());
			pstmt.setString(8, nVO.getDetail_addr());
			pstmt.setString(9, nVO.getTerms());
			
			pstmt.executeQuery();
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
			
		}//end finally
		
	}//insertNew
	
	public String selectIdDup(String id)throws SQLException {
		String resultId="";
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//1. JNDI사용 객체 생성
		//2. DataSource 얻기
		
		try {
			
		//3. Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성 객체얻기
			String selectId="select user_id   from user_table   where user_id=?";
			pstmt=con.prepareStatement(selectId);
		//5. 바인드변수 값 할당
			pstmt.setString(1, id);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				resultId=rs.getString("user_id");
			}//end if
			
		}finally {
		//7. 연결 끊기
		dbCon.dbClose(rs, pstmt, con);	
		}//end finally
		
		return resultId;
	}//selectIdDup
	
	//로그인
	public LoginResultVO selectLogin(LoginVO lVO)throws SQLException {
		LoginResultVO lrVO=null;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder selectLogin = new StringBuilder();
			selectLogin
			.append("   select user_id, name ")
			.append("   from user_table       ")
			.append("   where user_id=? and pass=?");
			
			pstmt=con.prepareStatement(selectLogin.toString());
			
			pstmt.setString(1, lVO.getUserId());
			pstmt.setString(2, lVO.getPass());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				lrVO=new LoginResultVO(rs.getString("user_id"), rs.getString("name"));
			}//end if
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return lrVO;
	}//selectLogin
	
	
	
	//아이디 찾기
	public ResultIdVO selectFindId(FindIdVO fiVO)throws SQLException {
		ResultIdVO rVO=null;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder selectFindId=new StringBuilder();
			selectFindId
			.append("   select user_id, reg_date   ")
			.append("   from user_table   ")
			.append("   where name=? and email=?   ");
			
			pstmt=con.prepareStatement(selectFindId.toString());
			
			pstmt.setString(1, fiVO.getName());
			pstmt.setString(2, fiVO.getEmail());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				rVO=new ResultIdVO(rs.getString("user_id"), rs.getDate("reg_date"));
			}//end if
			
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return rVO;
	}//selectFindId
	
	//비밀번호 찾기
	public boolean selectFindPass(FindPassVO fpVO)throws SQLException {
		boolean resultFlag=false;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder selectInfo=new StringBuilder();
			selectInfo
			.append("   select pass  ")
			.append("   from user_table  ")
			.append("   where user_id=? and email=? and name=?  ");
			
			pstmt=con.prepareStatement(selectInfo.toString());
			
			pstmt.setString(1, fpVO.getUserId());
			pstmt.setString(2, fpVO.getEmail());
			pstmt.setString(3, fpVO.getName());
			
			int result=pstmt.executeUpdate();
			
			resultFlag = result >0;
			
			
			
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
		return resultFlag;
	}//selectFindPass
	
	public int updatePass(ResetPassVO rpVO)throws SQLException {
		int result=0;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder updatePass=new StringBuilder();
			updatePass
			.append("   update user_table   ")
			.append("   set pass=?   ")
			.append("   where user_id=?   ");
			
			pstmt=con.prepareStatement(updatePass.toString());
			
			pstmt.setString(1, rpVO.getNewPass());
			pstmt.setString(2, rpVO.getUserId());
			
			result = pstmt.executeUpdate();
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
		return result;
	}//updatePass
	
	//비밀번호 확인 
	public boolean selectConPass(LoginVO lVO)throws SQLException {
		boolean flag=false;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			
			con=dbCon.getConn();
			String selectPass="select user_id from user_table where pass=?";
			
			pstmt=con.prepareStatement(selectPass);
			
			pstmt.setString(1, lVO.getPass());
			
			int result=pstmt.executeUpdate();
			flag = result>0;
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		return flag;
	}//selectConPass
	
	//회원정보수정
	public ModifiyInfoVO selectUserInfo(String id)throws SQLException {
		ModifiyInfoVO miVO=null;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder selectInfo=new StringBuilder();
			selectInfo
			.append("   select name, email, tel, zipcode, addr, detail_addr, terms, birth_date, gender")
			.append("   from user_table  ")
			.append("   where user_id=?");
			
			pstmt=con.prepareStatement(selectInfo.toString());
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				miVO=new ModifiyInfoVO();
				miVO.setName(rs.getString("name"));
				miVO.setEmail(rs.getString("email"));
				miVO.setTel(rs.getString("tel"));
				miVO.setZipcode(rs.getInt("zipcode"));
				miVO.setAddr(rs.getString("addr"));
				miVO.setDetailAddr(rs.getString("detail_addr"));
				miVO.setTerms(rs.getString("terms"));
				miVO.setBirthYear(rs.getDate("birth_date"));
				miVO.setGender(rs.getString("gender"));
			}//end if
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return miVO;
	}//selectUserInfo
	
	public int updateUserInfo(ModifiyInfoVO miVO)throws SQLException {
		int result=0;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder updateUserInfo = new StringBuilder();
			updateUserInfo
			.append("   update user_table   ")
			.append("   set email=?, tel=?, zipcode=?, addr=?, detail_addr=?, terms=?   ")
			.append("   where user_id=?");
			
			pstmt=con.prepareStatement(updateUserInfo.toString());
			
			pstmt.setString(1, miVO.getEmail());
			pstmt.setString(2, miVO.getTel());
			pstmt.setInt(3, miVO.getZipcode());
			pstmt.setString(4, miVO.getAddr());
			pstmt.setString(5, miVO.getDetailAddr());
			pstmt.setString(6, miVO.getTerms());
			pstmt.setString(7, miVO.getUserId());
			
			result=pstmt.executeUpdate();
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
			
		}//end finally
		
		return result;
	}//updateUserInfo
	
	//비밀번호 수정
	public int updateUserPass(ModifiyPassVO mpVO)throws SQLException {
		int result=0;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder updatePass = new StringBuilder();
			updatePass
			.append("   update user_table ")
			.append("   set pass=? ")
			.append("   where user_id=? and pass=? ");
			
			pstmt=con.prepareStatement(updatePass.toString());
			
			pstmt.setString(1, mpVO.getNewPass());
			pstmt.setString(2, mpVO.getUserId());
			pstmt.setString(3, mpVO.getPass());
			
			result = pstmt.executeUpdate();
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
			
		}//end finally
		
		return result;
	}//updateUserPass
	
	//회원 탈퇴
	public int updateQuit(String id)throws SQLException{
		int result=0;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder updatePass = new StringBuilder();
			updatePass
			.append("   update user_table ")
			.append("   set name='n/a', pass='n/a', email='n/a', tel='n/a', zipcode=0, addr='n/a',detail_addr='n/a', terms='N', "
					+ "reg_date=null , birth_date=null, img=null, gender=null, quit_date=sysdate ")
			.append("   where user_id=? ");
			
			pstmt=con.prepareStatement(updatePass.toString());
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
			
		}//end finally0
		
		return result;
	}//updateQuit
	
	public void deleteResume(String userId)throws SQLException {
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=dbCon.getConn();
			
			StringBuilder deleteResume = new StringBuilder();
			deleteResume
			.append("   delete   ")
			.append("   from  resume   ")
			.append("   where  resume.user_id=?   ");
			
			pstmt=con.prepareStatement(deleteResume.toString());
			
			pstmt.setString(1, userId);
			
			pstmt.executeQuery();
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
	}//deleteResume
	
	
	

}//class
