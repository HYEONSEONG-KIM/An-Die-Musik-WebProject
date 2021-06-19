<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- <link rel="stylesheet" href="../css/notice.css"> -->
<!-- <script src="../js/notice_list.js"></script> -->
<style>
.pag1{
	width : 80%;
	margin-left : 45%;
}
.listform{
	width : 100%;
	margin-top:7%;
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
	margin-left : 90%;
}
a:link{
    color : black;	
}
a:visited{
    color : black;
}
hr{
	border-top : 4px double #5F9EA0;
	width : 200px;
	margin-top : 2px;
}
a{
	color : black;
}
#list{
	margin-top: 60px;
}
 #par{
    	display: flex;
    	flex-direction: row;
    	width: 100%;
    } 
.pad{
    width : 20%;
    }
    #listInfo{
    	width : 55%;
    }
#ch{
	/* font-family: 'Do Hyeon', sans-serif; */
	font-family: 'Noto Sans KR', sans-serif;
	font-size : 37px;
	font-weight : bolder;
	margin-bottom : 1px;
}
#top{
	text-align : center;
	margin-bottom : 30px;
}

</style>
<% String admin = (String)session.getAttribute("admin"); 
System.out.println(admin);
%>
<script>
 currentPage = 1; //현재페이지
 
 $(function(){
	 readNotice = function(page){
			//공지사항 목록 보기
			$.ajax({
				url : '/ADM/NoticeList.do',
				method : 'post',
				data : {"page" : page},
				success : function(res){
					code = '<div class="container listform">';
					code += '	<div id="top">';
					code +=	'	<p id="ch">공지사항</p>';
					code += '	<hr>'
					code += '	</div>';
					code +=	'  <table class="table table-hover">';
					code +=	'    <thead>';
					code +=	'      <tr>';
					code +=	'        <th width="50px" >번호</th>';
					code +=	'        <th width="200px">제목</th>';
					code +=	'        <th width="60px">날짜</th>';
					code +=	'      </tr>';
					code +=	'    </thead>';
					code +=	'	    <tbody>';
					
					$.each(res.datas, function(i, v){
						code += '<tr>';
						code += '<td class="td_no">' + v.rnum + '</td>';
						code += '<td><a href = "/ADM/NoticeDetail.do?notice_code=' + v.code +'"class = "tt" >' + v.title + '</a></td>';
						code += '<td class="td_date">' + v.date.substr(0, 10) + '</td>';
						code += '</tr>';	
					})
					
					code +=	'    </tbody>';
					code +=	'  </table>';
					code +=	'</div>';
					
					$('#list').html(code);
					
					pages = '<div class="pag1">';
					
					//페이지 리스트 만들기
					pages+='<nav aria-label="Page navigation example">';
					
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
					pages+='  <ul class="pagination">';
					//페이지 번호 출력
					for(i=res.sp; i<=res.ep; i++){
						//현재 페이지와 i값이 같은지
						if(currentPage == i){
							pages+='    <li class="page-item"><a class="nowPage" href="#">' + i + '</a></li>';
						}else{
							pages+='    <li><a class="nowPage" href="#">' + i + '</a></li>';
						}
					}
					pages+='  </ul>';
					
					//다음 버튼 만들기 >
					if(res.ep < res.tp){
						pages+='  <ul class="pagination">';
						pages+='    <li class="next">';
						pages+='      <a class="next" href="#" aria-label="Next">';
						pages+='        <span aria-hidden="true">&raquo;</span>';
						pages+='      </a>';
						pages+='    </li>';
						pages+='  </ul>';
					}
					pages+='</nav>';
					pages+='</div>';
					
					$('#pageList').html(pages);
				},
				
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
				
			})
		};
	 
	 readNotice(1);
	 
	 //페이지번호
	 $("#pageList").on('click', '.nowPage', function(){
		 currentPage = $(this).text().trim();
		 
		 readNotice(currentPage);
		 
	 })
	 
	 //이전버튼
	 $("#pageList").on('click', '.before', function(){
		 vnext = $('.nowPage').first().text().trim();
		 currentPage = parseInt(vnext) - 1;
		 readNotice(currentPage);
		 
	 })
	 
	 //다음버튼
	 $("#pageList").on('click', '.next', function(){
		 vnext = $('.nowPage').last().text().trim();
		 currentPage = parseInt(vnext) + 1;
		 
		 readNotice(currentPage);
		 
	 })
	 //공지사항 상세보기
	 $('#list').on('click', '.tt', function(){
		 vidx = $(this).attr('idx');
		 //location.href = "NoticeDetail.do?notice_code=" + vidx;
	 })
	 
	 $('#write').on('click', function(){
		location.href = '<%=request.getContextPath()%>/insertForm.do';
	 })
	 
	 
	 
 })

</script>

</head>
<body>
<jsp:include page="../include.jsp" flush="false"/>
<div id = "par">
	<div class = "pad">
	
	</div>
	
	<div id = "listInfo">
	<div id="list"></div>
	<div id="pageList"></div>
<%
	if(admin != null){
		if(admin.equals("Y")){
%>
		<button type="button" class="btn btn-default" id="write">글쓰기</button>
<% 
		}
	}
%>
	
	</div>
	
	<div class = "pad"></div>
	
</div>	

</body>
</html>