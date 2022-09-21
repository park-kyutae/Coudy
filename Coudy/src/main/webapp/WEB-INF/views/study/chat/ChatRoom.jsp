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
                console.log(content.chatTime)
                let chat_time = new Date(content.chatTime+'Z');
                console.log(chat_time)
                chat_time = dateFormat(chat_time);
                let div1;
                let div2 = '<div class="toast show">' +
                    '<div class="toast-header">' +
                    '<strong class="me-auto">' +
                    content.memName +
                    '</strong>' +
                    '<small>' +
                    chat_time +
                    '</small>' +
                    '</div>' +
                    '<div class="toast-body">' +
                    content.payload +
                    '</div>' +
                    '</div>';

                if (memNum == content.memNum) {
                    div1 = '<div class="d-flex justify-content-end m-1">';
                } else {
                    div1 = '<div class="m-1">';
                }


                $('#content').append(div1 + div2);
                scroll_bottom()
            });
            client.subscribe('/sub/chat/file/' + chatNum, function (chat) {
                let content = JSON.parse(chat.body);
                let chat_time = new Date(content.chatTime);
                chat_time = dateFormat(chat_time);
                let div1;
                let div2 = '<div class="toast show">' +
                    '<div class="toast-header">' +
                    '<strong class="me-auto">' +
                    content.memName +
                    '</strong>' +
                    '<small>' +
                    chat_time +
                    '</small>' +
                    '</div>' +
                    '<div class="toast-body">' +
                    '<a href="/chat/files/download/' +
                    content.logNum +
                    '">' +
                    content.originalFileName +
                    '</a></div >' +
                    '</div>';

                if (memNum == content.memNum) {
                    div1 = '<div class="d-flex justify-content-end m-1">';
                } else {
                    div1 = '<div class="m-1">';
                }
                $('#content').append(div1 + div2)
                scroll_bottom();
            });
        });

        function dateFormat(date) {
            let month = date.getMonth() + 1;
            let day = date.getDate();
            let hour = date.getHours();
            let minute = date.getMinutes();
            let second = date.getSeconds();

            month = month >= 10 ? month : '0' + month;
            day = day >= 10 ? day : '0' + day;
            hour = hour >= 10 ? hour : '0' + hour;
            minute = minute >= 10 ? minute : '0' + minute;

            return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
        }

        function send_payload() {
            let current_time = new Date().toISOString();

            client.send('/pub/chat/text/' + chatNum, {}, JSON.stringify({
                payload: payload.val(),
                chatTime: current_time,
                memNum: memNum,
                memName: memName
            }));
            payload.val('');
            payload.focus();
        }

        $('#send_payload').click(function () {
            send_payload();
        });
        $("#input_payload").on("keydown", function (key) {
            if (key.keyCode == 13) {
                event.preventDefault();
                send_payload();
            }
        })
        $('#file_input').change(function () {
            console.log('text')
            if (confirm("파일을 전송하시겠습니까?")) {
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
            } else $(this).val('')
        })

        function scroll_bottom() {
            $('#content').scrollTop($('#content')[0].scrollHeight);
        }

        scroll_bottom();
    });
</script>

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
