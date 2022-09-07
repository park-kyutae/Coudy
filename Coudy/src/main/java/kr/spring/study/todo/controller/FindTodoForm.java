package kr.spring.study.todo.controller;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class FindTodoForm {

    private int todoNum;
    private String todoContent;
    private int todoProgress;

}
