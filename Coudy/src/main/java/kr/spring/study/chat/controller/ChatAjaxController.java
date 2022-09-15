package kr.spring.study.chat.controller;

import kr.spring.study.chat.service.ChatService;
import kr.spring.study.todo.vo.TodoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatAjaxController {
    private final ChatService chatService;

}
