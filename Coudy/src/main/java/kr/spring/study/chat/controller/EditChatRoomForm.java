package kr.spring.study.chat.controller;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Getter
@Setter
@ToString
public class  EditChatRoomForm {
    @NotBlank
    private String chatName;
    @NotNull
    private int chatNum;
    private String  mem_num;
}
