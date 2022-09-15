package kr.spring.study.todo.controller;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

@Getter
@Setter
@ToString
public class NextStepTodo {
    private int todoNum;
    @Min(0)
    @Max(2)
    private int todoProgress;

}
