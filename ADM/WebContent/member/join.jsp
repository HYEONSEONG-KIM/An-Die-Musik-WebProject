<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/memberReg.js"></script>
<!--카카오 주소 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	#par{
		display: flex;
		flex-direction: row;
		width: 100%;
	}
	
	.pad{
	
		width: 25%;
	}
	.pad2{
		margin-left : 3%;
		width: 25%;
	}
	.container{
		width: 46%;
	}
	h2{
		margin: 20px;
		margin-bottom: 40px;
	}
</style>
<script>

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
     }).open();
  }


 $(function(){
	 flag = [false, false, false,false,false,false];
		//중복 체크
		$('#check').on('click', function(){
			if(!idcheck()) return false;
			
			$.ajax({
				url : '/ADM/MemberController.do',
				data : {'memId' : $('#id').val()},
				type : 'post',
				success : function(res){
					if("ok" == res.sw){
						okpro('#check');
						alert("사용 가능한 아이디 입니다!!")
					}else{
						nopro('#check', "사용불가능 이미있거나 탈퇴한id 입니다")
					}
				},
				error : function(xhr){
					alert(xhr.status)
				},
				dataType : 'json'
			})
		})
		
		//이름 체크
		$('#name').on('keyup', function(){
				namevalue = $('#name').val().trim();
			//공백 체크
			if(namevalue.length < 1){
				nopro("이름을 입력하세요");
				return false;
			}
			
			//길이체크 2~5사이
			if(namevalue.length < 2 || namevalue.length > 5){
				nopro(this,"2~5사이 입니다");
				return false;
			}
			
			//정규식 - 한글만
			regname = /^[가-힣]{2,5}$/;
			
			if(regname.test(namevalue)){
				okpro(this)
				flag[0] = true;
			}else{
				nopro(this, "올바른형식이 아닙니다 다시 입력하세요")
				flag[0] = false;
			}
		})
		
		//비밀번호 체크
		$('#pwd').on('keyup', function(){
			//입력값 가져오기
			passvalue = $('#pwd').val().trim()
			
			//공백 체크
			if(passvalue.length < 1){
				nopro(this,"필수 정보입니다.");
				return false;
			}
			
			//길이체크 8~12
			if(passvalue.length < 8 || passvalue.length > 12){
				nopro(this, "8~12 사이 입니다");
				return false;
			}
			//정규식 - 특수문자, 대문자,숫자 한개이상 8~12자리이상
			regpass = /^(?=.*[!@#$%^&*()])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,12}$/
			
			if(regpass.test(passvalue)){
				okpro(this, "사용 가능한 비밀번호입니다")
				flag[1] = true;
			}else{
				nopro(this,"첫번쨰 입력은 특수문자를 입력하세요 숫자한자리 이상 포함해야합니다")
				flag[1] = false;
			}
			
		})
		
		//비밀번호 재확인
		$('#pwd2').on('keyup',function(){
			if($('#pwd').val() != $('#pwd2').val()){
				nopro(this,"비밀번호가 일치하지 않습니다 다시 확인해주세요")
				flag[2] = false;
			}else{
				okpro(this)
				flag[2] = true;
			}
		})
		
		//생년월일 체크
		$('#bir').on('change', function(){
		now = new Date();
		pday = $('#bir').val()
		
		pdate = new Date(pday)
		
		time = now.getTime() - pdate.getTime()
		
		day = time/1000/60/60/24;
		
		if(day >= 14) {
			okpro(this)
			flag[3] = true;
		}else{
			nopro(this,"14살 이상만 가능합니다.")
			flag[3] = false;
			}
	})
		
		//휴대폰 번호 체크
		$('#hp').on('keyup',function(){
			hpvalue = $('#hp').val().trim()
			
				reghp = /^\d{3}\d{3,4}\d{4}$/;
				
				if(reghp.test(hpvalue)){
					okpro(this,"사용가능한  번호입니다.")
					flag[4] = true;
					
				}else{
					nopro(this,"올바른 형식이 아닙니다 다시 입력하세요")
					flag[4] = false;
					return false;
				}
		})
		//이메일체크
		$('#email').on('keyup', function(){
			emailvalue = $('#email').val().trim()
			
			//정규식
			regmail =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/
			
			if(regmail.test(emailvalue)){
				okpro(this, "사용 가능합니다!!")
				flag[5] = true;
			}else{
				nopro(this, "올바른 형식이 아닙니다!! 다시입력하세요")
				flag[5] = false;
				return false;
			}
		})


		//submit전송 실행
		$('form').on('submit', function(){
			event.preventDefault()
			for(i = 0; i < flag.length;  i++){
				if(flag[i] == false){
					alert("올바르지 않은 정보가 있습니다. 확인해 주세요.")
					return;
				}
			}
			datas = $('form').serializeJSON()
			console.log(datas)
			$.ajax({
				url : '/ADM/InsertMember.do',
				type : 'post',
				data : datas,
				success : function(res){
					if(res.sw == "ok"){
						/* code = `${res.id}님 환영합니다!!` */
						alert(res.id + "님 환영합니다!!")
						location.href = "../index.jsp"
					}else{
						alert("가입실패!!!")
						/* code = "가입실패!!!" */
					}
					/* $('#joinspan').html(code).css('color', 'red') */
				},	
				error : function(xhr){
						alert("상태 : " + xhr.status)
				},
				 dataType : 'json'
			})
		})
		
		
	})
</script>
</head>
<body>
<jsp:include page="../include.jsp" flush="false"/>

<div id = "par">

<div class = "pad2"></div>
<div class="container">
  
  <form class="form-horizontal" onsubmit="return false">
  
  <h2 style = "text-align: center;">회원가입</h2>
  
  	<div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="id"  name="mem_id">
      </div>
      <button id="check"class="button btn-default btn-sm" type="button">중복검사</button>
        <span class="sp"></span>
    </div>
    
    <div class="form-group">
        <label class="control-label col-sm-2" for="name">이름</label>
        <span class="sp"></span>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="name"  name="mem_name">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="bir">생년월일</label>
        <span class="sp"></span>
      <div class="col-sm-6">
        <input type="date" class="form-control" id="bir"  name="mem_bir">
    </div>
      </div>
      
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">비밀번호</label>
        <span class="sp"></span>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="pwd"  name="mem_pass">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd2">비밀번호 재확인</label>
        <span class="sp"></span>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="pwd2"  name="mem_pass">
        
      </div>
    </div>
  	
  	<div class="form-group">
      <label class="control-label col-sm-2" for="hp">휴대폰번호</label>
        <span class="sp"></span>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="hp"  name="mem_hp">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">이메일</label>
        <span class="sp"></span>
      <div class="col-sm-6">
        <input type="email" class="form-control" id="email" name="mem_mail">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="zip">우편번호</label>
		<input type="button" class="button btn-default" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">		
      <div class="col-sm-7">
        <input type="text" class="form-control" id="sample4_postcode" name="mem_zip">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="zip">도로명주소</label>
      <div class="col-sm-7">
        <input type="text"  id="sample4_roadAddress" class="form-control" name="mem_addr1">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="zip">지번주소</label>
      <div class="col-sm-7">
        <input type="text"  id="sample4_jibunAddress" class="form-control" name="mem_addr2">
      </div>
    </div>
    <span id="guide" style="color:#999;display:none"></span>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="zip">상세주소</label>
      <div class="col-sm-7">
        <input type="text"  id="sample4_detailAddress" class="form-control" name="mem_addr3">
      </div>
      </div>
      
       	
    <!--취소 버튼에 메인 링크걸기  -->
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="button btn-default btn-lg">가입하기</button>
        <button type="button" class="button btn-default btn-lg">취소하기</button>
        <span id="joinspan"></span>
      </div>
    </div>
        
   </form>
   </div>
   
<div class = "pad"></div>
   </div>
</body>
</html>