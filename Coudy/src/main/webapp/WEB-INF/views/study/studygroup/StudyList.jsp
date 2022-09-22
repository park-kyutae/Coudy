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
<div class="container-flud">
    <div class="row">
        <div class="col-9">
        <h1>스터디 그룹</h1>
        </div>
    </div>
    <hr class="my-2">
    <form action="studygrouplist.do" method="get">
        <ul class="search">
            <li>
                <select name="keyfield" id="keyfield">
                    <option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
                    <option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>ID+별명</option>
                    <option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
                    <option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>제목+내용</option>
                </select>
            </li>
            <li>
                <input type="search" name="keyword" id="keyword"
                       value="${param.keyword}">
            </li>
            <li>
                <input type="submit" value="찾기">
                <input type="button" value="목록"
                       onclick="location.href='studygrouplist.do'">
            </li>
        </ul>
        <div class="row">
        <div class="col-10"></div>
        <div class="col-2">
            <c:if test="${!empty user}">
                <button type="button" justify="end" class="btn btn-primary" onclick="location.href='studygroupcreate.do'">생성하기</button>
            </c:if>
        </div>
        </div>
    </form>
    <c:if test="${count == 0}">
        <div>표시할 스터디 그룹이 없습니다.</div>
    </c:if>
    <c:if test="${count > 0}">
    <div class="row">
    <c:forEach var="studygroup" items="${list}">
            <div class="col-3">
                <div class="card ma-2 mb-3 pa-3" style="width: 19rem; height: 28rem"  >
                    <img src="${pageContext.request.contextPath}/images/logo.png" class="card-img-top" style="height: 230px;" >
                    <div class="card-body">
                        <div style="height: 75px">
                        <h3 class="card-title">${studygroup.name}</h3>
                        </div>
                        <div style="height: 40px">
                        <p class="card-subtitle">${studygroup.purpose}</p>
                        </div>
                        <span class="badge bg-info">${studygroup.stack}</span>
                        <p class="card-text text-muted">참여 중인 인원 : 1 / ${studygroup.limit}</p>
                         <button style="width: 18rem;" type="button" class="btn btn-primary justify-content-md-center" onclick="location.href='studydetail.do?study_num=${studygroup.study_num}'">신청 하기</button>
                        </div>
                </div>
            </div>
    </c:forEach>
    </div>
        <div class="align-center">${page}</div>
    </c:if>
</div>
</body>
</html>



