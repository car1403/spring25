package com.mc.app.repository;

import com.github.pagehelper.Page;
import com.mc.app.dto.Board;
import com.mc.app.frame.MCRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BoardRepository extends MCRepository<Board, Integer> {
    void updateHit(Integer id) throws Exception;
    Page<Board> getpage() throws Exception;
    List<Board> mainSelect() throws Exception;
}