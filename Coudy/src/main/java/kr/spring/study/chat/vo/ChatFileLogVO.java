package kr.spring.study.chat.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
public class ChatFileLogVO  {
    private int chatFileLogNum;
    private int memNum;
    private String chatFileName;
    private String chatFileHash;
    private int chatNum;
    private LocalDateTime chatFileTime;
    private String memName;


    public ChatFileLogVO(int chatFileLogNum, int memNum, String chatFileName, String chatFileHash, int chatNum) {
        this.chatFileLogNum = chatFileLogNum;
        this.memNum = memNum;
        this.chatFileName = chatFileName;
        this.chatFileHash = chatFileHash;
        this.chatNum = chatNum;
    }

    public ChatFileLogVO(int chatFileLogNum, int memNum, String chatFileName, String chatFileHash, int chatNum, LocalDateTime chatFileTime) {
        this.chatFileLogNum = chatFileLogNum;
        this.memNum = memNum;
        this.chatFileName = chatFileName;
        this.chatFileHash = chatFileHash;
        this.chatNum = chatNum;
        this.chatFileTime = chatFileTime;
    }
}
