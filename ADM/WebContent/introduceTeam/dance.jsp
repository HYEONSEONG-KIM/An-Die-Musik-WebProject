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
  <style>
  	#content{
  		height: 70%;
  	}
  	#title span{
  		font-size : 30px;
  		color : black;
  		align-content: center;
  		font-weight: bold;
  		text-shadow: 1px 1px 1px lightgray;
  	}
  	#title p {
  		font-size : 20px;
  		color : #8F1520;
  		font-weight: bold;
  	}
  	
  	#conten{
  		margin-bottom: 5%;
  		height: 800px;
  		font-size: 15px;
  	}
  	#img img{
  		width : 100%;
  	}
  
  </style>
</head>
<body>
<jsp:include page="../include.jsp" flush="false"/>

	<div id = "par">
		
		<div id = "nav">
		
		
		
		
			<div id = "perfdate">
		  		<h2>단체 소개</h2>
		  	</div>
		  	
			<div class="list-group">
				<a href="orchestra.jsp" class="list-group-item">대전 시립 교향악단</a>
				<a href="chorus.jsp" class="list-group-item">대전 시립 합창단</a>
				<a href="dance.jsp" class="list-group-item">대전 시립 무용단</a>
			</div>
		</div>
		
		
		
		
		
		<div class = "pad"></div>
		
		
		
		
		<div id = "content">
			<div id = "title">
				<span>한국무용의 중심으로 도약과 생동감 넘치는 대전시립무용단!</span>
				
			</div>
			<hr>
			<div id = "img">
				<img src = "<%=request.getContextPath()%>/images/무용단.jpg">
			</div>
			<hr>
			<div id = "conten">
			1985년 창단된 대전시립무용단은 36년 동안 대전시민과 호흡을 함께하며 성장했다. <br>
			한국인의 숨결 속에 감추어진 역동성과 삶에 대한 열정을 표현해 온 시간을 지나, 이제 한국의 대표적 무용단으로 자리매김하고 있다. <br>
			정기공연을 비롯해 다양한 기획공연과 찾아가는 공연 등을 통해 시민과 가깝게 만나고 있는 대전시립무용단은 지역을 넘어 세계로 춤의 지평을 넓혀가고 있다.<br>
			</div>
		</div>
		
		
		
		
		<div class = "pad"></div>
		
		
		
		
		<div id = "end"></div>
		
		
	</div>
</body>
</html>