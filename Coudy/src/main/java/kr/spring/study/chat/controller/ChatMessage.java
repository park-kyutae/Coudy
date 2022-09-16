package kr.spring.study.chat.controller;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatMessage {
    private int memNum;
    private String  memName;
    private String payload;
    private int chatNum;
}
