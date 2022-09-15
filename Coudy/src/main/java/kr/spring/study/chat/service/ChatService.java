package kr.spring.study.chat.service;


import kr.spring.member.vo.MemberVO;
import kr.spring.study.chat.vo.ChatRoomVO;

import java.util.List;

public interface ChatService {
    List<ChatRoomVO> findAllRoomByUser(int memNum);

    ChatRoomVO findChatRoomByChatNum(int chatNum);

    List<MemberVO> selectChatRoomMembers(int chatNum);

    void createChatRoom(ChatRoomVO chatRoomVO,List<MemberVO> members);
}
