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

        jQuery.fn.serializeObject = function () {
            var obj = null;
            try {
                if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
                    var arr = this.serializeArray();
                    if (arr) {
                        obj = {};
                        jQuery.each(arr, function () {
                            if (this.value == 'on') {
                                obj[this.name] = 'true';
                            } else if (this.value == 'off') {
                                obj[this.name] = 'false';
                            } else {
                                obj[this.name] = this.value;
                            }
                        });

                    }
                }
            } catch (e) {
                alert(e.message);
            } finally {
            }
            return obj;
        }
        $('#create_submit').click(function () {
            console.log($('#create_todo_form').serializeObject())
            $.ajax({
                url: $(location).attr('pathname'),
                type: 'post',
                data: JSON.stringify($('#create_todo_form').serializeObject()),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    if(param instanceof Array) {
                        for (let x of param) {
                            alert(x.message)
                        }
                    }
                    findTodos();
                },
                error: function () {
                    alert('error');
                }
            });
        });

        function findTodos() {
            const div_1 = '<div class="row todo" id="'
            const div_2 = '"><div class="col" >';
            const div_3 = '<img src="/images/arrow_forward.svg" class="'
            const div_4 = '"> ';
            const div_5 = '<input type="text" class="content_input" value="';
            const div_6 = '"></div><div class="col"><img src="/images/delete.svg" class="delete_todo" style="height: 20px">'
            const div_ = '<img src="/images/arrow_backward.svg" class="to_before">'
            const div__ = ' </div></div>';
            $.ajax({
                url: $(location).attr('pathname') + '/find',
                type: 'get',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    console.log(param)
                    reset_todos();
                    for (let x of param) {
                        if (x.todoProgress == 0) {
                            $('#before_start_todo').append(div_1 + x.todoNum + div_2 + div_3 + 'to_processing' + div_4 + div_5 + x.todoContent + div_6+div__);

                        } else if (x.todoProgress == 1) {
                            $('#progressing_todo').append(div_1 + x.todoNum + div_2 + div_3 + 'to_completed' + div_4 + div_5 + x.todoContent + div_6+div_+div__);
                        } else {
                            $('#completed_todo').append(div_1 + x.todoNum + div_2 + div_5 + x.todoContent + div_6+div__);
                        }

                    }
                    add_check_event();
                },
                error: function () {
                    alert('error');
                }
            });
        }

        function next_step_todo(param) {
            $.ajax({
                url: $(location).attr('pathname') + '/next-step',
                type: 'patch',
                data: JSON.stringify(param),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    findTodos();

                },
                error: function () {
                    alert('error');
                }
            });
        }

        function delete_todo(param) {
            $.ajax({
                url: $(location).attr('pathname'),
                type: 'delete',
                data: JSON.stringify(param),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    findTodos();

                },
                error: function () {
                    alert('error');
                }
            });
        }

        function add_check_event() {
            $('.to_processing').click(function () {
                    next_step_todo({
                        "todoNum": $(this).parent().parent().attr('id'),
                        "todoProgress": 1
                    })

            })
            $('.to_before').click(function () {
                    next_step_todo({
                        "todoNum": $(this).parent().parent().attr('id'),
                        "todoProgress": 0
                    })

            })
            $('.to_completed').click(function () {
                    next_step_todo({
                        "todoNum": $(this).parent().parent().attr('id'),
                        "todoProgress": 2
                    })

            })
            $('.delete_todo').click(function () {
                delete_todo({
                    "todoNum": $(this).parent().parent().attr('id')
                })

            })
            $(".content_input").on("keyup", function (key) {
                if (key.keyCode == 13) {
                    const todoNum = $(this).parent().parent().attr('id');
                    const todoContent = $(this).val();
                    modify_content({
                        'todoNum': todoNum,
                        'todoContent': todoContent
                    })
                }
            })
        }

        function reset_todos() {
            $('.todo').remove();
            $('#create_todo_input').val('')
        }

        function modify_content(param) {

            $.ajax({
                url: $(location).attr('pathname') + '/modify',
                type: 'patch',
                data: JSON.stringify(param),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    console.log(param)
                    if(param instanceof Array) {
                        for (let x of param) {
                            alert(x.message)
                        }
                    }
                    findTodos();


                },
                error: function () {
                    alert('error');
                }
            });
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
