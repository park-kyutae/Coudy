<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        const today = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();

        function removeChild() {
            for (let i = 1; i <= 6; i++) {
                $('.calender div').children().remove();
            }
            $("#year").children().remove();
            $("#month").children().remove();

        }

        const renderCalender = function () {
            let year = date.getFullYear();
            let month = date.getMonth();
            let realMonth = month + 1
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


            for (let x of preMonthDates) {
                if (index % 7 == 1) week++;

                let id = year + "-" + month + "-" + x;
                $("#week" + week).append("<div class='border col text-secondary' id='" + id + "'>" + x + "</div>");
                index++;
            }
            for (let x of currentMonthDates) {
                if (index % 7 == 1) week++;

                let id = year + "-" + realMonth + "-" + x;
                $("#week" + week).append("<div class='border col current_month' id='" + id + "'>" + x + "</div>");


                index++;
            }

            for (let x of nextMonthDates) {
                if (index % 7 == 1) week++;

                let id = year + "-" + (realMonth + 1) + "-" + x;
                $("#week" + week).append("<div class='border col text-secondary' id='" + id + "'>" + x + "</div>");
                index++;
            }
            $('#' + today).addClass('border bg-warning bg-opacity-25')
            $('.current_month:first-child').addClass('text-danger')


        };

        renderCalender();


        $('#calender_back').click(function () {
            date.setMonth(date.getMonth() - 1)
            renderCalender();
        })
        $('#calender_forward').click(function () {
            date.setMonth(date.getMonth() + 1)
            renderCalender();
        })
        $('#calender_today').click(function () {
            date = new Date();
            renderCalender();
        })
    })


</script>
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
<div class="calender">
    <div class="row" id="week1"></div>
    <div class="row" id="week2"></div>
    <div class="row" id="week3"></div>
    <div class="row" id="week4"></div>
    <div class="row" id="week5"></div>
    <div class="row" id="week6"></div>
</div>
</body>
</html>
