package com.icia.mjuniverse.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Data
public class BoardDTO {

    private Long id;
    private String boardTitle;
    private String boardWriter;
    private String boardContents;
    private String boardCategory;
    private int boardHits;
    private Timestamp boardCreatedDate;
    private int thumbnailAttached;
    private int fileAttached;
    private MultipartFile thumbnailFile;
    private List<MultipartFile> boardFile;

}
