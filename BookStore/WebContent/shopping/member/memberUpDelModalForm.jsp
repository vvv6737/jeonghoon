<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String	mode	= request.getParameter("mode");
String	id		= request.getParameter("id");
String	passwd	= request.getParameter("passwd");
String	name	= request.getParameter("name");
String	tel		= request.getParameter("tel1") + "-"
			    + request.getParameter("tel2") + "-"
			    + request.getParameter("tel3");
String	address	= request.getParameter("address");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<title>회원 정보 수정/탈퇴</title>
</head>
<body>

<div class="container">
	<h2>회원 정보 <%if(mode.equals("UP")) {%>수정<%}else {%>탈퇴<%} %></h2>

	<button class="btn btn-primary btn-lg" data-toggle="modal"
		data-target="#myModal">
		회원 정보 <%if(mode.equals("UP")) {%>수정<%}else {%>탈퇴<%} %>
	</button>
	
	
	<form class="form-horizontal" method="post" name="memberUpDelModalForm"
		action="memberUpDelPro.jsp">
		<input type="hidden" name="mode"	value="<%=mode%>">
		<input type="hidden" name="id"		value="<%=id%>">
		<input type="hidden" name="passwd"	value="<%=passwd%>">
		<input type="hidden" name="name"	value="<%=name%>">
		<input type="hidden" name="tel"		value="<%=tel%>">
		<input type="hidden" name="address"	value="<%=address%>">
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" 
							aria-hidden="true">X</button>
						<h4 class="modal-title" id="myModalLabel">고객 정보 <%if(mode.equals("UP")) {%>수정<%} else{%>탈퇴<%}%></h4>
					</div>
					<div class="modal-body">
						<h2><%if(mode.equals("UP")) {%>고객정보를 수정<%} else{%>회원탈퇴를 <%}%>하시겠습니까?</h2>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">고객정보 <%if(mode.equals("UP")) {%>수정<%} else{%>탈퇴<%}%></button>
						<button type="button" class="btn btn-primary" 
						onclick="javascript:window.location='memberUpDelPro.jsp?mode=<%=mode%>'">고객정보 <%if(mode.equals("UP")) {%>수정<%} else{%>탈퇴<%}%></button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
</div>


<!-- 부트스트랩의 기능을 사용하기 위해서는 jquery가 필요하다. -->
<script src="../../js/jquery-3.5.1.min.js"></script>

<!-- 부트스트랩의 기능을 사용하기 위해서 부트스트랩의 js를 가져온다. -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>

<script>
//모달 창이 떠있는 상태로 하기 위해서 스크립트를 추가
	$(function() {
		$('#myModal').modal({
			keyboard: true				
		});
	});
</script>

</body>
</html>