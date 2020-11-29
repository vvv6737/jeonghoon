<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bookstore.shopping.CartDTO" %>
<%@ page import="bookstore.shopping.CartDAO" %>
<%@ page import="java.util.List" %> <% //여러건의 데이터를 사용하기 위해서 %>
<%@ page import="java.text.NumberFormat" %> <% //숫자를 형식에 맞춰 보여주기 위해서 %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> <% //사진을 가져오기 위해서 %>
<%
//목적 : 로그인한 사용자에게 장바구니에 담은 정보를 보여주자!!!!!!

//로그인한 상태인가?
if(session.getAttribute("id") == null) {
	response.sendRedirect("shopMain.jsp");
}
		
//사용자 아이디를 알아야 사용자 아이디에 해당하는 정보를 가져올 수 있으므로
//먼저 세션에서 사용자 정보를 추출한다.
String 	buyer		= (String)session.getAttribute("id");
String	book_kind	= request.getParameter("book_kind");

//작업에 필요한 변수들을 정의한다.
int number	= 0; 	//화면에 데이터 건수를 일련번호로 보여주기 위해서
int count	= 0;	//사용자 아이디에 해당하는 장바구니의 개수를 저장할 변수
int total	= 0;	//사용자 아이디에 해당하는 장바구니에 물품들을 계산할 총금액

//이미지 파일 작업에 필요한 변수와 설정을 한다.
String	realFolder	= "";
String	saveFolder	= "/imageFile";
ServletContext context = getServletContext();
realFolder = context.getRealPath(saveFolder);
realFolder	= "http://localhost:8088/BookStore/imageFile";
//realFolder = "C://workspace//.metadata//.plugins//org.eclipse.wst.server.core//tmp0//wtpwebapps//BookStore//imageFile";
////System.out.println("RealFolder : " + realFolder);

//사용자 아이디에 해당하는 정보를 가져온다.
List<CartDTO>	cartLists	= null;
CartDTO			cartList	= null;

CartDAO	cartDAO = CartDAO.getInstance();
count	= cartDAO.getListCount(buyer);

//가져온 정보를 화면에 출력한다.
//정보를 보고 삭제하거나, 구매확정을 한다.
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<title>장바구니 목록</title>
</head>
<body>
<!-- 
<%= application.getContextPath() %><br>
<%= request.getSession().getServletContext().getRealPath("/") %><br>
<%= application.getRealPath("/imageFile") %><br>
 -->

