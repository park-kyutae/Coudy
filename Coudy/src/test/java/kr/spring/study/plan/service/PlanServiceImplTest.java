package kr.spring.study.plan.service;

import kr.spring.study.plan.vo.PlanVO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest
@Transactional
class PlanServiceImplTest {

    @Autowired
    PlanService planService;

    @Test
    public void 일정_등록() throws Exception {
        //given
        //when

        //then

    }
}