package com.icia.mjuniverse.controller;

import com.icia.mjuniverse.dto.MemberDTO;
import com.icia.mjuniverse.dto.MemberProfileDTO;
import com.icia.mjuniverse.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return "index";
    }

    @PostMapping("/email-check")
    public ResponseEntity emailCheck(@RequestParam("memberEmail") String memberEmail) {

        MemberDTO memberDTO = memberService.findByEmail(memberEmail);
        if (memberEmail.length() == 0) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else if (memberDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "memberPages/memberLogin";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
        boolean loginResult = memberService.login(memberDTO);
        model.addAttribute("member", memberDTO);
        if (loginResult) {
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            session.setAttribute("loginId", memberDTO.getId());
            model.addAttribute("loginInfo", memberDTO);
            return "index";
        } else {
            return "memberPages/memberLogin";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginEmail");
        return "redirect:/";
    }

    @GetMapping("/detail")
    public String detail(HttpSession session, Model model) {
        String loginEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByEmail(loginEmail);
        model.addAttribute("member", memberDTO);
        if (memberDTO.getMemberProfile() == 1) {
            MemberProfileDTO memberProfileDTO = memberService.findFile(memberDTO.getId());
            model.addAttribute("memberProfile", memberProfileDTO);
        }
        return "memberPages/memberDetail";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model) {
        String loginEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByEmail(loginEmail);
        model.addAttribute("member", memberDTO);
        if (memberDTO.getMemberProfile() == 1) {
            MemberProfileDTO memberProfileDTO = memberService.findFile(memberDTO.getId());
            model.addAttribute("memberProfile", memberProfileDTO);
        }
        return "memberPages/memberUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO,
                         @ModelAttribute MemberProfileDTO memberProfileDTO,
                         Model model,
                         HttpSession session) throws IOException {
        memberService.update(memberDTO);
        memberService.updateFile(memberDTO, memberProfileDTO);
        memberService.removeFile(memberProfileDTO);

        MemberDTO dto = memberService.findById(memberDTO.getId());
        MemberProfileDTO profile = memberService.findFile(memberProfileDTO.getMemberId());

        model.addAttribute("member", dto);
        model.addAttribute("profile", profile);
        return "redirect:/member/detail?id=" + memberDTO.getId();
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, HttpSession session) {
        memberService.delete(id);
        session.removeAttribute("loginEmail");
        return "redirect:/";
    }

}
