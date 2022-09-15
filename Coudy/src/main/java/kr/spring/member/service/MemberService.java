package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import kr.spring.member.vo.MemberVO;

public interface MemberService {

	//회원관리 - 일반회원

	public int selectMem_num();
	
	public void insertMember(MemberVO member);
	public MemberVO selectCheckMember(String id);
	public MemberVO selectMember(Integer mem_num);
	public void updateMember(MemberVO member);
	public void updatePasswd(MemberVO member);
	
	public void deleteMember(Integer mem_num);
 
	
	//프로필 사진 업데이트 
	public void updateProfile(MemberVO member);
	
	//======관리자======//
	public int selectRowCount(Map<String,Object> map);
	public List<MemberVO> selectList(Map<String,Object> map);
	public void updateByAdmin(MemberVO member);

	
	
}
