<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <title>Title</title>
</head>
<script>
    $(function () {
        $('.room_edit').click(function () {
            let chat_num = 'chatNum='+$(this).closest('.room').attr('id');
            location.href='/chat/edit?'+chat_num
        }); $('#create_room').click(function () {
            location.href='/chat/add'
        });
        $('.chat_room').click(function () {
            let chat_num = $(this).closest('.room').attr('id');
            location.href =  '/chat/'+chat_num;
        })

    })

</script>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                채팅
            </div>
        </div>
        <div class="row">
            <div class="col">
                <c:forEach items="${chatRooms}" var="chatRoom">
                    <div class="row room" id="${chatRoom.chatNum}">
                        <div class="col room_name">
                            <span class="chat_room">${chatRoom.chatName}</span>
                        </div>
                        <div class="col  d-flex justify-content-end">
                            <img src="/images/edit.svg"  class="room_edit" style="height: 20px" alt="">
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <img src="/images/plus.svg" id="create_room" alt="create_chat_room">
            </div>
        </div>
    </div>

</body>
</html>
