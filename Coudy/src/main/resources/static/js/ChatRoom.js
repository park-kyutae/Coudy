$(function () {
    let sock = new SockJS("/chat-init");
    let client = Stomp.over(sock);
    let chatNum = $(location).attr('pathname').split('/')[2]
    let payload = $('#input_payload');
    let memNum = payload.data('mem_num');
    let memName = payload.data('mem_name');
    console.log(memName);
    client.connect({}, function () {
        client.subscribe('/sub/chat/text/' + chatNum, function (chat) {
            let content = JSON.parse(chat.body);
            console.log(content.chatTime)
            let chat_time = new Date(content.chatTime+'Z');
            console.log(chat_time)
            chat_time = dateFormat(chat_time);
            let div1;
            let div2 = '<div class="toast show">' +
                '<div class="toast-header">' +
                '<strong class="me-auto">' +
                content.memName +
                '</strong>' +
                '<small>' +
                chat_time +
                '</small>' +
                '</div>' +
                '<div class="toast-body">' +
                content.payload +
                '</div>' +
                '</div>';

            if (memNum == content.memNum) {
                div1 = '<div class="d-flex justify-content-end m-1">';
            } else {
                div1 = '<div class="m-1">';
            }


            $('#content').append(div1 + div2);
            scroll_bottom()
        });
        client.subscribe('/sub/chat/file/' + chatNum, function (chat) {
            let content = JSON.parse(chat.body);
            let chat_time = new Date(content.chatTime);
            chat_time = dateFormat(chat_time);
            let div1;
            let div2 = '<div class="toast show">' +
                '<div class="toast-header">' +
                '<strong class="me-auto">' +
                content.memName +
                '</strong>' +
                '<small>' +
                chat_time +
                '</small>' +
                '</div>' +
                '<div class="toast-body">' +
                '<a href="/chat/files/download/' +
                content.logNum +
                '">' +
                content.originalFileName +
                '</a></div >' +
                '</div>';

            if (memNum == content.memNum) {
                div1 = '<div class="d-flex justify-content-end m-1">';
            } else {
                div1 = '<div class="m-1">';
            }
            $('#content').append(div1 + div2)
            scroll_bottom();
        });
    });

    function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;

        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
    }

    function send_payload() {
        let current_time = new Date().toISOString();

        client.send('/pub/chat/text/' + chatNum, {}, JSON.stringify({
            payload: payload.val(),
            chatTime: current_time,
            memNum: memNum,
            memName: memName
        }));
        payload.val('');
        payload.focus();
    }

    $('#send_payload').click(function () {
        send_payload();
    });
    $("#input_payload").on("keydown", function (key) {
        if (key.keyCode == 13) {
            event.preventDefault();
            send_payload();
        }
    })
    $('#file_input').change(function () {
        console.log('text')
         // if (confirm("파일을 전송하시겠습니까?")) {
            let formData = new FormData($('#file_upload')[0]);
            console.log(formData)
            $.ajax({
                cache: false,
                url: "/chat/file/" + chatNum,
                type: 'POST',
                data: formData,
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                timeout: 30000,
                success: function (data) {
                    $(this).val('')
                },
                error: function (xhr, status) {
                }
            });
        // } else
    })

    function scroll_bottom() {
        $('#content').scrollTop($('#content')[0].scrollHeight);
    }

    scroll_bottom();
});