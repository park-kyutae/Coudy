package kr.spring.study.chat.message;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
@AllArgsConstructor
public abstract class ChatMessage {
    private int memNum;
    private String memName;
    private LocalDateTime chatTime;

}
