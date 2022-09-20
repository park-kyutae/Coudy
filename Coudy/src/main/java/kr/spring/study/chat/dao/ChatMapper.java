package kr.spring.study.chat.dao;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.chat.vo.ChatFileLogVO;
import kr.spring.study.chat.vo.ChatTextLogVO;
import kr.spring.study.chat.vo.ChatRoomVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

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
    void createChatMember(int chatNum, MemberVO memberVO);

    @Select("select count(*) from CHAT_MEMBER where CHAT_NUM=#{chatNum}")
    int selectChatMemCount(int chatNum);

    @Delete("delete CHAT_MEMBER where MEM_NUM = #{memNum} and CHAT_NUM=#{chatNum}")
    void deleteChatMember(int memNum, int chatNum);

    @Delete("delete CHAT where CHAT_NUM = #{chatNum}")
    void deleteChatRoom(int chatNum);

    @Update("UPDATE CHAT set CHAT_NAME=#{chatName} where CHAT_NUM=#{chatNum}")
    void updateChatName(ChatRoomVO chatRoomVO);

    @Select("select MEM_NUM,NAME from MEMBER_DETAIL where REGEXP_LIKE(name,#{searchWord}) and rownum <= 100")
    List<MemberVO> selectMemberByName(String searchWord);

    @Insert("INSERT INTO CHAT_LOG values (CHAT_LOG_SEQ.nextval,#{memNum},#{chatMessage},#{chatNum},SYSDATE)")
    void createChatMessage(ChatTextLogVO chatTextLogVO);

    @Select("select CHAT_LOG.*,MD.NAME from CHAT_LOG join MEMBER_DETAIL MD on CHAT_LOG.MEM_NUM = MD.MEM_NUM where CHAT_NUM=#{chatNum}")
    List<ChatTextLogVO> selectChatMessagesByChatNum(int chatNum);

    @Select("select count(*) from CHAT_FILE_STORE where CHAT_FILE_HASH=#{chatFileHash}")
    int countFileHash(String chatFileHash);

    @Insert("insert into CHAT_FILE_LOG values (#{chatFileLogNum},#{memNum},#{chatFileName},#{chatFileHash}" +
            ",#{chatNum},SYSDATE)")
    void insertFileLog(ChatFileLogVO chatFileLogVO);
    @Insert("insert into CHAT_FILE_STORE values (#{chatFileHash})")
    void insertFile(String hash);

    @Select("select CHAT_FILE_LOG.*,MD.NAME from CHAT_FILE_LOG join MEMBER_DETAIL MD on CHAT_FILE_LOG.MEM_NUM = MD.MEM_NUM where CHAT_NUM=#{chatNum}")
    List<ChatFileLogVO> selectAllFilesByChatNum(int chatNum);

    @Select("select * from CHAT_FILE_LOG where CHAT_FILE_LOG_NUM=#{logNum}")
    ChatFileLogVO selectFileByLogNum(int logNum);

    @Select("select CHAT_FILE_LOG_SEQ.nextval from dual")
    int selectChatFileLogSeq();
    @Select("select * from (select CHAT_LOG.*,MD.NAME from CHAT_LOG join MEMBER_DETAIL MD on CHAT_LOG.MEM_NUM = MD.MEM_NUM order by CHAT_TIME desc ) where CHAT_NUM=#{chatNum} and ROWNUM = 1")
    ChatTextLogVO selectLatestChatMessagesByChatNum(int chatNum);
    @Select("select * from (select CHAT_FILE_LOG.*,MD.NAME from CHAT_FILE_LOG join MEMBER_DETAIL MD on CHAT_FILE_LOG.MEM_NUM = MD.MEM_NUM order by CHAT_FILE_TIME desc)" +
            " where CHAT_NUM=#{chatNum} and ROWNUM =1")
    ChatFileLogVO selectLatestFilesByChatNum(int chatNum);



}
