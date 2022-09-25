<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <link href="${pageContext.request.contextPath}/css/progress.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/progress.js" type="text/javascript"></script>
<div class="container">
    <div class="row study-nav-row">
        <div class="col">
            <span class="study-nav-text">${sidebarStudyGroup.name}</span>
        </div>
    </div>
    <div class="row study-content bg-text-primary bg-opacity-25 rounded pt-3">
        <div class="col ">
            <div class="timeline-steps aos-init aos-animate" id="progress_div" data-aos="fade-up">
            </div>
        </div>
    </div>
    <div class="row study-content">
        <div class="col"><span class="fs-3">진행 중인 할일</span></div>
    </div>
    <div class="row row-cols-3 study-content">
        <c:forEach items="${todoEachStudyUsers}" var="todo">
            <div class="col">
                <ul class="list-group go_todo pointer mb-3">
                    <li class="study-li-head">${todo.key}</li>
                    <c:forEach begin="0" end="5" step="1" varStatus="status">
                        <c:choose>
                            <c:when test="${fn:length(todo.value) > status.index}">
                                <li class="list-group-item">&#10132; ${todo.value[status.index].todoContent}</li>
                            </c:when>
                            <c:otherwise>
                                <li class="list-group-item">&#10132; <span class="text-secondary">할 일을 추가해주세요.</span></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </c:forEach>
    </div>
</div>
