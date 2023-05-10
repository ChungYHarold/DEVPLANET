<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.dao.AdminUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="check_login.jsp" %>
<%
AdminUserDAO auDAO = new AdminUserDAO();

String userId = request.getParameter("user_id");
try {
    auDAO.updateQuitUser(userId);
    out.println("<script>");
    out.println("alert('회원이 삭제되었습니다.');");
    out.println("location.href = 'member_manage.jsp';");
    // response.sendRedirect("http://localhost/prj2/project_admin/6.memberAdmin/member_manage.jsp");
    out.println("</script>");
} catch (SQLException e) {
    e.printStackTrace();
    out.println("<script>");
    out.println("alert('오류가 발생했습니다. 다시 시도해주세요.');");
    out.println("history.go(-1);");
    out.println("</script>");
}
%>