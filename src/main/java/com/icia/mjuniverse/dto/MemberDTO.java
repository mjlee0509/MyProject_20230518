package com.icia.mjuniverse.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class MemberDTO {
    private Long id;
    private String memberName;
    private String memberEmail;
    private String memberPassword;
    private String memberMobile;
    private int memberProfile;
    private MultipartFile profileFile;

}
