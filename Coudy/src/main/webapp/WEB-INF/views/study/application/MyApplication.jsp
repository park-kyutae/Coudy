<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap.min.js">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-9">
            <h1>나의 스터디 그룹</h1>
        </div>
    </div>
    <c:forEach var="mystudylist" items="${list}">
    <div class="row row-cols-2 row-cols-md-1 g-4">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <img src="${pageContext.request.contextPath}/images/logo.png" class="card-img-top" style="width : 200px; height: 200px;" >
                        <h5 class="card-title">${mystudylist.name}</h5>
                        <p class="card-text">${mystudylist.request}</p>
                    </div>
                </div>
            </div>
        </div>
        <!--경계-->
        <div class="col-3">
            <div class="card ma-2 mb-3 pa-3" style="width: 15rem;height: 27rem"  >
                <img src="${pageContext.request.contextPath}/images/logo.png" class="card-img-top" style="height: 200px;" >
                <div class="card-body">
                    <p class="card-text text-muted">${mystudylist.name}</p>
                    <p class="card-text text-muted">${mystudylist.request}</p>
                    <p class="card-text text-muted">${mystudylist.meet_time}</p>
                    <p class="card-text text-muted">${mystudylist.career}</p>
                    <p class="card-text text-muted">${mystudylist.description}</p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>


