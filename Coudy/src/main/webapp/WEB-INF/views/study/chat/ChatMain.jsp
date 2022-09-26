<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/chat-bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/stomp.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ChatMain.js"></script>
    <title>Title</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row chat-header">
            <div class="col chat-header-text">
                채팅
            </div>
        </div>
        <div class="row">
            <div class="col">
                <c:forEach items="${chatRooms}" var="chatRoom">
                    <div class="row room chat-list pointer" id="${chatRoom.key.chatNum}">
                        <div class="col col-2  room_name">
                            <span class=" fs-5 fw-bold">${chatRoom.key.chatName}</span>
                        </div>
                        <div class="col  w-50">
                            <span class="text-truncate d-inline-block fs-5 w-100" id="message${chatRoom.key.chatNum}">
                                <c:choose>
                                    <c:when test="${chatRoom.value.chatMessage.startsWith('file://')}">
                                        ${chatRoom.value.chatMessage.substring(7)}
                                    </c:when>
                                    <c:otherwise>
                                        ${chatRoom.value.chatMessage}
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div class="col  d-flex justify-content-end">
                            <img src="/images/edit.svg"  class="room_edit" style="height: 30px" alt="">
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="fixed-bottom d-flex justify-content-end m-3">
                <img src="/images/plus.svg" height="50px" id="create_room" alt="create_chat_room">
        </div>
    </div>

</body>
</html>
