package kr.spring.study.plan.controller;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UpdatePlanForm {
    private int planNum;
    private  String planContent;
    private  String planStartDate;
    private  String planEndDate;
    private  String planColor;
    private boolean planIsCompleted;
    private boolean planIsShared;
}
