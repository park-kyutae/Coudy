package kr.spring.study.chat.controller;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.apache.ibatis.annotations.Select;
@Getter
@AllArgsConstructor
public class SearchMemberResult {
    private int memNum;
    private String memName;
}
