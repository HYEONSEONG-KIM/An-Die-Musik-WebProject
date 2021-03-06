<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="adm.vo.PblprfrVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "<%=request.getContextPath() %>/css/performList.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>공연 상세 정보</title>
<style>
	#content a, #ettitude a, #notice a{
		font-size: 20px;
		font-weight: bold;
	}
	
	.infoli li{
		width: 33.33%;
		text-align: center;
		
	}
	.container-fluid ul{
		display : flex;
		flex-direction: row;
		width : 100%;
		justify-content : space-between;
		
	}
	.detail{
		padding : 30px;
		border-left: 1px solid lightgray;
		border-right: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		margin-bottom: 30px;
	}
	.navbar-nav li:hover{
		cursor: pointer;
		
	}
	.container-fluid{
		padding : 0;
		width : 100%
	}

	.detail li{
	 list-style: square;
	 margin : 10px;
	 font-size: 15px;
	 
	}
	.detailTitle{
		margin-left: 15px;
		color: #5882FA;
		font-weight: bold;
		font-size: 25px;
	}
	i{
		margin-left: 15px;
		color: gray;
		font-size: 20px;
	}
	#header{
		margin-top:20px; 
	}
	#info{
		padding-top: 3%;
	}
	
	.savebtn{
	margin : 6px;
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
	    padding: 4px 10px;
	    font-size: 14px;
	   
	    border-radius: 4px;
	    user-select: none;
	}
	.save{
	   color: #333;
    background-color: #fff;
    border-color: #ccc;
    box-shadow: 1px 1px 1px 1px lightgray;
    	
	}
	
</style>
<%
	String admin = (String)session.getAttribute("admin");
	PblprfrVO vo =(PblprfrVO)request.getAttribute("detail");
%>
<script type="text/javascript">
	$(function(){
		
		$('#content').on('click',function(){
			 
			$('#detail1').show();
			$('#detail2').hide();
			$('#detail3').hide();
			$(this).css("background", "#D8D8D8");
		 	$('#ettitude').css("background", "#f8f8f8");
			$('#notice').css("background", "#f8f8f8"); 
			
		})
		
		$('#ettitude').on('click',function(){
			
			$('#detail2').show();
			$('#detail1').hide();
			$('#detail3').hide();
			$(this).css("background", "#D8D8D8");
		 	$('#content').css("background", "#f8f8f8");
			$('#notice').css("background", "#f8f8f8"); 
			
		})
		
		$('#notice').on('click',function(){
			
			$('#detail3').show();
			$('#detail2').hide();
			$('#detail1').hide();
			$(this).css("background", "#D8D8D8");
			 $('#ettitude').css("background", "#f8f8f8");
			$('#content').css("background", "#f8f8f8"); 
			
		})
		
		$('#admin_delet').on('click',function(){
			
			flag = confirm("해당 공연을 삭제 하시겠습니까?");
			if(flag){
				location.href="<%=request.getContextPath()%>/PblDelet.do?code=<%=vo.getPbl_code()%>";
			}
			
		})
		
		$('.list').on('click',function(){
			location.href="<%=request.getContextPath()%>/selectPbl.do" 
		})
	})
	
</script>

