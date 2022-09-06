package kr.spring.study.plan.controller;


import lombok.*;

import javax.validation.constraints.*;
import java.util.Date;

@Getter
@Setter
@ToString
public class CreatePlanForm {
    @NotBlank
    @Size(max = 20)
    private  String planContent;
    @Pattern(regexp = "^20[0-9][0-9]-(0?[0-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01])$")
    private  String planStartDate;
    @Pattern(regexp = "^20[0-9][0-9]-(0?[0-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01])$")
    private  String planEndDate;
    @Pattern(regexp = "^[a-fA-F0-9]{6}$")
    private  String planColor;
    private boolean planIsShared;

}
