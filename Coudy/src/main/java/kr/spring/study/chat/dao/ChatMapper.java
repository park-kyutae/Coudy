package kr.spring.study.chat.dao;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.chat.vo.ChatRoomVO;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface ChatMapper {
    @Select("select CHAT.* from CHAT join CHAT_MEMBER CM on CHAT.CHAT_NUM = CM.CHAT_NUM where MEM_NUM = #{memNum}")
    List<ChatRoomVO> selectChatRoomsByUser(int memNum);
    @Select("select CHAT.* from CHAT where CHAT_NUM = #{chatNum}")
    ChatRoomVO selectChatRoomByChatNum(int chatNum);
    @Select("select CM.MEM_NUM,NAME from MEMBER_DETAIL join CHAT_MEMBER CM on MEMBER_DETAIL.MEM_NUM = CM.MEM_NUM where CHAT_NUM = #{chatNum}")
    List<MemberVO> selectChatRoomMembers(int chatNum);


    @Select("select chat_seq.nextval from DUAL")
    int selectChatSeq();

    @Insert("insert into CHAT values (#{chatNum},#{chatName})")
    void createChatRoom(ChatRoomVO chatRoomVO);

    @Insert("insert into CHAT_MEMBER values (#{chatNum},#{memberVO.mem_num})")
    void createChatMember(int chatNum,MemberVO memberVO);
}
