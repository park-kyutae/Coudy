<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="container">
	<h1>스터디 그룹 수정하기</h1>
	<form class="row g-3 needs-validation" method="post" action="updatestudygroup.do">
		<input type="hidden" id="study_num" name="study_num" value="${studygroup.study_num}">
		<div class="mb-3 col-lg-12">
			<label for="name" class="form-label">스터디 명</label>
			<input type="text" class="form-control" id="name" name="name" value="${studygroup.name}" aria-describedby="aboutName" required>
			<div class="invalid-feedback">
				스터디 명을 입력하세요.
			</div>
		</div>
		<div class="mb-3">
			<label for="purpose" class="form-label">스터디 목적</label>
			<input type="text" class="form-control" id="purpose" name="purpose" value="${studygroup.purpose}" required>
			<div class="invalid-feedback">
				스터디 목적을 입력하세요.
			</div>
		</div>
		<div class="mb-3">
			<label for="description" class="form-label">스터디 설명</label>
			<input type="text" class="form-control" id="description" name="description" value="${studygroup.description}" required>
			<div class="invalid-feedback">
				스터디를 설명해 주세요.
			</div>
		</div>
		<div class="mb-3">
			<label for="limit" class="form-label">스터디 인원</label>
			<input type="number" class="form-control" id="limit" name="limit" value="${studygroup.limit}" required>
			<div>
				최대 인원은 20명을 넘을 수 없습니다.
			</div>
		</div>
		<div class="mb-3">
			<select class="form-select" id="stack" name="stack" value="${studygroup.stack}" aria-label="Default select example">
				<option selected>스터디 하고자 하는 기술을 선택하세요.</option>
				<option value="Java">Java</option>
				<option value="Spring">Spring</option>
				<option value="Node.js">Node.js</option>
			</select>
		</div>
		<div class="mb-3">
			<label for="location" class="form-label">스터디 지역</label>
			<input type="text" class="form-control" id="location" name="location" value="${studygroup.location}" required>
			<div class="invalid-feedback">
				스터디 지역을 입력하세요.
			</div>
		</div>
		<div class="mb-3">
			<label for="limit_date" class="form-label">모집 종료 날짜</label>
			<input type="date" class="form-control" id="limit_date" name="limit_date" value="${studygroup.limit_date}" required>
		</div>

		<div class="mb-3">
			<label for="start_date" class="form-label">스터디 시작일</label>
			<input type="date" class="form-control" id="start_date" name="start_date" value="${studygroup.start_date}" required>
		</div>
		<div class="mb-3">
			<label for="end_date" class="form-label">스터디 종료일</label>
			<input type="date" class="form-control" id="end_date" name="end_date" value="${studygroup.end_date}" required>
		</div>
		<input type="submit" class="btn btn-primary" value="수정하기"></input>
		<input type="button" class="btn btn-primary" onclick="location.href='studydetail.do?study_num=${studygroup.study_num}'" value="취소하기"></input>
	</form>
</div>

</body>
<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function () {
		'use strict'
		// Fetch all the forms we want to apply custom Bootstrap validation styles to
		var forms = document.querySelectorAll('.needs-validation')
		// Loop over them and prevent submission
		Array.prototype.slice.call(forms)
				.forEach(function (form) {
					form.addEventListener('submit', function (event) {
						if (!form.checkValidity()) {
							event.preventDefault()
							event.stopPropagation()
						}
						form.classList.add('was-validated')
					}, false)
				})
	})()
</script>
</html>



