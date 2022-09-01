package kr.spring.study.plan.controller;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class FindPlanForm {
    private final int planNum;
    private final String planContent;
    private final String  planStartDate;
    private final String  planEndDate;
    private final String planColor;
    private final Integer memNum;
    private final boolean planIsCompleted;
    private final boolean planIsShared;
}
