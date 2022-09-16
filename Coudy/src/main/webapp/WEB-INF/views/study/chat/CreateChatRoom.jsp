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
        let count = 0;
        $('#add_member').click(function () {
            $('#submit').before('<div class="row"><div class="col"><input type="text" name="memberName"></div></div>')
            count++;
            if (count >= 9) {
                $('#add_member').remove();
            }
        })
    })

</script>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <span>채팅방 생성</span>
        </div>
        <div class="row">
            <div class="col">
                <button class="btn btn-secondary" id="add_member">추가</button>
            </div>
        </div>
        <div class="row">
            <form:form modelAttribute="createChatRoomForm" action="">
                <form:input path="chatName"/>
                <div class="row">
                    <div class="col">
                        <span>멤버 추가</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <form:input path="mem_num"/>
<%--                        <form:hidden path="mem_num"/>--%>
                    </div>
                </div>
                <div class="row" id="submit">
                    <div class="col">
                        <input type="submit" value="추가">
                    </div>
                </div>
            </form:form>


        </div>

    </div>
</div>
</body>
</html>
