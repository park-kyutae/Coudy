<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plan.js"></script>
<link href="${pageContext.request.contextPath}/css/plan.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/progress.css" rel="stylesheet">
<div class="container" id="cal-container" data-mem_num="${studyUser.mem_num}">
    <div class="row study-nav-row">
        <div class="col">
            <span class="study-nav-text">일정</span>
        </div>
    </div>


    <div class="row study-content bg-text-primary bg-opacity-25 rounded pt-3">
        <div class="col ">
            <div class="timeline-steps aos-init aos-animate" id="progress_div" data-aos="fade-up">

            </div>
        </div>
    </div>


    <div class="row study-content ps-5 pe-5">

        <div class="col-12">
            <div class="row mb-2">
                <div class="col-2"></div>
                <div class="col-1"></div>
                <div class="col"></div>
                <div class="col-1 d-flex align-items-center justify-content-end pointer"><img src="/images/arrow_backward.svg"
                                                                                              class="h-75"
                                                                                              id="calender_back"
                                                                                              alt="calender_back"></div>
                <div class="col-2 fs-2 text-center" id="year"></div>
                <div class="col-1 fs-2 text-center" id="month"></div>
                <div class="col-1 d-flex align-items-center pointer"><img src="/images/arrow_forward.svg" class="h-75 "
                                                                          id="calender_forward" alt="calender_forward"></div>
                <div class="col"></div>
                <div class="col-1 d-flex justify-content-end align-items-end">
                    <button class="btn btn-outline-primary h-75" id="calender_today">오늘</button>
                </div>
            </div>
            <div class="row">
                <div class="col-2 text-center">
                    <span class="fs-5"></span>
                </div>
                <div class="col text-center">
                    <span class="fs-5">일</span>
                </div>
                <div class="col text-center">
                    <span class="fs-5">월</span>
                </div>
                <div class="col text-center">
                    <span class="fs-5">화</span>

                </div>
                <div class="col text-center">
                    <span class="fs-5">수</span>

                </div>
                <div class="col text-center">
                    <span class="fs-5">목</span>

                </div>
                <div class="col text-center">
                    <span class="fs-5">금</span>

                </div>
                <div class="col text-center">
                    <span class="fs-5">토</span>
                </div>
            </div>
            <div class="row">
                <div class="col-2">
                    <div class="row mb-1">
                        <div class="col">
                            <span class="select_plan fw-bolder pointer" id="team">#팀 일정</span>
                        </div>
                    </div>
                    <c:forEach items="${studyUserForms}" var="studyUser">
                        <div class="row mb-1">
                            <div class="col">
                                <span class="select_plan pointer "
                                      id="${studyUser.memNum}">#${studyUser.studyUserName}</span>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="col  border border-1">
                    <div class="calender">
                        <div class="row calender-week" id="week1"></div>
                        <div class="row calender-week" id="week2"></div>
                        <div class="row calender-week" id="week3"></div>
                        <div class="row calender-week" id="week4"></div>
                        <div class="row calender-week" id="week5"></div>
                        <div class="row calender-week" id="week6"></div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>
<div id="create_modal_container" style="display: none;position: fixed;top: 0;left: 0;right: 0;bottom: 0">
    <div id="create_modal" class="bg-light container shadow-lg rounded-1 border" title="추가"
         style="display: none;position: absolute; width: 300px">

        <form id="create_plan_form" class="mb-5" name="createPlanForm">
            <div class="row mt-2 mb-2">
                <div class="col text-center"><span class="fs-5">일정 추가하기</span></div>
            </div>
            <div class="row">
                <div class="col text-danger global_validation">
                </div>
            </div>
            <div class="row mb-2">
                <div class="col">
                    <label for="create_plan_start_date">시작일</label>
                    <input type="text" id="create_plan_start_date" class="form-control datepicker" name="planStartDate"
                           value="" required>
                    <div class="invalid-feedback"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col">
                    <label for="create_plan_end_date">마감일</label>
                    <input type="text" id="create_plan_end_date" class="form-control datepicker" name="planEndDate"
                           value="" required>
                    <div class="invalid-feedback"></div>

                </div>
            </div>
            <div class="row mb-2">
                <div class="col">
                    <label for="create_plan_content" class="form-label m-0">목표</label>
                    <input type="text" class="form-control" id="create_plan_content" name="planContent" required>
                    <div class="invalid-feedback"></div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="create_plan_color" class="form-label m-0">색상</label>

                </div>
            </div>
            <div class="row mb-2">
                <div class="col"></div>
                <div class="col-10">
                    <div class="row">
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5 border border-2 pointer color_pick border-dark init_color"
                                 style="background-color: #AFC4E7;"
                                 name="AFC4E7"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #EEAFAF;"
                                 name="EEAFAF"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #BAE7AF;"
                                 name="BAE7AF"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #FCFFB0;"
                                 name="FCFFB0"></div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #FDC4F8;"
                                 name="FDC4F8"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #F3CDA0;"
                                 name="F3CDA0"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #83A7A3;"
                                 name="83A7A3"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #CB9FFD;"
                                 name="CB9FFD"></div>
                        </div>
                        <input type="hidden" id="create_plan_color" name="planColor" value="" required>
                        <div class="invalid-feedback"></div>
                    </div>


                </div>
                <div class="col"></div>

            </div>
            <div class="row">

                <div class="col form-check ms-3">
                    <c:if test="${studyUser.is_group_manager eq 'Y'.charAt(0)}">
                        <input type="checkbox" class="form-check-input" name="planIsShared" id="create_plan_is_shared">
                        <label for="create_plan_is_shared" class="form-check-label">팀에게 공유하기</label>
                    </c:if>
                </div>
            </div>

        </form>
        <div class="row mb-2">
            <div class="col d-flex justify-content-end">
                <button id="create_submit" class="btn btn-primary">추가하기</button>

            </div>

        </div>

    </div>
