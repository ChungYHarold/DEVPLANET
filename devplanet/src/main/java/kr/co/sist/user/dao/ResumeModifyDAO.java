package kr.co.sist.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.user.vo.CertificateAllVO;
import kr.co.sist.user.vo.CertificateVO;
import kr.co.sist.user.vo.EducationAllVO;
import kr.co.sist.user.vo.EducationVO;
import kr.co.sist.user.vo.LanguageAllVO;
import kr.co.sist.user.vo.ResumeDataVO;
import kr.co.sist.user.vo.ResumeRegisterVO;
import kr.co.sist.user.vo.SkillAllVO;



//이력서불러오기DAO
public class ResumeModifyDAO {
	
	
	
	//자격증
	public List<CertificateAllVO> selectCertificate(int rNum)throws SQLException{
		List<CertificateAllVO> list=new ArrayList<CertificateAllVO>();
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		try {
			
			//1. JNDI 사용 객체 생성
			//2. DataSource 얻기
			
			//3. Connection 얻기
			con=dbCon.getConn();
			
			//4. 쿼리문 생성객체 얻기
			StringBuilder selectInjection=new StringBuilder();
			selectInjection
			.append(" select NUM, NAME, ISSUER, GET_DATE 			") 
			.append(" from CERTIFICATE 				")
			.append(" where r_num = ? 			");
			
			pstmt= con.prepareStatement(selectInjection.toString());
			pstmt.setInt(1, rNum);
			
			//6. 쿼리문 수행 후 결과 얻기
			
			rs = pstmt.executeQuery();
			
			CertificateAllVO caVO = null;
			
			while(rs.next()) {
				caVO = new CertificateAllVO();
				caVO.setNum(rs.getInt("num"));
				caVO.setNameC(rs.getString("name"));
				caVO.setIssuer(rs.getString("issuer"));
				caVO.setGetDateC(rs.getString("get_date"));
				
				list.add(caVO);
			}//end while
			
		} finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
		
		return list;
	}//selectCertificate
	
	//자격증 삭제
	   public int deleteCertificate(int num)throws SQLException {
		   int cnt = 0;
		   
			DbConnection db=DbConnection.getInstance();
			Connection con=null;
			PreparedStatement pstmt=null;

			try {
				
				con=db.getConn();
				
				String deleteCer=" delete from certificate where num=? ";  
				pstmt=con.prepareStatement(deleteCer);
				
				pstmt.setInt(1, num);
				cnt=pstmt.executeUpdate();
				
			}finally {
				db.dbClose(null, pstmt, con);
				
			}//end finally
			System.out.println(cnt);
			return cnt; // 성공 - 1 / 실패 - 0 반환
	   }//deleteCertificate
	
	//학력
	public List<EducationAllVO> selectEducation(int rNum)throws SQLException{
		List<EducationAllVO> list=new ArrayList<EducationAllVO>();
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		try {
			
			//1. JNDI 사용 객체 생성
			//2. DataSource 얻기
			
			//3. Connection 얻기
			con=dbCon.getConn();
			
			//4. 쿼리문 생성객체 얻기
			StringBuilder selectInjection=new StringBuilder();
			selectInjection
			.append(" select NUM, SCHOOL_TYPE, SCHOOL_NAME, PERIOD, MAJOR, GPA 			") 
			.append(" from education 				")
			.append(" where r_num = ? 			");
			
			
			pstmt= con.prepareStatement(selectInjection.toString());
			pstmt.setInt(1, rNum);
			
			//6. 쿼리문 수행 후 결과 얻기
			
			rs = pstmt.executeQuery();
			
			EducationAllVO eaVO = null;
			
			while(rs.next()) {
				eaVO = new EducationAllVO();
				eaVO.setNum(rs.getInt("num"));
				eaVO.setSchoolType(rs.getString("school_type"));
				eaVO.setSchoolName(rs.getString("school_name"));
				eaVO.setPeriod(rs.getString("period"));
				eaVO.setMajor(rs.getString("major"));
				eaVO.setGpa(rs.getString("gpa"));
				
				list.add(eaVO);
			}//end while
			
		} finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
		
		return list;
	}//selectCertificate
	
	
	
