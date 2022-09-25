$(function () {
    let studyNum = new URLSearchParams(location.search).get('study_num');
    const base_url = '/study/plan/' + studyNum;
    const find_plans = function () {

        $.ajax({
            url: base_url + "/progress/find-all-shared",
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
                result = div_1 + 'is-completed' + div_2 + plan.planNum + div_3 + plan.planContent + div_4 + date + div_5;
            } else {
                result = div_1 + 'is-not-completed' + div_2 + plan.planNum + div_3 + plan.planContent + div_4 + date + div_5;

            }
            $('#progress_div').append(result);


        }
        $('.inner-circle').click(function () {
            console.log('inner')
            $.ajax({
                url: base_url + "/progress/update-completed",
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