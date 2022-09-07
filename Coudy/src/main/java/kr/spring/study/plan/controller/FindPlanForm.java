package kr.spring.study.plan.controller;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class FindPlanForm {
        private Integer planNum;
        private int studyNum;
        private String planContent;
        private String  planStartDate;
        private String  planEndDate;
        private String planColor;
        private int memNum;
        private boolean planIsCompleted;
        private boolean planIsShared;

    }
