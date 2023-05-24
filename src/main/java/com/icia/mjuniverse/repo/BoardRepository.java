package com.icia.mjuniverse.repo;

import com.icia.mjuniverse.dto.BoardDTO;
import com.icia.mjuniverse.dto.BoardFileDTO;
import com.icia.mjuniverse.dto.BoardThumbnailDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
