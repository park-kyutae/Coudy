<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <c:forEach var="i" begin="1" end="5">
        <div class="card" style="width: 18rem;">
            <img src="https://i.pravatar.cc/64" class="card-img-top">
            <div class="card-body">
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
        </div>
    </c:forEach>
    <button type="button" class="btn btn-primary" onclick="location.href='studygroupcreate.do'">생성하기</button>
</div>
</body>
</html>



