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
    <h1>스터디 그룹</h1>
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
    </form>
    <c:if test="${count == 0}">
        <div>표시할 스터디 그룹이 없습니다.</div>
    </c:if>
    <c:if test="${count > 0}">
    <div class="row">
    <c:forEach var="studygroup" items="${list}">
               <!--begin="1" end="3">-->
            <div class="col-3" onclick="location.href='studygroupDetail.do'">
                <div class="card ma-2 pa-3" style="width: 18rem;">
                    <img src="https://i.pravatar.cc/64" class="card-img-top">
                    <div class="card-body">
                        <p>${studygroup.name}</p>
                        <p class="card-text">스터디 방입니다.</p>
                    </div>
                </div>
            </div>
    </c:forEach>
        <c:if test="${!empty user}">
            <button type="button" class="btn btn-primary" onclick="location.href='studygroupcreate.do'">생성하기</button>
        </c:if>
    </div>
        <div class="align-center">${page}</div>
    </c:if>
</div>
</body>
</html>



