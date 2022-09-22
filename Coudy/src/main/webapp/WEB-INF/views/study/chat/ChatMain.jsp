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
    <title>Title</title>
</head>
<script>
    $(function () {
        let result = new URLSearchParams(location.search).get('result');
        if (result == 'true') {
            alert('채팅방이 생성되었습니다')
            history.replaceState({}, null, location.pathname);
        }

        $('.room_edit').click(function () {
            event.stopPropagation();
            let chat_num = 'chatNum='+$(this).closest('.room').attr('id');
            location.href='/chat/edit?'+chat_num
        }); $('#create_room').click(function () {
            location.href='/chat/add'
        });
        $('.room').click(function () {
            let chat_num = $(this).closest('.room').attr('id');
            location.href =  '/chat/'+chat_num;
        })

        let sock = new SockJS("/chat-init");
        let client = Stomp.over(sock);


        client.connect({}, function () {
            const elements = document.querySelectorAll('.room');
            Array.from(elements).forEach((element, index) => {
                let chatNum = element.id;
                client.subscribe('/sub/chat/text/' + chatNum, function (chat) {
                    let content = JSON.parse(chat.body);
                    $('#message'+chatNum).text(content.payload)
                });
                client.subscribe('/sub/chat/file/' + chatNum, function (chat) {
                    let content = JSON.parse(chat.body);
                    $('#message'+chatNum).text(content.originalFileName)
                });
            });

        });

    })

</script>
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
