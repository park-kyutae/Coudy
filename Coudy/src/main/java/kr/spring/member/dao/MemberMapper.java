package kr.spring.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {

	@Select("SELECT member_seq.nextval FROM dual")
	public int selectMem_num();
	
	@Insert("INSERT INTO member (mem_num) VALUES (#{mem_num})")
	public void insertMember(MemberVO member);
	
	@Insert("INSERT INTO member_detail (mem_num, name, passwd, phone, email, "
			+ "zipcode, address1,address2,id) "
			+ "VALUES(#{mem_num},#{name},#{passwd},#{phone},#{email}, "
			+ "#{zipcode},#{address1},#{address2},#{id})")
	public void insertMember_detail(MemberVO member);
	
	
	public MemberVO selectCheckMember(MemberVO member);
	
	
	public MemberVO selectMember(Integer mem_num);
	public void updateMember(MemberVO member);
	public void updatePasswd(MemberVO member);
	public void deleteMember(Integer mem_num);
}
