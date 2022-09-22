<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- ✅ load jquery UI ✅ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<html>
<head>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <title>Title</title>
</head>
<script>
    $(function () {
        const find_plans = function () {
            $.ajax({
                url: $(location).attr('pathname') + "/find-all-shared",
                type: 'get',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (plans) {
                    console.log(plans)
                    render_progress(plans)
                },
                error: function () {
                    alert('error');
                }
            });
        }
        const div_1 = '<div class="timeline-step">' +
            '<div class="timeline-content">' +
            '<div class="inner-circle '
        const div_2 = '" id="';
        const div_3 = '"></div>' +
            '<p class="h6 mt-3 mb-1">';
        const div_4 = '</p><p class="h6 text-muted mb-0 mb-lg-0">'
        const div_5 = '</p></div></div>';

        function render_progress(plans) {
            $('#progress_div').children().remove()
            for (let plan of plans) {
                let date = plan.planStartDate + '<br>~' + plan.planEndDate;

                let result;
                if (plan.planIsCompleted == true) {
                    result = div_1 +'is-completed'+div_2+ plan.planNum + div_3 + plan.planContent + div_4 + date + div_5;
                } else {
                    result = div_1 +'is-not-completed'+div_2+ plan.planNum + div_3 + plan.planContent + div_4 + date + div_5;

                }
                $('#progress_div').append(result);


            }
            $('.inner-circle').click(function () {
                console.log('inner')
                $.ajax({
                    url: $(location).attr('pathname') + "/update-completed",
                    type: 'patch',
                    data: JSON.stringify({
                        "planNum": $(this).attr('id')
                    }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    cache: false,
                    timeout: 30000,
                    success: function () {
                        find_plans();
                    },
                    error: function () {
                        alert('error');
                    }
                });
            });
        }

        //TODO 일정 추가 시 진행도도 같이 갱신되야
        find_plans();
    })
</script>
<style>
    body {
        margin-top: 20px;
    }

    .timeline-steps {
        display: flex;
        justify-content: center;
        flex-wrap: wrap
    }

    .timeline-steps .timeline-step {
        align-items: center;
        display: flex;
        flex-direction: column;
        position: relative;
        margin: 1rem
    }

    @media (min-width: 768px) {
        .timeline-steps .timeline-step:not(:last-child):after {
            content: "";
            display: block;
            border-top: .25rem dotted #3b82f6;
            width: 3.46rem;
            position: absolute;
            left: 7.5rem;
            top: .3125rem
        }

        .timeline-steps .timeline-step:not(:first-child):before {
            content: "";
            display: block;
            border-top: .25rem dotted #3b82f6;
            width: 3.8125rem;
            position: absolute;
            right: 7.5rem;
            top: .3125rem
        }
    }

    .timeline-steps .timeline-content {
        width: 10rem;
        text-align: center
    }

    .timeline-steps .timeline-content .inner-circle {
        border-radius: 1.5rem;
        height: 1rem;
        width: 1rem;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background-color: #3b82f6
    }

    .timeline-steps .timeline-content .inner-circle:before {
        content: "";
        background-color: #3b82f6;
        display: inline-block;
        height: 3rem;
        width: 3rem;
        min-width: 3rem;
        border-radius: 6.25rem;
    }

    .is-completed:before {
        opacity: 0
    }

    .is-not-completed:before {
        opacity: .5
    }


</style>
<body>
<div class="container">


    <div class="row">
        <div class="col ">
            <div class="timeline-steps aos-init aos-animate" id="progress_div" data-aos="fade-up">

            </div>
        </div>
    </div>
</div>

</body>
</html>
