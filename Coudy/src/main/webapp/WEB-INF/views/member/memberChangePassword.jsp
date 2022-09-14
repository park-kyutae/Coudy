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



<div class="align_center container">
	<form:form class="row g-3 needs-validation" id="update_passwd_form" action="changePassword.do" modelAttribute="memberVO">
		
		<div class="form-floating mb-3">
			<form:password path="now_passwd" class="form-control" placeholder="now_passwd" />
			<form:errors path="now_passwd" cssClass="error-color" />
			<label for="now_passwd">현재 비밀번호</label>
			<div class="valid-feedback">Looks good!</div>
		</div>

		<div class="form-floating mb-3">
			<form:password path="passwd" class="form-control" placeholder="passwd" />
			<form:errors path="passwd" cssClass="error-color" />
			<label for="passwd">새 비밀번호</label>
			<div class="valid-feedback">Looks good!</div>
		</div>

		<div>
			<button class="btn btn-primary" type="submit">Submit form</button>
		</div>
	</form:form>
</div>
