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
      <ul>
        <c:forEach items="${chatFiles}" var="file">
          <li>
            <c:set var="pos" value="${file.chatFileName.lastIndexOf('.')}"/>
            <c:set var="ext" value="${file.chatFileName.substring(pos+1)}"/>
            <a href="/chat/files/download/${file.chatFileLogNum}">

              <c:choose>
                <c:when test="${ext == 'png' || ext == 'jpg'||ext == 'jpeg'}">
                  <img class="file" src="/chat/files/${file.chatFileLogNum}" style="height: 20px">
                  ${file.chatFileName}
                </c:when>
                <c:otherwise>
                  <img class="file" src="/images/file.svg" style="height: 20px">
                  ${file.chatFileName}
                </c:otherwise>
              </c:choose>
            </a>

          </li>
        </c:forEach>
      </ul>
    </div>
  </div>



</div>

</body>
</html>
