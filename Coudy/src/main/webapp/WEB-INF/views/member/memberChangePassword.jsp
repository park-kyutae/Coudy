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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/member.js?"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style_ks.css">


<h2>비밀번호 변경</h2>

<style>
.align-center2{
	margin:0 auto;
}

.btn-primary{
	background-color:#8541f5;
	border-color:#8541f5;
}
.btn-primary:hover{
	background-color:#3d0991;
	border-color:#3d0991;
}
</style>



<div class="align_center container">
<div class="text-center">
	<img  class="mb-4 mt-2" src="${pageContext.request.contextPath}/images/COUDY_logo-04.png" width="15%" height="15%">	
</div>
	<form:form class="row g-3 needs-validation" id="change_form" action="changePassword.do" modelAttribute="memberVO">
		
		<div class="col-12">
		<div class="form-floating mb-2 col-3 align-center2">
			<form:password path="now_passwd" class="form-control" placeholder="now_passwd"/>
			<form:errors path="now_passwd" cssClass="error-color" />
			<label for="now_passwd">현재 비밀번호</label>
			<div class="valid-feedback"></div>
		</div>
		</div>

		<div class="col-12">
		<div class="form-floating mb-2 col-3 align-center2">
			<form:password path="passwd" class="form-control" placeholder="passwd" />
			<form:errors path="passwd" cssClass="error-color" />
			<label for="passwd">새 비밀번호</label>
		</div>
		</div>
		
		<div class="col-12">
		<div class="form-floating mb-2 col-3 align-center2">
			<input type="password" id="passwd2" name="passwd2" class="form-control" placeholder="passwd2"/> 
			<label for="passwd2">새 비밀번호 확인</label>
			<form:errors path="passwd2" cssClass="error-color"/>
			<div id="message_id" class="invalid-feedback">아아아ㄴㄴㄴ</div>
		</div>
		</div>
		
		<div class="col-3 mt-3" style="margin:0 auto;">
			<input class="btn btn-primary col-6" type="submit" style="float:left;border-radius:5px 0 0 5px;" value="변경하기"></input>
			<button class="btn btn-outline-secondary col-6" style="border-radius:0 5px 5px 0;" onclick="javascript:history.go(-1); return false;">돌아가기</button>
		</div>
	</form:form>

	
</div>
