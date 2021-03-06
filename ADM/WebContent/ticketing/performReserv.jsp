<%@page import="java.util.List"%>
<%@page import="adm.vo.AvdSeatVO"%>
<%@page import="jdk.internal.org.objectweb.asm.commons.AdviceAdapter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
  
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href = "<%=request.getContextPath()%>/css/reserv.css">
<meta charset="UTF-8">
<title>좌석 선택</title>
<style>
	
</style>

</head>
<body>

	<%  List<AvdSeatVO> list = (List<AvdSeatVO>)request.getAttribute("list"); 
		int code = list.get(0).getPblcode();
	%>
	
	
	
<script type="text/javascript">
	selectSeat = new Array();
	sendSeat = new Array();
	price = new Array();
	flag = false;
	seatflag = false;
	
	$(function(){
		
		
	getPblInfo = function(pbl){
			
			$.ajax({
				
				url : '<%=request.getContextPath()%>/selectTicketPblInfo.do',
				type : 'post',
				data : {'code' : pbl},
				success : function(data){
					res = '<table>'
						img = '<img class = "perfImg" src = "<%=request.getContextPath()%>/images/imagesView.do?fileName=' + data.file_name +'">';
							
						res +='<tr>'
						res +='	<th class = "td1">공연명</th>'
						res +='	<td class = "td2">'+ data.pbl_nm +'</td>'
						res +='</tr>'
					
					
						res +='<tr>'
						res +='		<th class = "td1">장소</th>'
						res +='     <td class = "td2">' + data.prf_nm + '</td>'
						res +='</tr>'
						
						res +='<tr>'
						res +='<th class = "td1">날짜</th>'
						res +='	<td class = "td2">' + data.pbl_date.substring(0,10) + '</td>'
						res +='</tr>'
						
						res +='<tr>'
						res +='	<th class = "td1">시간</th>'
						res +='	<td class = "td2">'+ data.pbl_time+'</td>'
						res +='</tr>'
						
						res +='<tr>'
						res +='	<th class = "td1">관람</th>'
						res +='	<td class = "td2">'+ data.pbl_grade +'</td>'
						res +='</tr>'
						
						
						
						res +='</table>'
					$('#infoTop').html(img);
					$('#infobottom').html(res);
				},
				error : function(xhr){
					alert(xhr.status)
				},
				dataType : 'json'
				
			})
			
		}
		
		
		getPblInfo(<%=code%>);
		
		//-------------------------------
		$('.seatNo').on('click',function(){
			if(seatflag){
				return;
			}
			
			
			
			select = $(this).text()
			if(select == ""){
				return;
			}
			
			for(i = 0; i < selectSeat.length; i++){
				if(selectSeat[i] ==  "<span>" + select + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>"){
					selectSeat.splice(i,1);
					sendSeat.splice(i,1);
					price.splice(i,1);
					totalPrice(price);
					$('#selectSeat').html(selectSeat);
					
					if($(this).css("background-color") == "rgb(223, 216, 216)"){
						$(this).css("background", "gray");
					}else{
						$(this).css("background", "#DFD8D8");
					}
					
					return;
				}
			}
			
			if(selectSeat.length > 3){
				alert("4개까지 선택하실수 있습니다");
				return;
			}
			if($(this).css("background-color") == "rgb(223, 216, 216)"){
				$(this).css("background", "gray");
			}else{
				$(this).css("background", "#DFD8D8");
			}
			res = "<span>" + select + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>";
			
			selectSeat.push(res);
			sendSeat.push(select);
			price.push($(this).attr("idx"))
			$('#selectSeat').html(selectSeat);
			totalPrice(price);
		})
		
		//------------------------------------------
		totalPrice = function(a){
		
			total = 0;
			for(i = 0; i < a.length; i++){
				total += parseInt(a[i]);
			}
			
			regTotal = total.toLocaleString( 'ko-KR', { style: 'currency', currency: 'KRW' } ) ;

			res = "<span id = 'total_span'>Total &nbsp;" + regTotal + "</span>"
			$('#pri').html(res);
		}
		//---------------------------------------
		$('.sale').on('change', function(){
			
			sale = parseInt($(this).val());
			
			saletotal = total - (total * sale / 100);
			
			reg = saletotal.toLocaleString( 'ko-KR', { style: 'currency', currency: 'KRW' } ) ;
			res = "<span id = 'total_span'>Total &nbsp;" + reg + "</span>"
			$('#pri').html(res);
		})
		//---------------------------------
	sendInfo = {
		'seat' : sendSeat,
		'code' : <%=code%>
	}
	
		//-----------------------------
	insert = function(info){
		
		
		$.ajax({
			url : '<%=request.getContextPath()%>/TIcketing.do',
			data : info,
			type : 'post',
			success : function(data){
				location.href = 'ticketing/tickecting.jsp'
			},
			error : function(xhr){
				alert(xhr.status)
			},
			dataType : 'json'
		})
		
	}
	
	//------------------------------
	$('#ticket').on('click',function(){
		
		check = confirm("결제 하시겠습니까?")
		     
		 
		if(check){
		  IMP.init('imp21203647');

		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : saletotal, //판매 가격,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		    	flag = true;
		    	
		        var msg = '결제가 완료되었습니다.';
		        
			    insert(sendInfo);
		        
		    } else {
		    	flag = false;
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});  
		
		}else{
			return;
		}  

	})
	//---------------------------
	$('#complet').on('click', function(){
		
		if(sendInfo.seat.length < 1){
			alert('좌석을 선택하세요');
			return;
		}
		saletotal = total
		
		seatflag = true;
		$('#selectSale').show();
		$(this).hide();
		$('#ticket').show();
		$('#reselect').show();
		
	})
	//-----------------------
	$('#reselect').on('click',function(){

		seatflag = false;
		$('#selectSale').hide();
		$(this).hide();
		$('#complet').show();
		$('#ticket').hide();
		$('.sale').val("0").prop("selected", true);
		
	})
		
	})
	
