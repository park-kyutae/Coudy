const scrap = {
    init: function() {
        $(document).on('click', '.scrap_star', function() {
            let com_num = $(this).data('com-num');

            console.log(com_num);
            if(confirm('스크랩 하시겠습니까?')){
                $.ajax({
                    url:'scrap.do',
                    type:'post',
                    dataType:'json',
                    data:{
                        'com_num':com_num
                    },
                    cache:false,
                    timeout:30000,
                    success:function (param) {
                        if(param.result=='logout'){
                            alert('로그인 후 이용가능');
                        }else if(param.result=='success'){
                            displayScrap(param);
                        }else{
                            alert('스크랩 중 오류');
                        }
                    },
                    error:function () {
                        alert('네트워크오류발생');
                    }
                });
            }else {
                return false;
            }
        });
        // $(document).on('click','.unscrap_star',function () {
        //     $(this).children().attr('d','M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z')
        //     console.log('unscrap');
        //     $(this).removeClass('unscrap_star');
        //     $(this).addClass('scrap_star');
        // })
    }
}
const scrap_btn = {
    init: function() {
        $(document).on('click', '.scrap_btn', function() {
            alert('엥 못읽냐?');
            if(confirm('스크랩 하시겠습니까?')){
                console.log('scrap');
                $(this).children().children().attr('d','M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z')
                $(this).removeClass('scrap_btn');
                $(this).addClass('unscrap_btn');
            }else {
                return false;
            }
        });
        $(document).on('click','.unscrap_btn',function () {
            $(this).children().children().attr('d','M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z')
            console.log('unscrap');
            $(this).removeClass('unscrap_btn');
            $(this).addClass('scrap_btn');
        })
    }
}
scrap.init();
scrap_btn.init();

//스크랩 표시
function displayScrap(param){
    if(param.status == 'noScrap'){
        $(this).removeClass('blank');
        $(this).addClass('checked');
    }else{
        $(this).removeClass('checked');
        $(this).addClass('blank');
    }



}


//날짜 남은시간 계산기
let remainTime = document.querySelector("#remain-time");
let schedule = document.getElementById('schedule').value;
let masTime = "<c:out value='${companyVO.com_schedule}'/>";
function diffDay() {
    let masTime = new Date(schedule);
    console.log(masTime);
    let todayTime = new Date();
    console.log(todayTime);
    let diff = masTime - todayTime;

    let diffDay = Math.floor(diff / (1000*60*60*24));
    let diffHour = Math.floor((diff / (1000*60*60)) % 24);
    let diffMin = Math.floor((diff / (1000*60)) % 60);
    let diffSec = Math.floor(diff / 1000 % 60);

    remainTime.innerText = `${diffDay}일 ${diffHour}시간 ${diffMin}분 ${diffSec}초`;
}
diffDay();
setInterval(diffDay, 1000);


