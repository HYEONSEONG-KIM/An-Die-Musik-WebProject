<%@page import="java.util.List"%>
<%@page import="adm.vo.FboardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 자유게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel = "stylesheet" href = "<%=request.getContextPath()%>/css/mypage.css">
<script src="<%=request.getContextPath() %>/js/updateMember.js"></script>

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
   
th{
	text-align : center;
}
.td_date{
	 text-align : center;
}
.td_no{
	 text-align : center;
}

#write{
	margin-left : 70%;
}
a:link{
    color : black;	
}
a:visited{
    color : black;
}

/* 	페이지 버튼 위치조정 */
.pagination{
	position : relative;
		left : 300px;
}
.contain{
	width : 700px;
}
</style>
</head>
<body>
<%
	FboardVO vo = (FboardVO)request.getAttribute("fboList");
	List<FboardVO> list = (List<FboardVO>)request.getAttribute("list");
	String id = (String)session.getAttribute("id");
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
			<div class = "nbsp"></div>
			
			<script>
	currentPage = 1;	//현재 페이지
	
	$(function(){
		
			
			readFboard = function(page){
				
				//목록 보기
				$.ajax({
					url : '<%=request.getContextPath()%>/SelectFboard.do',
					data : {"page" : page},
					success : function(res){
						code = '<div class="contain">';
						code += '<h2>자유게시판</h2>'
						code += '<table class="table table-hover">';
						code += 	'<thead>';
						code += 		'<tr>';
					 	code += 			'<th width="50px;">NO</th>'; 
					 	code += 			'<th width="200px;">TITLE</th>';
					 	code += 			'<th width="60px;">ID</th>';
					 	code += 			'<th width="60px;">DATE</th>';
						code += 		'</tr>';
						code += 	'</thead>';
						code += 		'<tbody>';
						
						$.each(res.datas, function(i, v){
							code += '<tr>';
							code += '<td class="td_no">' + v.rnum + '</td>';
							code += '<td><a href = "/ADM/FboardDetail.do?fboard_code=' + v.code +'"class = "tt" >' + v.title + '</a></td>';
							code += '<td class="td_date">' + v.mem_id + '</td>';
							code += '<td class="td_date">' + v.date.substr(0, 10) + '</td>';
							code += '</tr>';	
					
						})
					
						
						code += 	'</table>';
						code += 		'</div>'
						
						$('#list').html(code);
					
						pages = '<div class="pag1">';
						
						//페이지 리스트 생성
						page += '<nav aria-label="Page navigation example">';
						
						//이전버튼 <
						if(res.sp > 1){
							pages+='  <ul class="pagination">';
							pages+='    <li class="pre">';
							pages+='      <a class="before" href="#" aria-label="Previous">';
							pages+='        <span aria-hidden="true">&laquo;</span>';
							pages+='      </a>';
							pages+='   </li>';
							pages+='  </ul>';
						}
						pages += '<ul class="pagination">';
						
						//페이지 번호 출력
						for(i=res.sp; i<=res.ep; i++){
							//현재 페이지와 i값이 같은지
							if(currentPage == i){
								pages += '<li class="page-item"><a class="nowPage" href="#">' + i + '</a></li>';
							}else{
								pages += '<li><a class="nowPage" href="#">' + i + '</a></li>';
							}
						}
						pages += '</ul>';
						
						//다음 버튼 만들기 >
						if(res.ep < res.tp){
							pages += '<ul class="pagination">';
							pages += 	'<li class="next">';
							pages += 		'<a class="next" href="#" aria-label="Next">';
							pages += 		'<span aria-hidden="true">&raquo;</span>';
							pages += 		'</a>';
							pages += 	'</li>';
							pages += '</ul>';
						}
						pages += '</nav>';
						pages += '</div>';
						
						$('#pageList').html(pages);
					},
					
					error : function(xhr){
						alert("상태 : " + xhr.status);
					},
					
					dataType : 'json'
					
				})
			}
	
			readFboard(1);
	
			//페이지번호
			$('#pageList').on('click', '.nowPage', function(){
				currentPage = $(this).text().trim();
				
				readFboard(currentPage);
				
			})
			
			//이전버튼
			$('#pageList').on('click', '.before', function(){
				vnext = $('.nowPage').first().text().trim();
				currentPage = parseInt(vnext) - 1;
				readFboard(currentPage);
				
			})
			
			//다음버튼
			$('#pageList').on('click', '.next', function(){
				vnext = $('.nowPage').last().text().trim();
				currentPage = parseInt(vnext) + 1;
				readFboard(currentPage);
			
			})
	
			//글 상세보기
			$('#list').on('click', '.tt', function(){
				vidx = $(this).attr('idx');
			})
			
			//글쓰기 버튼
			$('#write').on('click', function(){
			
				location.href = 'fboard_insert.jsp';
					
			});
	
	
	
	
	})
	
</script>
			
			
			
<!-- 			<div class = "content2"> -->
<!-- 				<h3>예매상세내역</h3> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<!-- 						<td class = "td1">제목</td> -->
<%-- 						<td class = "td2"><%//=vo.getFboard_title()%></td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td class = "td1">작성자</td> -->
<%-- 						<td class = "td2"><%//=vo.getMem_id()%></td> --%>
<!-- 					</tr> -->
					
<!-- 					<tr> -->
<!-- 						<td class = "td1">날짜</td> -->
<%-- 						<td class = "td2"><%//=vo.getFboard_date()%></td> --%>
<!-- 					</tr> -->
					
<!-- 					<tr> -->
<!-- 						<td class = "td1">내용</td> -->
<%-- 						<td class = "td2"><%//=vo.getFboard_content()%></td> --%>
<!-- 					</tr> -->
					
<!-- 				</table> -->
				
<!-- 				<input type = "button" class="save savebtn" value = "목   록" id = "before"> -->
					
<!-- 			</div> -->
<!-- 		</div> -->
		

<!-- 		<hr> -->
<!-- 	</div> -->
	
<!-- 		</div> -->
		
		<div id="list"></div>

		<div class = "pad"></div>
		
		<div id = "end"></div>
		
		
	</div>
		<div id="pageList"></div>
</body>

</html>