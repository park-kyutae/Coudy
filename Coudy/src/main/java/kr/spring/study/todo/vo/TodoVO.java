package kr.spring.study.todo.vo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
public class TodoVO {
    private int todoNum;
    private String todoContent;
    private int todoProgress;
    private int memNum;
    private int studyNum;

    public TodoVO(String todoContent, int memNum, int studyNum) {
        this.todoContent = todoContent;
        this.memNum = memNum;
        this.studyNum = studyNum;
    }
    public TodoVO(int todoNum, int todoProgress) {
        this.todoNum = todoNum;
        this.todoProgress = todoProgress;
    }
    public TodoVO(int )
    //매퍼 생성자
    public TodoVO(int todoNum, String todoContent, int todoProgress) {
        this.todoNum = todoNum;
        this.todoContent = todoContent;
        this.todoProgress = todoProgress;
    }
}
