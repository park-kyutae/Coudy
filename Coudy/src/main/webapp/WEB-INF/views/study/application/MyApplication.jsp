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
    <c:forEach var="studygroup" items="${list}">
        <div class="col-3">
            <div class="card ma-2 mb-3 pa-3" style="width: 15rem;height: 27rem"  >
                <img src="${pageContext.request.contextPath}/images/logo.png" class="card-img-top" style="height: 200px;" >
                <div class="card-body">
                    <div style="height: 75px">
                        <h3 class="card-title">${studygroup.name}</h3>
                    </div>
                    <div style="height: 40px">
                        <p class="card-subtitle">${studygroup.purpose}</p>
                    </div>
                    <span class="badge bg-info">${studygroup.stack}</span>
                    <p class="card-text text-muted">참여 중인 인원 : 1 / ${studygroup.limit}</p>
                    <button style="width: 13rem;" type="button" class="btn btn-primary justify-content-md-center" onclick="location.href='studydetail.do?study_num=${studygroup.study_num}'">신청 하기</button>
                </div>
            </div>
        </div>
    </c:forEach>
    <div class="row row-cols-2 row-cols-md-1 g-4">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${studygroup.name}</h5>
                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>



