<%--
  Created by IntelliJ IDEA.
  User: taemin
  Date: 2022/09/05
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>

    span{
        font-size: 15pt;
    }
    pre{
        font-size: 15pt;
    }
    .checked {
        color: orange;
    }
    .blank{
        color: lightgray;
    }
</style>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.82/dist/themes/light.css"/>
<script type="module"
        src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.82/dist/shoelace.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<div style="height: 150px">

</div>
<div class="container" style="height: 1500px">
    <div class="row-cols-4">
        <div class="col-sm-12">
            <h4>${companyVO.com_name}</h4>
            <span class="float-end">조회수 : ${companyVO.com_hit}</span>
            <h2>${companyVO.com_title}</h2>
        </div>
    </div>
    <hr>
    <div>
        <div class="row">
            <div class="col-6">
                <h3>지원자격</h3><br>
                <span>경력 : <i style="color: #0d6efd">${companyVO.com_career}</i></span>
                <span class="float-end">학력 : <i style="color: #0d6efd">${companyVO.com_edu}</i></span><br>
                <span>급여 : <i style="color: #0d6efd">${companyVO.com_pay}</i></span>
                <span class="float-end">근무시간 : <i style="color: #0d6efd">${companyVO.com_time}</i> </span><br>
                <span>고용형태 : <i style="color: #0d6efd">${companyVO.com_empType}</i></span>
                <span class="float-end">근무지역 : ${companyVO.com_address1} </span><br>
            </div>
            <div class="col-6 mx-auto my-auto">
                <div class="row" style="margin-left: 10rem">
                    <button style="width: 400px;" data-com-num="${companyVO.com_num}" class="scrap_btn btn btn-outline-warning">스크랩
                        <span id="${companyVO.com_num}" data-com-num="${companyVO.com_num}" style="font-size: 23px; cursor: pointer;" class="scrap_btn fa fa-star blank"></span>
                        <script>
                            $(function () {
                                let com_num = ${companyVO.com_num};
                                function selectData(com_num) {
                                    $.ajax({
                                        url: 'getScrap.do',
                                        type: 'post',
                                        data: {com_num:com_num},
                                        dataType: 'json',
                                        cache: false,
                                        timeout: 30000,
                                        success:function (param) {
                                            displayScrap(param);
                                        },
                                        error:function () {
                                            alert('네트워크오류류류ㅠ')
                                        }
                                    })
                                }
                                selectData(com_num);

                                function displayScrap(param){
                                    let id=${companyVO.com_num};
                                    if(param.status == 'noScrap'){
                                        document.getElementById(id).classList.replace('checked','blank');
                                    }else{
                                        document.getElementById(id).classList.replace('blank', 'checked');
                                    }
                                }
                            });
                        </script>
                    </button>
                </div>
                <div class="row mt-2" style="margin-left: 10rem">

                    <button style="width: 400px;" id="btn2" class="btn btn-outline-primary" onclick="javascript:popup()" >즉시지원</button>
                    <input type="hidden" value="${companyVO.com_num}" id="com_num" name="com_num">
                    <script>
                        // var openWin;
                        //
                        // function openChild(){
                        //     window.name='comView';
                        //
                        //     setChildText();
                        //
                        //     openWin = window.open("resume.do","resumeForm",
                        //                                     "width = 500, height = 500, top = 300, left = 300, location = no, resizable = no, scrollbars = no");
                        //
                        // }
                        //
                        // function setChildText(){
                        //     openWin.document.getElementById('cInput').value = document.getElementById('pInput').value;
                        // }
                        function popup(){

                            var url = "resume.do";
                            var name = "popup test";
                            var option = "width = 500, height = 500, top = 300, left = 300, location = no, resizable = no, scrollbars = no"
                            window.open(url, name, option);
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col">
            <img width="100%" height="424px" src="imageView.do?com_num=${companyVO.com_num}&com_type=2">
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <h2>남은 시간</h2>
            <span style="color: red" id="remain-time"></span>
            <input type="hidden" value="${companyVO.com_schedule}" id="schedule">
<%--            <span>${companyVO.com_schedule} 까지</span>--%>
        </div>
        <div class="col-sm-6">
            <h2>모집 부문</h2>
            <span>${companyVO.com_part}</span>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col">
            <h4>${companyVO.com_comTitle}</h4>
            <pre style="font-size: 15pt">${companyVO.com_comContent}</pre>
        </div>

    </div>
    <div class="row mt-4">
        <div class="col">
            <h2>근무지</h2>
            <span>${companyVO.com_address1} ${companyVO.com_address2}</span>
        </div>
    </div>

    <div class="row mt-4">
        <h2>채용절차</h2>
        <div class="col-md-3 mt-4 px-4 col-6">
            <svg class="bd-placeholder-img rounded-circle" width="160" height="160" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 서류전형" preserveAspectRatio="xMidYMid slice" focusable="false"><title>서류전형</title><rect width="100%" height="100%" fill="#d3d3d3"></rect><text x="30%" y="50%" fill="#000" dy=".3em" style="font-size: 15pt" class="border-0">서류전형</text></svg>
            <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="ms-lg-4 bi bi-arrow-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
            </svg>
        </div>
        <div class="col-md-3 mt-4 px-4 col-6">
            <svg class="bd-placeholder-img rounded-circle" width="160" height="160" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 1차면접" preserveAspectRatio="xMidYMid slice" focusable="false"><title>1차면접</title><rect width="100%" height="100%" fill="#d3d3d3"></rect><text x="30%" y="50%" fill="#000" dy=".3em" style="font-size: 15pt" class="border-0">1차면접</text></svg>
            <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="ms-lg-4 bi bi-arrow-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
            </svg>
        </div>
        <div class="col-md-3 mt-4 px-4 col-6">
            <svg class="bd-placeholder-img rounded-circle" width="160" height="160" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 2차면접" preserveAspectRatio="xMidYMid slice" focusable="false"><title>2차면접</title><rect width="100%" height="100%" fill="#d3d3d3"></rect><text x="30%" y="50%" fill="#000" dy=".3em" style="font-size: 15pt" class="border-0">2차면접</text></svg>
            <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="ms-lg-4 bi bi-arrow-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
            </svg>
        </div>
        <div class="col-md-3 mt-4 px-4 col-6">
            <svg class="bd-placeholder-img rounded-circle" width="160" height="160" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 최종합격" preserveAspectRatio="xMidYMid slice" focusable="false"><title>최종합격</title><rect width="100%" height="100%" fill="#d3d3d3"></rect><text x="30%" y="50%" fill="#000" dy=".3em" style="font-size: 15pt" class="border-0">최종합격</text></svg>
        </div>
    </div>

    <button id="btn1" class="btn btn-primary float-end mt-5" onclick="location.href='/company/comHome.do'">홈으로</button>
</div>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/company1.js"></script>