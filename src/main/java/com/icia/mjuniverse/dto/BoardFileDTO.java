package com.icia.mjuniverse.dto;

import lombok.Data;

@Data
public class BoardFileDTO {
    private Long id;
    private String originalFilesName;
    private String storedFilesName;
    private Long boardId;
}
