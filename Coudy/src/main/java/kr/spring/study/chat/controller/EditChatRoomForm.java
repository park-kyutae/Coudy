package kr.spring.study.chat.controller;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class  EditChatRoomForm {
    private String chatName;
    private int chatNum;
    private String  mem_num;
}