	//학력 삭제
	   public int deleteEducation(int num)throws SQLException {
		   int cnt = 0;
		   
			DbConnection db=DbConnection.getInstance();
			Connection con=null;
			PreparedStatement pstmt=null;

			try {
				
				con=db.getConn();
				
				String deleteEdu=" delete from education where num=? ";
				pstmt=con.prepareStatement(deleteEdu);
				
				pstmt.setInt(1, num);
				cnt=pstmt.executeUpdate();
				
			}finally {
				db.dbClose(null, pstmt, con);
				
			}//end finally
			
			return cnt; // 성공 - 1 / 실패 - 0 반환
	}//deleteEducation
	
	//어학
	public List<LanguageAllVO> selectLanguage(int rNum)throws SQLException{
		List<LanguageAllVO> list=new ArrayList<LanguageAllVO>();
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		try {
			
			//1. JNDI 사용 객체 생성
			//2. DataSource 얻기
			
			//3. Connection 얻기
			con=dbCon.getConn();
			
			//4. 쿼리문 생성객체 얻기
			StringBuilder selectInjection=new StringBuilder();
			selectInjection
			.append(" select NUM, NAME, TEST_NAME, SCORE, GET_DATE 			") 
			.append(" from language 				")
			.append(" where r_num = ? 			");
			
			
			pstmt= con.prepareStatement(selectInjection.toString());
			pstmt.setInt(1, rNum);
			
			//6. 쿼리문 수행 후 결과 얻기
			
			rs = pstmt.executeQuery();
			
			LanguageAllVO laVO = null;
			
			while(rs.next()) {
				laVO = new LanguageAllVO();
				laVO.setNum(rs.getInt("num"));
				laVO.setNameL(rs.getString("name"));
				laVO.setTestName(rs.getString("test_name"));
				laVO.setScore(rs.getString("score"));
				laVO.setGetDateL(rs.getString("get_date"));
				
				list.add(laVO);
			}//end while
			
		} finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
		
		return list;
	}//selectCertificate
	
	//어학 삭제
	   public int deleteLanguage(int num)throws SQLException {
		   
		   int cnt = 0;
		   
			DbConnection db=DbConnection.getInstance();
			Connection con=null;
			PreparedStatement pstmt=null;

			try {
				
				con=db.getConn();
				
				String deleteLang=" delete from language where num=? ";
				pstmt=con.prepareStatement(deleteLang);
				
				pstmt.setInt(1, num);
				cnt=pstmt.executeUpdate();
				
			}finally {
				db.dbClose(null, pstmt, con);
				
			}//end finally
			
			return cnt; // 성공 - 1 / 실패 - 0 반환
	   }//deleteLanguage
	
