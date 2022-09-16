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
    $('.room_edit').click(function () {
        let chat_num = 'chatNum='+$(this).closest('.room').attr('id');
        location.href=$(location).attr('pathname')+'/edit?'+chat_num
    });
</script>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                채팅 수정
            </div>
        </div>
        <div class="row">
            <div class="col">
                <span>채팅방 이름 수정</span>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <input type="text" value="${chatRoom.chatName}" name="chatName">
            </div>
        </div>
        <c:forEach items="${members}" var="member">
            <div class="row">
                <div class="col">
                    <span>${member.name}</span>
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>
