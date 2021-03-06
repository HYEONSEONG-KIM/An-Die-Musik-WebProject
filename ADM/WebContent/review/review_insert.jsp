<%@page import="adm.vo.ViewVO"%>
<%@page import="java.util.List"%>
<%@page import="adm.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
#write_no{
	margin-left : 25%;
	margin-top : 5%;
}

#but1{
	margin-left : 30%;
}
#par{
	display: flex;
	flex-direction: row;
	width: 100%;
}

.padding{

	width : 500px;:
}
#content{
	width : 46%;
}
.container{
	width: 100%;
	}

.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

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
/* .starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
} */
/* .starR1.on{background-position:0 0;} */
/* .starR2.on{background-position:-15px 0;} */
</style>
<title>????????? ??????</title>
</head>
<%
	List<ViewVO> list = (List<ViewVO>)request.getAttribute("list");
%>
<script>
$(function(){

	//???????????? ?????????
	$('#list').on('click', function(){
		location.href = '<%=request.getContextPath() %>/ReviewWrite.do';
	
	})
// 	$('.starRev span').click(function(){
// 		  $(this).parent().children('span').removeClass('on');
// 		  $(this).addClass('on').prevAll('span').addClass('on');
// 		  return false;
// 		});
	$('.starRev span').click(function(){
		  var starCnt = $(this).text();
		  if(starCnt=="???1"){
			  $("#rev_score").val("1");
		  }else if(starCnt=="???2"){
			  $("#rev_score").val("2");
		  }else if(starCnt=="???3"){
			  $("#rev_score").val("3");
		  }else if(starCnt=="???4"){
			  $("#rev_score").val("4");
		  }else if(starCnt=="???5"){
			  $("#rev_score").val("5");
		  }else{
			  $("#rev_score").val("0");
		  }
		  
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		});
})
</script>
<body>
<jsp:include page="../include.jsp" flush="false"/>



	<div class = "pad"></div>
	
	
	<div class = "container">
	
		<form  class="form-horizontal" action="/ADM/ReviewWrite.do"
		method="post">
		 <input type="hidden" name="rev_score" id="rev_score" value="0" />
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="text">??????</label>
		    <div class="col-sm-5">
		      <input type="text" name="rev_title" class="form-control" id="sub1" placeholder="????????? ???????????????.">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="text">?????? ??????</label>
		    <div class="col-sm-5">
		    
		    	 <select class="selectpicker" data-width="75%" name="pbl_code">
		    	 <%for(int i = 0; i < list.size(); i++){ 
		    	 	ViewVO vo = list.get(i);
		    	 %>
		     		<option value="<%=vo.getPbl_code()%>"><%=vo.getPbl_nm() %></option>
		     	<%} %>
		 		 </select>    		
		    </div>
		  </div>
		  
		  <div class="form-group starRev">
		    <label class="control-label col-sm-2" for="text">??????</label>
		    <div class="col-sm-5">
		  		<span class="starR on">???1</span>
		  		<span class="starR">???2</span>
		  		<span class="starR">???3</span>
		  		<span class="starR">???4</span>
		  		<span class="starR">???5</span>
			</div>
		<!-- 	<div class="col-sm-5"> -->
		<!--   		<span class="starR1 on">???1_??????</span> -->
		<!--   		<span class="starR2">???1_?????????</span> -->
		<!--   		<span class="starR1">???2_??????</span> -->
		<!--   		<span class="starR2">???2_?????????</span> -->
		<!--   		<span class="starR1">???3_??????</span> -->
		<!--   		<span class="starR2">???3_?????????</span> -->
		<!--   		<span class="starR1">???4_??????</span> -->
		<!--   		<span class="starR2">???4_?????????</span> -->
		<!--   		<span class="starR1">???5_??????</span> -->
		<!--   		<span class="starR2">???5_?????????</span>       -->
		<!--   	</div> -->
		  </div>
		  
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="pwd">?????? </label>
		    <div class="col-sm-5">
		      <textarea class="form-control" name="rev_content" rows="30" cols="30" id="cont1" placeholder="????????? ???????????????."></textarea>
		    </div>
		  </div>
			  
		  <div id="but1">
			<button type="submit" class="save savebtn" id="send">??????</button>
			<button type="button" class="save savebtn" id="list">????????????</button>
		  </div>
			
		</form>
	 </div>
		 
		 <div class = "padding"></div>

</body>
</html>