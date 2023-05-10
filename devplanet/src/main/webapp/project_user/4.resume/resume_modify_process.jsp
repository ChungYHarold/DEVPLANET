<%@page import="kr.co.sist.user.dao.ResumeModifyDAO"%>
<%@page import="kr.co.sist.user.dao.JobDAO"%>
<%@page import="kr.co.sist.user.vo.LoginResultVO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="kr.co.sist.user.vo.ResumeInsertVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.vo.EducationVO"%>
<%@page import="kr.co.sist.user.vo.LanguageVO"%>
<%@page import="kr.co.sist.user.vo.CertificateVO"%>
<%@page import="kr.co.sist.user.vo.SkillVO"%>
<%@page import="kr.co.sist.user.dao.ResumeDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.swing.DefaultListModel"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- session 시작 -->
<%
	JobDAO jDAO=new JobDAO();
	
	String userId="";
	// 페이지가 응답되면 가장먼저 세션의 값을 가져온다.
	if(session.getAttribute("sesVO")==null) { // 정상적인 접근이라면 세션에 저장된 VO가 있을텐데 만약 세션의 값이 없다면(=null이라면) 로그인 창으로 보낸다.
		%>
	<script type="text/javascript">
		alert("로그인 후 이용해 주세요.");
		location.href="http://localhost/devplanet/project_user/2.join/login.jsp";
	</script>  
	<%															//로그인 창으로 보내는 예시
	} else { // 세션의 값을 불렀는데 null이 아니다 (= 세션에 값이 있다 ) => 세션에 저장할 때는 로그인 할 때 밖에 없으니까 세션에 값이 있다는 것 자체가 정상적인 접근이다.
		LoginResultVO lrVO=(LoginResultVO)session.getAttribute("sesVO");  //세션의 값을 lrVO에 담아준다.
		userId=lrVO.getUserId(); //lrVO안의 이름을 꺼내서 보여준다.
	}//end else
	%>
<!-- session 끝 -->
<%
File saveDirectory = new File("C:/Users/user/git/devplanet/devplanet/src/main/webapp/upload");
int totalMaxSize=1024*1024*10;
MultipartRequest mr = new MultipartRequest(request,saveDirectory.getAbsolutePath(), totalMaxSize, "UTF-8", new DefaultFileRenamePolicy());

// DAO생성
ResumeDAO rDAO = new ResumeDAO();
ResumeModifyDAO rmDAO= new ResumeModifyDAO();


int rNum = Integer.parseInt(mr.getParameter("rNum"));
System.out.println(rNum);
/* int rNum = 0; 
 rNum =	rDAO.selectResumeSEQ(); // 이거는 현재 이력서 번호를 조회하는 method. 
									// 이걸로 스킬, 학력, 자격증, 어학 insert */
									
								
/* int rNum = 123; */   
//        ↑↑↑ 직접 값 넣고 확인해보고 싶으면 위에 selectResumeSEQ() 주석처리 하고 사용하기   


//지금은 session에서 가져온 값을 사용하고 있으므로 값을 넣고 테스트 해보려면 맨 위에 session 스크립틀릿 주석처리하고 
//String userId = "test777"; 
//여기 바로 위에 ↑↑↑↑ 풀어서 값 넣기

%>

