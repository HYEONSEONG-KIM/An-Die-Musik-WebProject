<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel = "stylesheet" href = "<%=request.getContextPath()%>/css/mypage.css">
 
</head>
<script type="text/javascript">
	$(function(){
	
		$('#delete').on('click',function(){
			pass = $(this).attr('idx');
			input = prompt("패스워드를 입력하여 주세요.")
			
			if(pass == input){
				alert("탈퇴가 완료되었습니다.")
				location.href = "<%=request.getContextPath()%>/MemberDelete.do";
			}else{
				alert("패스워드가 올바르지 않습니다")
				return;
			}
			
			
		})
	})
	

</script>
<body>
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
			<table>
			<tr>
			<td class = "tdimg">
				<img src = "<%=request.getContextPath()%>/images/예매취소.jpg">
			</td>
			<td>
				<h3 style="color : red;">탈퇴시 유의사항</h3>
				<br>
				<br>
				<p >&nbsp;&nbsp;&nbsp;※예매하신 내역이 있을경우 예매 취소 혹은 본 공연이 끝난 이후에 탈퇴를 진행하여 주세오.</p>
				<br>
				<p >&nbsp;&nbsp;&nbsp;※예매하신 공연이 남아있는데 탈퇴를 하신 경우 본 공연날 매표소에 문의하여 주세요.</p>
				<br>
				<p >&nbsp;&nbsp;&nbsp;※탈퇴 이후에는 기존에 사용하던 아이디의 재사용이 불가합니다. </p>
				<br>
				<p >&nbsp;&nbsp;&nbsp;※위의 내용을 숙지하시고 신중히 진행하여 주시기 바랍니다. </p>
				<br>
			</td>
		</tr>	
		</table>
			<input idx = "<%=session.getAttribute("pass") %>" type = "button" id = "delete" value= "탈퇴하기">
		</div>
		
		<div class = "pad"></div>
		
		<div id = "end"></div>
		
		</div>
		
	
</body>
</html>






