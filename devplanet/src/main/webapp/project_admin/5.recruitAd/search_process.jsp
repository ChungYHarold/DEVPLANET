<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.dao.JobAdDAO"%>
<%@page import="kr.co.sist.admin.vo.JobAdNewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="기업명 조회 (숨겨진 div 화면에 보여주기)"
    %>
<%@ include file="check_login.jsp" %>
<!-- 기업명을 먼저 VO에 넣어보자!!!! 쿼리문이 잇는 DAO를 사용하지 않아 DB에 들어가지는 않음  오로지 다시 화면에 뿌려주기 위함-->
<%
request.setCharacterEncoding("utf-8");

// 넘어오는 값 중에 Date형으로 변환 후에 VO에 들어갈 수 있는 게 있음 => setProperty="*" 사용불가
// VO 객체화
//JobAdNewVO jVO=new JobAdNewVO();

JobAdDAO jDAO = new JobAdDAO();


String cName = request.getParameter("cName");

Boolean resultFlag = false; //불린은 false

//jsp 파일 안에서 코드가 실행되는 순서
//java가 먼저 실행 > script 영역이 실행됨

try{
	//db에 입력한 기업명이 있는지?
			
resultFlag = jDAO.selectFindcName(cName); 

	if(resultFlag==false){
		System.out.println("dfasdfsda?????---------------------------------");
		
	%>
	<script>
		alert("조회할 수 없는 회사명입니다. 다시 입력해주세요.");
		location.href="http://localhost/prj2/project_admin/5.recruitAd/recruit.jsp";
	</script>
	<%
}else{	//end if

	// 기업등록이 되어 있는 상태라면 아래를 실행
	
	//cname받음
	//String cName = request.getParameter("cName");

	String location="http://localhost/prj2/project_admin/5.recruitAd/recruit.jsp?flag=y&name="+URLEncoder.encode(cName, "UTF-8");
	response.sendRedirect(location);
	
}//end else
	
%>	

<% }catch(SQLException se){
	se.printStackTrace();
}//end catch

%>

 
