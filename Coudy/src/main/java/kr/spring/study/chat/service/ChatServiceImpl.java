package kr.spring.study.chat.service;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.chat.dao.ChatMapper;
import kr.spring.study.chat.vo.ChatFileLogVO;
import kr.spring.study.chat.vo.ChatTextLogVO;
import kr.spring.study.chat.vo.ChatRoomVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {
    private final ChatMapper chatMapper;
    private final FileStore fileStore;

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
    public void createChatRoom(ChatRoomVO chatRoomVO, List<MemberVO> members) {
        int chatNum = chatMapper.selectChatSeq();
        chatMapper.createChatRoom(new ChatRoomVO(chatNum, chatRoomVO.getChatName()));
        log.info("members = {}", members);
        members.stream().forEach(member -> chatMapper.createChatMember(chatNum, member));
    }

    @Override
    public void quitChatRoom(MemberVO memberVO, ChatRoomVO chatRoomVO) {
        int memNum = memberVO.getMem_num();
        int chatNum = chatRoomVO.getChatNum();
        log.info("chatNum = {}, memNum = {}", chatNum, memNum);
        chatMapper.deleteChatMember(memNum, chatNum);

        int chatMemberCount = chatMapper.selectChatMemCount(chatNum);
        if (chatMemberCount < 2) {
            chatMapper.deleteChatRoom(chatNum);
        }
    }

    @Override
    public List<MemberVO> searchMemberByMemberName(String searchWord) {
        return chatMapper.selectMemberByName(".*" + searchWord + ".*");
    }

    @Override
    public void updateChatName(ChatRoomVO chatRoomVO,List<MemberVO> members) {
        int chatNum = chatRoomVO.getChatNum();
        chatMapper.updateChatName(chatRoomVO);
        members.stream().forEach(member -> chatMapper.createChatMember(chatNum, member));
    }

    @Override
    public void createChatMessage(ChatTextLogVO chatTextLogVO) {
        chatMapper.createChatMessage(chatTextLogVO);
    }

    @Override
    public List<ChatTextLogVO> findMessagesByChatNum(int chatNum) {
        return chatMapper.selectChatMessagesByChatNum(chatNum);
    }
    @Override
    public List<ChatFileLogVO> findFilesByChatNum(int chatNum) {
        return chatMapper.selectAllFilesByChatNum(chatNum);
    }
    @Override
    public int getChatFileLogSEQ() {
        return chatMapper.selectChatFileLogSeq();
    }

    @Override
    public void saveFile(ChatFileLogVO chatFileVO, MultipartFile file) throws IOException, NoSuchAlgorithmException {
        String hash = chatFileVO.getChatFileHash();
        if (chatMapper.countFileHash(hash) == 0) {
            fileStore.storeFile(file,hash);
            chatMapper.insertFile(hash);
        }
        chatMapper.insertFileLog(chatFileVO);

    }

    @Override
    public ChatFileLogVO findFileByLogNum(int logNum) {
        return chatMapper.selectFileByLogNum(logNum);
    }
}
