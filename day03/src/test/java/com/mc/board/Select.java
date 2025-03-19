package com.mc.board;

import com.mc.app.dto.Board;
import com.mc.app.dto.Cust;
import com.mc.app.service.BoardService;
import com.mc.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class Select {

    @Autowired
    BoardService boardService;

    @Test
    void contextLoads() {
        List<Board> boards = null;
        try {
            boards = boardService.get();
            log.info("OK:"+boards);

        } catch (Exception e) {
            e.printStackTrace();
           log.info("Id 중복");
        }
    }

}
