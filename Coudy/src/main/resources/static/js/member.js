$(function(){
	
	
	
	
	
	//===========MyPage 프로필사진=============//
	$('#photo_btn').click(function(){
		$('#photo_choice').show();
		$(this).hide();
	});
	

		
	//처음에 보이는 이미지 태그의 이미지 읽기 
	let photo_path = $('.my-photo').attr('src');
	let my_photo; //업로드 하고자 선택한 이미지 저장
	$('#upload').change(function(){
		my_photo = this.files[0]; //이부분은 뭐지?
		
		if(!my_photo){ //업로드 하고자 하는 이미지가 없을 때 기본이미지로 설정하고 빠져나가기 
			('.my-photo').attr('src',photo_path); //attr('제어할 값', '제어할값에 넣을 값') : 속성값 제어하기 
			return;
		}
		
		//파일용량 체크
		if(my_photo.size > 1024*1024){
			alert(Math.round(my_photo.size/1024)+'kb까지만 업로드 가능');
			$('.my-photo').attr('src',photo_path);//업로드 하고자 하는 이미지 용량 클때 기본이미지로 설정하고 빠져나가기 
			$(this).val('')//파일명 지우기
			return;
		}
		
		//이미지 미리보기 처리
		let reader = new FileReader();
		
		//선택한 이미지 읽기
		reader.readAsDataURL(my_photo);
		reader.onload = function(){
			//읽어들인 이미지 표시
			$('.my-photo').attr('src',reader.result);
		};
		
	});//end of change
		
	//이미지 파일 전송 처리
	$('#photo_submit').click(function(){
		if($('#upload').val()==''){
			alert('파일을 선택하세요!');
			$('#upload').focus();
			return;
		}
		
		//파일전송(파일을 업로드하려면 formData생성)
		let form_data = new FormData();
		form_data.append('upload',my_photo);
		$.ajax({
			url:'updateMyPhoto.do',
			data:form_data,
			type:'post',
			dataType:'json', //서버에서 받을 데이터의 타입
			contentType:false, //contentType 보내는 데이터의 타입
			enctype:'multipart/form-data', //웹에서 멀티(다중)파일을 업로드할 때 아래와 같이 form tag 안에 input tag를 작성해 준다. 
											//이 때 form에 enctype="multipart/form-data" 처리를 꼭 해주어야 함
			processData:false,
			success:function(param){
				if(param.result=='logout'){
					alert('로그인 후 사용하세요');
				}else if(param.result =='success'){
					alert('프로필 사진이 수정되었습니다.');
					//교체된 이미지 저장
					photo_path = $('.my-photo').attr('src'); //프사가바뀌면 교체된 사진으로 변경해준다. -> 
														//여러번 바뀔수도 있으니까
					$('#upload').val('');
					$('#photo_choice').hide();
					$('#photo_btn').show();
				}else{
					alert('파일 전송 오류발생');
				}
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}

		});
		
	});
	
	//취소버튼 처리

//	$('#photo_cancel').click(function(){
//		$('.my-photo').attr('src',photo_path);
//		$('#upload').val('');
//		$('#photo_choice').hide();
//		$('#photo_btn').show();
//	});
	
	$('#passwd').keyup(function(){
		if($('#passwd2').val()!='' && $('#passwd2').val()!=$(this).val()){
			$('#message_id').text('비밀번호 불일치').css('color','red');
			
		}else if($('#passwd2').val()!='' && $('#passwd2').val()==$(this).val()){
			$('#message_id').text('비밀번호 일치').css('color','#000');
		}
	});
	
	$('#passwd2').keyup(function(){
		if($('#passwd').val()!='' && $('#passwd').val()!=$(this).val()){
			$('#message_id').text('비밀번호 불일치').css('color','red');
			
		}else if($('#passwd').val()!='' && $('#passwd').val()==$(this).val()){
			$('#message_id').text('비밀번호 일치').css('color','#000');
		}
	});
	
	$('#change_form').submit(function(){
		if($('#now_passwd').val().trim()==''){
			alert('현재 비밀번호를 입력하세요!');
			$('#now_passwd').val('').focus();
			return false;
		}
		if($('#passwd').val().trim()==''){
			alert('새비밀번호를 입력하세요!');
			$('#passwd').val('').focus();
			return false;
		}
		if($('#passwd2').val().trim()==''){
			alert('새비밀번호 확인을 입력하세요!');
			$('#passwd2').val('').focus();
			return false;
		}
		if($('#passwd').val()!=$('#passwd2').val()){
			$('#message_id').text('비밀번호 불일치')
			                .css('color','red');
			return false;
		}
	});
	
});