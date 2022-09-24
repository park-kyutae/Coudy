<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/chat-bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/EditChatRoom.js" type="text/javascript"></script>
    <title>Title</title>
</head>

<body>
<div class="container-fluid">
    <div class="row chat-header mb-3">
        <div class="col chat-header-text">
            채팅방 수정
        </div>
    </div>
    <div class="row">
        <form:form modelAttribute="editChatRoomForm" action="">
            <div class="col" id="form">
                <div class="row chat-content">
                    <div class="col">
                        <label for="chat_name_input" class="chat-title form-label">채팅 방 이름 수정</label>
                        <input type="text" class="form-control" id="chat_name_input" name="chatName"
                               value="${chatRoom.chatName}">
                        <input type="hidden" name="chatNum" value="${chatRoom.chatNum}">
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <span class="chat-title">현재 멤버</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <ul id="member_list" class="list-group list-group-flush">
                            <c:forEach items="${members}" var="member">
                                <li class="list-group-item ms-2">${member.name}</li>
                            </c:forEach>
                            <li class="member list-group-item">
                                <div class="row">
                                    <div class="col">
                                        <input type="text" class="search-member form-control"/>
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
        </form:form>


    </div>
</div>
<div class="fixed-bottom d-flex justify-content-end mb-2">
    <div class="container-fluid">
        <div class="row">
            <div class="col col-3">
                <form action="quit" method="post" class="m-0">
                    <input type="hidden" value="${chatRoom.chatNum}" name="chatNum">
                    <button type="submit" class="quit_room btn btn-outline-chat-primary">나가기</button>
                </form>
            </div>
            <div class="col d-flex justify-content-end">
                <input type="hidden" value="${chatRoom.chatNum}" name="chatNum">
                <button type="button" class="btn btn-secondary" onclick="history.go(-1)">취소</button>
                <input type="submit" id="submit" value="수정" class="ms-2 btn btn-chat-primary">
            </div>
        </div>
    </div>
</div>
</body>
</html>

