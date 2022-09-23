<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {
        let studyNum = new URLSearchParams(location.search).get('study_num');
        if (studyNum == null) {
            studyNum = $(location).attr('pathname').split('/')[3];
        } else {
        }

        $('.go_plan').click(function () {
            let path = '/study/plan/'
            go_somewhere(path)
        });
        $('.go_todo').click(function () {
            let path = '/study/todo/'
            go_somewhere(path)
        });
        $('.go_study_main').click(function () {
            let path = '/study/studymain.do?study_num='
            go_somewhere(path)
        });
        $('.go_blog').click(function () {
            let path = '/study/notice/list.do?study_num='
            go_somewhere(path)
        });
        function go_somewhere(path) {
            location.href=path+studyNum
        }
    })
</script>
<div class="row mb-2">
    <div class="col d-flex justify-content-center bg-secondary bg-opacity-10 rounded rounded-circle ratio ratio-1x1 mx-5">
        <img src="/images/java_logo.svg" class="go_study_main pointer p-3">
    </div>
</div>
<div class="row ">
    <div class="col text-center pointer go_study_main">
      <span class="fs-3 fw-bold " >${sidebarStudyGroup.name}</span>
    </div>
</div>
<div class="row">
    <div class="col text-center">
        <span class="text-secondary">~${sidebarStudyGroup.end_date}</span>
    </div>
</div>
<div class="row mb-4">
    <div class="col text-center">
        <span class="text-secondary">목적: ${sidebarStudyGroup.purpose}</span>
    </div>
</div>

<div class="row mb-2" >
    <div class="col text-center pe-4 ps-4 d-flex justify-content-center">
        <ul class="list-group list-group-flush">
            <li class="fw-bold list-group-item border-0">멤버</li>
            <c:forEach items="${sidebarMembers}" var="sidebarMember">
                <li class="list-group-item text-center ">${sidebarMember.name}</li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="row mb-4">
    <div class="col justify-content-center d-flex">
        <div class="p-2 rounded-circle bg-secondary bg-opacity-25 mx-1">
            <img src="/images/calender.svg" class="pointer go_plan">
        </div>
        <div class="p-2 rounded-circle bg-secondary bg-opacity-25 mx-1 ">
            <img src="/images/todo.svg"  class="pointer go_todo">
        </div>
        <div class="p-2 rounded-circle bg-secondary bg-opacity-25 mx-1 ">
            <img src="/images/blog.svg"  class="pointer go_blog">
        </div>
      </div>
</div>

<div class="fixed-bottom d-flex justify-content-end ">
    <div class="bg-opacity-10 bg-secondary rounded-circle mb-3 me-3 p-3">
        <img class="pointer " src="/images/chat3.svg"
             onclick="window.open('/chat','test','width=500,height=700');return false;" style="filter: invert(31%) sepia(35%) saturate(503%) hue-rotate(202deg) brightness(94%) contrast(91%);">
    </div>
</div>