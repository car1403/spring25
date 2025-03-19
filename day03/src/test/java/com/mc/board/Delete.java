package com.mc.board;

import com.mc.app.service.BoardService;
import com.mc.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class Delete {

    @Autowired
    BoardService boardService;

    @Test
    void contextLoads() {
        int id = 1;
        try {
            boardService.del(id);
            log.info("OK");
        } catch (Exception e) {
           log.info("Id 중복");
        }
    }

}
