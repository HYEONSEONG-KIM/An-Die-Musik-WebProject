<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%
	String id = (String)session.getAttribute("id");
%>
<style type="text/css">
body{
	height: 1500px;
}
	td{
		padding : 15px;
	}
	.tdimg{
		
	}
	#par{
		display: flex;
		flex-direction: row;
	}
	.pad{
		width:5%;
	}
	.reserv{
		position : absolute;
		top : 19%;
		margin-left: 75%;
	}
	#tb{
		width : 45%;
	}
	table {
		background: #fcfcfc;
		width : 100%;
		border-radius: 10px;
	}
	#nav{
		width : 20%;
	}
	#nav .container{
		width: 100%;
	}
	
	
	
	.savebtn{
		display: inline-block;
	    margin-bottom: 0;
	    font-weight: 400;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: middle;
	    touch-action: manipulation;
	    cursor: pointer;
	    border: 1px solid transparent;
	    padding: 6px 12px;
	    font-size: 14px;
	    line-height: 1.42857143;
	    border-radius: 10px;
	    user-select: none;
	    width: 100%;
	}
	
	.save{
	    color: #333;
    background-color: #EF3F43;
    border-color: #ccc;
    box-shadow: 2px 3px 2px 1px lightgray;
    height: 50px;
    margin-top: 10px;
    color: white;
    font-weight: bold;
    font-size: 20px;
    	
	}
	#selectPref{
		height: auto;
		width: 350px;
		border : 1px solid lightgray;
		border-radius: 10px;
		box-shadow: 2px 1px 2px 1px gray;
		
	}
	option{
		font-size: 20px;
	}
	.form-control{
		font-size: 20px;
		width: 90%;
		margin-left: 3%;
		margin-right: 3%;
	}
	.selText{
		margin : 3%;
	}
	#pblDetail{
		margin-top: 25px;
		padding-left : 30px;
	}
	.seaP{
		font-size: 14px;
	}
	.seatP span{
		font-weight: bold; 
		font-size: 17px;
	}
	#seatSatate{
		width: 50%;
		
	}
	#seatSatate table{
		width: 100%;
	}
	
	#seatSatate th{
		width: 30%;
		text-align: center;
	}
	#seatSatate td{
	text-align : right;
		width: 70%;
	}
	
	#seatText{
		text-align: center;
	}
	#seatpar{
		display: flex;
		flex-direction : row;
		margin-bottom: 15px;
		width: 100%;
	}
	.seatpad{
		width: 25%;
	}
	#perfdate h2{
	
	text-shadow : 1px 1px 1px lightgray;
	text-align: center;
}
	
