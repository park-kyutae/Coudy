<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style_ks.css">


<h2>비밀번호 변경</h2>

<style>
.align-center2{
	margin:0 auto;
}
</style>



<div class="align_center container">
	<h2 class="text-center mb-3 mt-3">Coudy</h3>
	<form:form class="row g-3 needs-validation" id="change_form" action="changePassword.do" modelAttribute="memberVO">
		
		<div class="col-12">
		<div class="form-floating mb-2 col-3 align-center2">
			<form:password id="now_passwd" path="now_passwd" class="form-control" placeholder="now_passwd" value="" required=""/>
			<form:errors id="now_passwd" path="now_passwd" cssClass="error-color" />
			<label for="now_passwd">현재 비밀번호</label>
			<div class="valid-feedback">Looks good!</div>
		</div>
		</div>

		<div class="col-12">
		<div class="form-floating mb-2 col-3 align-center2">
			<form:password id="passwd" path="passwd" class="form-control" placeholder="passwd" />
			<form:errors id="passwd" path="passwd" cssClass="error-color" />
			<label for="passwd">새 비밀번호</label>
			<div class="valid-feedback">Looks good!</div>
		</div>
		</div>
		
		<div class="col-12">
		<div class="form-floating mb-2 col-3 align-center2">
			<input type="password" id="passwd2" class="form-control" placeholder="passwd2"/> 
			<label for="passwd2">새 비밀번호 확인</label>
			<div class="valid-feedback">Looks good!</div>
			<div id="message_id" class="invalid-feedback">4~12의 숫자, 영문을 입력해주세요</div>
		</div>
		</div>
		
		<div class="col-3" style="margin:0 auto;">
			<input class="btn btn-primary col-6" type="submit" style="float:left;" value="변경하기"></input>
			<button class="btn btn-secondary col-6" onclick="javascript:history.go(-1); return false;">돌아가기</button>
		</div>
	</form:form>
</div>