<!-- enctype 멀티파트라서 request 사용 불가능 -->
 		
		<jsp:useBean id="rrVO" class="kr.co.sist.user.vo.ResumeRegisterVO"/>
		<jsp:useBean id="uudVO" class="kr.co.sist.user.vo.UserUpdateVO"/>
		
		<!-- 스킬 -->
		<jsp:useBean id="sVO" class="kr.co.sist.user.vo.SkillVO"/>
		<jsp:setProperty property="*" name="sVO"/>
		
		<!-- 자격증 -->
		<jsp:useBean id="cerVO" class="kr.co.sist.user.vo.CertificateVO"/>
		<jsp:setProperty property="*" name="cerVO"/>
		
		<!-- 학력 -->
		<jsp:useBean id="eVO" class="kr.co.sist.user.vo.EducationVO"/>
		<jsp:setProperty property="*" name="eVO"/>
		
		<!-- 어학 -->
		<jsp:useBean id="lVO" class="kr.co.sist.user.vo.LanguageVO"/>
		<jsp:setProperty property="*" name="lVO"/>
		
		<!-- file upload 시작 / 04.17-->
		<%
    	request.setCharacterEncoding("utf-8");
		
		//생일
	      String birthDate = mr.getParameter("birthDate"); // 생년월일을 문자열로 받아옴
	      
	      // SimpleDateFormat을 사용하여 문자열을 java.util.Date로 변환
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Date parsedDate = sdf.parse(birthDate);
	      
	      // java.util.Date를 java.sql.Date로 변환
	      java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
	      
	      // 유저테이블에 update (이미지, 성별, 생년월일)
	      uudVO.setUserId(userId);
	      /* uudVO.setImg(mr.getFilesystemName("img")); */
	      uudVO.setGender(mr.getParameter("gender"));
	      uudVO.setBirthDate(sqlDate);

		
		//스킬테이블 추가된 값 insert
		String[] nameS=mr.getParameterValues("nameS");
		
			if(nameS != null && nameS.length > 0 && !nameS[0].trim().isEmpty()){
				sVO.setNameS(nameS);
				sVO.setrNum(rNum);
				sVO.setUserId(userId);
				
				rDAO.insertSkill(sVO);//스킬select해온값 제외 추가한 값 insert
			}//end if
			
		
		//어학테이블 추가된 값 insert
		String[] nameL=mr.getParameterValues("nameL");
		String[] testName=mr.getParameterValues("testName");
		String[] score=mr.getParameterValues("score");
		String[] getDateL=mr.getParameterValues("getDateL");
		
		if(nameL != null && nameL.length > 0 && !nameL[0].trim().isEmpty()){
			lVO.setNameL(nameL);
			lVO.setTestName(testName);
			lVO.setScore(score);
			lVO.setGetDateL(getDateL);
			lVO.setrNum(rNum);
			lVO.setUserId(userId);
			
			rDAO.insertLanguege(lVO);//어학select해온값 제외 추가한 값 insert
		}//end if
		
		
		//자격테이블 추가된 값 insert
		String[] nameC=mr.getParameterValues("nameC");
		String[] issuer=mr.getParameterValues("issuer");
		String[] getDateC=mr.getParameterValues("getDateC");
		
		if(nameC != null && nameC.length > 0 && !nameC[0].trim().isEmpty()){
			cerVO.setNameC(nameC);
			cerVO.setIssuer(issuer);
			cerVO.setGetDateC(getDateC);
			cerVO.setrNum(rNum);
			cerVO.setUserId(userId);
			
			rDAO.insertCertificate(cerVO);//자격증select해온값 제외 추가한 값 insert
		}//end if
		
		
		//학력테이블 추가된 값 insert
		String[] schoolType=mr.getParameterValues("schoolType");
		String[] schoolName=mr.getParameterValues("schoolName");
		String[] period=mr.getParameterValues("period");
		String[] major=mr.getParameterValues("major");
		String[] gpa=mr.getParameterValues("gpa");
		
		if(schoolName != null && schoolName.length > 0 && !schoolName[0].trim().isEmpty()){
			eVO.setSchoolType(schoolType);
			eVO.setSchoolName(schoolName);
			eVO.setPeriod(period);
			eVO.setMajor(major);
			eVO.setGpa(gpa);
			eVO.setrNum(rNum);
			eVO.setUserId(userId);
			
			rDAO.insertEducation(eVO);//학력select해온값 제외 추가한 값 insert
		}//end if
		
		
		//이력서 테이블 (제목, 경력, 희망직무, 연봉, 고용형태, 희망근무지) update
		rrVO.setrNum(rNum);
		rrVO.setTitle(mr.getParameter("title"));
		rrVO.setCareer(mr.getParameter("career"));
		rrVO.setJob(mr.getParameter("job"));
		rrVO.setSal(mr.getParameter("sal"));
		rrVO.setEmpform(mr.getParameter("empform"));
		rrVO.setArea(mr.getParameter("area"));
		
		String newFileName = mr.getFilesystemName("img"); 

		System.out.println("==========");
		System.out.println("rNum = "+rNum);	
		System.out.println("newFileName = "+(newFileName == null));
		
		
		
		if(newFileName == null){
			uudVO.setImg(mr.getParameter("hiddenImg"));
			System.out.println("mr.getParameter('hiddenImg') ="+mr.getParameter("hiddenImg"));
		}else{
			uudVO.setImg(newFileName);
		}//end if
		
		
		System.out.println("uudVO.getImg() ="+uudVO.getImg());
		System.out.println("newFileName ="+ newFileName);
		
		try{ 	
			rmDAO.updateResume(rrVO);//이력서테이블 update (제목, 경력, 희망직무, 연봉, 고용형태, 희망근무지)
			rDAO.updateData(uudVO);//회원테이블에 update (성별,이미지,생년월일) 
		}catch(SQLException se){
			se.printStackTrace();
		}//end catch
		
		//암호화 진행 
		/* DataEncrypt de=new DataEncrypt("FsRt4SfY4US0IWtK4JPJsw=="); */
		/* System.out.println(Integer.parseInt(request.getParameter("rNum"))); */
		%>
		 
		<!-- file upload 끝 -->
		
		
<script>
	location.href="http://localhost/devplanet/project_user/4.resume/resume_modify_complete.jsp"
</script>