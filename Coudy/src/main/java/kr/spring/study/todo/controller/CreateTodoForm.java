package kr.spring.study.todo.controller;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@Setter
@ToString
public class CreateTodoForm {
    @Size(max = 15)
    @NotBlank
    private String todoContent;

}
