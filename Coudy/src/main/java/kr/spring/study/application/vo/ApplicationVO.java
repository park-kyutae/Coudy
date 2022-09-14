package kr.spring.study.application.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApplicationVO {

    private int application_num;
    private String career;
    private String meet_time;
    private String request;

    private int study_num;
    private int mem_num;
}
