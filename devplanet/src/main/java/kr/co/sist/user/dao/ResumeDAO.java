package kr.co.sist.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.user.vo.CertificateVO;
import kr.co.sist.user.vo.EducationVO;
import kr.co.sist.user.vo.LanguageVO;
import kr.co.sist.user.vo.ResumeInsertVO;
import kr.co.sist.user.vo.ResumeListVO;
import kr.co.sist.user.vo.SkillVO;
import kr.co.sist.user.vo.UserDataVO;
import kr.co.sist.user.vo.UserUpdateVO;

/**
 * 이력서DAO
 * @author 경태
 *
 */
public class ResumeDAO {
	
	
	//이력서등록page에 이력서 insert //2023-04-21
	public void insertResume(ResumeInsertVO riVO) throws SQLException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			
		//1. JNDI 사용 객체 생성
		//2. DataSource 얻기
		
		//3. Connection 얻기
			con=dbCon.getConn();
		
		//4. 쿼리문 생성객체 얻기
			StringBuilder insertResume=new StringBuilder();
			insertResume
			.append( " insert into resume(r_num, user_id, title, job, career, empform, sal, area, input_date) " )
			.append( " values(seq_resume.nextval,?,?,?,?,?,?,?,to_char(sysdate,'yyyy-mm-dd'))");
			
			
			pstmt= con.prepareStatement(insertResume.toString());
		
		//5. 바인드 변수 값 설정
			pstmt.setString(1, riVO.getUserId());
			pstmt.setString(2, riVO.getTitle());
			pstmt.setString(3, riVO.getJob());
			pstmt.setString(4, riVO.getCareer());
			pstmt.setString(5, riVO.getEmpform());
			pstmt.setString(6, riVO.getSal());
			pstmt.setString(7, riVO.getArea());
		
