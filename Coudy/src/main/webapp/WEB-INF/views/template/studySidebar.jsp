<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {
        let studyNum = new URLSearchParams(location.search).get('study_num');
        if (studyNum == null) {
            studyNum = $(location).attr('pathname').split('/')[3];
        } else {
        }

        $('#go_plan').click(function () {
            let path = '/study/plan/'
            go_somewhere(path)
        });
        $('#go_todo').click(function () {
            let path = '/study/todo/'
            go_somewhere(path)
        });
        function go_somewhere(path) {
            location.href=path+studyNum
        }
    })
</script>
<div class="row">
    <div class="col">
        팀 사진
    </div>
</div>
<div class="row">
    <div class="col">
      <span>팀이름</span>
    </div>
</div>
<div class="row">
    <div class="col">
        <span>~플젝 종료 일자</span>
    </div>
</div>
<div class="row">
    <div class="col">
        <ul>
            <li>진행 중인 목표</li>
            <li>다음 목표</li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col">
        <ul>
            <li>팀원</li>
            <li>팀원</li>
            <li>팀원</li>
            <li>팀원</li>
            <li>팀원</li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col">
        <button id="go_plan">일정</button>
    </div>
</div>
<div class="row">
    <div class="col">
        <button id="go_todo">할일</button>
    </div>
</div>
<div class="row">
    <div class="col">
        <button onclick="window.open('/chat','test','width=500,height=700');return false;">채팅</button>
    </div>
</div>