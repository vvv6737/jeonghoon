<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "bookstore.shopping.MemberDAO" %>
<%@ page import = "java.sql.Timestamp" %>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

int rtnVal = 0;
MemberDAO memberDAO = MemberDAO.getInstance();
rtnVal = memberDAO.confirmId(id);

if(rtnVal == -1) 
{
	out.println("<center><h3>사용할 수 있는 아이디 입니다.</h3></center>");
} else {
	out.println("<center><h3>이미 사용 중인 아이디 입니다.</h3></center>");
}
%>

<center>
	<input type="button" value="close" onclick="javascript:self.close()" />
</center>





















