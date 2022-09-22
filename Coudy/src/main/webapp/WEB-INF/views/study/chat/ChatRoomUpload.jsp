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
</script>

<body>
<div class="container-fluid">
    <div class="row chat-header">
        <div class="col chat-header-text">
            업로드한 파일들
        </div>
    </div>
    <div class="row row-cols-4">
        <c:forEach items="${chatFiles}" var="file">
            <div class="col text-center">
                <c:set var="pos" value="${file.chatFileName.lastIndexOf('.')}"/>
                <c:set var="ext" value="${file.chatFileName.substring(pos+1)}"/>
                <a href="/chat/files/download/${file.chatFileLogNum}">
                    <c:choose>
                        <c:when test="${ext == 'png' || ext == 'jpg'||ext == 'jpeg'}">
                            <img class="file w-100" src="/chat/files/${file.chatFileLogNum}">
                            ${file.chatFileName}
                        </c:when>
                        <c:otherwise>
                            <img class="file w-100" src="/images/file.svg" >
                            ${file.chatFileName}
                        </c:otherwise>
                    </c:choose>
                </a>
            </div>

        </c:forEach>
    </div>


</div>

</body>
</html>
