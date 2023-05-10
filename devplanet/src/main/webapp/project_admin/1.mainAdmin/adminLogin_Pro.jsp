<%@page import="kr.co.sist.admin.vo.AdminResultVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.sist.admin.dao.AdminDAO" %>
<%@ page import = "kr.co.sist.admin.vo.AdminLoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN 끝 -->
<script type="text/javascript">
if("<%=request.getMethod()%>" == "GET") {
	alert("정상적인 방식으로 요청하지 않으셨습니다.");
	location.href="http://localhost/prj2/project_admin/1.mainAdmin/adminLogin.jsp";
};
</script>

<jsp:useBean id="alVO" class="kr.co.sist.admin.vo.AdminLoginVO" scope="page"/>
<jsp:setProperty property="*" name="alVO"/>

<%
AdminDAO aDAO = new AdminDAO();
AdminResultVO arVO = aDAO.adminLogin(alVO);

if (arVO != null) {
    // session.setAttribute("admin_id", arVO.getId());
    session.setAttribute("arVO", arVO);
    response.sendRedirect("main.jsp");
} else {
    out.println("<script>");
    out.println("alert('등록된 정보와 일치하지 않습니다.');");
    out.println("location.href='http://localhost/prj2/project_admin/1.mainAdmin/adminLogin.jsp'");
    out.println("</script>");
}
%>

	




