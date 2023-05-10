package kr.co.sist.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.user.vo.CompanyVO;
import kr.co.sist.user.vo.JobPostVO;
import kr.co.sist.user.vo.SearchCorpVO;

public class JobDAO {
	
	//메인화면 회사 썸네일
	public List<CompanyVO> selectMain()throws SQLException {
		List<CompanyVO> list=new ArrayList<CompanyVO>();
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder selectCorp=new StringBuilder();
			selectCorp
			.append("   select  corp.logo, corp.name, job_ad.title, job_num           ")
			.append("   from   corp, job_ad                        ")
			.append("   where  corp.name=job_ad.name and TRUNC(SYSDATE) - job_ad.end_date < 0       ");
			
			pstmt=con.prepareStatement(selectCorp.toString());
			
			rs=pstmt.executeQuery();
			
			CompanyVO cVO=null;
			while(rs.next()) {
				cVO=new CompanyVO();
				cVO.setcName(rs.getString("name"));
				cVO.setLogo(rs.getString("logo"));
				cVO.setTitle(rs.getString("title"));
				cVO.setjobNum(rs.getInt("job_num"));
				
				list.add(cVO);
			}//end while
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectMain

	
	//채용공고 검색 결과.
	public List<SearchCorpVO> selectSearchCorp(String str)throws SQLException{ 
		List<SearchCorpVO> list=new ArrayList<SearchCorpVO>();
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String result="";
		if(!"".equals(str)) {
			result = this.selectCorpName(str);
		}//end if
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder selectCorp=new StringBuilder();
			selectCorp
			.append("   select logo, title, job_ad.name, recruit_field, job_num   ")
			.append("   from job_ad, corp   ")
			.append("   where job_ad.name=corp.name and TRUNC(SYSDATE) - job_ad.end_date < 0   ");
			
			if("".equals(result)) { //회사명이 아닌경우
			selectCorp
			.append("   and recruit_field like '%' || ? || '%'   ");
			}//end if
			
			if( !"".equals(result)) {
				selectCorp
				.append("   and job_ad.name=?   ");
			}//end if
			
			pstmt=con.prepareStatement(selectCorp.toString());
			
			if( "".equals(result)) { 
				pstmt.setString(1, str);
			}//end if
			
			if( !"".equals(result)) {
				pstmt.setString(1, str);
			}//end if
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				SearchCorpVO scVO=new SearchCorpVO();
				scVO.setcName(rs.getString("name"));
				scVO.setLogo(rs.getString("logo"));
				scVO.setField(rs.getString("recruit_field"));
				scVO.setTitle(rs.getString("title"));
				scVO.setjobNum(rs.getInt("job_num"));
				
				list.add(scVO);
			}//end while
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return list;
	}//selectSearchCorp
	
	public String selectCorpName(String cName)throws SQLException {
		String result="";
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			
			con=dbCon.getConn();
			
			StringBuilder selectCorp=new StringBuilder();
			selectCorp
			.append("   select name   ")
			.append("   from job_ad   ")
			.append("   where name=?   ");
			
			pstmt=con.prepareStatement(selectCorp.toString());
			
			pstmt.setString(1, cName);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getString("name");
			}//end if
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return result;
	}//selectCorpName
	
	
	//채용공고페이지, 채용공고 내용
	public JobPostVO selectJobPost(String cName, int jobNum)throws SQLException {
		JobPostVO jpVO=null;
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=dbCon.getConn();
			
			StringBuilder selectPost = new StringBuilder();
			selectPost
			.append("   select corp.name, title, career, education, empform, sal, area, description, "
					+ "recruit_field, logo, field,type, homepage, work_hours, start_date, end_date, work_hours, establish_year, recruit_people, emp, job_ad.job_num   ")
			.append("   from job_ad, corp   ")
			.append("   where job_ad.name=corp.name and job_ad.name=? and job_num=?  ");
			
			pstmt=con.prepareStatement(selectPost.toString());
			pstmt.setString(1, cName);
			pstmt.setInt(2, jobNum);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				jpVO=new JobPostVO(rs.getString("name"), rs.getString("title"), rs.getString("career"), rs.getString("education"), 
						rs.getString("empform"), rs.getString("sal"), rs.getString("area"), rs.getString("description"), rs.getString("recruit_field"), rs.getString("logo"), 
						rs.getString("field"), rs.getString("type"), rs.getString("homepage"), rs.getString("work_hours"), rs.getInt("recruit_people"), rs.getInt("emp"), rs.getDate("start_date"), 
						rs.getDate("end_date"), rs.getDate("establish_year"), rs.getInt("job_num"));
				
			}//end if
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		
		return jpVO;
	}//selectJobPost
	
	
}//class
