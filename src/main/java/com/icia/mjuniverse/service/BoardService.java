package com.icia.mjuniverse.service;

import com.icia.mjuniverse.dto.BoardDTO;
import com.icia.mjuniverse.dto.BoardFileDTO;
import com.icia.mjuniverse.dto.BoardThumbnailDTO;
import com.icia.mjuniverse.repo.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        // 1. 썸네일 저장
        if(boardDTO.getThumbnailFile().isEmpty()) {
            boardDTO.setThumbnailAttached(0);
            boardRepository.save(boardDTO);
        } else {
            boardDTO.setThumbnailAttached(1);
            BoardDTO dto = boardRepository.save(boardDTO);
            String originalFileName = boardDTO.getThumbnailFile().getOriginalFilename();
            String storedFileName = System.currentTimeMillis()+"-"+originalFileName;

            BoardThumbnailDTO boardThumbnailDTO = new BoardThumbnailDTO();
            boardThumbnailDTO.setOriginalFileName(originalFileName);
            boardThumbnailDTO.setStoredFileName(storedFileName);
            boardThumbnailDTO.setBoardId(dto.getId());

            String savePath = "D:\\springFramework_img\\mjimages\\" + storedFileName;

            boardDTO.getThumbnailFile().transferTo(new File(savePath));
            boardRepository.saveThumbnail(boardThumbnailDTO);
        }

        // 2. 게시물 첨부파일 저장
        if (boardDTO.getBoardFile().get(0).isEmpty()) {
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);
        } else {
            boardDTO.setFileAttached(1);
            BoardDTO dto = boardRepository.save(boardDTO);
            for (MultipartFile boardFile : boardDTO.getBoardFile()) {
                String originalFilesName = boardFile.getOriginalFilename();
                String storedFilesName = System.currentTimeMillis()+"-"+originalFilesName;
                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFilesName(originalFilesName);
                boardFileDTO.setBoardId(dto.getId());
                boardFileDTO.setStoredFilesName(storedFilesName);
                String savepath = "D:\\springFramework_img\\mjimages\\" + storedFilesName;
                boardRepository.saveFile(boardFileDTO);
                boardFile.transferTo(new File(savepath));
                boardRepository.saveFile(boardFileDTO);
            }
        }
    }
}