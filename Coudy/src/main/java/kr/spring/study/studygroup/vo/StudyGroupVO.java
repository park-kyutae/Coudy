package kr.spring.study.studygroup.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;


@Getter
@Setter
@ToString
public class StudyGroupVO {

    private int study_num;
    private char registered;
    private char is_group_manager;
    private String stack;
    private String name;
    private String description;
    private String location;
    //private String pic;//파일명
    private int limit;
    private int total;
    private String purpose;
    private Date limit_date; //등록일
    private Date start_date; //시작일
    private Date end_date; //종료일
    private Date modify_date; //수정일
    private Date reg_date; //등록일
    //private byte[] uploadfile;//파일

    //private String ip; //ip주소

    //private String id; //회원아이디
    //private String nick_name;//회원별명
    //private byte[] photo;//프로필 사진
    //private String photo_name;//프로필 사진명

    private int mem_num;
}
