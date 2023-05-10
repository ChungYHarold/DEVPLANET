<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.admin.vo.AdminCorpVO"%>
<%@page import="kr.co.sist.admin.dao.AdminCorpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="check_login.jsp" %>
<%
    // URL 파라미터로 전달된 기업 번호 가져오기
    int corpNum = Integer.parseInt(request.getParameter("corp_num"));

    // DAO 인스턴스 생성
    AdminCorpDAO acDAO = new AdminCorpDAO();

    try {
        // 기업 삭제
        acDAO.deleteCorp(corpNum);

        // 삭제가 성공했으면 메시지 출력 후 이전 페이지로 이동
        out.println("<script>");
        out.println("alert('기업이 삭제되었습니다.');");
        out.println("location.href = 'company_info.jsp';");
        out.println("</script>");
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<script>");
        out.println("alert('오류가 발생했습니다. 다시 시도해주세요.');");
        out.println("history.go(-1);");
        out.println("</script>");
    }
%>