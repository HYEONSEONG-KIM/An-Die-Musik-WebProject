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
  		color : blue;
  		align-content: center;
  		font-weight: bold;
  		text-shadow: 1px 1px 1px lightgray;
  	}
  	#title p {
  		font-size : 20px;
  		color : blue;
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
				<span>대전시립합창단</span>
				<p>BEYOND DAEJEON WONDERFUL CHOIR</p>
				
			</div>
			<hr>
			<div id = "img">
				<img src = "<%=request.getContextPath()%>/images/합창단.jpg">
			</div>
			<hr>
			<div id = "conten">
			
			대전시립합창단은 1981년 창단되었다.뛰어난 기량과 신선한 기획력으로 대한민국 정상의 자리를 지키며 한국합창음악의 지평을 넓히고 있다. 
			대전시립합창단은 이미 2005년 독일 바흐국제합창페스티벌 초청 출연으로 세계무대에 이름을 알렸으며, 2007년 시즌에는 「영국 브리티시 국제음악연보(British & International Music Yearbook 2007)」에 등재되어 세계로 도약하는 대전시립합창단의 면모를 유감없이 보여줬다.
			2007년 대전시립합창단은 합창지휘의 살아있는 전설, 헬무트 릴링의 계보를 이어받은 마에스트로 빈프리트 톨을 예술감독 겸 상임지휘자로 영입, 한국합창 역사에 새로운 장을 열었다. <br><br>
			예술감독 빈프리트 대전시립합창단은 그동안 바로크 합창음악부터 현대음악까지 폭넓은 레퍼토리로 한국 합창음악의 발전을 견인했다. 몬테베르디 &lt성모마리아의 저녁기도(Vespro della beata vergine)〉, 
			하이든 &lt천지창조 (Die Schopfung), &lt넬슨미사(Nelson Mass), 바흐 &lt마태수난곡, 작품 244(Matthauspassion, BWV 244), &lt크리스마스 오라토리오, 작품 248(Christmas Oratorio, BWV 248), 헨델 〈메시아, 작품 56(Messiah, HWV 56), 
			&lt이집트의 이스라엘인, 작품 54(Israel in Egypt, HWV 54), 멘델스존 &lt엘리야, 작품 70(Elijah, Op.70), 푸치니 &lt대영광송 (Messa di Gloria)〉을 비롯 수많은 작곡가들의 &lt레퀴엠(Requiem)〉이 대전시립합창단의 레퍼토리로 연주되고 갈채를 받았다.
			한편, 대전시립합창단은 대전뿐 아니라 대한민국을 대표하는 합창단으로 활동의 외연을 넓혀왔다. 2010년 헨델의 〈주께서 말씀하시기를, 작품 232(Dixit Dominus, HWV 232)〉로 서울 연주를 시작, 2019년 푸치니 &lt대영광송 (Messa di Gloria)〉까지 
			뜨거운 무대를 매해 준비하여 합창 애호가들을 매료시켰다. 이를 통해 2014년에는 제1회 서울예술의전당에서 선정한 예술대상 음악분야 관현악(합창) 부문에서 최우수상을 수상했다. 또한 대전시립합창단은 2013 통영국제음악제에도 초청돼 윤이상의 &ltO Licht〉를 선보였다. <br><br>
			2014년 스위스 메뉴힌 페스티벌 초청연주 및 독일 순회 연주로 로시니의 &lt작은 장엄미사(Petite messe solennelle)>와 함께 아카펠라의 아름다움을 담은 레퍼토리들로 유럽인들의 기립박수를 받았다. 2019년 유럽투어 콘서트를 통해 독일, 슬로바키아, 세르비아, 크로아티아에서 한국 문화 사절로, 
			한국 대표 합창단으로 성공적 연주를 선보였다.
			활발한 연주 활동 이외에도 대전시립합창단은 2010년 대전시립합창단은 헨델의 〈주께서 말씀하시길, 작품 232(Dixit Dominus, HWV 232)〉를, 2013년 마틴 〈두 개의 합창을 위한 미사(Mass for double choir)〉를 소니뮤직 레이블 음반으로 선보여 끊임없이 도전하는 모습을 보였다.
			2021년 창단 40주년을 맞은 대전시립합창단은 헨델 &lt사울, 작품53(Saul, HWV 53)>, 베토벤 &lt미사 솔렘니스, 작품123(Missa Solemnis, Op.123)>, 헨델 &lt메시아, 작품 56(Messiah, HWV 56)> 등의 레퍼토리를 선보일 예정이며 서울과 통영특별연주회를 통해 새롭고 뜨거운 감동을 준비한다.
			
			</div>
		</div>
		
		
		
		
		<div class = "pad"></div>
		
		
		
		
		<div id = "end"></div>
		
		
	</div>
</body>
</html>


