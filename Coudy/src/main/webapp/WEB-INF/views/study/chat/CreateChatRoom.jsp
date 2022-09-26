<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/chat-bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/CreateChatRoom.js" type="text/javascript"></script>
    <title>Title</title>
</head>
<script>
    $(function () {
        $('.invalid-feedback').parent().children('input[type=text]').addClass('is-invalid')
    })

</script>
<body>
<div class="container-fluid">
    <div class="row chat-header mb-3">
        <div class="col chat-header-text">
            채팅방 생성
        </div>
    </div>
    <form:form modelAttribute="createChatRoomForm" action="">
    <div class="row">
            <div class="col">
                <div class="row chat-content">
                    <div class="col">
                        <label for="chatName" class="chat-title form-label">채팅 이름</label>
                        <form:input path="chatName" cssClass="form-control"/>
                        <form:errors path="chatName" cssClass="invalid-feedback"/>
                        <input type="hidden" name="mem_num" value="${ownerMemNum}">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <span class="chat-title">멤버 추가</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <ul id="member_list" class="list-group list-group-flush">
                            <li class="member list-group-item">
                                <div class="row">
                                    <div class="col">
                                        <input type="text" class="search-member form-control"/>
                                        <form:errors path="mem_num" cssClass="invalid-feedback"/>
                                        <input type="hidden" name="mem_num" class="search-member-num">
                                    </div>
                                    <div class="col col-1 d-flex justify-content-center">
                                        <img src="/images/plus.svg" height="35px" class="pointer" id="add_member">
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
    </div>
</div>
<div class="fixed-bottom d-flex justify-content-end mb-2">
    <div class="container-fluid">
            <div class="row">
                <div class="col d-flex justify-content-end">
                    <button type="button" class="btn btn-secondary" onclick="history.go(-1)">취소</button>
                    <input type="submit" value="추가" class="ms-2 btn btn-chat-primary">
                </div>
            </div>
    </div>
</div>
</form:form>

</body>
</html>