</div>
<div id="update_modal_container" style="display: none;position: fixed;top: 0;left: 0;right: 0;bottom: 0">
    <div id="update_modal" class="bg-light container shadow-lg rounded-1 border" title="추가"
         style="display: none;position: absolute; width: 300px">

        <form id="update_plan_form" class="mb-5" name="updatePlanForm">
            <input type="hidden" id="update_plan_num" name="planNum" value="">

            <div class="row mt-2 mb-2">
                <div class="col text-center"><span class="fs-5">일정 수정하기</span></div>
            </div>
            <div class="row">
                <div class="col text-danger global_validation">
                </div>
            </div>
            <div class="row mb-2">
                <div class="col">
                    <label for="update_plan_start_date">시작일</label>
                    <input type="text" id="update_plan_start_date" class="form-control datepicker" name="planStartDate"
                           value="" required>
                    <div class="invalid-feedback"></div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col">
                    <label for="update_plan_end_date">마감일</label>
                    <input type="text" id="update_plan_end_date" class="form-control datepicker" name="planEndDate"
                           value="" required>
                    <div class="invalid-feedback"></div>

                </div>
            </div>
            <div class="row mb-2">
                <div class="col">
                    <label for="update_plan_content" class="form-label m-0">목표</label>
                    <input type="text" class="form-control" id="update_plan_content" name="planContent" required>
                    <div class="invalid-feedback"></div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="update_plan_color" class="form-label m-0">색상</label>

                </div>
            </div>
            <div class="row mb-2">
                <div class="col"></div>
                <div class="col-10">
                    <div class="row">
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5 pointer color_pick border border-2 border-dark init_color"
                                 style="background-color: #AFC4E7;"
                                 name="AFC4E7"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #EEAFAF;"
                                 name="EEAFAF"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #BAE7AF;"
                                 name="BAE7AF"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #FCFFB0;"
                                 name="FCFFB0"></div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #FDC4F8;"
                                 name="FDC4F8"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #F3CDA0;"
                                 name="F3CDA0"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #83A7A3;"
                                 name="83A7A3"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5 pointer color_pick"
                                 style="background-color: #CB9FFD;"
                                 name="CB9FFD"></div>
                        </div>
                        <input type="hidden" id="update_plan_color" name="planColor" value="" required>
                        <div class="invalid-feedback"></div>
                    </div>


                </div>
                <div class="col"></div>

            </div>
            <div class="row">

                <c:if test="${studyUser.is_group_manager eq 'Y'.charAt(0)}">
                <div class="col form-check ms-3">
                    <input type="checkbox" class="form-check-input" name="planIsShared" id="update_plan_is_shared">
                    <label for="update_plan_is_shared" class="form-check-label">팀에게 공유하기</label>
                </div>
                </c:if>
            </div>
            <div class="row">
                <div class="col form-check ms-3">
                    <input type="checkbox" class="form-check-input" name="planIsCompleted"
                           id="update_plan_is_completed">
                    <label for="update_plan_is_completed" class="form-check-label">완료</label>
                </div>
            </div>

        </form>
        <div class="row mb-2">
            <div class="col d-flex justify-content-end">
                <button id="delete_submit" class="btn btn-secondary me-1">삭제하기</button>
                <button id="update_submit" class="btn btn-primary ">수정하기</button>

            </div>

        </div>

    </div>
</div>

