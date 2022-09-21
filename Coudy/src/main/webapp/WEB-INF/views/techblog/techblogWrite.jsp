<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<!-- include libraries(jquery,bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.ck-editor__editable_inline{
	min-height:500px;
}
</style>
<!-- include ckeditor js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/techblog.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_kt.css">
	<div class="container">
	    	<div class="row mt-4">
		    	<form:form action="techblogWrite.do" modelAttribute="techblogVO"
		        id="register_form"
		        enctype="multipart/form-data" cssClass="needs-validation">
		        <form:errors element="div" id="error_color"/>
	    		<div class="col-lg">
	    			<label for="tech_title" class="form-label mt-1 fs-2" id="label">제목</label>
	    			<form:input path="tech_title" placeholder="제목을 입력해주세요" cssClass="form-control"/>
					<form:errors path="tech_title" id="error_color"/>
	    		</div>
	    	</div>
	    	<div class="row">
	    		<div class="col-lg">
		    		<label for="tech_name" class="form-label mt-1 fs-2" id="label">작성자</label>
					<form:input path="tech_name" placeholder="작성자를 입력해주세요" cssClass="form-control"/>
					<form:errors path="tech_name" id="error_color"/>
	    		</div>
	    	</div>
	    	<div class="row">
	    		<div class="col-lg">
		    		<label for="tech_category" class="form-label mt-1 fs-2" id="label">카테고리</label>
		    		<form:select path="tech_category" cssClass="form-select form-select-lg">
		    			<option label="선택"/>
		    			<form:option value="2" label="코드개발"/>
		    			<form:option value="3" label="개발자들의 이야기"/>
		    			<form:option value="4" label="AWS 설정 방법"/>
		    			<form:option value="5" label="코드리뷰"/>
		    		</form:select>
					<form:errors path="tech_category" id="error_color"/>
	    		</div>
	    	</div>
	    	<div class="row">
	    		<div class="col-lg">
	    			<label for="tech_tag" class="form-label mt-1 fs-2" id="label">태그</label>	
	    			<form:errors path="tech_tag" id="error_color"/>
	    		</div>
	    	</div>
	    	<div class="row">
	    		<div class="col-lg form-check">
					<label class="form-check-label col-sm-1 mx-2" for="AWS"><form:checkbox path="f_tech_tag" cssClass="form-check-input" value="AWS" id="AWS"/>AWS</label>
					<label class="form-check-label col-sm-1 mx-2" for="iOS"><form:checkbox path="f_tech_tag" cssClass="form-check-input" value="iOS" id="iOS"/>iOS</label>
					<label class="form-check-label col-sm-1 mx-1 mr-4" for="Android"><form:checkbox path="f_tech_tag" cssClass="form-check-input" value="Android" id="Android"/>Android</label>
					<label class="form-check-label col-sm-1 mx-5" for="WEB"><form:checkbox path="f_tech_tag" cssClass="form-check-input" value="WEB" id="WEB"/>WEB</label>
					<label class="form-check-label col-sm-2" for="코드리뷰"><form:checkbox path="f_tech_tag" cssClass="form-check-input" value="코드리뷰" id="코드리뷰"/>코드리뷰</label>
	    		</div>
	    	</div>
	    	<div class="row">
	    		<div class="col-lg">
	    		<form:errors path="tech_content" id="error_color"/>
	    			<form:textarea path="tech_content"/>
				<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#tech_content' ),{
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
	    	</div>
	    	<div class="row">
	    		<div class="col-lg my-3">
	    			<input type="submit" value="글 등록" class="btn btn-primary">
				<input type="button" value="목록"
			            onclick="location.href='techblogList.do'" class="btn btn-secondary">
	    		</div>
		        </form:form>
	    	</div>
	    </div>
<!-- 내용 끝 -->