</head>
<body>
<jsp:include page="../include.jsp" flush="false"/>
<div id = "headers">
	<div id = "nav">
		<div class="container">
		  <div id = "perfdate">
		  	<h2>공연 일정</h2>
		  </div>
		  <div class="list-group">
		    <a href="<%=request.getContextPath()%>/selectPbl.do" class="list-group-item">전체 공연</a>
		    <a href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 교향악단" class="list-group-item">-대전 시립 교향악단</a>
		    <a href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 합창단" class="list-group-item">-대전 시립 합창단</a>
		    <a href="<%=request.getContextPath()%>/selectPbl.do?team=대전 시립 무용단" class="list-group-item">-대전 시립 무용단</a>
		    
		    <%if(admin != null){ // 로그인한 계정이 관리자이면 공연 추가 활성화
		    if(admin.equals("Y")){ %>
		    <a id = "admin_update" href="<%=request.getContextPath()%>/PblSelectboxToUp.do" class="list-group-item">해당 공연 수정</a>
		    <a id = "admin_delet"  class="list-group-item">해당 공연 삭제</a>
		    <%
		    }} %>
		    
		  </div>
		</div>
	
	</div>
	<div id = "pad"></div>
	<div id = "info">
	
	
	
	<div class = "top">
		<div class = "par">
			<div class = "image">
				<img class = "perfImg" src = "<%=request.getContextPath()%>/images/imagesView.do?fileName=<%=vo.getFile_name()%>">
			</div>
			<div class = "nbsp"></div>
			<div class = "content">
				<h3><%=vo.getPbl_nm()%></h3>
				<table>
					<tr>
						<td class = "td1">장소</td>
						<td class = "td2"><%=vo.getPrf_nm()%></td>
					</tr>
					
					<tr>
						<td class = "td1">날짜</td>
						<td class = "td2"><%=vo.getPbl_date().substring(0,10) %></td>
					</tr>
					
					<tr>
						<td class = "td1">시간</td>
						<td class = "td2"><%=vo.getPbl_time()%></td>
					</tr>
					
					<tr>
						<td class = "td1">관람등급</td>
						<td class = "td2"><%=vo.getPbl_grade()%></td>
					</tr>
					
					<tr>
						<td class = "td1">공연문의</td>
						<td class = "td2">042-270-8382~8</td>
					</tr>
					
					<tr>
						<td class = "td1">주최/주관</td>
						<td class = "td2">대전광역시/<br><%=vo.getTeam_nm()%></td>
					</tr>
				</table>
					
			</div>
		</div>
		
		<div class = "foot">
		<%
			Date now = new Date();
			Calendar cal = Calendar.getInstance();
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String performS = vo.getPbl_date();
			Date perform = df.parse(performS);
			cal.setTime(perform);
			//Date performBefore = df.parse();
			cal.add((Calendar.MONTH),-1);
			String before = df.format(cal.getTime());
			Date performBerform = df.parse(before);
			
			if(now.after(performBerform) && now.before(perform)){
			%>
			
			
			<a href="<%=request.getContextPath()%>/ticketing/tickecting.jsp" class="save savebtn" role="button">예매하기</a>
			
			<%}%>
			<a class="btn btn-default list" role="button">목록</a>
		</div>
		<hr>
	</div>
	
	
		<nav id = "infonav" class="navbar navbar-default">
	  <div class="container-fluid">
	    <ul class="nav navbar-nav infoli">
	      <li id = "content" style = "background: #D8D8D8;"><a >공연정보</a></li>
	      <li id = "ettitude"><a >관람예절</a></li>
	      <li id = "notice"><a >유의사항</a></li>
	    </ul>
	  </div>
	</nav>
	<div class = "detail" id = "detail1">
		<p>▶ 공 연 명 : <%=vo.getPbl_nm()%></p>
		<p>▶ 일시장소 : <%=vo.getPbl_date().substring(0,10)%> <%=vo.getPbl_time() %> <%=vo.getPrf_nm()%></p>
		<p>▶ 프로그램</p>
		<p><%=vo.getPbl_content().replaceAll("\r\n", "<br>") %></p>
		<p>▶ 주    최 : 대전광역시</p>
		<p>▶ 주    관 : <%=vo.getTeam_nm()%></p>
		<p>▶ 입 장 료 : R석 30,000원, S석 20,000원, A석 10,000원, B석 5,000원 </p>
		<p>▶ 문    의 : 042-270-8382~8</p>
		<br><br>
		<p>※ 상기 공연은 연주자의 사정에 의해 변경될 수 있습니다.</p>
	</div>
	
	<div class = "detail" id = "detail2" style = "display: none" >
		<p ><i class="fas fa-drum"></i><span class = "detailTitle">연주장에 오실때에는</span></p>
		<ul>
			<li>공연시작 10분전에는 입장하여 주시고, 공연중에는 이동을 하지 않습니다.</li>
			<li>공연에 지장을 줄 어린이의 동반은 가급적 삼가 합니다.</li>
			<li>미취학 아동은 입장할 수 없습니다.</li>
			<li>(단,놀이방 시설이 있는 공연장의 경우 놀이방을 이용하실수 있습니다.)</li>
		</ul>
		<hr>
		<p ><i class="fas fa-drum"></i><span class = "detailTitle">박수를 치실때에는</span></p>
		<ul>
			<li>교향곡이나 협주곡 등 악장의 수가 3~4악장으로 되어 있는 곡은 모든 악장이 끝난후에 쳐야합니다.</li>
			<li>성악의 경우 프로그램을 보면 3~4곡씩을 묶어놓고 있는데 한 묶음이 끝날때마다 치는것이 좋습니다.</li>
			<li>기악연주는 한 악장으로 되어 있거나 소품일 경우에는 곡이 끝날때마다 박수를 쳐도 됩니다.</li>
			<li>오페라의 경우 아리아나 이중창 등이 끝나면 박수를 치고 환호하는 뜻의 부라보를 외쳐 격려합니다.</li>
			<li>국악의 경우 집박하는 이가 입장할때부터 인사를 할 때까지 박수로서 음악을 요청하는 것이 좋으며,
				음악이 끝날때도 집박이 박을 치면 박수로 답례하는 것이 좋습니다.</li>
			<li>재청(앙코르)를 할때에는 지휘자,연주자가 퇴장한 후에도 박수를 보냅니다.</li>
		</ul>
		<hr>
		<p ><i class="fas fa-drum"></i><span class = "detailTitle">공연중에는</span></p>
		<ul>
			<li>공연중에는 혹시 실수가 있어도 소리내어 웃거나 야유를 하지 않습니다.</li>
			<li>휴대폰,호출기 등 통신기기는 공연에 지장을 주니 꺼주시기 바랍니다.</li>
			<li>공연장 내에 음식물을 반입할 수 없으며, 사진을 촬영하지 않습니다.</li>
			<li>꽃다발, 기타 선물 등은 공연이 끝난 후 돌아갈 때 전달합니다.</li>
		
		</ul>
	
	</div>
	
	<div class = "detail" id = "detail3" style = "display: none">
		<p ><i class="fas fa-drum"></i><span class = "detailTitle">인터넷 예매</span></p>
			<ul>
				<li> 인터넷 예매는 공연 전날까지 예매가 가능하며, 이후에는 인터넷 예매가 되지않으니 유의하여 주시기 바랍니다.</li>
				<li> 공연 당일 공연장 매표소 인터넷 예매 창구에서 티켓을 수령하시면 됩니다.</li>
				<li> 공연을 예매하신 고객은 예매번호와 예약자의 신분증 (주민등록증, 운전면허증 등), 예매확인 결과 (인터넷 예약화면 프린터 등)를 제시하여 주시기 바랍니다.</li>
				<li> 인터넷예매 : ADM.com</li>
				<li>※ 현장에서의 구입은 공연 당일날 공연시작 1시간 전부터 매표소에서 구입가능합니다.</li>
				<li>※ 일부 공연의 경우 예매 종료시점이 변경 될 수 있습니다.</li>
			</ul>
			
	</div>

	
	
	
	</div>
</div>
</body>
</html>