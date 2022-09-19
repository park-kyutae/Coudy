package kr.spring.study.chat.message;

import kr.spring.member.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@ToString
public class ChatFileMessage extends ChatMessage{
    private String originalFileName;
    private int logNum;

    public ChatFileMessage(int memNum, String memName, LocalDateTime chatTime, String originalFileName, int logNum) {
        super(memNum, memName, chatTime);
        this.originalFileName = originalFileName;
        this.logNum = logNum;
    }
}
