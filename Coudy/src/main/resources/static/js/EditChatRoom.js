    $(function () {
    function render_member_input() {
        $('#member_list').append('<li class="member list-group-item">' +
            '<div class="row">' +
            '<div class="col">' +
            '<input type="text" class="search-member form-control"/>' +
            '<input type="hidden" name="mem_num" class="search-member-num">' +
            '</div>' +
            '<div class="col col-1 d-flex justify-content-center">' +
            '<img src="/images/backspace.svg" style="height: 35px;" class="remove_member ms-1 pointer">' +
            '</div></div>' +
            '</li>'
        )
        $('.remove_member').click(function () {
            $(this).closest('.member').remove()
        });
        add_search_key_event()
    }

    let count = 0;
    $('#add_member').click(function () {
    render_member_input();
    count++;
    if (count >= 9) {
    $('#add_member').remove();
}


})

    function isMatch(result, examine_word) {
    let regex = new RegExp('.*' + examine_word + '.*', 'i')
    return regex.test(result)
}

    let ajax_results = [];
    let ajax_count = 0;

    function add_search_key_event() {
    $('.search-member').keyup(function () {
    let results = [];
    let search_word = $(this).val()
    let trigger_ele = $(this)
    if (search_word.length % 4 == 1 || ajax_count == 0) {
    console.log('ajax up')
    ajax_count++;//TODO 키가 씹힘 문제 해결 후 카운트 삭제
    $.ajax({
    url: '/chat/search-member/' + search_word,
    type: 'get',
    dataType: 'json',
    cache: false,
    timeout: 30000,
    success: function (param) {
    console.log('-----------ajx-----------')
    console.log(param)
    if (param instanceof Array) {
    ajax_results = param;
    results = param
} else {
}
    console.log('search_word.length=' + search_word.length)

    render_result(trigger_ele, search_word, results)

},
    error: function () {
    alert('error');
}
});
} else if (search_word == '') {
    console.log('empty up')
    ajax_results = [];
    $('#result').remove()
} else {
    console.log('ele up')
    console.log('search_word.length=' + search_word.length)
    results = ajax_results.filter(result => isMatch(result.memName, search_word));
    render_result(trigger_ele, search_word, results);
}
})
}


    function render_result(trigger_ele, search_word, results) {
    $('#result').remove()
    trigger_ele.closest('.member').append(
    '<div class="col" id="result"style="position: absolute; z-index: 1">' +
    '<ul id="result_list" class="list-group list-group-flush" style="width: 390px">' +
    '</ul>' +
    '</div>'
    )
    if (results.length == 0) {
    $('#result_list').append(
    '<li class="list-group-item">' +
    '검색 결과가 없습니다' +
    '</li>'
    )
}
    for (let result of results) {
    $('#result_list').append(
    '<li class="list-group-item list-group-item-action select-member" data-mem_num="' +
    result.memNum +
    '">' +
    '<span>' +
    result.memName +
    '</span>' +
    '</li>'
    )
}
    $('.select-member').click(function () {
    let mem_num = $(this).data('mem_num')
    console.log($(this).text())
    let member_input = $(this).closest('.member');
    member_input.find('.search-member-num').val(mem_num)
    member_input.find('.search-member').val($(this).text())
    $('#result').remove()

});
}

    $('#submit').click(function () {
    $('#editChatRoomForm').submit()
})
    add_search_key_event()
})
