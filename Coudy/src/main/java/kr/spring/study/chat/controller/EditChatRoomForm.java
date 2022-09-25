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
    @NotBlank
    @Pattern(regexp = "^[[0-9],]*[0-9]$")
    private String  mem_num;
}
