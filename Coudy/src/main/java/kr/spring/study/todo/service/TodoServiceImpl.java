package kr.spring.study.todo.service;

import kr.spring.study.plan.dao.PlanMapper;
import kr.spring.study.plan.vo.PlanVO;
import kr.spring.study.todo.controller.FindTodoForm;
import kr.spring.study.todo.dao.TodoMapper;
import kr.spring.study.todo.vo.TodoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class TodoServiceImpl implements TodoService {
    private final TodoMapper todoMapper;

    @Override
    public void createTodo(TodoVO todoVO) {
        todoMapper.createTodo(todoVO);
    }

    @Override
    public List<TodoVO> selectTodos(Integer memNum, Integer studyNum) {
        return todoMapper.selectTodos(memNum, studyNum);
    }
}