</style>
<script type="text/javascript">
	$(function(){
		
		ticketInfo = {
			
		}
		selectPblCehck = false;
		
		$(window).scroll(function(){
			var scrollTop = $(document).scrollTop();
			if (scrollTop < 210) {
			 scrollTop = 210;
			}
			$(".reserv").stop();
			$(".reserv").animate( { "top" : scrollTop });
			}); 
		
		$('#selDate').change(function(){
			vdate = $(this).val();
			
			
			$.ajax({
				url : '<%=request.getContextPath()%>/SelectPblNm.do',
				data : {'date' : vdate},
				type : 'post',
				success : function(data){
					res = '<div class="form-group">'
					res += '  <label for="sel1" class = "selText">공연명</label>'
					res += '<select class="form-control" id="selPbl">'
					
					
					if(data == ""){
						res += '<option>공연이 없습니다.</option>'
					}else{
						res += '<option>==공연선택==</option>'
						$.each(data,function(i,v){
							res += '<option value = '+ v.pbl_code +'>'+ v.pbl_nm +'['+v.pbl_time +']</option>'
						})
					}
				
					res += '	  </select>'
					res += '			</div>'
					
					$('#pblNm').html(res);
					$('#pblDetail').empty();
					$('#seatSatate').empty();
					$('#seatText').empty();
					
				},
				error : function(xhr){
					alert(xhr.status)
					
				},
				dataType : 'json'
			})
		})
		
		$('#pblNm').on('change','#selPbl',function(){
			vpblNm = $(this).val();
			if(vpblNm == "공연이 없습니다." || vpblNm == "==공연선택=="){
				return;
			}
			vcode = $(this).val();
			selectPblCehck = true;
			
		$.ajax({
		
			url : '<%=request.getContextPath()%>/selectTicketPbl.do',
			data : {'code' : vcode},
			type : 'post',
			success : function(data){
				ticketInfo.pbl_code = data.vo.pbl_code;
				res = '<table>'
				res +='<tr>'
				res +='		<th class = "td1">장소</th>'
				res +='     <td class = "td2">' + data.vo.prf_nm + '</td>'
				res +='</tr>'
				
				res +='<tr>'
				res +='<th class = "td1">날짜</th>'
				res +='	<td class = "td2">' + data.vo.pbl_date.substring(0,10) + '</td>'
				res +='</tr>'
				
				res +='<tr>'
				res +='	<th class = "td1">시간</th>'
				res +='	<td class = "td2">'+ data.vo.pbl_time+'</td>'
				res +='</tr>'
				
				res +='<tr>'
				res +='	<th class = "td1">관람등급</th>'
				res +='	<td class = "td2">'+ data.vo.pbl_grade +'</td>'
				res +='</tr>'
				
				res +='<tr>'
				res +='	<th class = "td1">주최/주관</th>'
				res +='	<td class = "td2">대전광역시/<br>'+ data.vo.team_nm +'</td>'
				res +='</tr>'
				
				res +='</table>'
				
				seat = '<label for="sel1" class = "selText">잔여좌석</label>'
				
				seatstate = '<table>'
				seatstate += '<tr>'
				seatstate += '<th>R석 </th>' 
				seatstate += '<td>' + data.r + '/20</td>'
				seatstate += '</tr>'
				
				seatstate += '<tr>'
				seatstate += '<th>S석 </th>' 
				seatstate += '<td>' + data.s + '/20</td>'
				seatstate += '</tr>'
						
				seatstate += '<tr>'
				seatstate += '<th>A석 </th>' 
				seatstate += '<td>' + data.a + '/30</td>'
				seatstate += '</tr>'
				
				seatstate += '<tr>'
				seatstate += '<th>B석 </th>' 
				seatstate += '<td>' + data.b + '/30</td>'
				seatstate += '</tr>'
				
				seatstate += '</table>'
				
				$('#pblDetail').html(res);
				$('#seatText').html(seat);
				$('#seatSatate').html(seatstate);
			},
			error : function(xhr){
				alert(xhr.status)
			},
			dataType : 'json'
		})
		
		
			
		})
		checkid = 0;
		<%if(id != null){ %>
		
		checkid = <%=id.length()%>;
		
		<%}%>
		$('#ticket').on('click',function(){
			
			if(checkid < 1){
				check = confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까??")
				if(check){
					location.href = '../member/login.jsp'
					return;
				}else{
					return;
				}
			}else{
			
				if(!selectPblCehck){
					alert("예매할 공연을 선택하여 주세요");
					return;
				}
				
				vcode = ticketInfo.pbl_code;
				flag = confirm("해당 공연의 예매를 진행 하시겠습니까??");
				
				if(!flag){
					return;
				}
	
				
				 location.href = ('<%=request.getContextPath()%>/selectSeat.do?code=' + vcode)
			}
		})
		
	})
	
	
	
	

</script>
</head>

<body>
<jsp:include page="../include.jsp" flush="false"/>



<div id = "par">

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
		    
		   
		    
		  </div>
		</div>
	
	</div>

<div class = "pad">

