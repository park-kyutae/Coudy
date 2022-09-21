<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- ✅ load jquery UI ✅ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.ko.min.js" type="text/javascript"></script>
    <title>Title</title>
</head>
<body>

<script>
    $(function () {
        let date = new Date();
        const today_year = date.getFullYear();
        const today_month = date.getMonth() + 1;
        let real_month
        const today = today_year + "-" + today_month + "-" + date.getDate();
        let year
        let month
        let selected_plan = 'team';
        let plans
        let init_plan_color = $('.init_color').attr('name')

        jQuery.fn.serializeObject = function() {
            var obj = null;
            try {
                if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
                    var arr = this.serializeArray();
                    if(arr){ obj = {};
                        jQuery.each(arr, function() {
                            if (this.value == 'on') {
                                obj[this.name] = 'true';
                            }else if (this.value == 'off'){
                                obj[this.name] = 'false';
                            }else {
                                obj[this.name] = this.value;
                            }
                            });

                    }
                }
            }catch(e) {
                alert(e.message);
            }finally {}
            return obj;
        }
        function reset_validation() {
            $('.invalid-feedback').text('')
            $('.global_validation').text('')
            $('#update_modal input').removeClass('is-invalid')
            $('.invalid-feedback').text('')
            $('.global_validation').text('')
            $('#create_modal input').removeClass('is-invalid')
        }
        function hide_create_modal() {
            $('#create_modal_container').css(
                {
                    'display': 'none',
                }
            )
            $('#create_modal').css(
                {
                    'display': 'none',
                }
            )
        }

        function hide_update_modal() {
            $('#update_modal_container').css(
                {
                    'display': 'none',
                }
            )
            $('#update_modal').css(
                {
                    'display': 'none',
                }
            )
        }

        const render_calender = function () {
            year = date.getFullYear();
            month = date.getMonth();
            real_month = month + 1

            function remove_cal_child() {
                $('.calender div ').children().remove();
                $("#year").children().remove();
                $("#month").children().remove();

            }

            function render_year_month() {
                $('#year').append('<span>' + year + '</span>')
                $('#month').append('<span>' + real_month + '</span>')
            }

            function getDates() {
                for (let i = 1; i <= current_last_num; i++) {
                    current_month_dates.push(i);
                }

                for (let i = pre_last_num - current_first_day; i < pre_last_num; i++) {
                    pre_month_dates.push(i + 1);
                }

                for (let i = 1; i < 14 - current_last_day; i++) {
                    next_month_dates.push(i);
                }
            }

            function render_dates() {
                let current_month_div_1 = "<div class='current_month border day col' style='cursor: pointer;width:14%;'  id='";
                let div_1 = "<div class='border day col' style='cursor: pointer; width:14%;' id='";
                let current_month_div_2 = "'><div class='row '><div class='col '>";
                let div_2 = "'> <div class='row '><div class='col text-secondary'>";
                let div_3 = "</div></div></div>";

                for (let pre_month_date of pre_month_dates) {
                    if (index % 7 == 1) week++;

                    let id = year + "-" + month + "-" + pre_month_date;

                    $("#week" + week).append(
                        div_1 +
                        id +
                        div_2 +
                        pre_month_date +
                        div_3);
                    index++;
                }
                for (let current_month_date of current_month_dates) {
                    if (index % 7 == 1) week++;

                    let id = year + "-" + real_month + "-" + current_month_date;

                    $("#week" + week).append(
                        current_month_div_1 +
                        id +
                        current_month_div_2 +
                        current_month_date +
                        div_3);

                    index++;
                }

                for (let next_month_date of next_month_dates) {
                    if (index % 7 == 1) week++;

                    let id = year + "-" + (real_month + 1) + "-" + next_month_date;
                    $("#week" + week).append(
                        div_1 +
                        id +
                        div_2 +
                        next_month_date +
                        div_3);
                    index++;
                }
            }

            let current_last_date = new Date(year, real_month, 0);
            let current_last_num = current_last_date.getDate()
            let current_month_dates = [];
            let pre_last_date = new Date(year, month, 0);
            let current_first_date = new Date(year, month, 1);
            let current_first_day = current_first_date.getDay();
            let pre_month_dates = [];
            let pre_last_num = pre_last_date.getDate();
            let current_last_day = current_last_date.getDay();
            let next_month_dates = [];
            let index = 1;
            let week = 0;

            remove_cal_child();
            render_year_month();
            getDates();
            render_dates();
            $('#' + today).addClass('border bg-info bg-opacity-25')
            $('.calender').children().addClass('fs-5')
            $('.current_month:first-child').addClass('text-danger')

            $('.day').click(function (param) {
                let x = param.clientX;
                let y = param.clientY;
                let date_id = this.getAttribute('id');

                function init_plan_val() {
                    $('#create_plan_start_date').val(date_id)
                    $('#create_plan_end_date').val('')
                    $('#create_plan_content').val('')
                    $('#create_plan_is_shared').prop('checked', false)
                    $('#create_plan_color').val(init_plan_color)
                    $('.create_plan_color_pick').removeClass('border border-2 border-dark')
                    $('.create_plan_color_pick').filter(function () {
                        if ($(this).attr('name') == init_plan_color) {
                            return true
                        }
                        return false
                    }).addClass('border border-2 border-dark')
                }

                function modal() {
                    reset_validation();
                    $('#create_modal_container').css(
                        {
                            'display': 'block',
                        }
                    )
                    let rel_height = $(window).height()-y;
                    if (rel_height < 550) {
                        $('#create_modal').css(
                            {
                                'display': 'block',
                                'top': y-(550-rel_height),
                                'left': x
                            }
                        );
                    } else {
                        $('#create_modal').css(
                            {
                                'display': 'block',
                                'top': y,
                                'left': x
                            }
                        );
                    }

                    $('#create_modal_container').click(function () {


                        hide_create_modal();
                    })
                    $('#create_modal').click(function () {
                        event.stopPropagation();
                    });
                }

                modal();

                init_plan_val();


            })


        };
        const find_plans = function () {
            $.ajax({
                url: $(location).attr('pathname')+"/find",
                type: 'get',
                data: 'thisYearMonth='+year + "-" + real_month + "-01",
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    plans = param
                    render_plans()
                },
                error: function () {
                    alert('error');
                }
            });
        }
        const render_plans = function () {
            $('.plan').remove();
            $('.empty').remove();

            function render_plan() {


                let is_first = true;


                plans.sort(function (x, y) {
                    let x_start = new Date(x.planStartDate)
                    let x_end = new Date(x.planEndDate)
                    let y_start = new Date(y.planStartDate)
                    let y_end = new Date(y.planEndDate)

                    return (y_end - y_start) - (x_end - x_start)
                })
                for (let plan of plans) {
                    const plan_height = '25px';

                    const div_1 = "<div class='row plan' id='";
                    let div_2 = "'><div class='text-truncate text-black  fs-6 fst-italic' style='cursor: pointer; height:" + plan_height + ";background-color:#";
                    let div_3 = "'>";
                    const div_4 = "</div></div>"
                    let empty_div = '<div class="row empty" ><div class="col" style="height:' + plan_height + '"></div></div>';


                    let start_year_month_date = new Date(plan.planStartDate);
                    let end_year_month_date = new Date(plan.planEndDate);
                    let result = $('.day').filter(function () {
                        let filtered_date = new Date(this.getAttribute('id'));
                        filtered_date.setHours(9, 0, 0)
                        let is_plan_in_month = filtered_date >= start_year_month_date
                            && filtered_date <= end_year_month_date
                        let is_plan_match_mem = plan.memNum == selected_plan || (plan.planIsShared == true && selected_plan == 'team');
                        return is_plan_in_month && is_plan_match_mem;

                    });

                    is_first = true;


                    let order = 2;
                    //find empty
                    for (let i = 0; i < 20; i++) {
                        for (let x of result) {
                            if ($(x).children().length >= order && !$(x).children().eq(order - 1).hasClass('empty')) {
                                order++;
                                break;
                            }
                        }
                    }

                    for (let x of result) {
                        let temp = (order - $(x).children().length) - 1
                        let result_div = '';

                        for (let i = 0; i < temp; i++) {
                            $(x).append(empty_div);
                        }
                        let ordered_div = $(x).children().eq(order - 1);
                        if (is_first) {
                            if (plan.planIsCompleted) result_div = div_1 + plan.planNum + div_2 + plan.planColor + div_3 +'&#10003; '+ plan.planContent + div_4;
                            else result_div = div_1 + plan.planNum + div_2 + plan.planColor + div_3 + plan.planContent + div_4;
                            is_first = !is_first;
                        } else result_div =div_1 + plan.planNum + div_2 + plan.planColor + div_3 + div_4;

                        if (ordered_div.hasClass('empty')) {
                             ordered_div.replaceWith(result_div);

                        } else {
                            $(x).append(result_div);

                        }


                    }
                }
            }


            render_plan();


            $('.plan').click(function (param) {
                reset_validation()
                event.stopPropagation();
                let x = param.clientX;
                let y = param.clientY;
                $('#update_modal_container').css(
                    {
                        'display': 'block',
                    }
                )
                let rel_height = $(window).height()-y;
                if (rel_height < 550) {
                    $('#update_modal').css(
                        {
                            'display': 'block',
                            'top': y-(550-rel_height),
                            'left': x
                        }
                    );
                } else {
                    $('#update_modal').css(
                        {
                            'display': 'block',
                            'top': y,
                            'left': x
                        }
                    );
                }

                let plan;
                let clicked_plan = $(this).attr('id');
                for (let x of plans) {
                    if (x.planNum == clicked_plan) {
                        plan = x;
                    }
                }
                $('#update_plan_num').val(plan.planNum)
                $('#update_plan_start_date').val(plan.planStartDate)
                $('#update_plan_end_date').val(plan.planEndDate)
                $('#update_plan_content').val(plan.planContent)
                $('.update_plan_color_pick').removeClass('border border-2 border-dark')
                $('.update_plan_color_pick').filter(function () {
                    if ($(this).attr('name') == plan.planColor) {
                        return true
                    }
                    return false
                }).addClass('border border-2 border-dark')
                $('#update_plan_color').val(plan.planColor);
                if (plan.planIsShared == true) {
                    $('#update_plan_is_shared').prop('checked', true);
                } else {
                    $('#update_plan_is_shared').prop('checked', false)

                }
                if (plan.planIsCompleted == true) {
                    $('#update_plan_is_completed').prop('checked', true);
                } else {
                    $('#update_plan_is_completed').prop('checked', false)

                }


            });
            $('#update_modal_container').click(function () {
                hide_update_modal();
            })

            $('#update_modal').click(function () {
                event.stopPropagation();
            });
        }


        render_calender();
        find_plans();


        $('#calender_back').click(function () {
            date.setMonth(date.getMonth() - 1)
            render_calender();

            find_plans();

        })
        $('#calender_forward').click(function () {
            date.setMonth(date.getMonth() + 1)
            render_calender();
            find_plans();


        })
        $('#calender_today').click(function () {
            date = new Date();
            render_calender();
            find_plans();


        })

        $('.create_plan_color_pick').click(function () {
            let color_code = this.getAttribute('name');
            $('#create_plan_color').val(color_code);
            $('.create_plan_color_pick').removeClass('border border-2 border-dark')
            $(this).addClass('border border-2 border-dark')
        })
        $('.update_plan_color_pick').click(function () {
            let color_code = this.getAttribute('name');
            $('#update_plan_color').val(color_code);
            $('.update_plan_color_pick').removeClass('border border-2 border-dark')
            $(this).addClass('border border-2 border-dark')
        })


        $('#create_submit').click(function () {

                reset_validation();
            $.ajax({
                url: $(location).attr('pathname'),
                type: 'post',
                data: JSON.stringify($('#create_plan_form').serializeObject()),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    if ( param instanceof Array) {
                        for (let x of param) {
                            if (x.field == 'globalError') {
                                $('.global_validation').text(x.message)
                            }else {
                                let selector = $('form[name=' + x.objectName + '] input[name=' + x.field + ']');
                                selector.addClass('is-invalid')
                                selector.next().text(x.message)
                            }
                        }
                    } else {
                        find_plans();
                        hide_create_modal();
                    }


                },
                error: function (param) {
                    alert("error");
                }
            });
        });
        $('#update_submit').click(function () {
            reset_validation();
            $.ajax({
                url: $(location).attr('pathname'),
                type: 'patch',
                data: JSON.stringify($('#update_plan_form').serializeObject()),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    console.log(param)
                    if ( param instanceof Array) {
                        for (let x of param) {
                            if (x.field == 'globalError') {
                                $('.global_validation').text(x.message)
                            }else {
                                let selector = $('form[name=' + x.objectName + '] input[name=' + x.field + ']');
                                selector.addClass('is-invalid')
                                selector.next().text(x.message)
                            }
                        }
                    } else {
                        find_plans();
                        hide_update_modal();
                    }

                },
                error: function () {
                    alert('error');
                }
            });
        });
        $('#delete_submit').click(function () {

            $.ajax({
                url: $(location).attr('pathname'),
                type: 'delete',
                data: JSON.stringify({
                    "planNum":$('#update_plan_num').val()
                }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function () {
                    find_plans();
                    hide_update_modal()


                },
                error: function () {
                    alert('error');
                }
            });
        });
        $('.select_plan').click(function () {
            $('.select_plan').removeClass('fw-bolder')
            $(this).addClass('fw-bolder')

            selected_plan = $(this).attr('id');
            render_plans()
        });

        $('.datePicker').datepicker({
            format: "yyyy-mm-dd",
            startDate: '-1y',
            endDate: '+1y',
            autoclose: true,
            calendarWeeks: false,
            clearBtn: false,
            disableTouchKeyboard: false,
            immediateUpdates: false,
            multidate: false,
            templates: {
                leftArrow: '&laquo;',
                rightArrow: '&raquo;'
            },
            showWeekDays: true,

            todayHighlight: true,
            toggleActive: true,
            weekStart: 0,
            language: "ko"

        });//datepicker end
    })


