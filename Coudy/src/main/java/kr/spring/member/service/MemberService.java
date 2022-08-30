package kr.spring.member.service;

import kr.spring.member.vo.MemberVO;

public interface MemberService {

	//회원관리 - 일반회원

	public int selectMem_num();
	
	public void insertMember(MemberVO member);
	public MemberVO selectCheckMember(MemberVO member);
	public MemberVO selectMember(Integer mem_num);
	public void updateMember(MemberVO member);
	public void updatePasswd(MemberVO member);
	public void deleteMember(Integer mem_num);
	
	
	
}
