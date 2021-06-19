<%@page import="adm.vo.ReserveVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예매 상세</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel = "stylesheet" href = "<%=request.getContextPath()%>/css/mypage.css">
   <script src="<%=request.getContextPath() %>/js/updateMember.js"></script>
<%--   <link rel = "stylesheet" href = "<%=request.getContextPath()%>/css/performList.css"> --%>
  
  <style>
 	.par2{
		
		display: flex;
		flex-direction: row;
		height: 100%;
	}
	.image{
		width : 35%;
		
	}
	.top{
		height: 100%;
	}
	.nbsp{
		width : 8%;
	}
	.content2{
		
		width : 57%;
	}
	.foot{
		height: 50px;
		text-align: right;
	}
	.perfImg{
		width : 100%;
		height: 100%;
	}
	.td1{
		width : 30%;
		height: 60px;
		font-weight: bold;
		font-size: 20px;
	}
	.td2{
		width : 70%;
		font-size: 20px;
		
	}
	.savebtn{
   		margin : 15px;
      display: inline-block;
       margin-bottom: 0;
       font-weight: 400;
       text-align: center;
       white-space: nowrap;
       vertical-align: middle;
       touch-action: manipulation;
       cursor: pointer;
       background-image: none;
       border: 1px solid transparent;
       padding: 5px 12px;
       font-size: 14px;
      font-weight: bold;
       border-radius: 4px;
       user-select: none;
   }
   .save{
   	height : 8%;
   	width : 30%;
     color: #333;
    background-color: #fff;
    border-color: #ccc;
    box-shadow: 1px 1px 1px 1px lightgray;
       
   }
   .content2 h3{
   	margin-bottom: 30px;
   	margin-left: 20%;
   }
 	
  </style>
  
 <script>
 
 $(function(){
	 
		$('#delete').on('click',function(){
			
			vidx = $(this).attr('idx');
			flag = confirm("해당 내역을 취소하시겠습니까??")
			
			if(flag == true){
				location.href = '<%=request.getContextPath()%>/DeleteReserv.do?vidx=' + vidx;			
			}else{
				return;
			} 
			
		})
		
		$('#before').on('click',function(){
			location.href = '<%=request.getContextPath()%>/SelectReserve.do';
		})
	
 })

</script>
</head>
<body>
<%
	ReserveVO vo = (ReserveVO)request.getAttribute("detail");
%>
<jsp:include page="../include.jsp" flush="false"/>

	<div id = "par">
		
		<div id = "nav">
		
			<div id = "perfdate">
		  		<h2>공연 일정</h2>
		  	</div>
		  	
			<div class="list-group">
					<a href="mypage/mypageIndex.jsp" class="list-group-item">마이 페이지</a>
					<a  idx = "<%=session.getAttribute("pass") %>" id = "update" class="list-group-item">개인 정보 변경</a>
				<a href="<%=request.getContextPath()%>/SelectReserve.do" class="list-group-item">예매 내역 확인</a>
				<a href="<%=request.getContextPath()%>/mypage/myQnA.jsp" class="list-group-item">My Q&A</a>
				<a href="<%=request.getContextPath()%>/mypage/freeboarddetail.jsp" class="list-group-item">My 자유게시판</a>
				<a href="<%=request.getContextPath()%>/deleteform.do" class="list-group-item">회원 탈퇴</a>
			</div>
		</div>
		
		<div class = "pad"></div>
		
		<div id = "content">
			
			
	<div class = "top">
		<div class = "par2">
			<div class = "image">
				<img class = "perfImg" src = "<%=request.getContextPath()%>/images/imagesView.do?fileName=<%=vo.getFile_name()%>">
			</div>
			<div class = "nbsp"></div>
			<div class = "content2">
				<h3>예매상세내역</h3>
				<table>
					<tr>
						<td class = "td1">예매일자</td>
						<td class = "td2"><%=vo.getAdv_time()%></td>
					</tr>
					
					<tr>
						<td class = "td1">공연명</td>
						<td class = "td2"><%=vo.getPbl_nm()%></td>
					</tr>
					
					<tr>
						<td class = "td1">공연일자</td>
						<td class = "td2"><%=vo.getPbl_date().substring(0,10)%> <%=vo.getPbl_time()%></td>
					</tr>
					
					<tr>
						<td class = "td1">장소</td>
						<td class = "td2"><%=vo.getPrf_nm()%></td>
					</tr>
					
					<tr>
						<td class = "td1">공연 단체</td>
						<td class = "td2"><%=vo.getTeam_nm() %></td>
					</tr>
					
					<tr>
						<td class = "td1">좌석</td>
						<td class = "td2"><%=vo.getSeat_code()%></td>
					</tr>
				</table>
				
				<input idx = "<%=vo.getAdv_code() %>" type = "button" class="save savebtn" id = "delete" value = "해당 내역 취소">
				<input type = "button" class="save savebtn" value = "목   록" id = "before">
					
			</div>
		</div>
		

		<hr>
	</div>
	
		</div>
		
		<div class = "pad"></div>
		
		<div id = "end"></div>
		
		
	</div>
</body>
</html>













