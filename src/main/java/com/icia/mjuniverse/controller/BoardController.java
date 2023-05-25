package com.icia.mjuniverse.controller;

import com.icia.mjuniverse.dto.*;
import com.icia.mjuniverse.service.BoardService;
import com.icia.mjuniverse.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/")
    public String index() {
        return "boardPages/boardIndex";
    }

    @GetMapping("/save")
    public String saveForm() {
        return "boardPages/boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "boardPages/boardIndex";
    }

    @GetMapping("/list")
    public String list(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                       @RequestParam(value = "q", required = false, defaultValue = "") String q,
                       @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                       Model model) {
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;
        // fx1. 페이징 및 검색처리
        if (q.equals("")) {
            boardDTOList = boardService.pagingList(page);
            pageDTO = boardService.pagingParam(page);
        } else {
            boardDTOList = boardService.searchList(page, type, q);
            pageDTO = boardService.pagingSearchParam(page, type, q);
        }
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        // fx2. 썸네일 띄우기
        return "boardPages/boardList";
    }


}
