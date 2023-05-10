<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.dao.ResumeModifyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
    info="스킬, 자격증, 학력 ,어학 삭제"
    %><%
    request.setCharacterEncoding("utf-8");
    
    ResumeModifyDAO rmDAO = new ResumeModifyDAO();
    int num = Integer.parseInt(request.getParameter("num"));
    
    
    try{
		rmDAO.deleteSkill(num);
		rmDAO.deleteLanguage(num);
		rmDAO.deleteEducation(num);
		rmDAO.deleteCertificate(num);
    }catch (NumberFormatException e) {
    	e.printStackTrace();	
    }catch(SQLException se){
		se.printStackTrace();    	
    }//end catch
    
    
	%>
	<script>
		alert("삭제 되었습니다.");
		location.href=document.referrer; //뒤로가기 후 새로고침
	</script>