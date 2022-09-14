package kr.spring.study.plan.controller;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;
import java.util.Date;

@Getter
@ToString
public class UpdatePlanForm {
    //    @NotNull
    private int planNum;
    @NotBlank
    @Size(max = 20)
    private String planContent;
    //    @NotBlank
//    @Pattern(regexp = "^20[0-9][0-9]-(0?[0-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01])$")
    @NotNull
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date planStartDate;
    //    @NotBlank
//    @Pattern(regexp = "^20[0-9][0-9]-(0?[0-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01])$")
    @NotNull
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date planEndDate;
    @NotBlank
    @Pattern(regexp = "^[a-fA-F0-9]{6}$")
    private String planColor;
    //    @NotNull
    private boolean planIsCompleted;
    //    @NotNull
    private boolean planIsShared;
}
