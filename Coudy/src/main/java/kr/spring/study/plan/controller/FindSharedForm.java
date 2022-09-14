package kr.spring.study.plan.controller;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;
import org.apache.ibatis.annotations.Select;

import java.util.Date;

@Getter
@AllArgsConstructor
@ToString
public class FindSharedForm {

        private int planNum;
        private String planContent;
        @JsonFormat(pattern = "yyyy-MM-dd")
        private Date planStartDate;
        @JsonFormat(pattern = "yyyy-MM-dd")
        private Date  planEndDate;
        private String planColor;
        private boolean planIsCompleted;

}
