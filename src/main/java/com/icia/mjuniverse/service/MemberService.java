package com.icia.mjuniverse.service;

import com.icia.mjuniverse.dto.MemberDTO;
import com.icia.mjuniverse.dto.MemberProfileDTO;
import com.icia.mjuniverse.repo.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) throws IOException {
        if (memberDTO.getProfileFile().isEmpty()) {
            memberDTO.setMemberProfile(0);
            memberRepository.save(memberDTO);
        } else {
            memberDTO.setMemberProfile(1);
            MemberDTO dto = memberRepository.save(memberDTO);
            String originalFileName = memberDTO.getProfileFile().getOriginalFilename();
            String storedFileName = System.currentTimeMillis() + "-" + originalFileName;

            MemberProfileDTO memberProfileDTO = new MemberProfileDTO();
            memberProfileDTO.setOriginalFileName(originalFileName);
            memberProfileDTO.setStoredFileName(storedFileName);
            memberProfileDTO.setMemberId(dto.getId());

            String savePath = "D:\\springFramework_img\\mjimages\\" + storedFileName;

            memberDTO.getProfileFile().transferTo(new File(savePath));
            memberRepository.saveFile(memberProfileDTO);


        }
    }

    public MemberDTO findByEmail(String loginEmail) {
        return memberRepository.findByEmail(loginEmail);
    }

    public boolean login(MemberDTO memberDTO) {
        MemberDTO dto = memberRepository.login(memberDTO);
        if (dto != null) {
            return true;
        } else {
            return false;
        }
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public MemberProfileDTO findFile(Long memberId) {
        return memberRepository.findFile(memberId);
    }

    public void update(MemberDTO memberDTO) throws IOException {
        MemberDTO dto = memberRepository.update(memberDTO);
    }
    public void updateFile(MemberDTO memberDTO, MemberProfileDTO memberProfileDTO) throws IOException {
        MemberProfileDTO profile = memberRepository.updateFile(memberProfileDTO);

//        MemberDTO memberDTO = new MemberDTO();
        String originalFileName = memberDTO.getProfileFile().getOriginalFilename();
        String storedFileName = System.currentTimeMillis() + "-" + originalFileName;
        memberProfileDTO.setOriginalFileName(originalFileName);
        memberProfileDTO.setStoredFileName(storedFileName);
        memberProfileDTO.setMemberId(memberDTO.getId());

        String savePath = "D:\\springFramework_img\\mjimages\\" + storedFileName;

        memberDTO.getProfileFile().transferTo(new File(savePath));
        memberRepository.saveFile(memberProfileDTO);
    }
//    public void removeFile(MemberDTO memberDTO, MemberProfileDTO memberProfileDTO) {
//        memberRepository.removeFile(id);
//    }



    public void delete(Long id) {
        memberRepository.delete(id);
    }


    public void removeFile(MemberProfileDTO memberProfileDTO) {
        memberRepository.removeFile(memberProfileDTO);
    }
}
