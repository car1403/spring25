package com.mc.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.mc.app.dto.Board;
import com.mc.app.frame.MCService;
import com.mc.app.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService implements MCService<Board, Integer> {

    final BoardRepository boardRepository;

    @Override
    public void add(Board board) throws Exception {
        boardRepository.insert(board);
    }

    @Override
    public void mod(Board board) throws Exception {
        boardRepository.update(board);
    }

    @Override
    public void del(Integer integer) throws Exception {
        boardRepository.delete(integer);
    }

    @Override
    public Board get(Integer integer) throws Exception {
        return boardRepository.selectOne(integer);
    }

    @Override
    public List<Board> get() throws Exception {
        return boardRepository.select();
    }

    public void hit(Integer id) throws Exception {
        boardRepository.updateHit(id);
    }
    public Page<Board> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 3); // 3: 한화면에 출력되는 개수
        return boardRepository.getpage();
    }
    public List<Board> mainSelect() throws Exception{
        return boardRepository.mainSelect();
    }
}







