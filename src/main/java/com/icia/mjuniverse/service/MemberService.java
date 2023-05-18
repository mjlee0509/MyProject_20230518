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
        if(memberDTO.getProfileFile().isEmpty()) {
            memberDTO.setMemberProfile(0);
            memberRepository.save(memberDTO);
        } else {
            memberDTO.setMemberProfile(1);
            MemberDTO dto = memberRepository.save(memberDTO);
            String originalFileName = memberDTO.getProfileFile().getOriginalFilename();
            String storedFileName = System.currentTimeMillis()+"-"+originalFileName;

            MemberProfileDTO memberProfileDTO = new MemberProfileDTO();
            memberProfileDTO.setOriginalFileName(originalFileName);
            memberProfileDTO.setStoredFileName(storedFileName);
            memberProfileDTO.setMemberId(dto.getId());

            String savePath = "D:\\springFramework_img\\mjimages\\" + storedFileName;

            memberDTO.getProfileFile().transferTo(new File(savePath));
            memberRepository.saveFile(memberProfileDTO);


        }
    }
}
