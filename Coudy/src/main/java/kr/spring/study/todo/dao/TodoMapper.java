package kr.spring.study.todo.dao;

import kr.spring.study.plan.vo.PlanVO;
import kr.spring.study.todo.vo.TodoVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TodoMapper {
    @Select("select TODO_NUM, TODO_CONTENT, TODO_PROGRESS from STUDY_TODO where MEM_NUM=#{memNum} and STUDY_NUM=#{studyNum}")
    List<TodoVO> selectTodos(int memNum, int studyNum);
    @Select("select TODO_NUM, TODO_CONTENT, TODO_PROGRESS from STUDY_TODO where STUDY_NUM=#{studyNum} and MEM_NUM=#{memNum} and TODO_PROGRESS=1")
    List<TodoVO> selectProgressingTodos(int studyNum,int memNum);

    @Update("update STUDY_TODO set TODO_PROGRESS=#{todoProgress} where TODO_NUM=#{todoNum}")
    void updateProgressTodo(TodoVO todoVO);
    @Update("update STUDY_TODO set TODO_CONTENT=#{todoContent} where TODO_NUM=#{todoNum}")
    void modifyTodo(TodoVO todoVO);
    @Insert("INSERT INTO STUDY_TODO (TODO_NUM, TODO_CONTENT, MEM_NUM, STUDY_NUM) values (STUDY_TODO_SEQ.nextval,#{todoContent},#{memNum},#{studyNum})")
    void createTodo(TodoVO todoVO);

    @Delete("DELETE STUDY_TODO where TODO_NUM=#{todoNum}")
    void deleteTodo(int todoNum);
}
