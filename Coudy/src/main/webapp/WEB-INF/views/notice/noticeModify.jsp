<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ik.css">

<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>
<!-- include ckeditor js  -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploadAdapter.js"></script>

<div class="container">
	<div class="row col-3">
	<h2>글수정</h2>
	</div>
	<form:form action="update.do" modelAttribute="noticeVO" id="update_form" enctype="multipart/form-data">
		<form:hidden path="notice_num"/>
		<form:errors element="div" cssClass="error-color"/>
		<div class="row mt-4 col-5">
				<label for="notice_title" class="form-label mt-1 fw-bold">제목</label>
				<form:input path="notice_title"/>
				<form:errors path="notice_title" cssClass="error-color"/>
		</div>
		
		<div class="row mt-4 col-5">
				<label for="upload" class="form-label mt-1 fw-bold">파일업로드</label>
				<input class="btn btn-light btn-sm" type="file" name="upload" id="upload">
				<c:if test="${!empty noticeVO.notice_filename }">
				<div id="file_detail">(${noticeVO.notice_filename })파일 등록
				<input type="button" value="파일삭제" id="file_del">
				</div>
				<script type="text/javascript">
					$(function(){
						$('#file_del').click(function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								$.ajax({
									url:'deleteFile.do',
									data:{notice_num:${noticeVO.notice_num}},
									type:'post',
									dataType:'json',
									cache:false,
									timeout:30000,
									success:function(param){
										if(param.result == 'logout'){
											alert('로그인 후 사용하세요!');
										}else if(param.result == 'success'){
											$('#file_detail').hide();
										}else{
											alert('파일 삭제 오류 발생');
										}
									},
									error:function(){
										alert('네트워크 오류 발생');
									}
								});
							}
						});
					});
				</script>
				</c:if>
			</div>
		
		<div class="row">
			<b>내용</b>
				<form:textarea path="notice_content"/>
				<form:errors path="notice_content" cssClass="error-color"/>
				<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#notice_content' ),{
		            	extraPlugins: [MyCustomUploadAdapterPlugin]
		            })
		            .then( editor => {
						window.editor = editor;
					} )
		            .catch( error => {
		                console.error( error );
		            } );
			    </script>   
		</div>
		
		<div>
		<br>
			<form:button class="btn btn-light btn-sm">전송</form:button>
			<input class="btn btn-light btn-sm" type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>




