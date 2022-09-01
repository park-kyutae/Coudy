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
    private int board_num;//게시판 번호
    @NotEmpty
    private String title;//제목
    @NotEmpty
    private String content;//내용
    private int hit;//조회수
    private Date reg_date; //등록일
    private Date modify_date; //수정일
    private byte[] uploadfile;//파일
    private String filename;//파일명
    private String ip; //ip주소
    private int mem_num; //회원번호

    private String id; //회원아이디
    private String nick_name;//회원별명
    private byte[] photo;//프로필 사진
    private String photo_name;//프로필 사진명
}