	//이력서 수정 page에서 해당 이력서에 등록했던 스킬 selectAll 2023-04-24 확인
	public List<SkillAllVO> selectSkill(int rNum) throws SQLException{
		List<SkillAllVO> list=new ArrayList<SkillAllVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dbCon = DbConnection.getInstance();
		try {
			
			//1. JNDI 사용 객체 생성
			//2. DataSource 얻기
			
			//3. Connection 얻기
			con=dbCon.getConn();
			
			//4. 쿼리문 생성객체 얻기
			StringBuilder selectInjection=new StringBuilder();
			selectInjection
			.append(" select NUM, NAME 			") 
			.append(" from skill 				")
			.append(" where r_num = ? 			");
			
			pstmt= con.prepareStatement(selectInjection.toString());
			pstmt.setInt(1, rNum);
			
			//6. 쿼리문 수행 후 결과 얻기
			
			rs = pstmt.executeQuery();
			
			SkillAllVO saVO = null;
			
			while(rs.next()) {
				saVO = new SkillAllVO();
				saVO.setNum(rs.getInt("num"));
				saVO.setName(rs.getString("name"));
				
				list.add(saVO);
			}//end while
			
		} finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
		return list;
	}//selectCertificate

	
	//이력서 수정 page에서 해당 이력서에 등록했던 스킬 delete 2023-04-24 확인
	//스킬 삭제
	   public int deleteSkill(int num) throws SQLException {
		   
		   int cnt = 0;
			DbConnection db=DbConnection.getInstance();
			Connection con=null;
			PreparedStatement pstmt=null;

			try {
				
				con=db.getConn();
				
				String deleteAd=" delete from skill where num=? ";
				pstmt=con.prepareStatement(deleteAd);
				
				pstmt.setInt(1, num);
				cnt=pstmt.executeUpdate();
				
			}finally {
				db.dbClose(null, pstmt, con);
				
			}//end finally
			
			return cnt; // 성공 - 1 / 실패 - 0 반환
		   
	   }//deleteSkill
	
	
	//이력서 저장버튼 누르면 이력서 테이블에 저장 됨 update // 04-23 확인
		public int updateResume(ResumeRegisterVO rrVO) throws SQLException {
			
			int cnt = 0;
			DbConnection dbCon = DbConnection.getInstance();
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
			//1. 드라이버 로딩
			//2. 커넥션 얻기
				con = dbCon.getConn();
			//3. 쿼리문 생성객체 얻기
				StringBuilder updateTestJdbc = new StringBuilder();
				updateTestJdbc
				.append(" 	update  resume				") 
				.append(" 	set		title=?, job=?, career=?, empform=?, sal=?, area=?, input_date=to_char(sysdate,'yyyy-mm-dd')")
				.append(" 	where   r_num = ?				");
				
				pstmt = con.prepareStatement(updateTestJdbc.toString());
			//4. 바인드변수에 값설정
				pstmt.setString(1, rrVO.getTitle());
				pstmt.setString(2, rrVO.getJob());
				pstmt.setString(3, rrVO.getCareer());
				pstmt.setString(4, rrVO.getEmpform());
				pstmt.setString(5, rrVO.getSal());
				pstmt.setString(6, rrVO.getArea());
				pstmt.setInt(7, rrVO.getrNum());
				
			//5. 쿼리문 수행 후 결과 얻기
				cnt = pstmt.executeUpdate();
				
			} finally {
				//6. 연결 끊기
				dbCon.dbClose(null, pstmt, con);
			}//end finally
			
			return cnt;
		}//updateResume
	
		//이력서수정 page에 회원,이력서테이블 select //2023-04-21
				public ResumeDataVO selectResumeData(int rNum) throws SQLException {
					
					ResumeDataVO rdVO = null;
					DbConnection dbCon = DbConnection.getInstance();
							
					Connection con=null;
					PreparedStatement pstmt=null;
					ResultSet rs = null;
					
					
					//1. JNDI 사용 객체 생성
					//2. DataSource 얻기

					try {
						//3. Connection 얻기
						con=dbCon.getConn();
						
						//4. 쿼리문 생성객체 얻기
						StringBuilder selectResumeData = new StringBuilder();
						selectResumeData
						.append("	select resume.title, resume.job, resume.career, resume.empform, resume.sal, resume.area, user_table.name, user_table.email, user_table.tel, user_table.addr, user_table.birth_date, user_table.img, user_table.gender " )
						.append("	from resume 									   																					" )
						.append("	join user_table ON resume.user_id = user_table.user_id 									   " )
						.append("	where resume.r_num = ?						");
						pstmt = con.prepareStatement(selectResumeData.toString());
						
						pstmt.setInt(1, rNum);
						
						rs = pstmt.executeQuery();
					//5. 바인드 변수 값 설정
						if(rs.next()) {
							rdVO = new ResumeDataVO
									(rs.getString("name"), rs.getString("email"), rs.getString("tel"),
									rs.getString("addr"), rs.getString("img"), rs.getString("gender") ,
									rs.getDate("birth_date") ,rs.getString("title"), rs.getString("job"), rs.getString("career")
									,rs.getString("empform"), rs.getString("sal"), rs.getString("area"));
						}//end if
					}finally {
						dbCon.dbClose(null, pstmt, con);
					}//end finally
					return rdVO;
				}//selectUserData
		
}//class
