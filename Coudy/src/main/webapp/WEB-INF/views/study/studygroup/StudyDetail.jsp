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
          href="${pageContext.request.contextPath}/css/custom-bootstrap.min.css"
  />
  <link
          rel="stylesheet"
          href="${pageContext.request.contextPath}/js/bootstrap.min.js"
  />
</head>
<body>
<div class="container">
  <main class="container">
    <div class="p-4 p-md-5 mb-4 text-white rounded bg-dark">
      <div class="py-5">
        <div class="row">
          <div class="col-6">
            <img
                    class="d-block mx-auto mb-4"
                    src="${pageContext.request.contextPath}/images/logo.png"
                    alt=""
                    width="222"
                    height="150"
            />
          </div>
          <div class="col-6">
            <h2>${studygroup.name}</h2>
            <p class="text-muted">${studygroup.purpose}</p>
          </div>
        </div>
      </div>
    </div>

    <div class="row g-5">
      <div class="col-md-8">
        <div class="col-md-6 col-lg-12 order-md-last">
          <h4
                  class="d-flex justify-content-between align-items-center mb-3"
          >
            <span class="text-primary">스터디방 상세 설명</span>
          </h4>
          <ul class="list-group mb-3">
            <li
                    class="list-group-item d-flex justify-content-between lh-sm"
            >
              <div>
                <h6 class="my-2"><strong>스터디 상세 설명</strong></h6>
              </div>
            </li>

            <li
                    class="list-group-item d-flex justify-content-between lh-sm"
            >
              <div>
                <h6 class="my-4">${studygroup.description}</h6>
              </div>
            </li>
          </ul>
        </div>

        <div class="col-md-6 col-lg-12 order-md-last">
          <ul class="list-group mb-3">
            <li
                    class="list-group-item d-flex justify-content-between lh-sm"
            >
              <div>
                <h6 class="my-2"><strong>사용 기술</strong></h6>
              </div>
            </li>

            <li
                    class="list-group-item d-flex justify-content-between lh-sm"
            >
              <div>
                <h6 class="my-4">${studygroup.stack}</h6>
              </div>
            </li>
          </ul>
        </div>

        <div class="col-md-6 col-lg-12 order-md-last">
          <ul class="list-group mb-3">
            <li
                    class="list-group-item d-flex justify-content-between lh-sm"
            >
              <div>
                <h6 class="my-2"><strong>프로젝트 목표 기간</strong></h6>
              </div>
            </li>

            <li
                    class="list-group-item d-flex justify-content-between lh-sm"
            >
              <div>
                <h6 class="my-4">
                  ${studygroup.start_date} ~ ${studygroup.end_date}
                </h6>
              </div>
            </li>
          </ul>
        </div>

        <div class="col-md-6 col-lg-12 order-md-last">
          <ul class="list-group mb-3">
            <li
                    class="list-group-item d-flex justify-content-between lh-sm"
            >
              <div>
                <h6 class="my-2"><strong>스터디 희망 지역</strong></h6>
              </div>
            </li>

            <li
                    class="list-group-item d-flex justify-content-between lh-sm"
            >
              <div>
                <h6 class="my-4">${studygroup.location}</h6>
              </div>
            </li>
          </ul>
        </div>
      </div>

      <div class="col-md-4">
        <div class="position-sticky" style="top: 2rem">
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
                마감일 : ${studygroup.limit_date}
              </p>
              <p class="card-text text-muted">
                참여 중인 인원 : 1 / ${studygroup.limit}
              </p>
              <c:if
                      test="${!empty user && studygroup.mem_num == user.mem_num}"
              >
                <button
                        style="width: 13rem"
                        class="btn btn-info"
                        onclick="location.href='updatestudygroup.do?study_num=${studygroup.study_num}'"
                >
                  수정하기
                </button>
                <button
                        style="width: 13rem"
                        class="btn btn-danger mt-1"
                        onclick="location.href='deletestudygroup.do?study_num=${studygroup.study_num}'"
                >
                  삭제하기
                </button>
              </c:if>
              <c:if
                      test="${!empty user && studygroup.mem_num != user.mem_num && empty studyuser.registered}"
              >
                <button
                        style="width: 13rem"
                        class="btn btn-info mt-1"
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
                        onclick="location.href='applicationlist.do?study_num=${studygroup.study_num}'"
                >
                  신청자 목록
                </button>
              </c:if>
              <c:if
                      test="${!empty user && studyuser.registered eq 'N'.charAt(0)}"
              >
                <button
                        style="width: 13rem"
                        class="btn btn-info mt-1 justify-content-md-center"
                        onclick="location.href='mystudylist.do'"
                >
                  신청 확인
                </button>
              </c:if>
              <c:if
                      test="${!empty user && studyuser.registered eq 'Y'.charAt(0)}"
              >
                <button
                        style="width: 13rem"
                        class="btn btn-text-primary text-white mt-1 justify-content-md-center"
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
  </main>
</div>
</div>
</div>
</body>
</html>