<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/todo.js"></script>
<link href="${pageContext.request.contextPath}/css/todo.css" rel="stylesheet">

<div class="container">
    <div class="row study-nav-row">
        <div class="col">
            <span class="study-nav-text">Todos</span>
        </div>
    </div>
    <div class="row study-content">
        <div class="col">
            <ul class="list-group" id="before_start_todo">
                <li class="study-li-head">시작 전</li>
                <li class="list-group-item">
                    <form class="m-0 d-flex" id="create_todo_form">
                        <img src="/images/plus.svg" id="create_submit" style="height: 40px">
                        <input class="flex-grow-1 border-secondary border-bottom border-3 border-top-0 border-start-0 border-end-0"
                               type="text" id="create_todo_input" name="todoContent" placeholder="새로운 할일 추가">
                    </form>
                </li>
            </ul>
        </div>
        <div class="col">
            <ul class="list-group" id="progressing_todo">
                <li class="study-li-head">
                    <span>진행 중</span>
                </li>
            </ul>
        </div>
        <div class="col">
            <ul class="list-group" id="completed_todo">
                <li class="study-li-head">
                    <span>완료</span>
                </li>
            </ul>
        </div>
    </div>
</div>

