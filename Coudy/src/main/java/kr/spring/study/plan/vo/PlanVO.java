package kr.spring.study.plan.vo;

import lombok.*;

import java.util.Date;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
public class PlanVO {
    private int planNum;
    private int studyNum;
    private String planContent;
    private Date planStartDate;
    private Date planEndDate;
    private String planColor;
    private int memNum;
    private boolean planIsCompleted;
    private boolean planIsShared;

    public PlanVO(int planNum, String planContent, Date planStartDate, Date planEndDate, String planColor, int memNum, boolean planIsCompleted, boolean planIsShared) {
        this.planNum = planNum;
        this.planContent = planContent;
        this.planStartDate = planStartDate;
        this.planEndDate = planEndDate;
        this.planColor = planColor;
        this.memNum = memNum;
        this.planIsCompleted = planIsCompleted;
        this.planIsShared = planIsShared;
    }
//    public PlanVO(int planNum, Date planStartDate, Date planEndDate, String planColor, int memNum, boolean planIsCompleted, boolean planIsShared) {
//        this.planNum = planNum;
//        this.planStartDate = planStartDate;
//        this.planEndDate = planEndDate;
//        this.planColor = planColor;
//        this.memNum = memNum;
//        this.planIsCompleted = planIsCompleted;
//        this.planIsShared = planIsShared;
//    }

    public PlanVO(int planNum, String planContent, Date planStartDate, Date planEndDate, String planColor, boolean planIsCompleted) {
        this.planNum = planNum;
        this.planContent = planContent;
        this.planStartDate = planStartDate;
        this.planEndDate = planEndDate;
        this.planColor = planColor;
        this.planIsCompleted = planIsCompleted;
    }


    public PlanVO(int studyNum, String planContent, Date planStartDate, Date planEndDate, String planColor, int memNum, boolean planIsShared) {
        this.studyNum = studyNum;
        this.planContent = planContent;
        this.planStartDate = planStartDate;
        this.planEndDate = planEndDate;
        this.planColor = planColor;
        this.memNum = memNum;
        this.planIsShared = planIsShared;
    }
}
