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
        $('#create_submit').click(function () {

            $.ajax({
                url:$(location).attr('pathname')+'/create',
                type: 'POST',
                data: $('#create_todo_form').serialize(),
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function () {
                    findTodos();
                },
                error: function () {
                    alert('error');
                }
            });
        });
        function findTodos() {
            const div_1 = '<div class="row todo"><div class="col"><span>'
            const div_2 = '</span></div></div>'
            $.ajax({
                url:$(location).attr('pathname')+'/findTodos',
                type: 'get',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    console.log(param)
                    reset_todos();
                    for (let x of param) {

                        if (x.todoProgress == 0) {
                            $('#before_start_todo').append(
                                div_1+x.todoContent+div_2
                            );
                        }else if (x.todoProgress == 1) {
                            $('#progressing_todo').append(
                                div_1+x.todoContent+div_2
                            );
                        }else {
                            $('#completed_todo').append(
                                div_1+x.todoContent+div_2
                            );
                        }

                    }
                },
                error: function () {
                    alert('error');
                }
            });
        }
        function reset_todos() {
            $('.todo').remove();
            $('#create_todo_input').val('')
        }
        findTodos();

    })
</script>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <div class="row">
                <div class="col">
                    <span>시작 전</span>
                </div>
            </div>

            <div class="row" id="before_start_todo">
                <div class="col">
                </div>
            </div>
            <div class="row">
                <form id="create_todo_form">
                <div class="col">
                        <input type="text" id="create_todo_input" name="todoContent" placeholder="새로운 할일 추가">
                </div>
                <div class="col">
                    <span id="create_submit">+</span>
                </div>
                </form>

            </div>
        </div>
        <div class="col">

            <div class="row">
                <div class="col">
                    <span>진행 중</span>
                </div>
            </div>

            <div class="row" id="progressing_todo">
                <div class="col">
                </div>
            </div>
        </div>

        <div class="col">

            <div class="row">
                <div class="col">
                    <span>완료</span>
                </div>
            </div>

            <div class="row" id="completed_todo">
                <div class="col">
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
