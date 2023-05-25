package com.icia.mjuniverse.service;

import com.icia.mjuniverse.dto.*;
import com.icia.mjuniverse.repo.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

//    public List<BoardDTO> findAll() {
//        List<BoardDTO> boardDTOList = boardRepository.findAll();
//        return boardDTOList;
//    }

    public List<BoardDTO> pagingList(int page) {
        int pageLimit = 6;
        int pageStart = (page-1)*pageLimit;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pageStart);
        pagingParam.put("limit", pageLimit);
        List<BoardDTO> boardDTOList = boardRepository.pagingList(pagingParam);
        return boardDTOList;
    }

    public PageDTO pagingParam(int page) {
        int pageLimit = 6; // 한 페이지에 보여질 글의 개수
        int blockLimit = 10; // 한 블록 페이지에 보여질 블록의 개수
        int boardCount = boardRepository.boardCount();

        int maxPage = (int)(Math.ceil((double)boardCount/pageLimit));

        int startPage = (((int)(Math.ceil((double)page/blockLimit))) - 1) * blockLimit + 1 ;
        int endPage = startPage + blockLimit - 1;

        if(endPage > maxPage) {
            endPage = maxPage;
        }

        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);

        return pageDTO;
    }

    public List<BoardDTO> searchList(int page, String type, String q) {
        int pageLimit = 6;
        int pagingStart = (page-1)*pageLimit;
        Map<String, Object> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", pageLimit);
        pagingParam.put("q", q);
        pagingParam.put("type", type);
        List<BoardDTO> boardDTOList = boardRepository.searchList(pagingParam);
        return boardDTOList;
    }

    public PageDTO pagingSearchParam(int page, String type, String q) {
        int pageList = 6;
        int blockLimit = 10;
        Map<String, Object> pagingParam = new HashMap<>();
        pagingParam.put("q", q);
        pagingParam.put("type", type);
        int boardCount = boardRepository.boardSearchCount(pagingParam);
        int maxPage = (int)(Math.ceil((double)boardCount/pageList)) ;
        int startPage = (((int)(Math.ceil((double)page/blockLimit))) - 1) * blockLimit + 1 ;
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;
    }

//    public BoardDTO findById(Long id) {
//        BoardDTO boardDTO = boardRepository.findById(id);
//        return boardDTO;
//    }
//
//    public List<BoardThumbnailDTO> findThumbnail(Long id) {
//        return boardRepository.findThumbnail(id);
//    }
}