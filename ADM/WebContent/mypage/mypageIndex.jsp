<%@page import="adm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel = "stylesheet" href = "<%=request.getContextPath()%>/css/mypage.css">
  <script src="<%=request.getContextPath() %>/js/updateMember.js"></script>
  <style type="text/css">
  	#update{
  		cursor: pointer;
  	}
  </style>
</head>
<body>
<%
	MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
	/* out.print("vo : " + vo); */
	if(vo==null){
		 out.print("<script type='text/javascript'>location.href='/ADM/member/login.jsp';</script>"); 
	}else{
%>
<jsp:include page="../include.jsp" flush="false"/>

	<div id = "par">
		
		<div id = "nav">
		
			<div id = "perfdate">
		  		<h2>마이 페이지</h2>
		  	</div>
		  	
			<div class="list-group">
				<a  idx = "<%=session.getAttribute("pass") %>" id = "update" class="list-group-item">개인 정보 변경</a>
				<a href="<%=request.getContextPath()%>/SelectReserve.do" class="list-group-item">예매 내역 확인</a>
				<a href="<%=request.getContextPath()%>/mypage/myQnA.jsp" class="list-group-item">My Q&A</a>
				<a href="<%=request.getContextPath()%>/mypage/freeboarddetail.jsp" class="list-group-item">My 자유게시판</a>
				<a href="<%=request.getContextPath()%>/deleteform.do" class="list-group-item">회원 탈퇴</a>
			</div>
		</div>
		
		<div class = "pad"></div>
		
		<div id = "content">
			
			
			
			  <h2><%=vo.getMem_name()%>님의 개인정보</h2>
			          
			  <table class="table">
			    <thead>
			      <tr>
			        <th>정보</th>
			        <th>내용</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			       	<th class = "memth">회원 ID</th>
			        <td class = "memtd"><%=vo.getMem_id()%></td>
			      </tr>
			      <tr>
			       <th class = "memth">이름</th>
			        <td class = "memtd"><%=vo.getMem_name()%></td>
			      </tr>
			      <tr>
			        <th class = "memth">이메일</th>
			        <td class = "memtd"><%=vo.getMem_mail()%></td>
			      </tr>
			       <tr>
			        <th class = "memth">전화번호</th>
			        <td class = "memtd"><%=vo.getMem_hp().substring(0,3)%>-****-<%=vo.getMem_hp().substring(7)%></td>
			      </tr>
			      <tr>
			        <th class = "memth">생년월일</th>
			        <td class = "memtd"><%=vo.getMem_bir().substring(0,10)%></td>
			      </tr>
			      <tr>
			        <th class = "memth">주소</th>
			        <td class = "memtd"><%=vo.getMem_addr1()%></td>
			      </tr>
			    </tbody>
			  </table>
	
		</div>
		
		<div class = "pad"></div>
		
		<div id = "end"></div>
		
		
	</div>
<%
	}//end else
%>
</body>
</html>













