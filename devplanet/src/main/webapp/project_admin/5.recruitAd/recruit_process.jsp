<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Date"%>
<%@page import="kr.co.sist.admin.vo.JobAdNewVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.dao.JobAdDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="check_login.jsp" %>

<%
request.setCharacterEncoding("utf-8");
%>

<% 
// 넘어오는 값 중에 Date형으로 변환 후에 VO에 들어갈 수 있는 게 있음 => setProperty="*" 사용불가
// VO 객체화
JobAdNewVO jVO=new JobAdNewVO();

%>


<%-- <%  넘겨줘야하는 값중에 파일이 포함되어 있어서 값을 DB에 보내는 기존 코드는 필요 없어짐

//VO에 입력해야하는 값이 int면 캐스팅하기 위해 getParameter() 등으로 받기
/* int num=Integer.parseInt(request.getParameter("num")); */
int recruitPeople=Integer.parseInt(request.getParameter("recruitPeople"));

//Date형이면 String > Date형
Date startDate = Date.valueOf(request.getParameter("startDate"));
Date endDate = Date.valueOf(request.getParameter("endDate"));


//그 값들을 VO에 담기  - JobAdNewVO 생성해서 jVO.setXXX
jVO.setcName(request.getParameter("company"));
jVO.setTitle(request.getParameter("title"));
jVO.setCareer(request.getParameter("career"));
jVO.setEducation(request.getParameter("education"));
jVO.setEmpform(request.getParameter("empform"));
jVO.setSal(request.getParameter("sal"));
jVO.setArea(request.getParameter("area"));
jVO.setWorkHours(request.getParameter("workHours"));
jVO.setRecruitField(request.getParameter("recruitField"));
jVO.setDescription(request.getParameter("description"));
jVO.setRecruitPeople(recruitPeople);
jVO.setStartDate(startDate);
jVO.setEndDate(endDate);


%> --%>

<% 
// 1. 저장 디렉토리를 설정 
File saveDirectory=new File("C:/Users/user/git/prj2/prj2/src/main/webapp/upload/");
int totalMaxSize = 1024*1024*500;
int fileSize=1024*1024*10;

// 2. FileUpload Component 생성 (MultipartRequest) => 생성과 동시에 파일이 업로드
MultipartRequest mr= new MultipartRequest(request, saveDirectory.getAbsolutePath(), totalMaxSize, "UTF-8", 
		new DefaultFileRenamePolicy());

// 3. FileUpload Component를 사용하여 파라미터를 받는다.
String originalName = mr.getOriginalFileName("file"); 
String newFileName = mr.getFilesystemName("file");	


if(newFileName==null){ //안건들였으니까 기존 파일명으로 세팅해도 뭐 괜차나~
	jVO.setDescription(mr.getParameter("description")); 
}else{				//내가 파일 새로 선택했어
	jVO.setDescription(newFileName);
}//end else
	

jVO.setcName(mr.getParameter("company"));
jVO.setTitle(mr.getParameter("title"));
jVO.setCareer(mr.getParameter("career"));
jVO.setEducation(mr.getParameter("education"));
jVO.setEmpform(mr.getParameter("empform"));
jVO.setSal(mr.getParameter("sal"));
jVO.setArea(mr.getParameter("area"));
jVO.setWorkHours(mr.getParameter("workHours"));
jVO.setRecruitField(mr.getParameter("recruitField"));
jVO.setRecruitPeople(Integer.parseInt(mr.getParameter("recruitPeople")));
jVO.setStartDate(Date.valueOf(mr.getParameter("startDate")));
jVO.setEndDate(Date.valueOf(mr.getParameter("endDate")));


String cName = mr.getParameter("company");
%>

<%-- 
<!-- 잘 들어갔는지 확인만 하는 용도 나중에 삭제 예정 -->
기업명 : <%= jVO.getcName() %>
채용공고 제목 : <%= jVO.getTitle()  %>
경력 : <%= jVO.getCareer()  %>
학력 : <%= jVO.getEducation() %>
고용형태 : <%= jVO.getEmpform()  %>
연봉 : <%= jVO.getSal() %>
지역 : <%= jVO.getArea()  %>
근무요일 및 시간 : <%= jVO.getWorkHours() %>
시작일: <%= jVO.getStartDate() %>
마감일 : <%= jVO.getEndDate() %>
모집분야 : <%= jVO.getRecruitField() %>
모집인원 : <%= jVO.getRecruitPeople() %>
상세요강 : <%= jVO.getDescription() %>
<!-- 입력날짜 : <%= jVO.getInputDate() %> --> --%>


<%
//JobAdDAO를 객체화 한 후 
JobAdDAO jDAO=new JobAdDAO();

try{
jDAO.insertAd(jVO);
//인서트 성공

%>
<script>
	alert("채용 공고 등록 성공!");
	location.href="http://localhost/prj2/project_admin/3.recruitAdmin/job_posting.jsp"; 
						//채용공고 지원자 현황 페이지
</script>
<%
}catch(SQLException se){
	se.printStackTrace();
%>
<%-- 
	<script>
	alert("잘못입력하셨거나, 누락된 정보가 있습니다. 다시 등록해주세요.");/* 기업명을 조회는 성공 */
	location.href="http://localhost/prj2/project_admin/5.recruitAd/recruit.jsp?flag=y&name='<%=cName %>'";
	</script>
	 --%>
<% }//end catch %>  


