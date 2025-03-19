package com.mc.app.service;

import com.mc.app.dto.Board;
import com.mc.app.dto.Cust;
import com.mc.app.frame.MCService;
import com.mc.app.repository.BoardRepository;
import com.mc.app.repository.CustRepository;
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
}
