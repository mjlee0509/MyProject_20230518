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
import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {


        // if 1. 썸네일 X, 첨부파일 X
        if (boardDTO.getThumbnailFile().isEmpty() && boardDTO.getBoardFile().get(0).isEmpty()) {
            boardDTO.setThumbnailAttached(0);
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);

        // else if 2. 썸네일 O, 첨부파일 X
        } else if (!(boardDTO.getThumbnailFile().isEmpty()) && boardDTO.getBoardFile().get(0).isEmpty()) {
            boardDTO.setThumbnailAttached(1);
            boardDTO.setFileAttached(0);
            BoardDTO dto = boardRepository.save(boardDTO);
            String originalFileName = boardDTO.getThumbnailFile().getOriginalFilename();
            String storedFileName = System.currentTimeMillis() + "-" + originalFileName;
            BoardThumbnailDTO boardThumbnailDTO = new BoardThumbnailDTO();
            boardThumbnailDTO.setOriginalFileName(originalFileName);
            boardThumbnailDTO.setStoredFileName(storedFileName);
            boardThumbnailDTO.setBoardId(dto.getId());
            String savePath = "D:\\springFramework_img\\mjimages\\" + storedFileName;
            boardDTO.getThumbnailFile().transferTo(new File(savePath));
            boardRepository.saveThumbnail(boardThumbnailDTO);

        // else if 3. 썸네일 X, 첨부파일 O
        } else if (boardDTO.getThumbnailFile().isEmpty() && !(boardDTO.getBoardFile().get(0).isEmpty())) {
            boardDTO.setThumbnailAttached(0);
            boardDTO.setFileAttached(1);
            BoardDTO dto = boardRepository.save(boardDTO);
            for (MultipartFile boardFile : boardDTO.getBoardFile()) {
                String originalFilesName = boardFile.getOriginalFilename();
                String storedFilesName = System.currentTimeMillis() + "-" + originalFilesName;
                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFilesName(originalFilesName);
                boardFileDTO.setBoardId(dto.getId());
                boardFileDTO.setStoredFilesName(storedFilesName);
                String savepath = "D:\\springFramework_img\\mjimages\\" + storedFilesName;
                boardFile.transferTo(new File(savepath));
                boardRepository.saveFile(boardFileDTO);
            }

        // else if 4. 썸네일 O, 첨부파일 O
        } else if (!(boardDTO.getThumbnailFile().isEmpty()) && !(boardDTO.getBoardFile().get(0).isEmpty())) {
            boardDTO.setThumbnailAttached(1);
            boardDTO.setFileAttached(1);
            BoardDTO dto = boardRepository.save(boardDTO);
            // 썸네일 파일 이름 지정
            String originalFileName = boardDTO.getThumbnailFile().getOriginalFilename();
            String storedFileName = System.currentTimeMillis() + "-" + originalFileName;
            BoardThumbnailDTO boardThumbnailDTO = new BoardThumbnailDTO();
            boardThumbnailDTO.setOriginalFileName(originalFileName);
            boardThumbnailDTO.setStoredFileName(storedFileName);
            boardThumbnailDTO.setBoardId(dto.getId());
            String savePath = "D:\\springFramework_img\\mjimages\\" + storedFileName;
            boardDTO.getThumbnailFile().transferTo(new File(savePath));
            boardRepository.saveThumbnail(boardThumbnailDTO);
            // 첨부파일 이름 지정
            for (MultipartFile boardFile : boardDTO.getBoardFile()) {
                String originalFilesName = boardFile.getOriginalFilename();
                String storedFilesName = System.currentTimeMillis() + "-" + originalFilesName;
                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFilesName(originalFilesName);
                boardFileDTO.setBoardId(dto.getId());
                boardFileDTO.setStoredFilesName(storedFilesName);
                String savepath = "D:\\springFramework_img\\mjimages\\" + storedFilesName;
                boardFile.transferTo(new File(savepath));
                boardRepository.saveFile(boardFileDTO);
            }






        }
    }

    public List<BoardDTO> findAll() {
        List<BoardDTO> boardDTOList = boardRepository.findAll();
        return boardDTOList;
    }
}