package kr.co.sist.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.user.vo.CountNumVO;
import kr.co.sist.user.vo.OptionVO;
import kr.co.sist.user.vo.SearchResultVO;
import kr.co.sist.user.vo.UserApplyVO;

public class ApplicationDAO {
	
	public List<UserApplyVO> selectMain(OptionVO oVO)throws SQLException {
		List<UserApplyVO> list=new ArrayList<UserApplyVO>();
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String name=oVO.getCorpName();
		if(name == null) {
			name="all";
		}//end if
		String cancel=oVO.getCancel();
		if(cancel == null) {
			cancel="all";
		}//end if
		String progress=oVO.getProgress();
		if(progress == null) {
			progress="all";
		}//end if
		String read=oVO.getReadState();
		if(read == null) {
			read="all";
		}//end if
		
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder selectAll=new StringBuilder();
			selectAll
			.append("  SELECT name, title, read_state, cancel, apply.job_num, ")
			.append("  TRUNC(SYSDATE) - job_ad.end_date as diff ")
			.append("  FROM   job_ad, apply  where job_ad.job_num = apply.job_num and apply.user_id=? ");
			
			if(progress.equals("ing")) { 
				selectAll.append("   and TRUNC(SYSDATE) - job_ad.end_date < 0   ");
			}else if(progress.equals("end")) {
				selectAll.append("   and TRUNC(SYSDATE) - job_ad.end_date > 0   ");
				
			}//end if
			
			if(read.equals("rd")) { 
				selectAll.append("   and read_state = 'RD'   ");
			}else if(read.equals("urd")) {
				selectAll.append("   and read_state = 'URD'   ");
				
			}//end if
			
			if(cancel.equals("nc")) {
				selectAll.append("   and cancel='NC'   ");
			}else if(cancel.equals("c")) {
				selectAll.append("   and cancel='C'   ");
			}//end if
			
			
			if(!name.equals("all")) {
				selectAll.append("   and name=?   ");
			}//end if
			
			
			
			
			pstmt=con.prepareStatement(selectAll.toString());
			
			pstmt.setString(1, oVO.getUserId());
			
			if(!name.equals("all")) {
				pstmt.setString(2, oVO.getCorpName());
			}//end if
			
			rs=pstmt.executeQuery();
			
			
			UserApplyVO uaVO=null;
			
			while(rs.next()) {
				uaVO=new UserApplyVO(rs.getString("name"), rs.getString("title"), rs.getString("read_state"), 
						rs.getString("cancel"), rs.getInt("diff"), rs.getInt("job_num"));
				list.add(uaVO);
			}//end while
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectMain
	
	
	public int selectCountApply(String userId)throws SQLException {
		int result=0;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder selectApply=new StringBuilder();
			selectApply
			.append("   select count(cancel) num  from apply   ")
			.append("   where cancel = 'NC' and user_id=?   ");
			
			pstmt=con.prepareStatement(selectApply.toString());
			
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt("num");
			}//end if
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
			
		}//end finally
		
		return result;
	}//selectCountApply
	
	
	public CountNumVO selectCount(String userId)throws SQLException {
		CountNumVO cnVO=null;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder selectCount=new StringBuilder();
			selectCount
			.append("   SELECT  SUM(CASE WHEN read_state = 'URD' THEN 1 ELSE 0 END) AS urd,   ")
			.append("   SUM(CASE WHEN read_state = 'RD' THEN 1 ELSE 0 END) AS rd   ")
			.append("   FROM  apply WHERE user_id =?   ");
			
			pstmt=con.prepareStatement(selectCount.toString());
			
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cnVO=new CountNumVO(rs.getInt("urd"), rs.getInt("rd"));
			}//end if
			
			
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return cnVO;
	}//selectCount
	
	public List<SearchResultVO> selectSearch(OptionVO oVO) {
		List<SearchResultVO> list=new ArrayList<SearchResultVO>();
		
		return list;
	}//selectSearch

}//class
