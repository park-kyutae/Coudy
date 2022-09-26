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
        const div_5 = '<input type="text" class="fs-5 content_input border-0 w-75" value="';
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
