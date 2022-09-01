<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<html>
<head>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/bootstrap.js" type="text/javascript"></script>
    <title>Title</title>
</head>
<body>

<script>
    $(function () {
        let date = new Date();
        const todayYear = date.getFullYear();
        const todayMonth = date.getMonth() + 1;
        let realMonth
        const today = todayYear + "-" + todayMonth + "-" + date.getDate();
        let year
        let month

        function removeChild() {
            for (let i = 1; i <= 6; i++) {
                $('.calender div').children().remove();
            }
            $("#year").children().remove();
            $("#month").children().remove();

        }

        let clickCount = false;

        const renderCalender = function () {
            year = date.getFullYear();
            month = date.getMonth();
            realMonth = month + 1
            removeChild();

            $('#year').append('<span>' + year + '</span>')
            $('#month').append('<span>' + realMonth + '</span>')
            let currentLastDate = new Date(year, realMonth, 0);
            let currentLastNum = currentLastDate.getDate()
            let currentMonthDates = [];
            for (let i = 1; i <= currentLastNum; i++) {
                currentMonthDates.push(i);
            }
            let preLastDate = new Date(year, month, 0);
            let currentFirstDate = new Date(year, month, 1);

            let currentFirstDay = currentFirstDate.getDay();
            let preMonthDates = [];
            let preLastNum = preLastDate.getDate();
            for (let i = preLastNum - currentFirstDay; i < preLastNum; i++) {
                preMonthDates.push(i + 1);
            }

            let currentLastDay = currentLastDate.getDay();
            let nextMonthDates = [];
            for (let i = 1; i < 14 - currentLastDay; i++) {
                nextMonthDates.push(i);
            }


            let index = 1;
            let week = 0;


            for (let preMonthDate of preMonthDates) {
                if (index % 7 == 1) week++;

                let id = year + "-" + month + "-" + preMonthDate;
                $("#week" + week).append("<div class='border day col' id='" + id + "'>"
                    + "<div class='row '>"
                    + "<div class='col text-secondary'>"
                    + preMonthDate
                    + "</div>"
                    + "</div>"
                    + "</div>");
                index++;
            }
            for (let currentMonthDate of currentMonthDates) {
                if (index % 7 == 1) week++;

                let id = year + "-" + realMonth + "-" + currentMonthDate;
                $("#week" + week).append("<div class='current_month border day col'  id='" + id + "'>"
                    + "<div class='row '>"
                    + "<div class='col '>"
                    + currentMonthDate
                    + "</div>"
                    + "</div>"
                    + "</div>");

                index++;
            }

            for (let nextMonthDate of nextMonthDates) {
                if (index % 7 == 1) week++;

                let id = year + "-" + (realMonth + 1) + "-" + nextMonthDate;
                $("#week" + week).append("<div class='border day col' id='" + id + "'>"
                    + "<div class='row '>"
                    + "<div class='col text-secondary'>"
                    + nextMonthDate
                    + "</div>"
                    + "</div>"
                    + "</div>");
                index++;
            }
            $('#' + today).addClass('border bg-warning bg-opacity-25')
            $('.current_month:first-child').addClass('text-danger')

            $('.calender>div>div').click(function () {
                let dateId = this.getAttribute('id');
                if (clickCount == false) {
                    $('#planStartDate').val(dateId)
                    $('#planEndDate').addClass("border-primary");
                    $('#planStartDate').removeClass("border-primary");

                    clickCount = !clickCount;
                } else {
                    $('#planEndDate').val(dateId)
                    $('#planStartDate').addClass("border-primary");
                    $('#planEndDate').removeClass("border-primary");

                    clickCount = !clickCount;
                }
                $('.plan').click(function (param) {
                    event.stopPropagation();

                    let x = param.clientX;
                    let y = param.clientY;
                    $('#modal').css(
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


                });
                $('#modal').click(function () {

                    $('#modal').css(
                        {
                            'display': 'none',
                        }
                    )
                    $('#update_modal').css(
                        {
                            'display': 'none',
                        }
                    )
                })
                $('#update_modal').click(function () {
                    event.stopPropagation();
                });


            })
            // let temp = "<div class='row'> " +
            //     "<div class='col ratio  bg-black bg-opacity-25' style='--bs-aspect-ratio: 50%'>" +
            //     "</div>" +
            //     "</div>";
            // $('.day').append(temp)

        };

        renderCalender();


        $('#calender_back').click(function () {
            date.setMonth(date.getMonth() - 1)
            renderCalender();

            find_plans();

            render_plans()
        })
        $('#calender_forward').click(function () {
            date.setMonth(date.getMonth() + 1)
            renderCalender();
            find_plans();

            render_plans()

        })
        $('#calender_today').click(function () {
            date = new Date();
            renderCalender();
            find_plans();

            render_plans()

        })

        $('.plan_color_pick').click(function () {
            let colorCode = this.getAttribute('id');
            $('#planColor').val(colorCode);
            $('.plan_color_pick').removeClass('border border-dark')
            $(this).addClass('border border-dark')
        })


        $('#submit').click(function () {
            $.ajax({
                url: '/study/plan/createPlan',
                type: 'post',
                data: $('#createPlanForm').serialize(),
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function () {

                },
                error: function () {
                    alert('네트워크 오류 발생');
                }
            });
        });

        let selected_plan = 'team';

        let first_div = "<div class='row'> " +
            "<div class='col ratio plan bg-opacity-25 text-truncate' style='--bs-aspect-ratio: 50%; background-color:#";
        let second_div = "'>"
        let third_div = "</div></div>";
        let plans
        let render_plans = function () {
            $('.plan').remove();
            for (let plan of plans) {

                console.log(plan)
                let start_year_month_date = new Date(plan.planStartDate)
                let end_year_month_date = new Date(plan.planEndDate)
                let result = $('.day').filter(function () {
                    let filtered_date = new Date(this.getAttribute('id'));
                    filtered_date.setHours(9, 0, 0)
                    let temp_flag = filtered_date >= start_year_month_date
                        && filtered_date <= end_year_month_date
                        && (plan.memNum == selected_plan || (plan.planIsShared == true && selected_plan == 'team'));
                    return temp_flag;

                })
                let is_first = true;
                for (let x of result) {
                    if (is_first) {
                        $(x).append(first_div + plan.planColor + second_div + plan.planContent + third_div);
                        is_first = !is_first;
                    } else
                        $(x).append(first_div + plan.planColor + second_div  + third_div)

                        }
            }
        }

        const find_plans = function () {
            console.log(year)
            console.log(realMonth)
            $.ajax({
                url: '/study/plan/findPlans',
                type: 'get',
                data: {
                    "thisYearMonth": year + "-" + realMonth + "-01"
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
        $('.select_plan').click(function () {
            selected_plan = $(this).attr('id');
            render_plans()
        });
        find_plans();


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
    <div class="col-2">
        <form id="createPlanForm">
            <div class="row">
                <div class="col">
                    <label for="planStartDate">시작일</label>
                    <input type="text" id="planStartDate" class="border-primary" name="planStartDate">

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="planEndDate">마감일</label>
                    <input type="text" id="planEndDate" name="planEndDate">

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="planContent">목표</label>
                    <input type="text" id="planContent" name="planContent">
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <label for="planColor">색상</label>
                    <div class="row">
                        <div class="col g-0">
                            <div class="plan_color_pick rounded-5 border border-dark"
                                 style="background-color: #1e81b0;height: 10px"
                                 id="1e81b0"></div>
                        </div>
                        <div class="col g-0">
                            <div class="plan_color_pick rounded-5" style="background-color: #b6d4fe;height: 10px"
                                 id="b6d4fe"></div>
                        </div>
                        <div class="col g-0">
                            <div class="plan_color_pick rounded-5" style="background-color: #e28743;height: 10px"
                                 id="e28743"></div>
                        </div>
                        <div class="col g-0">
                            <div class="plan_color_pick rounded-5" style="background-color: #98fb98;height: 10px"
                                 id="98fb98"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col g-0">
                            <div class="plan_color_pick rounded-5" style="background-color: #eee8aa;height: 10px"
                                 id="eee8aa"></div>
                        </div>
                        <div class="col g-0">
                            <div class="plan_color_pick rounded-5" style="background-color: #dda0dd;height: 10px"
                                 id="dda0dd"></div>
                        </div>
                        <div class="col g-0">
                            <div class="plan_color_pick rounded-5" style="background-color: #db7093;height: 10px"
                                 id="db7093"></div>
                        </div>
                        <div class="col g-0">
                            <div class="plan_color_pick rounded-5" style="background-color: #7cfc00;height: 10px"
                                 id="7cfc00"></div>
                        </div>
                        <input type="hidden" id="planColor" name="planColor" value="1e81b0">

                    </div>
                    <div class="row">
                        <input type="checkbox">
                    </div>
                </div>
            </div>
        </form>
        <div class="row">
            <div class="col">
                <button id="submit">완</button>

            </div>

        </div>

    </div>
</div>

<div id="modal"  style="display: none;position: fixed;top: 0;left: 0;right: 0;bottom: 0">
    <div id="update_modal" class="bg-light container" title="수정" style="display: none;position: absolute;width: 30%;height: 30%">
        <form id="updatePlanForm">
            <div class="row">
                <div class="col">
                    <label for="update_plan_start_date">시작일</label>
                    <input type="text" id="update_plan_start_date" class="border-primary" name="update_plan_start_date">

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="update_plan_end_date">마감일</label>
                    <input type="text" id="update_plan_end_date" name="update_plan_end_date">

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="update_plan_content">목표</label>
                    <input type="text" id="update_plan_content" name="update_plan_content">
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <label for="update_plan_color">색상</label>
                    <div class="row">
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5 border border-dark"
                                 style="background-color: #1e81b0;height: 10px"
                                 ></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #b6d4fe;height: 10px"
                                 ></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #e28743;height: 10px"
                                 ></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #98fb98;height: 10px"
                                 ></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #eee8aa;height: 10px"
                                 ></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #dda0dd;height: 10px"
                                 ></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #db7093;height: 10px"
                                 ></div>
                        </div>
                        <div class="col g-0">
                            <div class="update_plan_color_pick rounded-5" style="background-color: #7cfc00;height: 10px"
                                 ></div>
                        </div>
                        <input type="hidden" id="update_plan_color" name="update_plan_color" value="1e81b0">

                    </div>
                    <div class="row">
                        <input type="checkbox">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
