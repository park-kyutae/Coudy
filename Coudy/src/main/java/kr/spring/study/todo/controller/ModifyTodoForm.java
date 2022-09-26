package kr.spring.study.todo.controller;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Map;

@Getter
@ToString
@AllArgsConstructor
public class ModifyTodoForm {

    private int todoNum;
    @Size(max = 30)
    @NotBlank
    private String todoContent;
}
