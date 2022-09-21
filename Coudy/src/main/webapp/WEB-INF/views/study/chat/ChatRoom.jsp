<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/stomp.min.js"></script>
    <title>Title</title>
</head>
<script>
    $(function () {
        let sock = new SockJS("/chat-init");
        let client = Stomp.over(sock);
        let chatNum = $(location).attr('pathname').split('/')[2]
        let payload = $('#input_payload');
        let memNum = payload.data('mem_num');
        let memName = payload.data('mem_name');

        client.connect({}, function () {
            client.subscribe('/sub/chat/text/' + chatNum, function (chat) {
                let content = JSON.parse(chat.body);
                $('#content').append('<li>' + content.payload + '--' + content.chatTime + '--' + content.memName + '</li>')
            });
            client.subscribe('/sub/chat/file/' + chatNum, function (chat) {
                let content = JSON.parse(chat.body);
                console.log(content)
                $('#content').append('<li><a href="/chat/files/download/'+ content.logNum+'">' + content.originalFileName + '</a>--' + content.chatTime + '--' + content.memName + '</li>')
            });
        });

        $('#send_payload').click(function () {
            let current_time = new Date().toISOString();
            client.send('/pub/chat/text/' + chatNum, {}, JSON.stringify({
                payload: payload.val(),
                chatTime: current_time,
                memNum: memNum,
                memName: memName
            }));
            payload.val('');
            payload.focus();
        });
        $('#sub').click(function () {
            console.log("test")
            let formData = new FormData($('#file_upload')[0]);
            console.log(formData)
            $.ajax({
                cache: false,
                url: "/chat/file/" + chatNum,
                type: 'POST',
                data: formData,
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                timeout: 30000,
                success: function (data) {
                },
                error: function (xhr, status) {
                }
            });
        })

    });
</script>

<body>
<div class="container-fluid">
        <div class="row">
            <div class="col">
                <span class="fs-3 fw-bolder">${chatRoomVO.chatName}</span>
            </div>
            <div class="col">
                <button onclick="location.href='${chatNum}/upload'">파일 보기</button>
            </div>
        </div>
    <div class="row">
        <div class="col">
            <div style="height:500px;overflow: auto">
                <ul id="content">
                    <c:forEach items="${chatMessages}" var="chatMessage">
                        <c:choose>
                            <c:when test="${chatMessage.chatMessage.startsWith('file://')}">
                                <li><a href="/chat/files/download/${chatMessage.chatLogNum}">
                                        ${chatMessage.chatMessage.substring(7)}</a>/${chatMessage.chatTime}/${chatMessage.memName}
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>${chatMessage.chatMessage}/${chatMessage.chatTime}/${chatMessage.memName}</li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </div>
        
    </div>


    <div class="fixed-bottom">
        <div class="row">
            <div class="col">
                <input type="text" id="input_payload" data-mem_num="${member.mem_num}" data-mem_name="${member.name}">
            </div>
            <div class="col">
                <button class="btn btn-secondary" id="send_payload">전송</button>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <form id="file_upload">
                    <input type="hidden" name="memNum" value="${member.mem_num}">
                    <input type="file" name="chatFile">
                </form>
            </div>
            <button id="sub">테스트 전송</button>
        </div>
    </div>

</div>

</body>
</html>
