<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom-bootstrap.css">
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
                          <h2>${studygroup.name} 그룹 유저 관리</h2>
                        </div>
                          </div>

                      </div>
                    </div> 
              </div>
        <div class="row p-5 bg-light">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="row">
                    <h2>스터디 신청 목록</h2>
                    <h5><strong>지원 현황</strong> ${total}/${studygroup.limit}</h5>
                    <c:if test="${empty list}">
                        <div class="card my-3 pt-2">
                            <div class="card-body shadow-sm text-center">
                                <p>등록된 신청서가 없습니다.</p>  
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${!empty list}">
                    <c:forEach var="applicationlist" items="${list}">
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
                                                        <h4 class="card-title"> ${applicationlist.name}</h4>
                                                        <p class="card-subtitle"> 경력 : ${applicationlist.career}, 요구사항 : ${applicationlist.request}, 가능한 시간 : ${applicationlist.meet_time} </p>
                                                        <c:if test="${!empty user && applicationlist.registered eq 'Y'.charAt(0)}"><strong>승인</strong></c:if>
                                                        <c:if test="${!empty user && applicationlist.registered eq 'N'.charAt(0)}"><strong>미승인</strong></c:if>
                                                    </div>
                                                    <div class="col-3">
                                                        <c:if
                                                                test="${!empty user && applicationlist.registered eq 'N'.charAt(0)}"
                                                        >
                                                            <div>
                                                                <form class="row g-3 justify-content-end" method="post" action="updatestudyauth.do">
                                                                    <input type="hidden" id="study_user_num_accept" name="study_user_num" value="${applicationlist.study_user_num}">
                                                                    <input type="hidden" id="study_num_reject" name="study_num" value="${applicationlist.study_num}">
                                                                    <input type="submit" class="btn btn-primary rounded" style="width: 120px; height: 100px;" value="승인 하기">
                                                                </form>
                                                            </div>
                                                        </c:if>
                                                        <c:if
                                                                test="${!empty user && applicationlist.registered eq 'Y'.charAt(0)}"
                                                        >
                                                            <div>
                                                                <form class="row g-3 justify-content-end" method="post" action="updaterejectauth.do">
                                                                    <input type="hidden" id="study_user_num_reject" name="study_user_num" value="${applicationlist.study_user_num}">
                                                                    <input type="hidden" id="study_num_reject" name="study_num" value="${applicationlist.study_num}">
                                                                    <input type="submit" class="btn btn-danger rounded" style="width: 120px; height: 100px;" value="승인 취소">
                                                                </form>
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
                <input type="button" class="btn btn-primary btn-text-primary" onclick="location.href='studydetail.do?study_num=${studygroup.study_num}'" value="뒤로가기"></input>
                </div>
            </div>
        </div>
    </div>
    </main>
</body>
</html>



