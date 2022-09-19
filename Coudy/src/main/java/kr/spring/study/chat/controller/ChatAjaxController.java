package kr.spring.study.chat.controller;

import kr.spring.member.vo.MemberVO;
import kr.spring.study.chat.service.ChatService;
import kr.spring.study.plan.artgumentResolver.Login;
import kr.spring.study.todo.vo.TodoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatAjaxController {
    private final ChatService chatService;

    @GetMapping("/search-member/{searchWord}")
    public List<SearchMemberResult> searchMember(@Login Integer memNum, @PathVariable String searchWord) {


        List<SearchMemberResult> results = chatService.searchMemberByMemberName(searchWord).stream()
                .map(member -> new SearchMemberResult(member.getMem_num(), member.getName()))
                .collect(Collectors.toList());
        log.info("results = {}", results);


        return results;
    }
}
