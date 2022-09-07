package kr.spring.study.todo.service;

import kr.spring.study.plan.vo.PlanVO;
import kr.spring.study.todo.controller.FindTodoForm;
import kr.spring.study.todo.vo.TodoVO;

import java.util.List;


public interface TodoService {

    void createTodo(TodoVO todoVO);

    List<TodoVO> selectTodos(Integer memNum, Integer studyNum);
}
