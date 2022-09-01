package kr.spring.study.plan.vo;

import lombok.*;

import java.sql.Date;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
public class PlanVO {
    private Integer planNum;
    private int studyNum;
    private String planContent;
    private String  planStartDate;
    private String  planEndDate;
    private String planColor;
    private int memNum;
    private boolean planIsCompleted;
    private boolean planIsShared;

    public PlanVO(int studyNum, String planContent, String planStartDate, String planEndDate, String planColor, int memNum, boolean planIsShared) {
        this.studyNum = studyNum;
        this.planContent = planContent;
        this.planStartDate = planStartDate;
        this.planEndDate = planEndDate;
        this.planColor = planColor;
        this.memNum = memNum;
        this.planIsShared = planIsShared;
    }
}
