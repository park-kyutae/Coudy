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
<div class="page-main">
	<h2>기술블로그 수정</h2>
	<form:form action="techblogUpdate.do" modelAttribute="techblogVO"
	        id="update_form"
	        enctype="multipart/form-data">
	        <form:hidden path="tech_num"/>
	    <form:errors element="div" cssClass="error-color"/>    
		<ul>
			<li>
				<label for="tech_title">제목</label>
				<form:input path="tech_title"/>
				<form:errors path="tech_title" 
				             cssClass="error-color"/>
			</li>
			<li>
				<label for="tech_name">작성자</label>
				<form:input path="tech_name"/>
				<form:errors path="tech_name" 
				             cssClass="error-color"/>
			</li>
			<li>
				<label for="tech_tag">태그</label>
				<form:input path="tech_tag"/>
				<form:errors path="tech_tag" 
				             cssClass="error-color"/>
			</li>
			<li>
				<label for="tech_kategorie">카탈로그</label>
				<form:input path="tech_kategorie"/>
				<form:errors path="tech_kategorie" 
				             cssClass="error-color"/>
			</li>
			<li><b>내용</b></li>
			<li>
				<form:textarea path="tech_content"/>
				<form:errors path="tech_content" 
				             cssClass="error-color"/>
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
			          
			</li>
		</ul>    
		<div class="align-center">
			<form:button>수정</form:button>
			<input type="button" value="목록"
			            onclick="location.href='techblogList.do'">
		</div>    
	</form:form>
</div>
<!-- 내용 끝 -->