<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

        function add_todo() {
            $.ajax({
                url: $(location).attr('pathname'),
                type: 'post',
                data: JSON.stringify($('#create_todo_form').serializeObject()),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                cache: false,
                timeout: 30000,
                success: function (param) {
                    if (param instanceof Array) {
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
        function findTodos() {
            const div_1 = '<li class="todo list-group-item d-flex justify-content-center" id="'
            const div_2 = '">';
            const div_ = '<img src="/images/arrow_backward.svg" class="to_before " >'
            const div_3 = '<input type="checkbox" style="height: 20px;width:20px;" src="/images/arrow_forward.svg" class="form-check-input  me-3 '
            // const div_3 = '<img src="/images/arrow_forward.svg" class="'
            const div_4 = '"> ';
            const div_5 = '<input type="text" class="fs-5 content_input border-0" value="';
            const div_6 = '"><img src="/images/backspace.svg" class="delete_todo" >'
            const div__ = ' </li>';
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
                            $('#create_todo_form').parent().before(div_1 + x.todoNum + div_2 + div_3 + 'to_processing' + div_4 + div_5 + x.todoContent + div_6 + div__);

                        } else if (x.todoProgress == 1) {
                            $('#progressing_todo').append(div_1 + x.todoNum + div_2 + div_ + div_3 + 'to_completed' + div_4 + div_5 + x.todoContent + div_6 + div__);
                        } else {
                            $('#completed_todo').append(div_1 + x.todoNum + div_2 + div_5 + x.todoContent + div_6 + div__);
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
                    "todoNum": $(this).parent().attr('id'),
                    "todoProgress": 1
                })

            })
            $('.to_before').click(function () {
                next_step_todo({
                    "todoNum": $(this).parent().attr('id'),
                    "todoProgress": 0
                })

            })
            $('.to_completed').click(function () {
                next_step_todo({
                    "todoNum": $(this).parent().attr('id'),
                    "todoProgress": 2
                })

            })
            $('.delete_todo').click(function () {
                delete_todo({
                    "todoNum": $(this).parent().attr('id')
                })

            })
            $(".content_input").on("keyup", function (key) {
                if (key.keyCode == 13) {
                    const todoNum = $(this).parent().attr('id');
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
                    if (param instanceof Array) {
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
        $("#create_todo_input").on("keydown", function (key) {
            if (key.keyCode == 13) {
                event.preventDefault();
                add_todo();
            }
        })
        $('#create_submit').click(function () {
            add_todo();
        });
        findTodos();

    })

</script>
<style>
    .to_before{
        height: 25px;
    }
    .delete_todo{
        height: 25px;
    }
</style>
<div class="container">
    <div class="row study-nav-row">
        <div class="col">
            <span class="study-nav-text">Todos</span>
        </div>
    </div>
    <div class="row study-content">
        <div class="col">
            <ul class="list-group" id="before_start_todo">
                <li class="study-li-head">시작 전</li>
                <li class="list-group-item">
                    <form class="m-0 d-flex" id="create_todo_form">
                        <img src="/images/plus.svg" id="create_submit" style="height: 40px">
                        <input class="flex-grow-1 border-secondary border-bottom border-3 border-top-0 border-start-0 border-end-0"
                               type="text" id="create_todo_input" name="todoContent" placeholder="새로운 할일 추가">
                    </form>
                </li>
            </ul>
        </div>
        <div class="col">
            <ul class="list-group" id="progressing_todo">
                <li class="study-li-head">
                    <span>진행 중</span>
                </li>
            </ul>
        </div>
        <div class="col">
            <ul class="list-group" id="completed_todo">
                <li class="study-li-head">
                    <span>완료</span>
                </li>
            </ul>
        </div>
    </div>
</div>

