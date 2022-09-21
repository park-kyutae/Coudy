package kr.spring.study.todo.controller;


import kr.spring.study.plan.artgumentResolver.Login;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/study/todo")
public class TodoController {
    @GetMapping("/{studyNum}")
    public String studyMain(@Login Integer memNum, @PathVariable Integer studyNum) {



        return "todo";
    }

}
