<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/chat-bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/stomp.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ChatRoom.js"></script>
    <title>Title</title>
</head>

<body>
<div class="container-fluid">
    <div class="row chat-header">
        <div class="col chat-header-text">
            ${chatRoomVO.chatName}
        </div>
        <div class="d-flex align-items-center justify-content-end p-0" style="position: absolute;width: 490px">
            <button class="btn btn-secondary pb-1" onclick="location.href='${chatNum}/upload'">파일 보기</button>
        </div>
    </div>
    <div class="row">
        <div class="col p-0">
            <div id="content" class="w-100" style="height:578px;overflow: auto">
                <c:forEach items="${chatMessages}" var="chatMessage">
                <c:choose>
                <c:when test="${chatMessage.memNum == member.mem_num}">
                <div class="d-flex justify-content-end m-1">
                    </c:when>
                    <c:otherwise>
                    <div class="m-1">
                        </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${chatMessage.chatMessage.startsWith('file://')}">
                                <div class="toast show">
                                    <div class="toast-header">
                                        <strong class="me-auto">${chatMessage.memName}</strong>
                                        <small>
                                            <fmt:parseDate value="${chatMessage.chatTime}" pattern="yyyy-MM-dd'T'HH:mm"
                                                           var="parsedTime" type="both"/>
                                            <fmt:formatDate value="${parsedTime}" pattern="yyyy-MM-dd HH:mm"/>
                                        </small>
                                    </div>
                                    <div class="toast-body">
                                        <a href="/chat/files/download/${chatMessage.chatLogNum}">
                                                ${chatMessage.chatMessage.substring(7)}</a>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="toast show">
                                    <div class="toast-header">
                                        <strong class="me-auto">${chatMessage.memName}</strong>
                                        <small>
                                            <fmt:parseDate value="${chatMessage.chatTime}" pattern="yyyy-MM-dd'T'HH:mm"
                                                           var="parsedTime" type="both"/>
                                            <fmt:formatDate value="${parsedTime}" pattern="yyyy-MM-dd HH:mm"/>
                                        </small>
                                    </div>
                                    <div class="toast-body">
                                            ${chatMessage.chatMessage}
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    </c:forEach>
                </div>
            </div>


        </div>


        <div class="fixed-bottom border-top btn-secondary border-3">
            <div class="row">
                <div class="col d-flex m-3">
                    <label for="file_input"><img src="/images/file.svg" class="me-2" height="40px"></label>
                    <form id="file_upload">
                        <input type="hidden" name="memNum" value="${member.mem_num}">
                        <input type="file" id="file_input" style="display:none;" name="chatFile">
                    </form>
                    <input type="text" class="flex-grow-1 me-2" id="input_payload" data-mem_num="${member.mem_num}"
                           data-mem_name="${member.name}">
                    <button class="btn btn-chat-primary" id="send_payload">전송</button>
                </div>
            </div>
        </div>

    </div>

</body>
</html>
