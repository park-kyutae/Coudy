<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<script type="text/javascript" src="${pageContext.request.contextPath }/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploadAdapter.js"></script>

<div class="container">
	<form:form action="write.do" modelAttribute="noticeVO" id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<div class="row mt-4 col-5">
				<label for="notice_title" class="form-label mt-1 fw-bold">제목</label>
				<form:input path="notice_title" cssClass=""/>
				<form:errors path="notice_title" cssClass="error-color"/>
		</div>	
		
		<div class="row mt-4 col-5">
				<label for="upload" class="form-label mt-1 fw-bold" >파일업로드</label>
				<input  class="btn btn-light btn-sm" style="float:left;" type="file" name="upload" id="upload">
		</div>
		
		<br>
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
			
		<div >
		<br>
			<form:button class="btn btn-light btn-sm">전송</form:button>
			<input class="btn btn-light btn-sm" type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
    
 