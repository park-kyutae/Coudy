package kr.spring.study.todo.controller;

import kr.spring.member.vo.MemberVO;
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
    public Map<String ,Object> createTodo(@Login MemberVO member, @Validated @RequestBody CreateTodoForm form, BindingResult result, @PathVariable Integer studyNum) throws BindException {
        if (result.hasErrors()) {
            throw new BindException(result);
        }
        todoService.createTodo(new TodoVO(form.getTodoContent(), member.getMem_num(), studyNum));

        //삭제
        return Map.of("result", "success");
    }
    @PatchMapping("/next-step")
    public Map<String ,Object> nextStepTodo(@Validated @RequestBody NextStepTodo form, BindingResult result, @PathVariable Integer studyNum) throws BindException {
        log.info("form = {}", form);
        if (result.hasErrors()) {
            throw new BindException(result);
        }
        todoService.nextStepTodo(new TodoVO(form.getTodoNum(), form.getTodoProgress()));

        //삭제
        return Map.of("result", "success");
    }
    @PatchMapping("/modify")
    public Map<String ,Object> modifyTodo(@Validated @RequestBody ModifyTodoForm form, BindingResult result, @PathVariable Integer studyNum) throws BindException {
        log.info("form = {}", form);
        if (result.hasErrors()) {
            throw new BindException(result);
        }
        todoService.modifyTodo(new TodoVO(form.getTodoNum(), form.getTodoContent()));

        //삭제
        return Map.of("result", "success");
    }
    @DeleteMapping
    public Map<String ,Object> deleteTodo(  @RequestBody Map<String,Integer> map, BindingResult result, @PathVariable Integer studyNum) {
        log.info("memNum = {}", map);
        todoService.deleteTodo(map.get("todoNum"));

        //삭제
        return Map.of("result", "success");
    }

    @GetMapping("/find")
    public List<FindTodoForm> findTodos(@Login MemberVO member, @PathVariable Integer studyNum) {


        List<FindTodoForm> findTodoForms = todoService.selectTodos(member.getMem_num(), studyNum).stream()
                .map(todoVO -> new FindTodoForm(todoVO.getTodoNum(), todoVO.getTodoContent(), todoVO.getTodoProgress()))
                .collect(Collectors.toList());
        return findTodoForms;
    }
}
