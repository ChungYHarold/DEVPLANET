package kr.co.sist.user.dao;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.user.vo.ApplyInfoVO;
import kr.co.sist.user.vo.ApplyResumeVO;
import kr.co.sist.user.vo.OtherResumeVO;
import kr.co.sist.util.cipher.DataDecrypt;

public class ApplyResumeDAO {
	
	public List<ApplyResumeVO> selectResume(String id)throws SQLException, UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
		List<ApplyResumeVO> list=new ArrayList<ApplyResumeVO>();
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DataDecrypt dd=new DataDecrypt("FsRt4SfY4US0IWtK4JPJsw==");
		
		try{
			
			con=dbCon.getConn();
			
			StringBuilder selectResume=new StringBuilder();
			selectResume
			.append("   select resume.title, user_table.email, user_table.tel, resume.r_num  ")
			.append("   from resume, user_table  ")
			.append("   where user_table.user_id = resume.user_id and resume.user_id=?");
			
			pstmt=con.prepareStatement(selectResume.toString());
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			ApplyResumeVO arVO=null;
			while(rs.next()) {
				arVO=new ApplyResumeVO(rs.getString("title"), dd.decryption(rs.getString("email")), dd.decryption(rs.getString("tel")), rs.getInt("r_num"));
				
				list.add(arVO);
			}//end if
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectResume
	
	public void insertApply(ApplyInfoVO aiVO)throws SQLException {
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder insertApply=new StringBuilder();
			insertApply
			.append("   insert into apply(job_num, r_num, user_id, apply_num, inspec_date)  ")
			.append("   values(?,?,?, seq_apply.nextval ,sysdate)");
			
			pstmt=con.prepareStatement(insertApply.toString());
			
			pstmt.setInt(1, aiVO.getJobNum());
			pstmt.setInt(2, aiVO.getrNum());
			pstmt.setString(3, aiVO.getUserId());
			
			pstmt.executeQuery();
			
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
			
		}//end finally
		
	}//insertApply
	
	public String selectCancel(String id, int jNum)throws SQLException {
		String result="";
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			
			con=dbCon.getConn();
			
			StringBuilder selectResume=new StringBuilder();
			selectResume
			.append("   select cancel  ")
			.append("   from  apply  ")
			.append("   where user_id=? and job_num=? AND cancel IN ('C', 'NC') ");
			
			pstmt=con.prepareStatement(selectResume.toString());
			
			pstmt.setString(1, id);
			pstmt.setInt(2, jNum);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getString("cancel");
			}//end if
			
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
		return result;
	}//selectCancel
	
	public int deleteApply(String id, int jNum)throws SQLException {
		int r=0;
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			
			con=dbCon.getConn();
			
			StringBuilder selectResume=new StringBuilder();
			selectResume
			.append("   delete   ")
			.append("   from  apply  ")
			.append("   where user_id=? and job_num=? ");
			
			pstmt=con.prepareStatement(selectResume.toString());
			
			pstmt.setString(1, id);
			pstmt.setInt(2, jNum);
			
			r=pstmt.executeUpdate();
			
			
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		return r;
	}//deleteApply
	
	public int updateCancel(String id, int jNum)throws SQLException {
		int result=0;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			
			con=dbCon.getConn();
			
			StringBuilder updateCancel=new StringBuilder();
			updateCancel
			.append("   update apply   ")
			.append("   set  cancel='C'  ")
			.append("   where user_id=? and job_num=? ");
			
			pstmt=con.prepareStatement(updateCancel.toString());
			
			pstmt.setString(1, id);
			pstmt.setInt(2, jNum);
			
			result=pstmt.executeUpdate();
			
		}finally {
			dbCon.dbClose(null, pstmt, con);
			
			
		}//end finally
			
		
		return result;
	}//updateCancel
	
	
	public List<OtherResumeVO> selectOtherResume() {
		List<OtherResumeVO> list=new ArrayList<OtherResumeVO>();
		
		return list;
	}//selectOtherResume

}//class
