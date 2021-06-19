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
  		color : #8F1520;
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
				<span>한국을 대표하는 특급오케스트라 대전시립교향악단!!!</span>
				<p>매력적인 레퍼토리, 견고하고 아름다운 앙상블, 신선한 기획력,</p>
				<p>그리고 새로운 도전과 뜨거운 열정으로 감동과 기쁨을 선사하는 오케스트라,</p>
				<p>대전시립교향악단은 여러분의 친구이며 가족이고 자랑입니다.</p>
			</div>
			<hr>
			<div id = "img">
				<img src = "<%=request.getContextPath()%>/images/교향악단.jpg">
			</div>
			<hr>
			<div id = "conten">
			1984년 창단한 대전시립교향악단은 3관 편성의 오케스트라로 최고의 음악을 향한 끊임없는 노력과 열정을 표출하며 대한민국을 대표하는 교향악단 중 하나로 성장했다.<br>
			특히 매 시즌 시리즈별 다양한 레퍼토리, 섬세한 앙상블과 기쁨과 감동을 선사하는 신선한 기획으로 주목받으며, 대전을 넘어 한국을 대표하는 교향악단으로 자리했다.<br><br>
			대전시립교향악단은 국내 뿐 아니라, 세계를 무대로 그 영역을 넓혀왔다. <br>
  			특히 2004년에는 뉴욕의 카네기홀 등 미주 4개 도시의 세계적인 홀에서 순회 연주를, 2005년과 2015년에 한국 대표로 ‘아시아 오케스트라 위크’에 초청되어 도쿄와 오사카에서 각각 연주를 성공적으로 선보였다. <br>
  			2012년에는 한국 시립오케스트라 최초로 비엔나 무지크페어라인 골드홀 연주를 비롯하여 체코 프라하, 헝가리 부다페스트, 독일 뮌헨을 연결하는 유럽투어를 통해 세계화된 대전시립교향악단의 면모를 갖추게 되었다. <br>
  			이러한 명성으로 2017년 프랑스 ‘생말로 페스티벌’, 독일 ‘쟈를란트 뮤직 페스티벌’과 프랑크푸르트에 초청받아 유럽인들에게 다시 한 번 대전시향을 깊이 각인시켰다.<br><br>
			예술감독 겸 상임지휘자 ‘제임스 저드’, 전임지휘자 ‘류명우’, 수석객원지휘자 ‘마티아스 바메르트’ 지휘 체제를 갖춘 대전시립교향악단은 연간 80여 회의 연주를 진행한다. <br>
			연주 유형은 정통 클래식의 진수를 맛 볼 수 있는 ‘마스터즈시리즈’, 신인 발굴, 회원을 위한 특별연주회 등 다양한 기획과 눈높이를 겨냥한 ‘디스커버리시리즈’, 깊이 있고 섬세한 매력의 ‘챔버시리즈’, <br>
			음악 그리고 이야기가 있는 힐링의 시간 ‘마티네 콘서트’, 원도심 주민들을 위해 펼치는 ‘해피클래식’을 비롯, 연구소와 기업체, 각종 기관, 수험생을 위한 연주 등 나눔을 실천하는 ‘찾아가는 음악회’ 등으로 진행된다.<br><br>
			2021년, 더욱 앞선 기획력으로 깊은 감동과 유쾌함을 준비하는 대전시립교향악단은 대전시민의 사랑받는 친구로, 대전을 넘어 세계로 도약하는 교향악단으로, 음악을 향한 뜨거운 열정과 새로운 도전을 멈추지 않을 것이다.<br>
			
			</div>
		</div>
		
		
		
		
		<div class = "pad"></div>
		
		
		
		
		<div id = "end"></div>
		
		
	</div>
</body>
</html>