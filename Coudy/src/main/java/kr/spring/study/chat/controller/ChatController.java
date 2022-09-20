package kr.spring.study.chat.controller;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.study.chat.message.ChatTextMessage;
import kr.spring.study.chat.service.ChatService;
import kr.spring.study.chat.vo.ChatFileLogVO;
import kr.spring.study.chat.vo.ChatRoomVO;
import kr.spring.study.chat.vo.ChatTextLogVO;
import kr.spring.study.plan.artgumentResolver.Login;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {
    private final ChatService chatService;
    private final MemberService memberService;

    @Value("${file.chat-dir}")
    private String dir;


    @GetMapping
    public String chatMain(@Login Integer memNum, Model model) {
        List<ChatRoomVO> chatRooms = chatService.findAllRoomByUser(memNum);
        model.addAttribute("chatRooms", chatRooms);
        return "study/chat/ChatMain";
    }

    @GetMapping("/add")
    public String addRoomView(@Login Integer memNum, Model model) {
        model.addAttribute("createChatRoomForm", new CreateChatRoomForm());
        model.addAttribute("ownerMemNum", memNum);

        return "study/chat/CreateChatRoom";

    }

    @PostMapping("/add")
    public String addRoom(@Login Integer memNum, @ModelAttribute CreateChatRoomForm form, RedirectAttributes redirectAttributes) {
        log.info("form = {}", form);

        ChatRoomVO chatRoomVO = new ChatRoomVO(form.getChatName());

        List<MemberVO> members = Arrays.stream(form.getMem_num().split(","))
                .map(mem_num -> new MemberVO(Integer.parseInt(mem_num)))
                .collect(Collectors.toList());


        chatService.createChatRoom(chatRoomVO, members);


        redirectAttributes.addAttribute("result", true);
        return "redirect:/chat";
    }

    @GetMapping("/edit")
    public String editRoomView(@Login Integer memNum, @RequestParam Integer chatNum, Model model) {
        ChatRoomVO chatRoom = chatService.findChatRoomByChatNum(chatNum);
        List<MemberVO> members = chatService.selectChatRoomMembers(chatNum);
        model.addAttribute("chatRoom", chatRoom);
        model.addAttribute("members", members);
        model.addAttribute("editChatRoomForm", new EditChatRoomForm());

        return "study/chat/EditChatRoom";
    }

    @PostMapping("/edit")
    public String editRoom(@Login Integer memNum, @ModelAttribute EditChatRoomForm form, @RequestParam Integer chatNum, Model model) {
//        List<MemberVO> members = Arrays.stream(form.getMem_num().split(","))
//                .map(mem_num -> new MemberVO(Integer.parseInt(mem_num)))
//                .collect(Collectors.toList());

        List<MemberVO> members = new ArrayList<>();
        for (String mem_num :
                form.getMem_num().split(",")) {
            if (mem_num != "") {
                members.add(new MemberVO(Integer.parseInt(mem_num)));
            }
        }
        chatService.updateChatName(new ChatRoomVO(form.getChatNum(), form.getChatName()), members);

        return "redirect:/chat";
    }

    @GetMapping("/{chatNum}")
    public String joinRoom(@Login Integer memNum, @PathVariable Integer chatNum, Model model) {

        String name = memberService.selectMember(memNum).getName();
        List<ChatTextLogVO> chatTextLogVOList = chatService.findMessagesByChatNum(chatNum);
        List<ChatTextLogVO> convertFileToTextLogVO = chatService.findFilesByChatNum(chatNum).stream()
                .map(log -> new ChatTextLogVO(log.getChatFileLogNum(), memNum, "file://" + log.getChatFileName(),
                        log.getChatNum(), log.getChatFileTime(), log.getMemName()))
                .collect(Collectors.toList());
        chatTextLogVOList.addAll(convertFileToTextLogVO);

        chatTextLogVOList.stream()
                .sorted(Comparator.comparing(ChatTextLogVO::getChatTime))
                .collect(Collectors.toList());

        model.addAttribute("member", new ChatMemberInfo(memNum, name));
        model.addAttribute("chatMessages", chatTextLogVOList);
        return "/study/chat/ChatRoom";
    }

    @GetMapping("/{chatNum}/upload")
    public String uploadFiles(@Login Integer memNum, @PathVariable Integer chatNum, Model model) {

        String name = memberService.selectMember(memNum).getName();
        List<ChatFileLogVO> filesByChatNum = chatService.findFilesByChatNum(chatNum);


        model.addAttribute("member", new ChatMemberInfo(memNum, name));
        model.addAttribute("chatFiles", filesByChatNum);

        return "/study/chat/ChatRoomUpload";
    }

    @PostMapping("/quit")
    public String quitRoom(@Login Integer memNum, @RequestParam Integer chatNum, Model model) {
        chatService.quitChatRoom(new MemberVO(memNum), new ChatRoomVO(chatNum));
        return "redirect:/chat";
    }

    @ResponseBody
    @GetMapping("/files/{logNum}")
    public Resource imageDownload(@PathVariable Integer logNum) throws MalformedURLException {
        ChatFileLogVO chatFileLogVO = chatService.findFileByLogNum(logNum);
        return new UrlResource("file:" + dir + chatFileLogVO.getChatFileHash());
    }

    @ResponseBody
    @GetMapping("/files/download/{logNum}")
    public ResponseEntity<Resource> fileDownload(@PathVariable Integer logNum) throws MalformedURLException {
        ChatFileLogVO chatFileLogVO = chatService.findFileByLogNum(logNum);
        UrlResource resource = new UrlResource("file:" + dir + chatFileLogVO.getChatFileHash());

        String chatFileName = chatFileLogVO.getChatFileName();

        String contentDisposition = "attachment; filename=\"" + chatFileName + "\"";

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
                .body(resource);
    }
}
