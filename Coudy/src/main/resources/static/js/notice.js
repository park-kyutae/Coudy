$(function(){
	$('search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력해주세요');
			$('#keyword').val('').focus();
			return false;
		}
	});
});