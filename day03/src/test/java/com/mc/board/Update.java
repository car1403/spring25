package com.mc.board;

import com.mc.app.dto.Board;
import com.mc.app.dto.Cust;
import com.mc.app.service.BoardService;
import com.mc.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Update {

    @Autowired
    BoardService boardService;

    @Test
    void contextLoads() {
        Board board =
                Board.builder().boardId(1).boardTitle("제목").boardContent("내용").boardAuthor("id02").build();
        log.info(board.toString());
        try {
            boardService.mod(board);
            log.info("OK");
        } catch (Exception e) {
           log.info("Id 중복");
        }
    }

}
