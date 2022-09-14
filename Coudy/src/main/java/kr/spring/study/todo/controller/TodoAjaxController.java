package kr.spring.study.todo.controller;

import kr.spring.study.plan.artgumentResolver.Login;
import kr.spring.study.todo.service.TodoService;
import kr.spring.study.todo.vo.TodoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/study/todo/{studyNum}")
public class TodoAjaxController {
    private final TodoService todoService;

    @PostMapping
    public Map<String ,Object> createTodo(@Login Integer memNum, @Validated @RequestBody CreateTodoForm form, BindingResult result, @PathVariable Integer studyNum) throws BindException {
        log.info("form = {}", form);
        log.info("result = {}", result);
        log.info("memNum = {}, studyNum = {}", memNum, studyNum);
        if (result.hasErrors()) {
            throw new BindException(result);
        }
        todoService.createTodo(new TodoVO(form.getTodoContent(),memNum,studyNum));

        //삭제
        return Map.of("result", "success");
    }
    @PatchMapping("/next-step")
    public Map<String ,Object> nextStepTodo(@Login Integer memNum,@Validated @RequestBody NextStepTodo form, BindingResult result, @PathVariable Integer studyNum) throws BindException {
        log.info("form = {}", form);
        if (result.hasErrors()) {
            throw new BindException(result);
        }
        todoService.nextStepTodo(new TodoVO(form.getTodoNum(), form.getTodoProgress()));

        //삭제
        return Map.of("result", "success");
    }
    @PatchMapping("/modify")
    public Map<String ,Object> modifyTodo(@Login Integer memNum,@Validated @RequestBody ModifyTodoForm form, BindingResult result, @PathVariable Integer studyNum) throws BindException {
        log.info("form = {}", form);
        if (result.hasErrors()) {
            throw new BindException(result);
        }
        todoService.modifyTodo(new TodoVO(form.getTodoNum(), form.getTodoContent()));

        //삭제
        return Map.of("result", "success");
    }
    @DeleteMapping
    public Map<String ,Object> deleteTodo(@Login Integer memNum,  @RequestBody Map<String,Integer> map, BindingResult result, @PathVariable Integer studyNum) {
        log.info("memNum = {}", map);
        todoService.deleteTodo(map.get("todoNum"));

        //삭제
        return Map.of("result", "success");
    }

    @GetMapping("/find")
    public List<FindTodoForm> findTodos(@Login Integer memNum, @PathVariable Integer studyNum) {


        List<FindTodoForm> findTodoForms = todoService.selectTodos(memNum, studyNum).stream()
                .map(todoVO -> new FindTodoForm(todoVO.getTodoNum(), todoVO.getTodoContent(), todoVO.getTodoProgress()))
                .collect(Collectors.toList());
        return findTodoForms;
    }
}
