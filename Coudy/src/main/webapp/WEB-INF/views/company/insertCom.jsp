<%--
  Created by IntelliJ IDEA.
  User: taemin
  Date: 2022/08/30
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<div class="bg-light">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
        <h2>채용 공고 폼</h2>
        <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
    </div>
    <form class="needs-validation" novalidate method="post" action="insertCom.do" enctype="multipart/form-data">
        <div class="row g-3">
            <div class="col-sm-4">
                <label for="com_name" class="form-label">회사명</label>
                <input type="text" class="form-control" name="com_name" id="com_name" placeholder="회사명을 입력해주세요." value="" required="">
                <div class="invalid-feedback">
                    회사명을 입력해주세요.
                </div>
            </div>
            <div class="col-sm-6">
                <label for="com_title" class="form-label">채용공고 제목</label>
                <input type="text" class="form-control" name="com_title" id="com_title" placeholder="채용정보 제목을 입력해주세요." value="" required="">
                <div class="invalid-feedback">
                    채용공고 제목을 입력해주세요.
                </div>
            </div>
            <div class="col-sm-5">
                <label for="com_career" class="form-label">경력</label>
                <select class="form-select" name="com_career" id="com_career" required="" >
                    <option value="">필수 항목입니다.</option>
                    <option value="신입">신입</option>
                    <option value="경력">경력</option>
                    <option value="경력무관">경력무관</option>
                </select>
            </div>
            <div class="col-sm-5">
                <label for="com_edu" class="form-label">학력</label>
                <select class="form-select" name="com_edu" id="com_edu" required="">
                    <option value="">필수 항목입니다.</option>
                    <option value="고졸">고졸</option>
                    <option value="초대졸">초대졸</option>
                    <option value="대졸">대졸</option>
                    <option value="학력무관">학력무관</option>
                </select>
            </div>

            <div class="col-sm-5">
                <label for="com_empType" class="form-label">고용형태</label>
                <input type="text" name="com_empType" class="form-control" id="com_empType" placeholder="정규식/계약직/인턴" required="">
                <div class="invalid-feedback">
                    고용형태를 입력해주세요.
                </div>
            </div>
            <div class="col-sm-5">
                <label for="com_pay" class="form-label">급여</label>
                <input type="text" name="com_pay" class="form-control" id="com_pay" placeholder="급여를 입력해주세요." value="" required="">
                <div class="invalid-feedback">
                    급여를 입력해주세요.
                </div>
            </div>


            <div class="col-sm-5">
                <label for="com_time" class="form-label">근무시간</label>
                <input type="text" name="com_time" class="form-control" id="com_time" placeholder="주5일/주3일/..." value="" required="">
            </div>
            <div class="col-5">
                <label for="com_tag" class="form-label">해쉬태그<span class="text-muted">(필수아님)</span></label>
                <input type="text" class="form-control" name="com_tag" id="com_tag" placeholder="#해쉬#태그#달아요">
            </div>
            <div class="col-sm-4">
                <label for="com_zipcode" class="form-label">근무지 우편번호</label>
                <input type="text" class="form-control" name="com_zipcode" id="com_zipcode" required="">
                <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"/>
                <div class="invalid-feedback">
                    우편번호를 입력해주세요.
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <label for="com_address1" class="form-label">주소</label>
                <input type="text" class="form-control" name="com_address1" id="com_address1" required="">
            </div>
            <div class="col-sm-7">
                <label for="com_address2" class="form-label">상세주소</label>
                <input type="text" class="form-control" name="com_address2" id="com_address2" required="">
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-4">
                <label for="com_schedule">모집일정</label>
                <input type="date" class="form-control" name="com_schedule" id="com_schedule" required="">
            </div>
            <div class="col-6">
                <label for="com_part">모집구분</label>
                <input type="text" class="form-control" id="com_part" name="com_part" placeholder="모집구분을 입력해주세요." required="">
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-4">
                <label>회사포스터 업로드</label>
                <input class="border" type="file" id="upload" name="upload" accept="image/png,image/jpg,image/jpeg" required="">
                <div class="invalid-feedback">
                    파일을 첨부해주세요.
                </div>
            </div>
        </div>
        <hr class="my-4">

        <div class="row">
            <div class="col-4">
                <label for="com_comTitle">회사소개 제목</label>
                <input type="text" class="form-control" id="com_comTitle" name="com_comTitle" placeholder="회사소개 제목을 입력해주세요." required="">
            </div>
        </div>
        <div class="row">
            <div class="col-4">

                <label for=com_comContent>회사소개 내용</label>
                <textarea id=com_comContent style="font-size: medium;" class="form-text" name="com_comContent" cols="70" rows="5" placeholder="회사 소개 및 인재상 입력해주세요." required=""></textarea>
                <div class="invalid-feedback">
                    내용을 입력해주세요.
                </div>
            </div>
        </div>
        <hr class="my-4">
        <input type="submit" class="w-100 btn btn-primary btn-lg" value="등록하기"/>
        <input type="button" class="mt-2 w-100 btn btn-secondary btn-lg" value="취소하기" onclick="location.href='/company/comHome.do'"/>
    </form>
</div>
<%--우편번호 검색 시작--%>
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
    <img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('com_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('com_address1').value = fullAddr;
                //document.getElementById('sample2_addressEnglish').value = data.addressEnglish;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
    <%--validation 시작--%>
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
<%--우편번호 검색 끝--%>