</script>
<jsp:include page="../include.jsp" flush="false"/>
	
<div id = "par">
	<div id = "nav">
		
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
	<div class = "pad"></div>
	<div id ="frame">
		<div id = "stageImg">
			<img id = "stage" src = "<%=request.getContextPath()%>/images/무대_캡쳐.PNG">
		</div>
		<div id = middlepad></div>
		
		<div id = "seat">
		<div class = "padtop"></div>
		<div class ="seatTable" >
			<table border =1>
		<%for(int i = 0; i < 10; i++){%>
			<tr>
			<% for(int j = 0; j <3; j++){
				int num = 10*i + j;	
					if(list.get(num).getAdccheck().equals("Y")){
				%>
					<td class = "non" style = "border : 2px solid lightgray;"><%=list.get(num).getSeatcode() %></td>
				<%}else{
					if(list.get(num).getPricdoe().equals("B")){
				%>
					<td class = "seatNo" style = "border : 2px solid skyblue;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
				
				<%
					}else if(list.get(num).getPricdoe().equals("A")){
				%>
					<td class = "seatNo" style = "border : 2px solid green;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
				
				<%}else if(list.get(num).getPricdoe().equals("S")){
				%>	
					<td class = "seatNo" style = "border : 2px solid orange;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
				
				<%}else if(list.get(num).getPricdoe().equals("R")){
					%>
					<td class = "seatNo" style = "border : 2px solid red;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
						
				<% }%>
				<%}%>
			<%}%>
			</tr>
		<%}%>
			</table>
		</div>
		<div class = "padside"></div>
		
			<div class ="seatTableMiddle" >
				<table border =1>
		<%for(int i = 0; i < 10; i++){%>
			<tr>
			<% for(int j = 3; j <7; j++){
				int num = 10*i + j;	
					if(list.get(num).getAdccheck().equals("Y")){
				%>
					<td class = "non" style = "border : 2px solid lightgray;text-align : center; color : gray;"><%=list.get(num).getSeatcode() %></td>
				<%}else{
					if(list.get(num).getPricdoe().equals("B")){
				%>
					<td class = "seatNo" style = "border : 2px solid skyblue;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
				
				<%
					}else if(list.get(num).getPricdoe().equals("A")){
				%>
					<td class = "seatNo" style = "border : 2px solid green;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
				
				<%}else if(list.get(num).getPricdoe().equals("S")){
				%>	
					<td class = "seatNo" style = "border : 2px solid orange;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
				
				<%}else if(list.get(num).getPricdoe().equals("R")){
					%>
					<td class = "seatNo" style = "border : 2px solid red;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
						
				<% }%>
				<%}%>
			<%}%>
			</tr>
		<%}%>
			</table>
		</div>
		<div class = "padside"></div>
		
			<div class ="seatTable" >
				<table border =1>
		<%for(int i = 0; i < 10; i++){%>
			<tr>
			<% for(int j = 7; j <10; j++){
				int num = 10*i + j;	
					if(list.get(num).getAdccheck().equals("Y")){
				%>
					<td class = "non" style = "border : 2px solid lightgray;text-align : center; color : gray;"><%=list.get(num).getSeatcode() %></td>
				<%}else{
					if(list.get(num).getPricdoe().equals("B")){
				%>
					<td class = "seatNo" style = "border : 2px solid skyblue;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
				
				<%
					}else if(list.get(num).getPricdoe().equals("A")){
				%>
					<td class = "seatNo" style = "border : 2px solid green;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
				
				<%}else if(list.get(num).getPricdoe().equals("S")){
				%>	
					<td class = "seatNo" style = "border : 2px solid orange;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
				
				<%}else if(list.get(num).getPricdoe().equals("R")){
					%>
					<td class = "seatNo" style = "border : 2px solid red;" idx = "<%=list.get(num).getPrice()%>"><%=list.get(num).getSeatcode() %></td>
						
				<% }%>
				<%}%>
			<%}%>
			</tr>
		<%}%>
			</table>
		</div>
		<div class = "padtop"></div>

	
		</div>
	</div>
	
		<div class = "pad"></div>
	
	
		<div id = "info" >
		
				<div id = "seatInfo">
					<table>
						<tr>
							<td style = "border : 3px solid red;">S석<br>₩30,000</td>
							<td style = "border : 3px solid orange;">R석<br>₩20,000</td>
							<td style = "border : 3px solid green;">A석<br>₩10,000</td>
							<td style = "border : 3px solid skyblue;">B석<br>₩5,000</td>
							
						</tr>
					</table>
				</div>
			
				<div id = "infoTop"></div>
				
				<div id = "infobottom"></div>
				
				<div id= "selectSeat"></div>
				
				<div id = "selectSale" class="form-group" style="display: none;">
				  <label for="sel1">할인선택</label>
				  <select class="form-control sale" id="sel1">
				    <option value = "0">해당없음</option>
				    <option value = "50">국가 유공자(50%할인)</option>
				    <option value = "30">학 생(30%할인)</option>
				    <option value = "40">장애인(40%할인)</option>
				    <option value = "20">경로우대(20%할인)</option>
				  </select>
				</div>
			
				<div id = "pri"></div>
				
				<div id = "button">
					
					<button id = "ticket" type="submit" class="save savebtn" style="display: none">결&nbsp;&nbsp;&nbsp;제</button>
					<button id = "reselect" type="submit" class="save savebtn" style="display: none">좌 석 선 택</button>
					
					<button id = "complet" type="submit" class="save savebtn">선 택 완 료</button>
				</div>
			
		</div>
		
	</div>
</body>
</html>


















