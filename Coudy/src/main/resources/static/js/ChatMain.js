$(function () {
    let result = new URLSearchParams(location.search).get('result');
    if (result == 'true') {
        alert('채팅방이 생성되었습니다')
        history.replaceState({}, null, location.pathname);
    }

    $('.room_edit').click(function () {
        event.stopPropagation();
        let chat_num = 'chatNum='+$(this).closest('.room').attr('id');
        location.href='/chat/edit?'+chat_num
    }); $('#create_room').click(function () {
        location.href='/chat/add'
    });
    $('.room').click(function () {
        let chat_num = $(this).closest('.room').attr('id');
        location.href =  '/chat/'+chat_num;
    })

    let sock = new SockJS("/chat-init");
    let client = Stomp.over(sock);


    client.connect({}, function () {
        const elements = document.querySelectorAll('.room');
        Array.from(elements).forEach((element, index) => {
            let chatNum = element.id;
            client.subscribe('/sub/chat/text/' + chatNum, function (chat) {
                let content = JSON.parse(chat.body);
                $('#message'+chatNum).text(content.payload)
            });
            client.subscribe('/sub/chat/file/' + chatNum, function (chat) {
                let content = JSON.parse(chat.body);
                $('#message'+chatNum).text(content.originalFileName)
            });
        });

    });

})
