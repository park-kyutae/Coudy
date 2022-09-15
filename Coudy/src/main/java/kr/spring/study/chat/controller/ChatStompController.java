package kr.spring.study.chat.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.spring.study.plan.artgumentResolver.Login;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ChatStompController {
    private final SimpMessagingTemplate template;

    @MessageMapping("/chat/send")
    public void send(ChatMessage chatMessage) {
        chatMessage.setPayload(chatMessage.getPayload());

        log.info("chatMessage = {}", chatMessage);
        template.convertAndSend("/sub/chat/text/"+chatMessage.getChatNum(),chatMessage);
    }
}
