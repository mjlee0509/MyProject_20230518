package com.icia.mjuniverse.repo;

import com.icia.mjuniverse.dto.MemberDTO;
import com.icia.mjuniverse.dto.MemberProfileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;


    public MemberDTO save(MemberDTO memberDTO) {
        sql.insert("Member.save", memberDTO);
        return memberDTO;
    }

    public void saveFile(MemberProfileDTO memberProfileDTO) {
        sql.insert("Member.saveFile", memberProfileDTO);
    }

    public MemberDTO findByEmail(String loginEmail) {
        return sql.selectOne("Member.findByEmail", loginEmail);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }

    public MemberProfileDTO findFile(Long memberId) {
        return sql.selectOne("Member.findFile", memberId);
    }

    public MemberDTO update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
        return memberDTO;
    }

    public MemberProfileDTO updateFile(MemberProfileDTO memberProfileDTO) {
        sql.update("Member.updateFile", memberProfileDTO);
        return memberProfileDTO;
    }

    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }

    public void removeFile(MemberProfileDTO memberProfileDTO) {
        sql.delete("Member.removeFile", memberProfileDTO);
    }
}
