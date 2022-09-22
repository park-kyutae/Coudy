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
        <h1>스터디 그룹 유저 관리</h1>
        </div>
    </div>
    <c:forEach var="applicationlist" items="${list}">
    <div class="row row-cols-2 row-cols-md-1 g-4">
            <div class="col-12 my-4">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-2">
                                <img src="${pageContext.request.contextPath}/images/logo.png" class="card-img-top" style="width : 100px; height: 100px;" >
                            </div>
                            <div class="col-10">
                                <div class="row">
                                    <div class="col-9">
                                        <h5 class="card-title">${applicationlist.name}</h5>
                                        <p class="card-text">${applicationlist.request}</p>
                                        <p class="card-text">${applicationlist.meet_time}</p>
                                        <p class="card-text">${applicationlist.career}</p>
                                    </div>
                                    <div class="col-3">
                                        <div>
                                            <form class="row g-3" method="post" action="updatestudyauth.do">
                                                <input type="hidden" id="study_user_num" name="study_user_num" value="${applicationlist.study_user_num}">
                                                <input type="submit" class="btn btn-primary rounded" style="width: 100px; height: 80px;" value="수정하기">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="!empty applicationlist.registered">
                            <div>
                                <h1>등록 완료</h1>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>



