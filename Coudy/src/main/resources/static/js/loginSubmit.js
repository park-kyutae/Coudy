

//============로그인 체크=============//
	$("#loginSubmit22").click(function(){
		
		$.ajax({
			url:'loginValid.do',
			type:'post',
			data:{id:$('#id').val(),passwd:$('#passwd').val()},
			dataType:'json',
			cache:'false',
			success:function(param){
				if(param.result=='hasNoData'){
					console.log('hasNoData로 왔음+++++++')
					$('#id').removeClass('is-valid');
					$('#id').addClass('is-invalid');
					$('#message_id').removeClass('valid-feedback');
					$('#message_id').addClass('invalid-feedback');
					$('#message_id').text('회원정보가 없습니다.');
					
				}else if(param.result=='checkedFail'){
					console.log('checkedFail로 왔음!!!!!!');
					$('#id').removeClass('is-valid');
					$('#id').addClass('is-invalid');
					$('#message_id').removeClass('valid-feedback');
					$('#message_id').addClass('invalid-feedback');
					$('#message_id').text('아이디 또는 비밀번호가 일치하지 않습니다.');
				}else if(param.result=='success'){
					console.log('success로 왔음~~~~~~~');
					
				}
				
			},
			error:function(){
				alert('로그인valid오류');
			}
			
		});
		
		
		
	});