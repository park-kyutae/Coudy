<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datepicker.ko.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="container">
    <h1>스터디 그룹 개설하기</h1>
    <form class="row g-3 needs-validation" novalidate>
        <div class="mb-3 col-lg-12">
            <label for="name" class="form-label">스터디 명</label>
            <input type="text" class="form-control" id="name" aria-describedby="aboutName" required>
            <div class="invalid-feedback">
                스터디 명을 입력하세요.
            </div>
        </div>
        <div class="mb-3">
            <label for="purpose" class="form-label">스터디 목적</label>
            <input type="text" class="form-control" id="purpose" required>
            <div class="invalid-feedback">
                스터디 목적을 입력하세요.
            </div>
        </div>
        <div class="mb-3">
            <label for="limit" class="form-label">스터디 인원</label>
            <input type="number" class="form-control" id="limit" value="2" required>
            <div>
                최대 인원은 20명을 넘을 수 없습니다.
            </div>
        </div>
        <div class="mb-3">
            <select class="form-select" aria-label="Default select example">
                <option selected>스터디 하고자 하는 기술을 선택하세요.</option>
                <option value="1">Java</option>
                <option value="2">Spring</option>
                <option value="3">Node.js</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="location" class="form-label">스터디 지역</label>
            <input type="text" class="form-control" id="location" required>
            <div class="invalid-feedback">
                스터디 지역을 입력하세요.
            </div>
        </div>
        <div class="mb-3">
            <label for="limit-date" class="form-label">모집 종료 날짜</label>
            <input type="text" class="form-control datepicker" id="limit-date" required>
        </div>

        <div class="mb-3">
            <label for="satrt_date" class="form-label">스터디 시작일</label>
            <input type="text" class="form-control datepicker" id="satrt_date" required>
        </div>
        <div class="mb-3">
            <label for="end_date" class="form-label">스터디 종료일</label>
            <input type="text" class="form-control" id="end_date" required>
        </div>
            <button type="button" id="click-btn">테스트</button>

        <button type="submit" class="btn btn-primary">개설하기</button>
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
<script type="text/javascript">
    $('#datepicker').datepicker({
        format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
        startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
        language : "ko",	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
    })//여기까지가 기본 사용 방법

    $('#click-btn').on("changeDate", function(e) {
        //이벤트의 종류
        //show : datePicker가 보이는 순간 호출
        //hide : datePicker가 숨겨지는 순간 호출
        //clearDate: clear 버튼 누르면 호출
        //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
        //changeMonth : 월이 변경되면 호출
        //changeYear : 년이 변경되는 호출
        //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
        console.log("test")
        console.log(e);// 찍어보면 event 객체가 나온다.
        //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데
        // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
        // 위와 같은 형태로 보인다.
        // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다.
    });
</script>
</html>



