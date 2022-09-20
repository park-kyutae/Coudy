package kr.spring.study.chat.controller;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.study.chat.message.ChatFileMessage;
import kr.spring.study.chat.message.ChatTextMessage;
import kr.spring.study.chat.service.ChatService;
import kr.spring.study.chat.service.FileStore;
import kr.spring.study.chat.vo.ChatFileLogVO;
import kr.spring.study.chat.vo.ChatTextLogVO;
import kr.spring.study.plan.artgumentResolver.Login;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ChatStompController {
    private final SimpMessagingTemplate template;
    private final ChatService chatService;
    private final MemberService memberService;


    @MessageMapping("/chat/text/{chatNum}")
    public void send(@DestinationVariable Integer chatNum, @Payload ChatTextMessage chatTextMessage) {


        chatService.createChatMessage(new ChatTextLogVO(chatTextMessage.getMemNum(), chatTextMessage.getPayload(), chatNum));

        log.info("chatTextMessage = {}", chatTextMessage);
        template.convertAndSend("/sub/chat/text/" + chatNum, chatTextMessage);
    }

    @ResponseBody
    @PostMapping("/chat/file/{chatNum}")
    public Map<String, Object> sendFile(@Login Integer memNum, @PathVariable Integer chatNum, @ModelAttribute ChatFileForm chatFile)
            throws IOException, NoSuchAlgorithmException {
        MultipartFile file = chatFile.getChatFile();
        String hash = FileStore.getHash(file);

        MemberVO member = memberService.selectMember(memNum);
        int logNum = chatService.getChatFileLogSEQ();
        ChatFileLogVO chatFileVO = new ChatFileLogVO(logNum,memNum, file.getOriginalFilename(), hash, chatNum);
        chatService.saveFile(chatFileVO, file);


        template.convertAndSend("/sub/chat/file/" + chatNum, new ChatFileMessage(memNum, member.getName(),
                 LocalDateTime.now(),chatFileVO.getChatFileName(), logNum));

        return Map.of("result","success");
    }

}
