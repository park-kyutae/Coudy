package kr.spring.study.todo.service;

import kr.spring.study.plan.vo.PlanVO;
import kr.spring.study.todo.controller.FindTodoForm;
import kr.spring.study.todo.vo.TodoVO;

import java.util.List;


public interface TodoService {

    void createTodo(TodoVO todoVO);
    void nextStepTodo(TodoVO todoVO);
    void modifyTodo(TodoVO todoVO);
    void deleteTodo(int todoNum);

    List<TodoVO> selectTodos(int memNum, int studyNum);
}
