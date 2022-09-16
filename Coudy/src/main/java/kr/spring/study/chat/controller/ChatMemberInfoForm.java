package kr.spring.study.chat.controller;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ChatMemberInfoForm {
    private int memNum;
    private String memName;
}
