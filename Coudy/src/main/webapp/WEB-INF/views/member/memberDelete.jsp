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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style_ks.css">


<style>
.align-center2{
	margin:0 auto;
}
</style>

<h2>회원탈퇴 확인</h2>



<div class="align_center container">
	<form:form class="row g-3 needs-validation" style="margin:0 auto;" id="delete_form" action="delete.do" modelAttribute="memberVO">
		<div class="col-12">
		<div class="text-center">
		<br><h4>정말로 탈퇴 하시겠습니까?</h4><br>
		</div>
			<div class="form-floating mb-3 col-3 align-center2"> 
				<form:input path="id" class="form-control left-input"
					placeholder="id" />
				<form:errors path="id" cssClass="error-color" />
				<label for="id">아이디</label> 
				<div class="valid-feedback">Looks good!</div>
				<div class="invalid-feedback">4~12자 사이의 문구를 입력하세요</div>
			</div>
		</div>

		<div class="col-12">
		<div class="form-floating mb-3 col-3 align-center2">
			<form:password path="passwd" class="form-control"
				placeholder="passwd" />
			<form:errors path="passwd" cssClass="error-color" />
			<label for="passwd">비밀번호</label>
			<div class="valid-feedback">Looks good!</div>
			<div class="invalid-feedback">4~12자 사이의 문구를 입력하세요</div>
		</div>
		</div>
		
		<div class="col-12">
			<div style="margin:0 38%;">
				<button class="btn btn-primary col-6" style="float:left;" type="submit">탈퇴하기</button>
				<button class="btn btn-secondary col-6" onclick="javascript:history.go(-1); return false;">돌아가기</button>
			</div>
		</div>
	</form:form>
</div>
