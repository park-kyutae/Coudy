package kr.spring;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.studygroup.dao.StudyGroupMapper;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.lang.reflect.Member;
import java.util.Date;

@SpringBootTest
class SpringProjectApplicationTests {


	private StudyGroupMapper studyGroupMapper;

	 @Test
	     public void hello(){
		 StudyGroupVO studyGroupVO = new StudyGroupVO();
		 MemberVO memberVO= new MemberVO();
		 memberVO.setMem_num(111);
		 Date nowDate = new Date();
	         //given
	 		studyGroupVO.setDescription("asdf");
			 studyGroupVO.setLimit(12);
			 studyGroupVO.setLocation("locate");
			 studyGroupVO.setName("name");
			 studyGroupVO.setStack("java");
			 studyGroupVO.setPurpose("purpose");
			 studyGroupVO.setMem_num(memberVO.getMem_num());

		 studyGroupMapper.insertStudyGroup(studyGroupVO);

	         //when

	         //then

	     }

}
