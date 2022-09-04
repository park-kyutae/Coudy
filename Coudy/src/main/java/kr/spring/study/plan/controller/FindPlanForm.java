package kr.spring.study.plan.controller;

import lombok.*;

@Getter
@ToString
@AllArgsConstructor
public class FindPlanForm {
    private int planNum;
    private String planContent;
    private String  planStartDate;
    private String  planEndDate;
    private String planColor;
    private Integer memNum;
    private boolean planIsCompleted;
    private boolean planIsShared;
}
