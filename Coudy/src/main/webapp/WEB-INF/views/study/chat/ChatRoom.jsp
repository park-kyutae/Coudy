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
                $('#content').append('<li>' + content.payload + '   ' + content.memName + '</li>')
            });
        });

        $('#send_payload').click(function () {
            client.send('/pub/chat/send', {}, JSON.stringify({chatNum: chatNum, payload: payload.val(),memNum:memNum,memName:memName}));
            payload.val('');
            payload.focus();
        });

    });
</script>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <span>${chatName}</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div style="height: 500px;width: 300px">
                <ul id="content">
                </ul>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <input type="text" id="input_payload" data-mem_num="${member.memNum}" data-mem_name="${member.memName}">
        </div>
        <div class="col">
            <button class="btn btn-secondary" id="send_payload">전송</button>
        </div>
    </div>


</div>

</body>
</html>
