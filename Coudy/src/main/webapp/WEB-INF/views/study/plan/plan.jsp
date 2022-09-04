<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
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
                let current_month_div_1 = "<div class='current_month border day col'  id='";
                let div_1 = "<div class='border day col' id='";
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

            $('#' + today).addClass('border bg-warning bg-opacity-25')
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
                    $('.create_plan_color_pick').removeClass('border border-dark')
                    $('.create_plan_color_pick').filter(function () {
                        if ($(this).attr('name') == init_plan_color) {
                            return true
                        }
                        return false
                    }).addClass('border border-dark')
                }

                function modal() {
                    $('#create_modal_container').css(
                        {
                            'display': 'block',
                        }
                    )
                    $('#create_modal').css(
                        {
                            'display': 'block',
                            'top': y,
                            'left': x
                        }
                    )
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
                url: '/study/plan/findPlans',
                type: 'get',
                data: {
                    "thisYearMonth": year + "-" + real_month + "-01"
                },
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    plans = param
                    render_plans()
                },
                error: function () {
                    alert('네트워크 오류 발생');
                }
            });
        }
        const render_plans = function () {
            $('.plan').remove();
            $('.empty').remove();

            function render_plan() {
                let div_1 = "<div class='row plan' " ;

                let div_2 = "<div class='col ratio bg-opacity-25 text-truncate' "+" style='--bs-aspect-ratio: 50%; height:20px;background-color:#";
                let div_3 = "'><span>"
                let div_4 = "</span><span>"
                let div_5 = "</span></div></div>";

                let is_first = true;
                // for (let plan of plans) {
                //     let start_year_month_date = new Date(plan.planStartDate);
                //     let end_year_month_date = new Date(plan.planEndDate);
                //     let order = 1;
                //     if (is_first) {
                //         plan.order = order;
                //         is_first = !is_first;
                //         continue;
                //     }
                //
                //     while (order<100) {
                //         let temp = plans.filter(x => x.order == order);
                //         let temp_is_overlap = false;
                //         for (let x of temp) {
                //             let temp_start_date = new Date(x.planStartDate);
                //             let temp_end_date = new Date(x.planEndDate);
                //             if (end_year_month_date >= temp_start_date
                //                 && start_year_month_date <= temp_end_date) {
                //                 temp_is_overlap = true;
                //             }
                //         }
                //         if (!temp_is_overlap) {
                //             plan.order = order;
                //             break;
                //         }
                //         order++;
                //     }
                //
                //     //
                //     // let temp_map = new map();
                //     // let temp_list=[];
                //     //
                //     // if (plan_order.length == 0) {
                //     //     plan.order = 1;
                //     //     temp_map.set('start_date', start_year_month_date);
                //     //     temp_map.set('end_date', end_year_month_date);
                //     //     temp_list.push(temp_map);
                //     //     plan_order.push(temp_list);
                //     // } else {
                //     //     for (let i = 0; i < plan_order.length; i++) {
                //     //         for (let x = 0; x < plan_order[i].length; x++) {
                //     //
                //     //         }
                //     //     }
                //     // }
                //
                //
                // }
                // plans.sort(function (x, y) {
                //     return x.order - y.order;
                // })
                console.log('-----------------------------------')

                plans.sort(function (x,y) {
                    let x_start = new Date(x.planStartDate)
                    let x_end = new Date(x.planEndDate)
                    let y_start = new Date(y.planStartDate)
                    let y_end = new Date(y.planEndDate)

                    return (y_end -y_start) - (x_end - x_start)
                    // return (x_end -x_start) - (y_end - y_start)
                })
                console.log(plans)
                for (let plan of plans) {
                    // console.log(plan)
                    console.log('##########################')
                    console.log('name='+plan.planContent)


                    let start_year_month_date = new Date(plan.planStartDate);
                    let end_year_month_date = new Date(plan.planEndDate);
                    let result = $('.day').filter(function () {
                        let filtered_date = new Date(this.getAttribute('id'));
                        filtered_date.setHours(9, 0, 0)
                        // let is_plan_in_month = filtered_date.getTime() == start_year_month_date.getTime()
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
                            console.log($(x).children())
                            console.log('order = '+order)
                            console.log($(x).children().eq(order).hasClass('empty'))

                            if ($(x).children().length >= order && $(x).children().eq(order).attr('class') != 'empty') {
                                order++;
                                break;
                            }
                        }
                    }

                    for (let x of result) {
                        console.log('$(x).children().length-1='+$(x).children().length)
                        console.log('$(x).children().length-1+order='+((order - $(x).children().length)-1))
                        let temp = (order - $(x).children().length)-1
                        for (let i = 0; i <temp; i++) {
                            console.log('render '+i)
                            $(x).append('<div class="row empty" ><div class="col" style="height: 20px"></div></div>');
                        }
                        if ($(x).children().eq(order).hasClass('empty') ) {
                            if (is_first) {
                                $(x).children().eq(order).replaceWith(div_1+'id="'+plan.planNum+'">' + div_2 + plan.planColor + div_3 + plan.planContent + div_4 + div_5);
                                is_first = !is_first;
                            } else $(x).children().eq(order).replaceWith(div_1 +'id="'+plan.planNum+'">'+ div_2 + plan.planColor + div_3 + div_4);
                            console.log('replace')
                        }
                        else {
                            console.log('add')
                            if (is_first) {
                                $(x).append(div_1+'id="'+plan.planNum+'">' + div_2 + plan.planColor + div_3 + plan.planContent + div_4 + div_5);
                                is_first = !is_first;
                            } else $(x).append(div_1 +'id="'+plan.planNum+'">'+ div_2 + plan.planColor + div_3 + div_4);

                        }


                    }
                }
            }


            render_plan();


            $('.plan').click(function (param) {
                event.stopPropagation();
                let x = param.clientX;
                let y = param.clientY;
                $('#update_modal_container').css(
                    {
                        'display': 'block',
                    }
                )
                $('#update_modal').css(
                    {
                        'display': 'block',
                        'top': y,
                        'left': x
                    }
                )
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
                $('.update_plan_color_pick').removeClass('border border-dark')
                $('.update_plan_color_pick').filter(function () {
                    if ($(this).attr('name') == plan.planColor) {
                        return true
                    }
                    return false
                }).addClass('border border-dark')
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
            $('.create_plan_color_pick').removeClass('border border-dark')
            $(this).addClass('border border-dark')
        })
        $('.update_plan_color_pick').click(function () {
            let color_code = this.getAttribute('name');
            $('#update_plan_color').val(color_code);
            $('.update_plan_color_pick').removeClass('border border-dark')
            $(this).addClass('border border-dark')
        })


        $('#create_submit').click(function () {
            $.ajax({
                url: '/study/plan/createPlan',
                type: 'post',
                data: $('#create_plan_form').serialize(),
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function () {
                    find_plans();
                    hide_create_modal();

                },
                error: function () {
                    find_plans();
                    hide_create_modal();

                }
            });
        });
        $('#update_submit').click(function () {
            $.ajax({
                url: '/study/plan/updatePlan',
                type: 'post',
                data: $('#update_plan_form').serialize(),
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function () {
                    find_plans();
                    hide_update_modal()

                },
                error: function () {
                    find_plans();
                    hide_update_modal();
                    alert('네트워크 오류 발생');
                }
            });
        });
        $('#delete_submit').click(function () {
            $.ajax({
                url: '/study/plan/deletePlan',
                type: 'post',
                data: {
                    'planNum': $('#update_plan_num').val()
                },
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function () {
                    find_plans();
                    hide_update_modal()


                },
                error: function () {
                    find_plans();
                    hide_update_modal()

                    alert('네트워크 오류 발생');
                }
            });
        });
        $('.select_plan').click(function () {
            selected_plan = $(this).attr('id');
            render_plans()
        });
    })