</div>
<div id = 'tb'>
	<table border = 1>
		<tr>
			<td class = "tdimg">
				<img src = "<%=request.getContextPath()%>/images/예매.jpg">
			</td>
			<td>
				<h3 style="color : blue;">예매</h3>
				<p>- 공연 전일(오후 5시)까지 전화와 인터넷을 통하여 예매하시고, 공연 당일 공연장 매표소 인터넷 예매 창구에서 티켓을 수령하시면 됩니다.</p>
				<p style="color:#FA3C3C;">&nbsp;&nbsp;&nbsp;※ 단 공연 전일(오후 5시)까지만 취소가 가능하며, 이후에는 취소되지 않습니다.</p>
				<p>- 공연을 예매하신 고객은 예약 번호와 예약자의 신분증(주민등록증,운전면허증 등),예매확인 결과(인터넷 예약화면)를 제시하여 주시기 바랍니다.</p>
				<p style="color:#FA3C3C;">&nbsp;&nbsp;&nbsp;※ 대전시립교향악단 홈페이지를 통해 예매하시면 10% 할인 혜택을 누리실 수 있습니다.</p>
				<h3 style="color : blue;">현장 구입</h3>
				<p>- 공연 당일 공연 시작 1시간 전부터 매표소에서 구입 가능하며, 매진인 경우에는 현장에서 구입하실 수 없습니다.</p>
				<p style="color:#FA3C3C;">&nbsp;&nbsp;&nbsp;※ 단, 사전에 매진된 경우에도 연주 시작 15분 전부터 예매 취소 분량을 현장 판매 할 수 있으니 사전에 전화 상담 해주시기 바랍니다.</p>
			</td>
		</tr>
		
		<tr>
			<td class = "tdimg">
				<img src = "<%=request.getContextPath()%>/images/단체.jpg">
			</td>
			<td>
				<h3 style="color : blue;">단체 티켓 예매</h3>
				<p>- 20인 이상 예매하시면, 할인 혜택을 드립니다.</p>
				<p>- 대전 예술단 사무국으로 연락주시거나 대전 문화 예술의전당 아트홀 로비에 문의 주세요</p>
			</td>
		</tr>
		
			<tr>
			<td class = "tdimg">
				<img src = "<%=request.getContextPath()%>/images/예매취소.jpg">
			</td>
			<td>
				<h3 style="color : blue;">티켓 취소&환불</h3>
				<p>- 공연 1일 전 : 수수료(티켓 금액의 10%) 제외</p>
				<p style="color:#FA3C3C;">&nbsp;&nbsp;&nbsp;※ 공연 전일(오후 5시)까지만 취소가 가능하며, 이후에는 취소되지 않습니다.</p>
				<p style="color:#FA3C3C;">&nbsp;&nbsp;&nbsp;※ 예매처에 따라 취소수수료와 취소가능일자가 다를 수 있습니다. 예매정보를 확인해주시기 바랍니다.</p>
				<p>- 당일 : 환불 불가</p>
				<p>- 티켓 환불은 예매하신 곳에서 직접, 전화 또는 인터넷으로 취소하셔야 합니다.</p>
			</td>
		</tr>
	</table>
	
</div>
<div class = "pad"></div>

</div>
<div class = "reserv">
	<div id = "selectPref">
		<div class="form-group">
			  <label for="sel1" class = "selText">날짜 선택</label>
			  <select class="form-control" id="selDate" class = "selectDay" >
			    <%
			    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			    Calendar cal = Calendar.getInstance();
			    Date date = new Date(); 
			    cal.setTime(date);
			    String now = null;
			    for(int i = 1; i <=30; i++){
			   		cal.add(Calendar.DATE, 1);
			   		now = df.format(cal.getTime());
			    %>
			    <option class = "dateText"><%=now%></option>
			    
			    <%}
			    %>
			  
			  </select>
		</div>
		<div id = "pblNm"></div>
		<div id = "pblDetail"></div>
		<hr>
		<div id = "seatText"></div>
		<div id = "seatpar">
			<div class = "seatpad"></div>
			<div id = "seatSatate"></div>
			<div class = "seatpad"></div>
	</div>
	<button id = "ticket" type="submit" class="save savebtn">예&nbsp;&nbsp;&nbsp;매</button>
</div>

</body>
</html>