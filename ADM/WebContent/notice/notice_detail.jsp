<%@page import="adm.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 공지사항 상세보기 JSP -->
<script type="text/javascript" src = "<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
 <style>
    .table {
      border-collapse: collapse;
      border-top: 1px solid gray;
      width : 100%;
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
    	margin-left : 60px;
    	margin-top: 10px;
    	margin-bottom: 30px;
    	
    }
    #notice_img{
    	width : 80%;
    	margin-left : 100px;
    	margin-right: 40px;
    }
    #sub{
    	border-top: 1px solid lightgray;
    	border-left: 1px solid lightgray;
    	border-right: 1px solid lightgray;
    	border-bottom: 1px solid lightgray;
    	width: 50%;
    	margin-bottom: 50px;
    }
    #titlep{
    	font-size: 22px;
    	margin-left : 15px;
    	font-weight: bold;
    	margin-top : 10px;
    }
    #but{
    	margin-left : 40%;
    	margin-bottom : 3%;
    }
    .contentImg{
    	width : 100%;
    	height: 100%;
    }
    #imgCon{
    	height: auto;
    	overflow : auto;
    	width : 80%;
    	
    }
    #par{
    	display: flex;
    	flex-direction: row;
    }
    
    .pad{
    	width : 25%;
    }

  </style>
<%
	NoticeVO vo = (NoticeVO)request.getAttribute("detail");
	String admin = (String)session.getAttribute("admin");
%>
<script>
$(function(){
	$("#upd").on("click", function(){
		var form = $("#noticeForm").get(0);
		form.action = "<%=request.getContextPath()%>/NoticeUpdate.do";
		form.submit(); 
	});
	
	$('#list').on('click', function(){
		location.href=('notice/notice_index.jsp');
	})
	
	$('#del').on('click', function(){
	
		location.href = "<%=request.getContextPath()%>/NoticeDelete.do?code=<%=vo.getNotice_code()%>";
		
	})
})
	
</script>
</head>

<body>
<jsp:include page="../include.jsp" flush="false"/>
<form id="noticeForm" >
	<input type="hidden" id="notice_code" name="notice_code" value="<%=vo.getNotice_code()%>">
</form>
<div id = "par">
	<div class = "pad">
	
	</div>
		<div id="sub">
		<p id = "titlep"><%=vo.getNotice_title().replaceAll(" ", "&nbsp;") %></p>
		 <table class="table">
		    <tr><th>Name</th><td id = "id"><%=vo.getAdmin_id() %></td></tr>
		    <tr><th>Date</th><td><%=vo.getNotice_date() %></td></tr>
		  <%
		  	if(vo.getFile_name() == null){
		  %>
		    <tr><th>File</th><td></td></tr>
		  <%
		  	}else{
		  %>
		  <tr><th>File</th><td>   </td></tr>
		  <%
		  	}
		  %>
		  </table>
		  <!-- <div id = "imgCon"> -->
		  <%
		  	if(vo.getFile_name() != null){
		  
		  %>    
		   <div id = "notice_img">
		  	<img class = "contentImg" src = "<%=request.getContextPath()%>/noticeImageView.do?fileName=<%=vo.getFile_name()%>">
		  </div> 
		  <div id="cont"> 
		  <%=vo.getNotice_content().replaceAll("\r\n", "<br>") %>
		  </div>
		  <%
		  	}else{
		  %>
		  <div id="cont">
		  <%=vo.getNotice_content().replaceAll("\r\n", "<br>") %>
		 </div>
		  <%
		  	}
		  %>
		<!-- </div> -->
		<div id="but">
	<%if(admin != null){
		if(admin.equals("Y")){
	%>
	
			<button type="submit" class="btn btn-default" id="upd">수정</button>
			<button type="submit" class="btn btn-default" id="del">삭제</button>
				
<% }else{%>	
			<button type="button" class="btn btn-default" id="list">목록으로</button>		
	<% } } %>
		<button type="button" class="btn btn-default" id="list">목록으로</button>
		</div>
		
		</div>
	<div class = "pad">
	</div>
</div>
</body>
</html>