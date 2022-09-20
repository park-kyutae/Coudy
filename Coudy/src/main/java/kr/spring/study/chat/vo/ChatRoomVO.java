package kr.spring.study.chat.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ChatRoomVO {

    private int chatNum;
    private String chatName;

    public ChatRoomVO(String chatName) {
        this.chatName = chatName;
    }

    public ChatRoomVO(int chatNum) {
        this.chatNum = chatNum;
    }
}
