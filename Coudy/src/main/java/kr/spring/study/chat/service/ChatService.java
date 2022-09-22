package kr.spring.study.chat.service;


import kr.spring.member.vo.MemberVO;
import kr.spring.study.chat.vo.ChatFileLogVO;
import kr.spring.study.chat.vo.ChatTextLogVO;
import kr.spring.study.chat.vo.ChatRoomVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

public interface ChatService {
    List<ChatRoomVO> findAllRoomByUser(int memNum);

    ChatRoomVO findChatRoomByChatNum(int chatNum);

    List<MemberVO> selectChatRoomMembers(int chatNum);

    void createChatRoom(ChatRoomVO chatRoomVO,List<MemberVO> members);

    void quitChatRoom(MemberVO memberVO, ChatRoomVO chatRoomVO);

    List<MemberVO> searchMemberByMemberName(String searchWord);

    void updateChatName(ChatRoomVO chatRoomVO,List<MemberVO> members);

    void createChatMessage(ChatTextLogVO chatTextLogVO);

    List<ChatTextLogVO> findMessagesByChatNum(int chatNum);

    List<ChatFileLogVO> findFilesByChatNum(int chatNum);



    List<ChatTextLogVO> findConvertedFilesByChatNum(int chatNum);

    int getChatFileLogSEQ();

    void saveFile(ChatFileLogVO chatFileVO, MultipartFile file) throws IOException, NoSuchAlgorithmException;


    ChatFileLogVO findFileByLogNum(int logNum);

    Map<ChatRoomVO, ChatTextLogVO> findLatestMessageEachRoom(int memNum);
}
