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
</style>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.82/dist/themes/light.css"/>
<script type="module"
        src="https://cdn.jsdelivr.net/npm/@shoelace-style/shoelace@2.0.0-beta.82/dist/shoelace.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<div style="height: 150px">

</div>
<div class="container" style="height: 1500px">
    <div class="row-cols-4 align-center">
        <div class="align-center col-sm-12">
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
            <div class="col-6 text-center align-center">
                <div class="row d-grid gap-2">
                    <br>
                    <button class="scrap_btn btn btn-sm btn-outline-primary mb-2">스크랩
                        <svg style="cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                             fill="currentColor" id="star" class="bi bi-star" viewBox="0 0 16 16">
                            <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                        </svg>
                    </button>
                </div>
                <div class="row align-center text-center">
                    <button style="width: 300px;" class="btn btn-sm btn-outline-primary" >즉시지원</button>
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
            <h3>남은 시간</h3>
            <span style="color: crimson" id="remain-time"></span>
            <input type="hidden" value="${companyVO.com_schedule}" id="schedule">
<%--            <span>${companyVO.com_schedule} 까지</span>--%>
        </div>
        <div class="col-sm-6">
            <h3>모집 부문</h3>
            <span>${companyVO.com_part}</span>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col">
            <h3>${companyVO.com_comTitle}</h3>
            <span>${companyVO.com_comContent}</span>
        </div>

    </div>
    <sl-button href="comHome.do">홈으로</sl-button>
</div>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/company.js"></script>