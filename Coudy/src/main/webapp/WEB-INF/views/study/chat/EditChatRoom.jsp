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
<script>
    $(function () {
        function render_member_input() {
            $('#submit').before('<div class="row member">' +
                '<div class="row member-input">' +
                '<div class="col">' +
                '<input type="text" class="search-member"/>' +
                '<input type="hidden" name="mem_num" class="search-member-num">' +
                '</div>' +
                '<div class="col">' +
                '<img src="/images/delete.svg" style="height: 15px" class="remove_member">' +
                '</div>' +
                '</div>' +
                '</div>')
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
                if (search_word.length % 4 == 1 || ajax_count ==0) {
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
                '<div class="row"  id="result">' +
                '<div class="col" style="position: absolute">' +
                '<ul id="result_list">' +
                '</ul>' +
                '</div>' +
                '</div>'
            )
            if (results.length == 0) {
                $('#result_list').append(
                    '<li>' +
                    '검색 결과가 없습니다' +
                    '</li>'
                )
            }
            for (let result of results) {
                $('#result_list').append(
                    '<li>' +
                    '<span class="select-member" data-mem_num="' + result.memNum + '">' +
                    result.memName +
                    '</span>' +
                    '</li>'
                )
            }
            $('.select-member').click(function () {
                $('.search-member').focus()
                let mem_num = $(this).data('mem_num')
                console.log($(this).text())
                let member_input = $(this).closest('.member');
                member_input.find('.search-member-num').val(mem_num)
                member_input.find('.search-member').val($(this).text())
                $('#result').remove()

            });
        }
        add_search_key_event()
    })

</script>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <span>채팅방 생성</span>
        </div>
        <div class="row">
            <div class="col">
                <button class="btn btn-secondary" id="add_member">추가</button>
            </div>
        </div>
        <div class="row">
            <form:form modelAttribute="editChatRoomForm" action="">
                <input type="text" name="chatName" value="${chatRoom.chatName}">
                <input type="hidden" name="chatNum" value="${chatRoom.chatNum}">
                <div class="row">
                    <div class="col">
                        <span>멤버 추가</span>
                    </div>
                </div>
                <c:forEach items="${members}" var="member">
                    <div class="row">
                        <div class="col">
                            <span>${member.name}</span>
                        </div>
                    </div>
                </c:forEach>
                <div class="row member">
                    <div class="row member-input">
                        <div class="col">
                            <input type="text" class="search-member"/>
                            <input type="hidden" name="mem_num" class="search-member-num">
                        </div>
                    </div>
                </div>
                <div class="row" id="submit">
                    <div class="col">
                        <input type="submit" value="추가">
                    </div>
                </div>
            </form:form>


        </div>
        <div class="row">
            <div class="col">
                    <form action="quit" method="post">
                        <div class="row">
                            <div class="col">
                                <input type="hidden" value="${chatRoom.chatNum}" name="chatNum">
                                <button type="submit" class="quit_room">나가기</button>
                            </div>
                        </div>
                    </form>
            </div>
        </div>

    </div>
</div>
</body>
</html>