		//6. 쿼리문 수행 후 결과 얻기
			pstmt.executeQuery();
		} finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
	}//insertResume
	
	//이력서등록page에 저장버튼 누르면 회원테이블 사진,생년월일,성별 update // 2023-04-21
	public int updateData(UserUpdateVO uudVO) throws SQLException {
		
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
			.append(" 	update  user_table					 	") 
			.append(" 	set		birth_date=?, img=?, gender=?	 ") //바인드 변수는 왼쪽에서 오른쪽으로 지나가면서 1번,2번,3번 값을 정한다.
			.append(" 	where   user_id = ?						");
			
			pstmt = con.prepareStatement(updateTestJdbc.toString());
		//4. 바인드변수에 값설정
			pstmt.setDate(1, uudVO.getBirthDate());
			pstmt.setString(2, uudVO.getImg());
			pstmt.setString(3, uudVO.getGender());
			pstmt.setString(4, uudVO.getUserId());
			
		//5. 쿼리문 수행 후 결과 얻기
			cnt = pstmt.executeUpdate();
			
		} finally {
			//6. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		
		return cnt;
		
	}//updateFirstData

		
	
	
	
	//이력서등록 페이지에서 스킬 추가 insert 0421
	   public void insertSkill(SkillVO sVO) throws SQLException {
	      
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      
	      DbConnection dbCon=DbConnection.getInstance();
	      
	      try {
	         
	         con=dbCon.getConn();
	         
	         String insertSkill="insert into skill(NUM, NAME, R_NUM, USER_ID) values(seq_skill.nextval,?,?,?)";//user_id랑r_num 음 FK 이고, num은 PK
	         
	         pstmt=con.prepareStatement(insertSkill);

	         String[] skillNames = sVO.getNameS();

	              for (String skillName : skillNames) {
	                  pstmt.setString(1, skillName);
	                  pstmt.setInt(2, sVO.getrNum());
	                  pstmt.setString(3, sVO.getUserId());
	                  pstmt.executeUpdate();
	              }//end for
	         
	      }finally {
	         dbCon.dbClose(null, pstmt, con);
	         
	      }//end finally
	      
	      
	   }//insertSkill
	   
	   
	   
	   //이력서등록 페이지에서 자격증 추가 insert 0421
	   public void insertCertificate(CertificateVO cVO)throws SQLException {
	      
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      
	      DbConnection dbCon=DbConnection.getInstance();
	      
	      try {
	         
	         con=dbCon.getConn();
	         
	         String insertCer="insert into certificate(NUM, NAME, ISSUER, GET_DATE, R_NUM, USER_ID) values(SEQ_CERTIFICATE.NEXTVAL,?,?,?,?,?)";//user_id랑r_num 음 FK 이고, num은 PK
	         
	         pstmt=con.prepareStatement(insertCer);
	         
	         String[] cerNames = cVO.getNameC();
	         String[] cerIssuers = cVO.getIssuer();
	         String[] cerGetDates = cVO.getGetDateC();

	         for(int i=0; i<cerNames.length; i++) {
	            pstmt.setString(1, cerNames[i]);
	            pstmt.setString(2, cerIssuers[i]);
	            pstmt.setString(3, cerGetDates[i]);
	            pstmt.setInt(4, cVO.getrNum());
	            pstmt.setString(5, cVO.getUserId());
	            pstmt.executeUpdate();
	         }//end for
	         
	         
	         
	      }finally {
	         dbCon.dbClose(null, pstmt, con);
	         
	      }//end finally
	   }//insertCertificate
	   
	   
	   
	   //이력서등록 페이지에서 언어 추가 insert 0421
	   public void insertLanguege(LanguageVO lVO)throws SQLException {
	      
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      
	      DbConnection dbCon=DbConnection.getInstance();
	      
	      try {
	         con=dbCon.getConn();
	         
	         String insertlang="insert into language(NUM, NAME, TEST_NAME, SCORE, GET_DATE, R_NUM, USER_ID)values(seq_lang.nextval,?,?,?,?,?,?)";//user_id랑r_num 음 FK 이고, num은 PK
	         
	         pstmt=con.prepareStatement(insertlang);
	         
	         
	         
	         String[] langNames = lVO.getNameL();
	         String[] langTestName = lVO.getTestName();
	         String[] langScore = lVO.getScore();
	         String[] langGetDate = lVO.getGetDateL();

	         for(int i=0; i<langNames.length; i++) {
	            pstmt.setString(1, langNames[i]);
	            pstmt.setString(2, langTestName[i]);
	            pstmt.setString(3, langScore[i]);
	            pstmt.setString(4, langGetDate[i]);
	            pstmt.setInt(5, lVO.getrNum());
	            pstmt.setString(6, lVO.getUserId());
	            pstmt.executeUpdate();
	         }//end for
	         
	      }finally {
	         dbCon.dbClose(null, pstmt, con);
	         
	      }//end finally
	      
	   }//insertLanguege
	   
	   
	   
	   //이력서등록 페이지에서 학력 추가 insert 0421
	   public void insertEducation(EducationVO eVO)throws SQLException {
	      
	      Connection con=null;
	      PreparedStatement pstmt=null;
	      
	      DbConnection dbCon=DbConnection.getInstance();
	      
	      try {
	         con=dbCon.getConn();
	         
	         String insertEdu="insert into education(NUM, SCHOOL_TYPE, SCHOOL_NAME, PERIOD, MAJOR, GPA, R_NUM, USER_ID)values(seq_education.nextval,?,?,?,?,?,?,?)";//user_id랑r_num 음 FK 이고, num은 PK
	         
	         pstmt=con.prepareStatement(insertEdu);
	         
	         String[] schoolType = eVO.getSchoolType();
	         String[] schoolName = eVO.getSchoolName();
	         String[] period = eVO.getPeriod();
	         String[] major = eVO.getMajor();
	         String[] gpa = eVO.getGpa();

	         for(int i=0; i<schoolType.length; i++) {
	            pstmt.setString(1, schoolType[i]);
	            pstmt.setString(2, schoolName[i]);
	            pstmt.setString(3, period[i]);
	            pstmt.setString(4, major[i]);
	            pstmt.setString(5, gpa[i]);
	            pstmt.setInt(6, eVO.getrNum());
	            pstmt.setString(7, eVO.getUserId());
	            pstmt.executeUpdate();
	         }//end for
	         
	      }finally {
	         dbCon.dbClose(null, pstmt, con);
	         
	      }//end finally
	      
	      
	   }//insertEducation
	      
	   
	
	

	
	//이력서등록page에 회원정보 select 불러오기 //2023-04-21
	public UserDataVO selectUserData(String userId) throws SQLException {
		
		UserDataVO udVO = null;
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
			StringBuilder selectUserData = new StringBuilder();
			selectUserData
			.append("	select 	name, email, tel, addr, gender, img, birth_date " )
			.append("	from 	user_table 									   " )
			.append("	where	user_id=? 									   " );
	
			pstmt = con.prepareStatement(selectUserData.toString());
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
		//5. 바인드 변수 값 설정
			if(rs.next()) {
				udVO = new UserDataVO(userId, rs.getString("name"), rs.getString("email"), rs.getString("tel"), rs.getString("addr"), rs.getString("gender"),rs.getString("img"), rs.getDate("birth_date"));
			}//end if
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		return udVO;
	}//selectUserData
	
	
	

	
	//이력서 현황page에서 이력서 리스트 보이기 //2023-04-22 확인
	public List<ResumeListVO> selectResume(String userId) throws SQLException{
		List<ResumeListVO> list = new ArrayList<ResumeListVO>();
		
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con = dbCon.getConn();
			
			StringBuilder selectResume = new StringBuilder();
			selectResume
			.append("	select r_num, title		")
			.append("	from resume 			")
			.append(" 	where user_id = ?		");
			
			pstmt = con.prepareStatement(selectResume.toString());
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			
			ResumeListVO rlVO = null;
			while(rs.next()) {
				rlVO = new ResumeListVO();
				rlVO.setrNum(rs.getInt("r_num"));
				rlVO.setTitle(rs.getString("title"));
				
				list.add(rlVO);
			}//end while
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		return list;
	}//selectResume
	
	
	//이력서 현황판에서 삭제 버튼 2023-04-22 확인
	public int deleteResume(int rNum) throws SQLException {
		
		int cnt = 0;
		DbConnection db=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt=null;

		try {
			
			con=db.getConn();
			
			String deleteAd=" delete resume where r_Num=?";
			pstmt=con.prepareStatement(deleteAd);
			
			pstmt.setInt(1, rNum);
			cnt=pstmt.executeUpdate();
			
		}finally {
			db.dbClose(null, pstmt, con);
			
		}//end finally
		
		return cnt; // 성공 - 1 / 실패 - 0 반환
		
	}//deleteResume
	
	public int selectResumeSEQ() throws SQLException{
		
		int rNum = 0;
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
			String selectResumeSEQ = ( " select SEQ_RESUME.currval from dual " );
			pstmt = con.prepareStatement(selectResumeSEQ);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rNum = rs.getInt(1);
			}//end if
		
		}finally {
			dbCon.dbClose(null, pstmt, con);
		}//end finally
		return rNum;
		
		
	}//end selectResumeSEQ
	
}//class
