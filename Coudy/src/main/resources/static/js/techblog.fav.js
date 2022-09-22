$(function(){
	//좋아요 읽기
	//좋아요 선택 여부와 선택한 총개수 표시
	function selectData(tech_num){
		$.ajax({
			url:'getFav.do',
			type:'post',
			data:{tech_num:tech_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				displayFav(param);
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}
	
	//좋아요 등록
	$('#output_fav').click(function(){
		$.ajax({
			url:'writeFav.do',
			type:'post',
			data:{tech_num:$('#tech_num').val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 좋아요를 눌러주세요!');
				}else if(param.result == 'success'){
					displayFav(param);
				}else{
					alert('좋아요 등록시 오류 발생!');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});//좋아요 등록 끝
	
	//좋아요 표시
	function displayFav(param){
		let output;
		if(param.status == 'noFav'){
			output = '../images/heart.svg';
		}else{
			output = '../images/heart-fill.svg';
		}
		//문서 객체에 추가
		$('#output_fav').attr('src',output);
		$('#output_fcount').text(param.count);
	}//좋아요 표시 끝
	
	//초기 데이터 표시
	selectData($('#tech_num').val());
	
});