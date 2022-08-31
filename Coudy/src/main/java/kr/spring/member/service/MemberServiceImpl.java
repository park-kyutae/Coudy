package kr.spring.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public int selectMem_num() {
		return memberMapper.selectMem_num();
	}

	@Override
	public void insertMember(MemberVO member) {
		member.setMem_num(memberMapper.selectMem_num());
		memberMapper.insertMember_detail(member); //엄마 
		memberMapper.insertMember(member); //자식 
		
	}

	@Override
	public MemberVO selectCheckMember(MemberVO member) {
		return null;
	}

	@Override
	public MemberVO selectMember(Integer mem_num) {
		return null;
	}

	@Override
	public void updateMember(MemberVO member) {
		
	}

	@Override
	public void updatePasswd(MemberVO member) {
		
	}

	@Override
	public void deleteMember(Integer mem_num) {
		
	}


}
