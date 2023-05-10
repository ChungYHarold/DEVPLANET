<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.dao.AdminCorpDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="check_login.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
%>    
<jsp:useBean id="acVO" class="kr.co.sist.admin.vo.AdminCorpVO" scope="page"/>
등록완료

<!-- 이미지 폴더에 저장 -->
<%
		// 1. 저장 디렉토리를 설정
		File saveDirectory = new File("C:/Users/user/git/prj2/prj2/src/main/webapp/upload");
		int totalMaxSize = 1024*1024*500;
		int fileSize = 1024*1024*10;
		// 2. FileUpload Component 생성 (MultipartRequest) => 생성함과 동시에 파일이 업로드된다.
		MultipartRequest mr = new MultipartRequest(request, saveDirectory.getAbsolutePath(), totalMaxSize, "UTF-8", 
				new DefaultFileRenamePolicy());
		// 3. FileUpload Component를 사용하여 파라미터를 받는다.
		
		String originalName = mr.getOriginalFileName("file");
		String newFileName = mr.getFilesystemName("file");
		
		// 대표자 배열
		String[] nameList = mr.getParameterValues("repNames");
		int leng=nameList.length;
		
		int empValue = Integer.parseInt(mr.getParameter("emp"));
		int zipValue = Integer.parseInt(mr.getParameter("zipcode"));
		
		// Date값 받기
		/* String establishYearString = mr.getParameter("establishYear");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date establishYear = sdf.parse(establishYearString);
		java.sql.Date sqlEstablishYear = new java.sql.Date(establishYear.getTime());  */  
				
		// VO값 받기
		acVO.setName(mr.getParameter("name"));
		acVO.setType(mr.getParameter("type"));
		acVO.setBusinessNum(mr.getParameter("businessNum"));
		acVO.setField(mr.getParameter("field"));
		acVO.setEmp(empValue);
		acVO.setHomepage(mr.getParameter("homepage"));
		acVO.setEstablishYear(Date.valueOf(mr.getParameter("establishYear")));
		acVO.setZipcode(zipValue);
		acVO.setAddr(mr.getParameter("addr"));
		acVO.setDetailAddr(mr.getParameter("detailAddr"));
		acVO.setLogo(newFileName);
		acVO.setRepresentativeName(nameList);
%>

<%
AdminCorpDAO acDAO=new AdminCorpDAO();
try{
	acDAO.insertCorp(acVO);
	acDAO.insertRepresent(acVO);
	
	out.println("<script>");
    out.println("alert('기업이 등록되었습니다.');");
    out.println("location.href = 'http://localhost/prj2/project_admin/2.corpInfo/company_info.jsp';"); // 수정 후 이동할 페이지 경로
    out.println("</script>"); 
}catch(SQLException se) {
	se.printStackTrace();
	out.println("<script>");
    out.println("alert('오류가 발생했습니다. 다시 시도해주세요.');");
    out.println("history.go(-1);");
    out.println("</script>");
}//end catch
%> 






