package kr.spring.study.plan.controller;


import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
public class CreatePlanForm {
    private  String planContent;
    private  String planStartDate;
    private  String planEndDate;
    private  String planColor;
    private boolean planIsShared;
}
