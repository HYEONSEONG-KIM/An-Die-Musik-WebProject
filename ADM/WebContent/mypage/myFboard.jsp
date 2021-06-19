<%@page import="adm.vo.FboardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel = "stylesheet" href = "<%=request.getContextPath()%>/css/mypage.css">
</head>
<body>
<%
	List<FboardVO> list =(List<FboardVO>)request.getAttribute("list");
// 	int spage = (Integer)request.getAttribute("sp");
// 	int epage = (Integer)request.getAttribute("ep");
// 	int tpage = (Integer)request.getAttribute("tp");
%>
<jsp:include page="../include.jsp" flush="false"/>

	<div id = "par">
		
		<div id = "nav">
		
			<div id = "perfdate">
		  		<h2>공연 일정</h2>
		  	</div>
		  	
			<div class="list-group">
				<a href="mypage/mypageIndex.jsp" class="list-group-item">마이 페이지</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">개인 정보 변경</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">예매 내역 확인</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">My Q&A</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">회원 탈퇴</a>
			</div>
		</div>
		
		<div class = "pad"></div>
		
		<div id = "content">
		<!-- 여기가 리스트 불러올 공간 -->
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
		
		<tbody>
		<%if(list == null){
		%>
			<tr>
				<td colspan="5">작성하신 게시글이 없습니다</td>
			</tr>
		<%}else{
			for(int i =0; i < list.size(); i++){
				FboardVO vo = list.get(i);
			
			%>
			<tr>
				<td><%=vo.getFboard_code() %></td>
				<td><a href="<%=request.getContextPath()%>/FboardDetail.do?fboard_code=<%=vo.getFboard_code()%>"><%=vo.getFboard_title()%></a></td>
<%-- 				<td><a href = "<%=request.getContextPath()%>/ReservDetail.do?code=<%=vo.getAdv_code()%>"><%=vo.getPbl_nm()%></a></td> --%>
				<td><%=vo.getFboard_date().substring(0,10) %></td>
				<%-- <a href="<%=request.getContextPath()%>/FboardDetail.do?code=<%=vo.getFboard_title()%>"></a> --%>
			</tr>
			<%}
			%>
		<% }%>
		</tbody>
		</table>
		</div>
		
		<div class = "pad"></div>
		
		<div id = "end"></div>
		
		
	</div>
</body>
</html>













