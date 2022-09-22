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
			success:function(param){ //컨트롤러에서 param 받아오는 파라미터 
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
		console.log('섭밋체크 들어옴')
		//아이디 변경을 하지 않을 때
//		$.ajax({
//			url:'noChangeId.do',
//			type:'post',
//			data:{id:$('#id').val()},
//			dataType:'json',
//			success:function(param){
//				if(param.result=='noChanged'){
//					console.log('아이디 변경하지 않고 그대로, 체크아이디 1 줌')
//					checkId=1;
//				}else if(param.result=='changed'){
//					checkId=0;
//				}else{
//					console.log('else로 들어옴 ');
//				}
//				//아이디 변경할 때
//				if(checkId==0){
//					console.log('섭밋체크 실패함')
//					alert('아이디중복 체크를 완료해주세요!')
//					$('#id').val('').focus();
//					return false;
//					
//				}else if(checkId==1){
//					console.log('섭밋체크 성공함')
//				}else{
//					alert('submit 오류 ');
//				};
//			},
//			error:function(){
//				alert('뭔가가 잘못됐습니다.');	
//			}
//			
//		});
		//아이디 변경할 때
		if(checkId==0){
			console.log('섭밋체크 실패함')
			alert('아이디중복 체크를 완료해주세요!')
			$('#id').val('').focus();
			return false;
			
		}else if(checkId==1){
			console.log('섭밋체크 성공함')
		}else{
			alert('submit 오류 ');
		};
		
		
	});
	

});


