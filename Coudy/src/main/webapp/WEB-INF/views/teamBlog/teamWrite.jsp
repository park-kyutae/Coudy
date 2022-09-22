v<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploadAdapter.js"></script>

<div>
	<form:form action="write.do" modelAttribute="teamblogVO" id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="team_title">제목</label>
				<form:input path="team_title"/>
				<form:errors path="team_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="upload">파일업로드</label>
				<input type="file" name="upload" id="upload">
			</li>
			<li><b>내용</b></li>
			<li>
				<form:textarea path="team_content"/>
				<form:errors path="team_content" cssClass="error-color"/>
				<script>
				function MyCustomUploadAdapterPlugin(editor) {
				    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
				        return new UploadAdapter(loader);
				    }
				}
			 
			 ClassicEditor
	            .create( document.querySelector( '#team_content' ),{
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
			<form:button>전송</form:button>
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
    
    