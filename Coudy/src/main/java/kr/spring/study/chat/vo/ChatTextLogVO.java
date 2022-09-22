package kr.spring.study.chat.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
public class ChatTextLogVO  {
    private int chatLogNum;

    private int memNum;
    private String chatMessage;

    private int chatNum;
    private LocalDateTime chatTime;
    private String memName;



    public ChatTextLogVO(int memNum, String chatMessage, int chatNum) {
        this.memNum = memNum;
        this.chatMessage = chatMessage;
        this.chatNum = chatNum;
    }
}
