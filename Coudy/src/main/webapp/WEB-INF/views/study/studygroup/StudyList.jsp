<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap.min.js">
    <style>
   a{
	text-decoration:none;
    }
    a:visited{
	color:gray;
    }
    a:link{
	color:gray;
    }
</style>
</head>
<body>
<div class="container-flud">
    <main>
        <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/images/COUDY_logo-04.png" alt="" width="200" height="57">
            <h2>스터디 그룹</h2>
            <p class="text-muted">누구나 만들고 신청할 수 있는 쿠디 스터디 그룹</p>
          </div>
    <c:if test="${count == 0}">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="card my-3 pt-2">
                    <div class="card-body shadow-sm text-center">
                        <p>표시할 스터디 그룹이 없습니다.</p>  
                    </div>
                </div>
            </div>
            <div class="col-2"></div>
        </div>
    </c:if>
    <c:if test="${count > 0}">
    <div class="row p-5 bg-light">
        <div class="col-2"></div>
        <div class="col-8">
            <h4><strong>총 ${count}개</strong></h4>
            <div class="row">
            <c:forEach var="studygroup" items="${list}">
                <div class="col-2">
                <div class="card ma-2 mb-3 pa-3 shadow-sm" style="width: 15rem; height: 28rem"  >
                    <img src="${pageContext.request.contextPath}/images/logo.png" class="card-img-top" style="height: 230px;" >
                    <div class="card-body">
                        <div style="height: 75px">
                        <h3 class="card-title">${studygroup.name}</h3>
                        </div>
                        <div style="height: 45px">
                        <p class="card-subtitle">${studygroup.purpose}</p>
                        </div>
                        <span class="badge bg-info">${studygroup.stack}</span>
                        <p class="card-text text-muted">참여 중인 인원 : ${studygroup.total} / ${studygroup.limit}</p>
                        <c:if test="${studygroup.total >= studygroup.limit}">
                            <button style="width: 13rem;" type="button" class="btn btn-secondary text-white justify-content-md-center" onclick="location.href='studydetail.do?study_num=${studygroup.study_num}'">모집 완료</button>
                            </c:if>
                            <c:if test="${studygroup.total < studygroup.limit}">
                               <button style="width: 13rem;" type="button" class="btn btn-text-primary text-white justify-content-md-center" onclick="location.href='studydetail.do?study_num=${studygroup.study_num}'">신청 하기</button>
                               </c:if>
                        </div>
                </div>
            </div>
            <div class="col-1"></div>
    </c:forEach>
</div>
        </div>
        <div class="col-2"></div>
        <div class="row">
         <div class="col-2"></div>
             <div class="col-8">
                <div class="row">
                    <div class="col align-center text-center">                        
                        <form action="studygrouplist.do" method="get">
                            <ul class="search nav justify-content-center mb-5 mt-2">
                                <li>
                                    <select name="keyfield" class="form-select" style="border-radius:10px 0 0 10px;">
                                        <option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
                                        <option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>기술스택</option>
                                        <option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>제목+스택</option>
                                    </select>
                                </li>
                                <li>
                                    <input class="form-control" type="search" name="keyword" id="keyword" value="${param.keyword}" style="border-radius:0 0 0 0;">
                                </li>
                                <li>
                                    <input type="submit" class="btn btn-primary" value="찾기" style="border-radius:0 10px 10px 0;">
                                </li>
                            </ul>
                        </form>
                    </div>
                </div>
               <div class="d-flex justify-content-center">
                ${page}
               </div>
            <div class="d-flex justify-content-end mb-5">
            <c:if test="${!empty user}">
            <button type="button" justify="end" class="btn btn-text-primary text-white" onclick="location.href='studygroupcreate.do'">생성하기</button>
        </c:if>
        </div>
        </div>
        <div class="col-2"></div>
    </div>
    </c:if>
    </div>
</div>
</main>
</body>
</html>



