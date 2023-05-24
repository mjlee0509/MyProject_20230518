package com.icia.mjuniverse.dto;

import lombok.Data;

@Data
public class BoardThumbnailDTO {
    private Long id;
    private String originalFileName;
    private String storedFileName;
    private Long boardId;
}
