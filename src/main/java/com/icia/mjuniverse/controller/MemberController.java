package com.icia.mjuniverse.controller;

import com.icia.mjuniverse.dto.MemberDTO;
import com.icia.mjuniverse.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "memberPages/memberSave";
    }

    @PostMapping("/save")
    public String save (@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return  "index";
    }

}