<jsp:include page="../module/top.jsp"/>
<%if(count < 1) { //보여줄 장바구니의 내용이 없으면 %>
	<h2><span class="label label-success">장 바 구 니</span></h2><hr>
	<h3>장바구니에 담긴 물품이 없습니다.</h3><hr>
	<input class="btn btn-info btn-xs" type="button" value="책방둘러보기"
	onclick="javascript:window.location='bookList.jsp?book_kind=<%=book_kind%>'">
<% } else { 
	cartLists = cartDAO.getCart(buyer); //화면에 보여줄 데이터를 가져온다.
%>
<div class="container">

	<h3><span class="label label-primary">장 바 구 니</span></h3>
	<!-- form의 전송방식은 반드시 method="post"로 해야 수정관련 script가 정상적으로 작동한다. -->
	<form name="cartModifyForm" method="post" action="updateCartPro.jsp">
		<table class="table table-bordered table-striped table-hover">
			<tr class="info">
				<td width= "50">번호</td>
				<td width="300">책 제 목</td>
				<td width="100">판매가격</td>
				<td width="150">수량</td>
				<td width="150">금액</td>
			</tr>
			<% //장바구니의 개수만큼 작업을 반복한다.
			for(int i = 0; i < cartLists.size(); i++) { 
				cartList = (CartDTO)cartLists.get(i); %>
			<tr>
				<td align="right"><%=++number %></td>
				<td>
					<img src="<%=realFolder%>/<%=cartList.getBook_image()%>"
						border="0" width="30" height="50" align="middle">
					<%=cartList.getBook_title()%>
				</td>
				<td align="right">
					<%=NumberFormat.getInstance().format(cartList.getBuy_price())%>&nbsp;원
				</td>
				<td>
					<!-- input 속성을 disabled로 하면 다음 페이지로 값이 넘어가지 않는다. -->
					<!-- 값을 넘어가게 하려면 readonly속성으로 하여야 한다. -->
					<input type="text" style="text-align:right" name="buy_countOld"
						size="4" value="<%=cartList.getBuy_count()%>" readonly>
					<input type="text" style="text-align:right" name="buy_count"
						size="4" value="<%=cartList.getBuy_count()%>">

					<input type="hidden" class="form-control" name="cart_id" value="<%=cartList.getCart_id()%>" />
					<input type="hidden" class="form-control" name="book_kind" value="<%=book_kind%>" />
					<input type="hidden" class="form-control" name="book_id" value="<%=cartList.getBook_id()%>" />

					<input class="btn btn-warning btn-xs ModifyBtn" type="button" value="수정"/>

				</td>
				<td align="right">
					<%total += cartList.getBuy_count()*cartList.getBuy_price();%>
					<%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price())%>&nbsp;원
					<input class="btn btn-danger btn-xs" type="button" value="삭제"
					onclick="javascript:window.location=
						'cartListDel.jsp?cart_id=<%=cartList.getCart_id()%>&book_kind=<%=book_kind%>'">
				</td>
			</tr>
			<% } %>
			<tr class="danger">
				<td colspan="5" align="right">
					<h4>총 금액 : <%=NumberFormat.getInstance().format(total)%>&nbsp;원&nbsp;</h4>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<input class="btn btn-danger btn-sm" type="button" value="구매하기"
					onclick="javascript:window.location='buyForm.jsp'"/>&nbsp;&nbsp;
					
					<input class="btn btn-primary btn-sm" type="button" value="쇼핑계속하기"
					onclick="javascript:window.location='bookList.jsp?book_kind=<%=book_kind%>'"/>&nbsp;&nbsp;
					
					<input class="btn btn-warning btn-sm" type="button" value="장바구니비우기"
					onclick="javascript:window.location='cartListDel.jsp?cart_id=all&book_kind=<%=book_kind%>'"/>&nbsp;&nbsp;
					
					<input class="btn btn-info btn-sm" type="button" value="메인으로"
					onclick="javascript:window.location='shopMain.jsp'"/>
				</td>
			</tr>
		</table>
	
	
	</form>
</div>


<% } %>

<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script>
//수정 버튼 클릭시 row값 가져오기
$(".ModifyBtn").click(function() {
	var ModifyBtn = $(this);
	
	//ModifyBtn.parent().parent() : <td>의 부모이므로 <tr>을 말한다.
	//ModifyBtn.parent() : ModifyBtn의 부모인 <td>를 말한다.
	var tr = ModifyBtn.parent().parent();
	var td = tr.children();
	
	//alert("클릭한 곳의 데이터 : " + tr.text());
	var no				= td.eq(0).text();
	var title			= td.eq(1).text();
	var buy_price		= td.eq(2).text();
	var buy_countOld	= td.eq(3).find('input').eq(0).val();
	var buy_count		= td.eq(3).find('input').eq(1).val();
	var cart_id			= td.eq(3).find('input').eq(2).val();
	var book_kind		= td.eq(3).find('input').eq(3).val();
	var book_id			= td.eq(3).find('input').eq(4).val();
	var totalMoney		= td.eq(4).text();
	
	//alert(no +":"+ title +":"+ buy_price +":"+ buy_countOld +":"+ 
	//		buy_count +":"+ cart_id +":"+ book_kind +":"+ book_id +":"+ totalMoney);
	//------------------------------------------------------------------------------------
	// form의 전송방식이 post이나, 찾아온 값을 url에 담어서 보내지 않으면 
	// 첫번째 row의 값을 전송하므로 전송할 값들을 모두 url에 담아서 보내야 한다.
	// 넘겨주는 데이터를 cartList.getCart_id()방식으로 가져오면,
	// 무조건 테이블 첫번째 줄의 값을 가져오기 때문에
	// var ModifyBtn = $(this); 로 받은 값에서 추출한 후에 전송해야 한다.
	//------------------------------------------------------------------------------------
	
	var url = "updateCartPro.jsp"
			+ "?cart_id=" 		+ cart_id
			+ "&book_kind=" 	+ book_kind
			+ "&book_id="		+ book_id
			+ "&buy_countOld="	+ buy_countOld
			+ "&buy_count="		+ buy_count;
	
	cartModifyForm.action = url;
	cartModifyForm.submit();
	
	
});
</script>	

</body>
</html>













