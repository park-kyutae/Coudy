package kr.spring.study.chat.message;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
public class ChatTextMessage extends ChatMessage{
    private String payload;

    public ChatTextMessage(int memNum, String memName, LocalDateTime chatTime, String payload) {
        super(memNum, memName, chatTime);
        this.payload = payload;
    }
}
