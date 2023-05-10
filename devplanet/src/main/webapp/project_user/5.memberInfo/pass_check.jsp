<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String password="test123";             //일단 DB에 접근하는건 아직 안해서 DB에 저장된 비밀번호를 test123이라고 정해놓고
String userPass = request.getParameter("pass"); // form페이지에서 사용자가 적은 비밀번호를 post방식으로 해당 페이지로 넘겨서 userPass에 저장을 한다.
if(password.equals(userPass)) { // DB에 저장된 비밀번호와 post방식으로 받은 비밀번호를 비교해서
   %>
   <jsp:forward page="correctionInfo.jsp">  <!-- 일치하면 다음 페이지로 넘기고 -->
   <jsp:param name="userId" value="test123"/><!-- 혹시 모르니까 userId랑 비번을 같이 넘겼는데 지금생각하니까 비번을 넘길 필요는 없겠네요 ㅈㅅ -->
   </jsp:forward>
   <%
} else {
    %>
    <script>
        alert("비밀번호가 일치하지 않습니다."); /* 입력한 비번이 DB에 있는 비번과 일치하지 않으면 alert창을 띄우고  */
        location.href="confrimInfo.jsp";    /* 전 페이지로 넘아간다 */
    </script>
    <%  
}//end else
%>
