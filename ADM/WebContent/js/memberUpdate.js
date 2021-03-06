/**
 * 
 */
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
		$('#bir').on('keyup', function(){
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
			
			datas = $('form').serializeJSON()
			console.log(datas)
			$.ajax({
				url : '/ADM/UpdateMember.do',
				type : 'post',
				data : datas,
				success : function(res){
					if(res == "ok"){
						/* code = `${res.id}님 환영합니다!!` */
						alert("수정 완료되었습니다")
						location.href = "mypageIndex.jsp"
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