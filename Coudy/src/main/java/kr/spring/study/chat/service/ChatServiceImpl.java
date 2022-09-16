package kr.spring.study.chat.service;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.chat.dao.ChatMapper;
import kr.spring.study.chat.vo.ChatRoomVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {
    private final ChatMapper chatMapper;
    @Override
    public List<ChatRoomVO> findAllRoomByUser(int memNum) {
        return chatMapper.selectChatRoomsByUser(memNum);
    }

    @Override
    public ChatRoomVO findChatRoomByChatNum(int chatNum) {
        return chatMapper.selectChatRoomByChatNum(chatNum);
    }

    @Override
    public List<MemberVO> selectChatRoomMembers(int chatNum) {
        return chatMapper.selectChatRoomMembers(chatNum);
    }

    @Override
    public void createChatRoom(ChatRoomVO chatRoomVO,List<MemberVO> members) {
        int chatNum = chatMapper.selectChatSeq();
        chatMapper.createChatRoom(new ChatRoomVO(chatNum,chatRoomVO.getChatName()));
        log.info("members = {}", members);
        members.stream().forEach(member -> chatMapper.createChatMember(chatNum,member));
    }
}
