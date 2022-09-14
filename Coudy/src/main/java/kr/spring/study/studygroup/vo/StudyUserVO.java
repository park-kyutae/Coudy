package kr.spring.study.studygroup.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudyUserVO {
    private int study_user_num;
    private char registered;
    private char is_group_manager;
    private int study_num;
    private int mem_num;
}
