<%@page import="adm.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판 상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src = "<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>

<style>
    .table {
      border-collapse: collapse;
      border-top: 1px solid gray;
      width : 57%;
    }  
    .table th {
      color: black;
      background: white;
      text-align: center;
      width : 70px;
      font-weight: normal;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{caption-side: bottom; display: none;}
    
    #cont{
    	width : 50%;
    	margin-left : 60px;
    	margin-top: 30px;
    	margin-bottom: 30px;
    	
    }
    #sub{
    	margin-left : 28%;
    	margin-top : 7%;
    }
    p{
    	font-size: 22px;
    	margin-left : 15px;
    	font-weight: bold;
    }
    #but{
    	margin-left : 37%;
    }
    img{
    	width : 100%;
    	height: 100%;
    }
    
	.starR{
	  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	  background-size: auto 100%;
	  width: 30px;
	  height: 30px;
	  display: inline-block;
	  text-indent: -9999px;
	  cursor: pointer;
	}
	.starR.on{background-position:0 0;}
  </style>
<%
	ReviewVO vo =(ReviewVO)request.getAttribute("detail");
	String nm = (String)request.getAttribute("nm");
	String myid = vo.getMem_id();
	String id = (String)session.getAttribute("id");
%>
<script>
$(function(){
	$("#upd").on("click", function(){
		var form = $("#reviewForm").get(0);
		form.action = "<%=request.getContextPath()%>/ReviewUpdate.do";
		form.submit(); 
	});
	
	$('#list').on('click', function(){
		location.href=('review/review_start.jsp');
	})
	
	$('#del').on('click', function(){
		location.href= "<%=request.getContextPath()%>/ReviewDelete.do?code=<%=vo.getRev_code()%>";
	})

})
</script>
</head>
<body>
<jsp:include page="../include.jsp" flush="false"/>
<form id="reviewForm">
	<input type="hidden" id="rev_code" name="rev_code" value="<%=vo.getRev_code()%>">
</form>
<div id="sub">
<p><%=vo.getRev_title().replaceAll("", "&nbsp;") %></p>
	<table class="table">
		<tr><th>작성자</th><td id="id"><%=vo.getMem_id() %></td></tr>
		<tr><th>공연명</th><td><%=nm%></td></tr>
		<tr><th>날짜</th><td><%=vo.getRev_date()%></td></tr>
		<tr><th>조회수</th><td><%=vo.getRev_cnt()%></td></tr>
		<tr><th>평점</th><td>
		<%
			for(int i=1; i<=vo.getRev_score(); i++){
		%>
		<span class="starR on">별1</span>
		<%
			}
		%>
		</td></tr>
	</table>
<div id="cont">
	<%=vo.getRev_content().replaceAll("\r\n", "<br>") %>
</div>

</div>
<div id="but">
	<%
		if (id != null) { 
	%>
	<button type="submit" class="btn btn-default" id="del">삭제</button>
	<button type="submit" class="btn btn-default" id="list">목록으로</button>
	<%} %>
</div>

</body>
</html>