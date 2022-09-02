package kr.spring.study.studygroup.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.NotEmpty;

import java.util.Date;

@Getter
@Setter
@ToString
public class StudyGroupVO {

    private int study_num;
    @NotEmpty
    private String stack;
    @NotEmpty
    private String name;
    private String description;
    private String location;
    private int limit;
    private String purpose;
    private String picname;//프로필사진 이름
    private Date limit_date; //등록일
    private Date reg_date; //등록일
    private Date satrt_date; //시작일
    private Date end_date; //종료일
    private Date modify_date; //수정일
    private byte[] uploadfile;//파일
    private String filename;//파일명
    private String ip; //ip주소

    private String id; //회원아이디
    private String nick_name;//회원별명
    private byte[] photo;//프로필 사진
    private String photo_name;//프로필 사진명

    private int member_num;
}
