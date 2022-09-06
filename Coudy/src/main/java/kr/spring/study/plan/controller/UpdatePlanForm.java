package kr.spring.study.plan.controller;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;

@Getter
@Setter
@ToString
public class UpdatePlanForm {
    @NotNull
    private int planNum;
    @NotBlank
    @Size(max = 20)
    private  String planContent;
    @Pattern(regexp = "^20[0-9][0-9]-(0?[0-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01])$")
    private  String planStartDate;
    @Pattern(regexp = "^20[0-9][0-9]-(0?[0-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01])$")
    private  String planEndDate;
    @Pattern(regexp = "^[a-fA-F0-9]{6}$")
    private  String planColor;
    @NotNull
    private boolean planIsCompleted;
    private boolean planIsShared;
}