</script>
<div class="row">
    <div class="col-2">
        <div class="row">
            <div class="col">
                <span class="select_plan" id="team">#팀 일정</span>
            </div>
        </div>
        <c:forEach items="${studyUserForms}" var="studyUser">
            <div class="row">
                <div class="col">
                    <span class="select_plan" id="${studyUser.memNum}">${studyUser.studyUserName}</span>
                </div>
            </div>
        </c:forEach>

    </div>
    <div class="col-8">
        <div class="row">
            <div class="col"><img src="/images/arrow_back.svg" id="calender_back" alt="calender_back"></div>
            <div class="col" id="year"></div>
            <div class="col " id="month"></div>
            <div class="col"><img src="/images/arrow_forward.svg" id="calender_forward" alt="calender_forward"></div>
            <div class="col">
                <button id="calender_today">오늘</button>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <span>일</span>
            </div>
            <div class="col">
                <span>월</span>
            </div>
            <div class="col">
                <span>화</span>

            </div>
            <div class="col">
                <span>수</span>

            </div>
            <div class="col">
                <span>목</span>

            </div>
            <div class="col">
                <span>금</span>

            </div>
            <div class="col">
                <span>토</span>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="calender">
                    <div class="row" id="week1" style="min-height: 60px"></div>
                    <div class="row" id="week2" style="min-height: 60px"></div>
                    <div class="row" id="week3" style="min-height: 60px"></div>
                    <div class="row" id="week4" style="min-height: 60px"></div>
                    <div class="row" id="week5" style="min-height: 60px"></div>
                    <div class="row" id="week6" style="min-height: 60px"></div>
                </div>
            </div>

        </div>
    </div>

