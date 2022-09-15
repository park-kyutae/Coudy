package kr.spring.study.chat.controller;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.study.chat.service.ChatService;
import kr.spring.study.chat.vo.ChatRoomVO;
import kr.spring.study.plan.artgumentResolver.Login;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {
    private final ChatService chatService;
    private final MemberService memberService;

    @GetMapping
    public String chatMain(@Login Integer memNum, Model model) {
        List<ChatRoomVO> chatRooms = chatService.findAllRoomByUser(memNum);
        model.addAttribute("chatRooms", chatRooms);
        return "study/chat/ChatMain";
    }
    @GetMapping("/add")
    public String addRoomView(@Login Integer memNum,@ModelAttribute CreateChatRoomForm form ) {

        return "study/chat/CreateChatRoom";

    }

    @PostMapping("/add")
    public String addRoom(@Login Integer memNum, @ModelAttribute CreateChatRoomForm form, RedirectAttributes redirectAttributes) {
        log.info("form = {}", form);

        ChatRoomVO chatRoomVO = new ChatRoomVO(form.getChatName());

        List<MemberVO> members = Arrays.stream(form.getMem_num().split(","))
                .map(mem_num -> new MemberVO(Integer.parseInt(mem_num)))
                .collect(Collectors.toList());

        chatService.createChatRoom(chatRoomVO,members);



        redirectAttributes.addAttribute("result", true);
        return "redirect:/chat";
    }

    @GetMapping("/edit")
    public String editRoomView(@Login Integer memNum, @RequestParam Integer chatNum, Model model) {

        ChatRoomVO chatRoom = chatService.findChatRoomByChatNum(chatNum);
        List<MemberVO> members = chatService.selectChatRoomMembers(chatNum);
        model.addAttribute("chatRoom", chatRoom);
        model.addAttribute("members", members);
        return "study/chat/EditChatRoom";
    }
    @PostMapping("/edit")
    public String editRoom(@Login Integer memNum, @RequestParam Integer chatNum, Model model) {
        return "study/chat/EditChatRoom";
    }

    @GetMapping("/{roomNum}")
    public String joinRoom(@Login Integer memNum, @PathVariable Integer roomNum,Model model) {

        String name = memberService.selectMember(memNum).getName();
        model.addAttribute("member", new ChatMemberInfoForm(memNum,name));
        return "/study/chat/ChatRoom";
    }
}
