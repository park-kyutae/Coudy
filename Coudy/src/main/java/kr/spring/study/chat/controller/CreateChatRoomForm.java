package kr.spring.study.chat.controller;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class  CreateChatRoomForm {
    private String chatName;
    private String mem_num;
}