</div>

<div id="create_modal_container" style="display: none;position: fixed;top: 0;left: 0;right: 0;bottom: 0">
    <div id="create_modal" class="bg-light container" title="추가"
         style="display: none;position: absolute;width: 30%;height: 30%">
        <form id="create_plan_form">
            <div class="row">
                <div class="col">
                    <label for="create_plan_start_date">시작일</label>
                    <input type="text" id="create_plan_start_date" class="border-primary" name="planStartDate">

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="create_plan_end_date">마감일</label>
                    <input type="text" id="create_plan_end_date" name="planEndDate">

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="create_plan_content">목표</label>
                    <input type="text" id="create_plan_content" name="planContent">
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <label for="create_plan_color">색상</label>
                    <div class="row">
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5 border border-dark init_color"
                                 style="background-color: #1e81b0;height: 10px"
                                 name="1e81b0"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5" style="background-color: #b6d4fe;height: 10px"
                                 name="b6d4fe"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5" style="background-color: #e28743;height: 10px"
                                 name="e28743"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5" style="background-color: #98fb98;height: 10px"
                                 name="98fb98"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5" style="background-color: #eee8aa;height: 10px"
                                 name="eee8aa"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5" style="background-color: #dda0dd;height: 10px"
                                 name="dda0dd"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5" style="background-color: #db7093;height: 10px"
                                 name="db7093"></div>
                        </div>
                        <div class="col g-0">
                            <div class="create_plan_color_pick rounded-5" style="background-color: #7cfc00;height: 10px"
                                 name="7cfc00"></div>
                        </div>
                        <input type="hidden" id="create_plan_color" name="planColor" value="">

                    </div>
                    <div class="row">
                        공유 일정<input type="checkbox" name="planIsShared" id="create_plan_is_shared">
                    </div>

                </div>
            </div>
        </form>
        <div class="row">
            <div class="col">
                <button id="create_submit">완료</button>

            </div>

        </div>

    </div>
</div>

<div id="update_modal_container" style="display: none;position: fixed;top: 0;left: 0;right: 0;bottom: 0">
    <div id="update_modal" class="bg-light container" title="추가"
         style="display: none;position: absolute;width: 30%;height: 30%">
        <form id="update_plan_form">
            <input type="hidden" id="update_plan_num" name="planNum" value="">
            <div class="row">
                <div class="col">
                    <label for="update_plan_start_date">시작일</label>
                    <input type="text" id="update_plan_start_date" class="border-primary" name="planStartDate">

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="update_plan_end_date">마감일</label>
                    <input type="text" id="update_plan_end_date" name="planEndDate">

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="update_plan_content">목표</label>
                    <input type="text" id="update_plan_content" name="planContent">
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <label for="update_plan_color">색상</label>
                    <div class="row">
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5 "
                                 style="background-color: #1e81b0;height: 10px"
                                 name="1e81b0"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #b6d4fe;height: 10px"
                                 name="b6d4fe"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #e28743;height: 10px"
                                 name="e28743"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #98fb98;height: 10px"
                                 name="98fb98"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #eee8aa;height: 10px"
                                 name="eee8aa"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #dda0dd;height: 10px"
                                 name="dda0dd"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #db7093;height: 10px"
                                 name="db7093"></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #7cfc00;height: 10px"
                                 name="7cfc00"></div>
                        </div>
                        <input type="hidden" id="update_plan_color" name="planColor" value="">

                    </div>
                    <div class="row">
                        공유 일정 <input type="checkbox" name="planIsShared" id="update_plan_is_shared">
                    </div>
                    <div class="row">
                        완료 여부 <input type="checkbox" name="planIsCompleted" id="update_plan_is_completed"
                    >
                    </div>
                </div>
            </div>
        </form>
        <div class="row">
            <div class="col">
                <button id="update_submit">수정하기</button>

            </div>
            <div class="col">
                <button id="delete_submit">삭제하기</button>

            </div>

        </div>

    </div>
</div>

</body>
</html>
