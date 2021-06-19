<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	$('#login').on('click',function(){
		vid = $('#id').val()
		vpass = $('#pass').val()
		
		if(vid.length ==0 || vpass.length==0){
			alert("로그인 정보를 입력하여 주세요")
			return;
		}
		
		 $.ajax({
			 url : '/ADM/MemberLogin.do',
			 type : 'post',
			 data : {'id':vid, 'pass':vpass},
			 success : function(res){
				 if(res == "no"){
					 alert("입력하신 정보가 틀렸습니다.")
					 $('#id').val("");
					 $('#pass').val("");
				 }else{
					 alert(vid + "님 환영합니다")
					 location.href = "../index.jsp";
				 }
			 },
			 error : function(xhr){
				 alert("상태 : " + xhr.status)
			 },
			 dataType : 'json'
		 })
	})
	
})
</script>
<style type="text/css">
.mybtn{
  width:150px;
  height:40px;
  padding:0;
  display:inline; 
  border-radius: 4px; 
  background: #212529;
  color: #fff;
  margin-top: 20px;
  border: solid 2px #212529; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}
.ff{
	position: relative;
	right: 80px;
	font-size: 11px;
	font-weight: bold;
}
</style>
<title>로그인</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4 w3-auto" style="width: 382px;height: 450px;">
			<div class="w3-center w3-large w3-margin-top">
				<h4>로그인</h4>
			</div>
			<div>
				<p>
					<label>아이디</label>
					<input class="w3-input" type="text" id="id" name="mem_id" placeholder="회원가입한 아이디를 입력하세요" required>
				</p>
				<p>
					<label>비밀번호</label>
					<input class="w3-input" type="password" id="pass" name="mem_pass" placeholder="회원가입한 비밀번호를 입력하세요" required>
				</p>
				<p class="w3-center">
					<button type="button" id="login" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">로그인</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">취소</button><br>
					<a class="ff" href="findid.jsp">아이디 찾기</a>
					<a class="ff" href="findpass.jsp">비밀번호 찾기</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>