</script>
<div class="container">
    <div class="row">

        <div class="col-12">
            <div class="row mb-2">
                <div class="col-2"></div>
                <div class="col-1"></div>
                <div class="col"></div>
                <div class="col-1 d-flex align-items-center justify-content-end"><img src="/images/arrow_backward.svg"
                                                                                      class="h-75"
                                                                                      style="cursor: pointer"
                                                                                      id="calender_back"
                                                                                      alt="calender_back"></div>
                <div class="col-2 fs-2 text-center" id="year"></div>
                <div class="col-1 fs-2 text-center" id="month"></div>
                <div class="col-1 d-flex align-items-center"><img src="/images/arrow_forward.svg" class="h-75 "
                                                                  style="cursor: pointer"
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
                            <span class="select_plan fw-bolder" style="cursor: pointer" id="team">#팀 일정</span>
                        </div>
                    </div>
                    <c:forEach items="${studyUserForms}" var="studyUser">
                        <div class="row mb-1">
                            <div class="col">
                                <span class="select_plan" style="cursor: pointer"
                                      id="${studyUser.memNum}">#${studyUser.studyUserName}</span>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="col  border border-1">
                    <div class="calender">
                        <div class="row" id="week1" style="min-height: 80px"></div>
                        <div class="row" id="week2" style="min-height: 80px"></div>
                        <div class="row" id="week3" style="min-height: 80px"></div>
                        <div class="row" id="week4" style="min-height: 80px"></div>
                        <div class="row" id="week5" style="min-height: 80px"></div>
                        <div class="row" id="week6" style="min-height: 80px"></div>
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
                            <div class="create_plan_color_pick rounded-5 border border-2 border-dark init_color"
                                 style="background-color: #AFC4E7;height: 20px; cursor: pointer;"
                                 name="AFC4E7"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5"
                                 style="background-color: #EEAFAF;height: 20px; cursor: pointer;"
                                 name="EEAFAF"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5"
                                 style="background-color: #BAE7AF;height: 20px; cursor: pointer;"
                                 name="BAE7AF"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5"
                                 style="background-color: #FCFFB0;height: 20px; cursor: pointer;"
                                 name="FCFFB0"></div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5"
                                 style="background-color: #FDC4F8;height: 20px; cursor: pointer;"
                                 name="FDC4F8"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5"
                                 style="background-color: #F3CDA0;height: 20px; cursor: pointer;"
                                 name="F3CDA0"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5"
                                 style="background-color: #83A7A3;height: 20px; cursor: pointer;"
                                 name="83A7A3"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5"
                                 style="background-color: #CB9FFD;height: 20px; cursor: pointer;"
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
                    <input type="checkbox" class="form-check-input" name="planIsShared" id="create_plan_is_shared">
                    <label for="create_plan_is_shared" class="form-check-label">팀에게 공유하기</label>
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
                            <div class="update_plan_color_pick rounded-5 border border-2 border-dark init_color"
                                 style="background-color: #AFC4E7;height: 20px; cursor: pointer;"
                                 name="AFC4E7"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5"
                                 style="background-color: #EEAFAF;height: 20px; cursor: pointer;"
                                 name="EEAFAF"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5"
                                 style="background-color: #BAE7AF;height: 20px; cursor: pointer;"
                                 name="BAE7AF"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5"
                                 style="background-color: #FCFFB0;height: 20px; cursor: pointer;"
                                 name="FCFFB0"></div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5"
                                 style="background-color: #FDC4F8;height: 20px; cursor: pointer;"
                                 name="FDC4F8"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5"
                                 style="background-color: #F3CDA0;height: 20px; cursor: pointer;"
                                 name="F3CDA0"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5"
                                 style="background-color: #83A7A3;height: 20px; cursor: pointer;"
                                 name="83A7A3"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5"
                                 style="background-color: #CB9FFD;height: 20px; cursor: pointer;"
                                 name="CB9FFD"></div>
                        </div>
                        <input type="hidden" id="update_plan_color" name="planColor" value="" required>
                        <div class="invalid-feedback"></div>
                    </div>


                </div>
                <div class="col"></div>

            </div>
            <div class="row">

                <div class="col form-check ms-3">
                    <input type="checkbox" class="form-check-input" name="planIsShared" id="update_plan_is_shared">
                    <label for="update_plan_is_shared" class="form-check-label">팀에게 공유하기</label>
                </div>
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

<button onclick="window.open('/chat','test','width=500,height=700');return false;">임시 채팅 버튼</button>

</body>
</html>
