package kr.spring.study.chat.vo;

import lombok.Getter;
import org.springframework.web.socket.WebSocketSession;

import java.util.List;
import java.util.Map;

@Getter
public class ChatRoomStore {
    Map<Integer,WebSocketSession> sessions;


    boolean findAllSession(Integer chatNum) {
        return sessions.containsKey(chatNum);
    }

}
