$(function(){
	let checkId=0;
	
	//아이디 중복 체크
	$('#confirmId').click(function(){
		if($('#id').val().trim()==''){
			alert('아이디를 입력하세요');
			('#id').val('').focus();
		}
		
	//서버 프로그램과 통신
		$.ajax({
			url:'confirmId.do',
			type:'post',
			data:{id:$('#id').val()}, //컨트롤러에 파라미터 보내줌 
			dataType:'json',
			cache:false,
			success:function(param){
				if(param.result=='duplicated'){
					$('#id').removeClass('is-valid');
					$('#id').addClass('is-invalid');
					$('#message_id1').removeClass('valid-feedback');
					$('#message_id1').addClass('invalid-feedback');
					$('#message_id1').text('다시 입력해주세요');
					checkId=0;
					
				}else if(param.result=='good'){
					$('#id').removeClass('is-invalid');
					$('#id').addClass('is-valid');
					$('#message_id1').removeClass('invalid-feedback');
					$('#message_id1').addClass('valid-feedback');
					$('#message_id1').text('사용가능한 ID');
					
					checkId=1;
				}else{
					alert('네트워크오류1');
				}
			},
			error:function(){
				alert("네트워크오류2");
			}
			
			
		});
		
	});

	
	//아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
	$('#id').keydown(function(){
		$('#message_id').text('');
		$('#id').removeClass('is-invalid');
		checkId=0;
	});
	
	//submit 이벤트 발생시 아이디 중복 체크 여부 확인
	$('#register_submit').click(function(){
		if(checkId==0){
			return false;
		}else if(checkId==1){
			return true
		}else{
			alert('submit 오류 ');
		};
		
	});
	

});


