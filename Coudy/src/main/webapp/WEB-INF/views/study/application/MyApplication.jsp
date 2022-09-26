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
        <main>
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">        
                        <div class="my-3 p-4 p-md-5 mb-4 text-white rounded bg-dark g-4">
                          <div class="row">
                        <div class="col-12 text-center">
                          <h2>${user.name}의 스터디 그룹</h2>
                        </div>
                          </div>

                      </div>
                    </div> 
              </div>
        <c:if test="${!empty list}">
        <div class="row p-5 bg-light">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="row">
                    <h2>나의 스터디 목록</h2>
                    <c:if test="${empty list}"> 등록된 신청서가 없습니다.</c:if>
                    <c:if test="${!empty list}">
                    <c:forEach var="mystudylist" items="${list}">
                    <div class="row row-cols-2 row-cols-md-1 g-2">
                        <div class="col-2"></div>
                            <div class="col-8">
                                <div class="card">
                                    <div class="card-body shadow-sm">
                                        <div class="row">
                                            <div class="col-2">
                                                <img src="${pageContext.request.contextPath}/images/logo.png" class="card-img-top" style="width : 100px; height: 100px;" >
                                            </div>
                                            <div class="col-10">
                                                <div class="row">
                                                    <div class="col-9">
                                                        <h4 class="card-title"> ${mystudylist.name}</h4>
                                                        <p class="card-subtitle"> 경력 : ${mystudylist.career}, 요구사항 : ${mystudylist.request}, 가능한 시간 : ${mystudylist.meet_time} </p>
                                                        <c:if test="${!empty user && mystudylist.registered eq 'Y'.charAt(0)}"><strong>승인</strong></c:if>
                                                        <c:if test="${!empty user && mystudylist.registered eq 'N'.charAt(0)}"><strong>미승인</strong></c:if>
                                                    </div>
                                                    <div class="col-3">
                                                        <c:if
                                                                test="${!empty user && mystudylist.registered eq 'N'.charAt(0)}"
                                                        >
                                                            <div class="row g-3 justify-content-end">
                                                                <input type="submit" class="btn btn-primary rounded bg-secondary text-white" style="width: 120px; height: 100px;" value="승인 대기">
                                                            </div>
                                                        </c:if>
                                                        <c:if
                                                                test="${!empty user && mystudylist.registered eq 'Y'.charAt(0)}"
                                                        >
                                                            <div class="row g-3 justify-content-end">
                                                                <input type="submit" class="btn btn-primary rounded" style="width: 120px; height: 100px;" onclick="location.href='studymain.do?study_num=${mystudylist.study_num}'" value="입장 하기">
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2"></div>
                        </div>
                    </c:forEach>
                </c:if>
                </div>
            </div>
        </c:if>
        </div>
    </div>
    </main>
</body>
</html>



