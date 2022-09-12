package kr.spring.study.todo.controller;

import kr.spring.study.plan.artgumentResolver.Login;
import kr.spring.study.todo.service.TodoService;
import kr.spring.study.todo.vo.TodoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/study/todo/{studyNum}")
public class TodoAjaxController {
    private final TodoService todoService;

    @PostMapping("/create")
    public Object createTodo(@Login Integer memNum, @RequestBody CreateTodoForm form, BindingResult result, @PathVariable Integer studyNum) {
        log.info("Call TodoAjaxController.createTodo --- Variable = form = {}", form);

        todoService.createTodo(new TodoVO(form.getTodoContent(),memNum,studyNum));

        //삭제
        return result.getAllErrors();
    }
    @PostMapping("/nextStep")
    public Object nextStepTodo(@Login Integer memNum, @RequestBody NextStepTodo form, BindingResult result, @PathVariable Integer studyNum) {
        log.info("Call TodoAjaxController.nextStepTodo --- Variable = form = {}", form);

        todoService.nextStepTodo(new TodoVO(form.getTodoNum(), form.getProgress()));

        //삭제
        return result.getAllErrors();
    }

    @GetMapping("/findTodos")
    public List<FindTodoForm> findTodos(@Login Integer memNum, @PathVariable Integer studyNum) {


        List<FindTodoForm> findTodoForms = todoService.selectTodos(memNum, studyNum).stream()
                .map(todoVO -> new FindTodoForm(todoVO.getTodoNum(), todoVO.getTodoContent(), todoVO.getTodoProgress()))
                .collect(Collectors.toList());
        return findTodoForms;
    }
}
