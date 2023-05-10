<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Date"%>
<%@page import="kr.co.sist.admin.vo.ModifyAdVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.dao.JobAdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="check_login.jsp" %>


<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->


<% 
	request.setCharacterEncoding("UTF-8");	
	
	//세션에서 아이디를 얻어왔다고 가정
//	String userId = "kim";
	

	//파라미터를 받아 mVO에 세팅 후 update 메서드 호출
	ModifyAdVO mVO = null;
	int result=0;
	
	
	// 1. 저장 디렉토리를 설정
	String saveDirectoryPath = "C:/Users/user/git/prj2/prj2/src/main/webapp/upload";

	// 사용자 디렉토리 경로 설정
	//File userDirectory = new File(saveDirectoryPath, userId);
	File userDirectory = new File(saveDirectoryPath);

	// 사용자 디렉토리가 없으면 생성
//	if (!userDirectory.exists()) {
//	    userDirectory.mkdirs();
//	}
	
	
	// 파일 최대 크기 설정
	int maxFileSize = 1024 * 1024 * 10; // 10MB

	// 요청 인코딩 방식 설정
	String encoding = "UTF-8";
			
	// 2. MultipartRequest 객체를 생성하여 파일 업로드 처리 생성함과 동시에 파일이 업로드된다.
	MultipartRequest mr = new MultipartRequest(request, userDirectory.getAbsolutePath(), maxFileSize, encoding,
	        new DefaultFileRenamePolicy());
			
	//경로에 이미 동일한 파일명이 존재하는 경우, DefaultFileRenamePolicy 클래스가 해당 파일명에 숫자를 붙여서 
	//새로운 파일명을 생성합니다. 예를 들어, "test.jpg" 파일이 이미 존재할 경우, 새로운 파일명으로 
	//"test1.jpg", "test2.jpg", "test3.jpg", ... 와 같이 숫자가 붙은 파일명이 생성됩니다. 
	//이를 통해 동일한 파일명으로 파일을 업로드해도 파일이 덮어씌워지지 않고 새로운 파일로 생성됩니다.
	
	// 3. FileUpload Component를 사용하여 파라미터를 받는다.
			String originalName = mr.getOriginalFileName("file"); 
			String newFileName = mr.getFilesystemName("file");	
			
	
	
	//사용자가 입력한 수정됐을 수도 있는 파라미터값
	mVO = new ModifyAdVO();

	
	if(newFileName==null){ //선택 안했으니까 기존 DB의 파일명으로 보여주자
		System.out.println("기존 파일로 선택함");
		mVO.setDescription(mr.getParameter("description")); 
	}else{					//파일 새로 선택했어
		System.out.println("새로 선택함");
		mVO.setDescription(newFileName);
	}//end else
	
	
	
	mVO.setcName(mr.getParameter("cName"));
	mVO.setTitle(mr.getParameter("title"));
	mVO.setCareer(mr.getParameter("career"));
	mVO.setEducation(mr.getParameter("education"));
	mVO.setEmpform(mr.getParameter("empform"));
	mVO.setSal(mr.getParameter("sal"));
	mVO.setArea(mr.getParameter("area"));
	mVO.setWorkHours(mr.getParameter("workHours"));
	mVO.setRecruitField(mr.getParameter("recruitField"));
	mVO.setRecruitPeople(Integer.parseInt(mr.getParameter("recruitPeople")));
	mVO.setJobNum(Integer.parseInt(mr.getParameter("jobNum")));
	mVO.setStartDate(Date.valueOf(mr.getParameter("startDate")));
	mVO.setEndDate(Date.valueOf(mr.getParameter("endDate")));
	

	JobAdDAO jDAO = new JobAdDAO();
	
	try{
		//VO를 넣어 DB에 update하기
		result = jDAO.updateAd(mVO);
		
	//성공했다면 */
%>
			
		<script>
			alert("채용공고가 수정되었습니다.");
			location.href="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp";
		</script>
		
<% 		

	}catch(SQLException se){
			
			se.printStackTrace();

%>
		<script>
			alert("서버에 문제가 발생했습니다. 잠시 후 다시 시도해주세요");
			location.href="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp";
		</script>
			
			
			
<%	}//end catch
		
%>