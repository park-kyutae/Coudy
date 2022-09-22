package kr.spring.study.chat.controller;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@ToString
@AllArgsConstructor
public class  ChatFileForm {
    private int memNum;
    private MultipartFile chatFile;
}
