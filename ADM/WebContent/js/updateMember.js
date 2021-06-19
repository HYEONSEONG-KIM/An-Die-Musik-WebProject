/**
 * 
 */

$(function(){

	$('#update').on('click',function(){
		mypass = $(this).attr('idx').trim();
		input = prompt("패스워드 입력").trim();
		
		if(mypass == input){
			location.href="changeInfo.jsp";
		}else{
			alert("패스워드가 올바르지 않습니다")
			return;
		}
		
	})
	
})
