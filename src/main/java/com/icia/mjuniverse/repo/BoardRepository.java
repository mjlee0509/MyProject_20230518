package com.icia.mjuniverse.repo;

import com.icia.mjuniverse.dto.BoardDTO;
import com.icia.mjuniverse.dto.BoardFileDTO;
import com.icia.mjuniverse.dto.BoardThumbnailDTO;
import com.icia.mjuniverse.dto.MemberProfileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {

    @Autowired
    private SqlSessionTemplate sql;


    public BoardDTO save(BoardDTO boardDTO) {
        sql.insert("Board.save", boardDTO);
        return boardDTO;
    }

    public void saveFile(BoardFileDTO boardFileDTO) {
        sql.insert("Board.saveFile", boardFileDTO);
    }

    public void saveThumbnail(BoardThumbnailDTO boardThumbnailDTO) {
        sql.insert("Board.saveThumbnail", boardThumbnailDTO);
    }

//    public List<BoardDTO> findAll() {
//        return sql.selectList("Board.findAll");
//    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.paging", pagingParam);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> searchList(Map<String, Object> pagingParam) {
        return sql.selectList("Board.search", pagingParam);
    }

    public int boardSearchCount(Map<String, Object> pagingParam) {
        return sql.selectOne("Board.searchCount", pagingParam);
    }


//    public BoardDTO findById(Long id) {
//        return sql.selectOne("Board.findById", id);
//    }
//
//    public List<BoardThumbnailDTO> findThumbnail(Long boardId) {
//        return sql.selectList("Board.findThumbnail", boardId);
//    }
}
