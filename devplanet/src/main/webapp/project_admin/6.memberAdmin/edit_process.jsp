<%@page import="kr.co.sist.service.CipherService"%>
<%@page import="kr.co.sist.admin.vo.AdminUserVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.dao.AdminUserDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="check_login.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
%>


<!-- 이미지 폴더에 저장 -->
<%
		AdminUserVO auVO = new AdminUserVO();
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
		
		int zipValue = Integer.parseInt(mr.getParameter("zipcode"));
		String userId = mr.getParameter("user_id");
		
		// Date값 받기
		String birthDateString = mr.getParameter("birthDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthDate = sdf.parse(birthDateString);
		java.sql.Date sqlBirthDate = new java.sql.Date(birthDate.getTime());
		
		String hidden = mr.getParameter("imgHidden");
	    
		// file
		if(newFileName == null) {
			auVO.setImg(hidden);
		}else {
			auVO.setImg(newFileName); 
		}
		
		// VO값 받기
		auVO.setName(mr.getParameter("name"));
		auVO.setId(userId);
		auVO.setTel(mr.getParameter("tel"));
		auVO.setBirthDate(sqlBirthDate);
		auVO.setEmail(mr.getParameter("email"));
		auVO.setAddr(mr.getParameter("addr"));
		auVO.setDetailAddr(mr.getParameter("detailAddr"));
%> 

<%
AdminUserDAO auDAO = new AdminUserDAO();

//암호화
CipherService cs = new CipherService();
cs.updateUser(auVO);

int result = 0;

try {
    result = auDAO.updateUser(auVO);
    
    out.println("<script>");
    out.println("alert('회원이 수정되었습니다.');");
    out.println("location.href = 'member_manage.jsp';"); // 수정 후 이동할 페이지 경로
    out.println("</script>"); 
} catch(SQLException se) {
    se.printStackTrace();
    out.println("<script>");
    out.println("alert('오류가 발생했습니다. 다시 시도해주세요.');");
    out.println("history.go(-1);");
    out.println("</script>");
}
%>















