package kr.spring.study.plan.controller;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import java.util.Date;

@Getter
@AllArgsConstructor
@ToString
public class FindPlanForm {
        private int planNum;
//        private int studyNum;
        private String planContent;
        @JsonFormat(pattern = "yyyy-MM-dd")
        private Date planStartDate;
        @JsonFormat(pattern = "yyyy-MM-dd")
        private Date  planEndDate;
        private String planColor;
        private int memNum;
        private boolean planIsCompleted;
        private boolean planIsShared;

    }
