package kr.spring.study.studygroup.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.NotEmpty;

import java.util.Date;

@Getter
@Setter
@ToString
public class StudyGroupReviewVO {
    private int study_review_num;
    private String content;
    private Date reg_date; //등록일
    private Date modify_date; //수정일
    private String filename;//파일명
    private String studygroup_review_ip; //ip주소
    private int mem_num;
    private int study_num;

    private String id; //아이디
    private String nick_name;//별명

}
