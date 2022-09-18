<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/js/bootstrap.min.js"
    />
  </head>
  <body>
    <div class="container bg-secondary bg-gradient">
      <div class="row bg-info bg-gradient">
        <div class="col-3" style="height: 15rem">
          <img
            src="${pageContext.request.contextPath}/images/logo.png"
            style="width: 13rem; height: 14rem"
            class="img-thumbnail mt-2 rounded float-start"
            alt="..."
          />
        </div>
        <div class="col-9 mt-3">
          <h1>${studygroup.name}</h1>
          <p class="text-">${studygroup.purpose}</p>
        </div>
      </div>
      <div class="row">
        <div class="col-9">
          <div class="card m-2 mt-3 p-3">
            <div class="row">
              <div class="col-9 mb-5">
                <h1>스터디 상세 설명</h1>
                <h5>${studygroup.description}</h5>
              </div>

              <div class="col-9 mb-5">
                <h2>사용 기술</h2>
                <h5>${studygroup.stack}</h5>
              </div>

              <div class="col-9 mb-5">
                <h2>프로젝트 목표 기간</h2>
                <h5>${studygroup.start_date} ~ ${studygroup.end_date}</h5>
              </div>
              <div class="col-9 mb-5">
                <h2>스터디 희망 지역</h2>
                <h5>${studygroup.location}</h5>
              </div>
            </div>
          </div>
        </div>
        <div class="col-3">
          <div class="card ma-2 mt-3 pa-3" style="width: 15rem">
            <div class="card-body">
              <div style="height: 75px">
                <h3 class="card-title">${studygroup.name}</h3>
              </div>
              <div style="height: 40px">
                <p class="card-subtitle">${studygroup.purpose}</p>
              </div>
              <span class="badge bg-info">${studygroup.stack}</span>
              <p class="card-text text-muted">
                참여 중인 인원 : 1 / ${studygroup.limit}
              </p>
              <c:if test="${!empty user && studygroup.mem_num == user.mem_num}">
                <button
                  style="width: 13rem"
                  class="btn btn-info"
                  onclick="location.href='updatestudygroup.do?study_num=${studygroup.study_num}'"
                >
                  수정하기
                </button>
                <button
                  style="width: 13rem"
                  class="btn btn-danger"
                  onclick="location.href='deletestudygroup.do?study_num=${studygroup.study_num}'"
                >
                  삭제하기
                </button>
              </c:if>
              <c:if test="${!empty user && studygroup.mem_num != user.mem_num}">
                <button
                  style="width: 13rem"
                  class="btn btn-info"
                  onclick="location.href='applicationcreate.do?study_num=${studygroup.study_num}'"
                >
                  신청하기
                </button>
              </c:if>
              <c:if
                test="${!empty user && studyuser.registered eq 'Y'.charAt(0) && studyuser.is_group_manager eq 'Y'.charAt(0)}"
              >
                <button
                  style="width: 13rem"
                  class="btn btn-info mt-1 justify-content-md-center"
                  onclick="location.href='applicationcreate.do?study_num=${studygroup.study_num}'"
                >
                  신청자 목록
                </button>
              </c:if>
                <c:if
                        test="${!empty user && studyuser.registered eq 'Y'.charAt(0)}"
                >
                    <button
                            style="width: 13rem"
                            class="btn btn-info mt-1 justify-content-md-center"
                            onclick="location.href='studymain.do?study_num=${studygroup.study_num}'"
                    >
                        입장 하기
                    </button>
                </c:if>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
