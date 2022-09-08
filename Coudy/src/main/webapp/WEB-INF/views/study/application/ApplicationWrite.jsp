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
    <h1>스터디 그룹 신청하기</h1>
    <form class="row g-3 needs-validation" method="post" action="applicationcreate.do">
        <div class="mb-3 col-lg-12">
            <label for="career" class="form-label">경력</label>
            <input type="text" class="form-control" id="career" name="career" aria-describedby="aboutName" required>
            <div class="invalid-feedback">
                경력을 입력하세요.(신입/경력)
            </div>
        </div>
        <div class="mb-3">
            <label for="meet_time" class="form-label">가능한 시간</label>
            <input type="text" class="form-control" id="meet_time" name="meet_time" required>
            <div class="invalid-feedback">
                스터디가 가능한 시간을 입력하세요.
            </div>
        </div>
        <div class="mb-3">
            <label for="request" class="form-label">스터디 참여시 요구사항</label>
            <input type="text" class="form-control" id="request" name="description" required>
            <div class="invalid-feedback">
                스터디를 설명해 주세요.
            </div>
        </div>
        <input type="submit" class="btn btn-primary" value="신청하기"></input>
        <input type="button" class="btn btn-danger" onclick="history.back()" value="취소하기"></input>
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



