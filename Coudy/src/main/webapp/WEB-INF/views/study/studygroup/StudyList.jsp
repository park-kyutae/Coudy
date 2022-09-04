<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap.min.js">
</head>
<body>
<div id="main">
    <h1>get test</h1>
    <div class="row">
    <c:forEach var="i" begin="1" end="5">
            <div class="col-3">
                <div class="card ma-2" style="width: 18rem;">
                    <img src="https://i.pravatar.cc/64" class="card-img-top">
                    <div class="card-body">
                        <p class="card-text">스터디 방입니다.</p>
                    </div>
                </div>
            </div>
    </c:forEach>
    </div>
    <button type="button" class="btn btn-primary" onclick="location.href='studygroupcreate.do'">생성하기</button>
</div>
</body>
</html>



